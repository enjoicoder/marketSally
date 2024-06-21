package kr.or.marketsally.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.order.service.IOrderService;
import kr.or.marketsally.order.service.OrderServiceImpl;
import kr.or.marketsally.order.vo.OrdersVO;
import kr.or.marketsally.order.vo.PaymentVO;

public class OrderCheckoutAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int cnt = 0;
		IOrderService service = OrderServiceImpl.getInstance();
		
		
		String memId = request.getParameter("mem_id");
		
		// 등급에 따른 적립퍼센트 구하기
		String memGrade = request.getParameter("mem_grade");
		double pointGrade = 0;
		switch (memGrade) {
		case "1":
			pointGrade = 0.03;
			break;
		case "2":
			pointGrade = 0.05;
			break;
		case "3":
			pointGrade = 0.08;
			break;
		case "4":
			pointGrade = 0.1;
			break;
		}
		
		String orderAdd = request.getParameter("order_add");
		String cartId = request.getParameter("cart_id");
		
		int payAmount = Integer.parseInt(request.getParameter("pay_amount"));
		int payPoint = Integer.parseInt(request.getParameter("pay_point"));
		
		//결제시 적립될 포인트
		int addPoint = (int) (payAmount * pointGrade);
		
		OrdersVO orderVo = new OrdersVO();
		orderVo.setMem_id(memId);
		orderVo.setOrder_add(orderAdd);
		orderVo.setCart_id(cartId);
		orderVo.setCart_id(cartId);
		
		PaymentVO paymentVo = new PaymentVO();
		
		paymentVo.setPay_amount(payAmount);
		paymentVo.setPay_point(payPoint);
		
		// 주문 데이터 추가
		String orderId = service.insertOrders(orderVo);
		System.out.println(orderId);
		
		// 주문 데이터 추가 성공시 다음 진행
		if(orderId != null && orderId != "") {
			// 결제 데이터 추가
			paymentVo.setOrder_id(orderId);
			cnt = service.insertPayment(paymentVo);
			// 회원의 다음 장바구니 생성
			cnt = service.insertCart(memId);
			// 포인트적립
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("mem_id", memId);
			map.put("add_point", addPoint);
			map.put("pay_point", payPoint);
			service.updateMemberPoint(map);
			
		}
		
		request.setAttribute("result", cnt);
		request.setAttribute("orderId", orderId);
		request.setAttribute("payAmount", payAmount);
	}

}

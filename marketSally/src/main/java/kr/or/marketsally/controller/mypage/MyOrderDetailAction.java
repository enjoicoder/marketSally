package kr.or.marketsally.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.cart.vo.CartVO;
import kr.or.marketsally.controller.Action;
import kr.or.marketsally.order.service.IOrderService;
import kr.or.marketsally.order.service.OrderServiceImpl;
import kr.or.marketsally.order.vo.OrdersVO;
import kr.or.marketsally.order.vo.PaymentVO;

public class MyOrderDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		List<CartVO> list = null;
		OrdersVO ordersVO = null;
		PaymentVO payVO = null;
		String order_id = request.getParameter("order_id");
			  
		IOrderService service = OrderServiceImpl.getInstance();
			  
		list = service.getMyOrderProdList(order_id);
		ordersVO = service.selectOrders(order_id);
		payVO = service.selectPayment(order_id);
		
		request.setAttribute("prodList", list);
		request.setAttribute("order", ordersVO);
		request.setAttribute("pay", payVO);

	}

}

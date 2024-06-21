package kr.or.marketsally.order.service;



import java.util.List;
import java.util.Map;

import kr.or.marketsally.cart.vo.CartVO;
import kr.or.marketsally.order.vo.MyPageOrdersVO;
import kr.or.marketsally.order.vo.OrdersVO;
import kr.or.marketsally.order.vo.PaymentVO;


public interface IOrderService {

	public String insertOrders(OrdersVO ordersVo);
	
	public int insertPayment(PaymentVO PaymentVo);
	
	public int insertCart(String mem_id);

	public void updateMemberPoint(Map<String, Object> map);
	
	// 마이페이지 주문내역 리스트 가져오기
	public List<MyPageOrdersVO> getMyOrdersList(String mem_id);
	// 마이페이지 주문상세 상품리스트 가져오기
	public List<CartVO> getMyOrderProdList(String order_id);
	
	// 주문번호로 주문데이터 가져오기
	public OrdersVO selectOrders(String order_id);
	
	// 주문번호로 결제데이터 가져오기
	public PaymentVO selectPayment(String order_id);

}
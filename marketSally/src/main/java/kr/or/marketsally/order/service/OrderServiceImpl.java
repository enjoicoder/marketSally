package kr.or.marketsally.order.service;

import java.util.List;
import java.util.Map;

import kr.or.marketsally.cart.vo.CartVO;
import kr.or.marketsally.order.dao.IOrderDao;
import kr.or.marketsally.order.dao.OrderDaoImpl;
import kr.or.marketsally.order.vo.MyPageOrdersVO;
import kr.or.marketsally.order.vo.OrdersVO;
import kr.or.marketsally.order.vo.PaymentVO;

public class OrderServiceImpl implements IOrderService {
	
	private static OrderServiceImpl service;	
	
	public static OrderServiceImpl getInstance() {
		if(service==null) service = new OrderServiceImpl();
		return service;
	}
	
	private IOrderDao orderDao;
	
	private OrderServiceImpl() {
		orderDao = OrderDaoImpl.getInstance();
	}

	@Override
	public String insertOrders(OrdersVO ordersVo) {
		return orderDao.insertOrders(ordersVo);
	}


	@Override
	public int insertPayment(PaymentVO PaymentVo) {
		return orderDao.insertPayment(PaymentVo);
	}


	@Override
	public int insertCart(String mem_id) {
		return orderDao.insertCart(mem_id);
	}

	@Override
	public void updateMemberPoint(Map<String, Object> map) {
		orderDao.updateMemberPoint(map);
		
	}

	@Override
	public List<MyPageOrdersVO> getMyOrdersList(String mem_id) {
		return orderDao.getMyOrdersList(mem_id);
	}

	@Override
	public List<CartVO> getMyOrderProdList(String order_id) {
		return orderDao.getMyOrderProdList(order_id);
	}

	@Override
	public OrdersVO selectOrders(String order_id) {
		return orderDao.selectOrders(order_id);
	}

	@Override
	public PaymentVO selectPayment(String order_id) {
		return orderDao.selectPayment(order_id);
	}

}
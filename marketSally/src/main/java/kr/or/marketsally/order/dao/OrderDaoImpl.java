package kr.or.marketsally.order.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.marketsally.cart.vo.CartVO;
import kr.or.marketsally.order.vo.MyPageOrdersVO;
import kr.or.marketsally.order.vo.OrdersVO;
import kr.or.marketsally.order.vo.PaymentVO;
import kr.or.marketsally.util.SqlMapClientFactory;

public class OrderDaoImpl implements IOrderDao{

	//1번
	private static OrderDaoImpl dao;
	private SqlMapClient smc;
	//2번
	private OrderDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	//3번
	public static OrderDaoImpl getInstance() {
		if(dao==null) dao = new OrderDaoImpl();

		return dao;
	}

	@Override
	public String insertOrders(OrdersVO ordersVo) {
		String orderId = ""; // order_id
		try {
			String obj = (String)smc.insert("orders.insertOrders", ordersVo);
			System.out.println("스트링값"+ obj);
			if(obj ==null)orderId = "";
			orderId = obj;
		} catch (SQLException e) {
			orderId = "";
			e.printStackTrace();
		}

		return orderId;
	}
	@Override
	public int insertPayment(PaymentVO PaymentVo) {
		int cnt = 0; // 반환값이 저장될 변수
		try {
			Object obj = smc.insert("orders.insertPayment", PaymentVo);
			if(obj ==null)cnt =1;
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}

		return cnt;
	}
	@Override
	public int insertCart(String mem_id) {
		int cnt = 0; // 반환값이 저장될 변수
		try {
			Object obj = smc.insert("orders.insertCart", mem_id);
			if(obj ==null)cnt =1;
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}

		return cnt;
	}
	@Override
	public void updateMemberPoint(Map<String, Object> map) {
		try {
			smc.update("orders.updateMemberPoint", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MyPageOrdersVO> getMyOrdersList(String mem_id) {
		List<MyPageOrdersVO> list = null;
		
		try {
			list = smc.queryForList("orders.getMyOrdersList", mem_id);
			return list;
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		
		return null;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<CartVO> getMyOrderProdList(String order_id) {
		List<CartVO> list = null;
		
		try {
			list = smc.queryForList("orders.getMyOrderProdList", order_id);
			return list;
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		
		return null;
	}
	@Override
	public OrdersVO selectOrders(String order_id) {
		OrdersVO orderVO = null;
		try {
			orderVO = (OrdersVO) smc.queryForObject("orders.selectOrders",order_id);
			return orderVO;
		} catch (SQLException e) {
			orderVO = null;
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public PaymentVO selectPayment(String order_id) {
		PaymentVO payVO = null;
		try {
			payVO = (PaymentVO) smc.queryForObject("orders.selectPayment",order_id);
			return payVO;
		} catch (SQLException e) {
			payVO = null;
			e.printStackTrace();
		}
		return null;
	}
}


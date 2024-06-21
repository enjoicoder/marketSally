package kr.or.marketsally.cart.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.marketsally.cart.vo.CartVO;
import kr.or.marketsally.util.SqlMapClientFactory;

public class CartDaoImpl implements ICartDao{

	//1번
	private static CartDaoImpl dao;
	private SqlMapClient smc;
	//2번
	private CartDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	//3번
	public static CartDaoImpl getInstance() {
		if(dao==null) dao = new CartDaoImpl();

		return dao;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CartVO> getCartList(String mem_id) {
		List<CartVO> list = null;
		
		try {
			list = smc.queryForList("cart.getCartList", mem_id);
			return list;
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		
		return null;
	}
	
	@Override
	public void updateCartQty(CartVO cartVO) {
		try {
			smc.update("cart.updateCartQty", cartVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void deleteCartProd(CartVO cartVO) {
		try {
			smc.update("cart.deleteCartProd", cartVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public int selectCartProd(CartVO cartVO) {
		int cnt = 0;
		try {
			cnt = (int) smc.queryForObject("cart.selectCartProd", cartVO);
			return cnt;
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int insertCartProd(CartVO cartVO) {
		int cnt = 0;
		try {
			Object obj = smc.insert("cart.insertCartProd", cartVO);
			if(obj == null) cnt = 1;
			return cnt;
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return 0;
	}
}


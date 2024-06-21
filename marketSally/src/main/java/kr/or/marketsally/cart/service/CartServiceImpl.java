package kr.or.marketsally.cart.service;

import java.util.List;

import kr.or.marketsally.cart.dao.CartDaoImpl;
import kr.or.marketsally.cart.dao.ICartDao;
import kr.or.marketsally.cart.vo.CartVO;

public class CartServiceImpl implements ICartService {
	
	private static CartServiceImpl service;	
	
	public static CartServiceImpl getInstance() {
		if(service==null) service = new CartServiceImpl();
		return service;
	}
	
	private ICartDao dao;
	
	private CartServiceImpl() {
		dao = CartDaoImpl.getInstance();
	}

	@Override
	public List<CartVO> getCartList(String mem_id) {
		return dao.getCartList(mem_id);
	}

	@Override
	public void updateCartQty(CartVO cartVO) {
		dao.updateCartQty(cartVO);
		
	}

	@Override
	public void deleteCartProd(CartVO cartVO) {
		dao.deleteCartProd(cartVO);
		
	}

	@Override
	public int selectCartProd(CartVO cartVO) {
		return dao.selectCartProd(cartVO);
	}

	@Override
	public int insertCartProd(CartVO cartVO) {
		return dao.insertCartProd(cartVO);
	}

}
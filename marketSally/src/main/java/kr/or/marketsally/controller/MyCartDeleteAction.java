package kr.or.marketsally.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.cart.service.CartServiceImpl;
import kr.or.marketsally.cart.service.ICartService;
import kr.or.marketsally.cart.vo.CartVO;

public class MyCartDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CartVO cart = new CartVO();
		
		String cart_Id = request.getParameter("cartId");
		String prod_Id = request.getParameter("prodId");
		
		cart.setCart_id(cart_Id);
		cart.setProd_id(prod_Id);
		
		ICartService service = CartServiceImpl.getInstance();
		service.deleteCartProd(cart);
		
	}

}

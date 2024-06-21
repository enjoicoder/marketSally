package kr.or.marketsally.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.cart.service.CartServiceImpl;
import kr.or.marketsally.cart.service.ICartService;
import kr.or.marketsally.cart.vo.CartVO;

public class MyCartUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CartVO cart = new CartVO();
		
		String cart_Id = request.getParameter("cartId");
		int prod_Qty = Integer.parseInt(request.getParameter("prodQty"));
		String prod_Id = request.getParameter("prodId");
		
		cart.setCart_id(cart_Id);
		cart.setOrder_detail_qty(prod_Qty);
		cart.setProd_id(prod_Id);
		
		ICartService service = CartServiceImpl.getInstance();
		service.updateCartQty(cart);
	}

}

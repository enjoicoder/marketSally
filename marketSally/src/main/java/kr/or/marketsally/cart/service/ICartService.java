package kr.or.marketsally.cart.service;


import java.util.List;

import kr.or.marketsally.cart.vo.CartVO;


public interface ICartService {
	
	// 현재 장바구니목록 출력
	public List<CartVO> getCartList(String mem_id);
	
	// 현재 장바구니 상품 수량조절
	public void updateCartQty(CartVO cartVO);
	
	// 현재 장바구니 상품 삭제
	public void deleteCartProd(CartVO cartVO);
	
	// 장바구니 상품중복 확인
	public int selectCartProd(CartVO cartVO);
	
	// 장바구니 상품추가
	public int insertCartProd(CartVO cartVO);

}
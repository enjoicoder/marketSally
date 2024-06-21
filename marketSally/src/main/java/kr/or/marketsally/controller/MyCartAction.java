package kr.or.marketsally.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.marketsally.cart.service.CartServiceImpl;
import kr.or.marketsally.cart.service.ICartService;
import kr.or.marketsally.cart.vo.CartVO;
import kr.or.marketsally.member.vo.MemberVO;

public class MyCartAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberVO memVO = null;
		List<CartVO> list = null;
		//세션을 생성한다.
		HttpSession session = request.getSession();
		
		// 회원이 로그인중이면 로직을 실행한다.
		if (session.getAttribute("sessionMember") != null) {
			  //세션의 값을 가져오기
			  memVO = (MemberVO)session.getAttribute("sessionMember");
			  
			  ICartService service = CartServiceImpl.getInstance();
			  
			  list = service.getCartList(memVO.getMem_id());
			}
		
		
		request.setAttribute("cartList", list);
	}

}

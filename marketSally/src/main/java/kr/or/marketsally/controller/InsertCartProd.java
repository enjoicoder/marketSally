package kr.or.marketsally.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.marketsally.cart.service.CartServiceImpl;
import kr.or.marketsally.cart.service.ICartService;
import kr.or.marketsally.cart.vo.CartVO;
import kr.or.marketsally.member.vo.MemberVO;

@WebServlet("/insertCartProd.do")
public class InsertCartProd extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); // 한글 인코딩
		MemberVO memVO = null;
		CartVO cartVO = new CartVO();
		String prod_id = req.getParameter("prodId");
		int prod_qty = Integer.parseInt(req.getParameter("qty"));
		
		String res = "로그인을 해주세요.";
		//세션을 생성한다.
		HttpSession session = req.getSession();
		
		// 회원이 로그인중이면 로직을 실행한다.
		if (session.getAttribute("sessionMember") != null) {
			  //세션의 값을 가져오기
			  memVO = (MemberVO)session.getAttribute("sessionMember");
			  
			  cartVO.setMem_id(memVO.getMem_id());
			  cartVO.setProd_id(prod_id);
			  cartVO.setOrder_detail_qty(prod_qty);
			  
			  ICartService service = CartServiceImpl.getInstance();
			  
			  int cnt = service.selectCartProd(cartVO);
			  if(cnt == 0) {
				  cnt = service.insertCartProd(cartVO);
				  if(cnt > 0) {
					  res = "1";
				  }else {
					  res = "상품추가 실패";
				  }
			  }else {
				  res = "장바구니에 상품이 이미 추가되어있습니다.";
			  }
			}
		
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(res);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}

package kr.or.marketsally.controller.like;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.marketsally.like.service.ILikeService;
import kr.or.marketsally.like.service.LikeServiceImpl;
import kr.or.marketsally.like.vo.LikeVO;
import kr.or.marketsally.member.vo.MemberVO;

@WebServlet("/InsertLike.do")
public class InsertLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MemberVO memVo = null;
		LikeVO likeVo = new LikeVO();		
		String prodId = request.getParameter("prodId");
		
		String res = "로그인을 해주세요";
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("sessionMember") != null) {
			memVo = (MemberVO)session.getAttribute("sessionMember");
			
			likeVo.setMem_id(memVo.getMem_id());
			likeVo.setProd_id(prodId);
			
			ILikeService service = LikeServiceImpl.getInstance();
			
			int cnt = service.selectLikeCnt(likeVo);
			if(cnt==0) {
				cnt = service.insertLike(likeVo);
				if(cnt>0) {
					res= "1";
				}else {
					res ="상품 추가 실패";
				}
			}else {
				res = "이미 찜한 상품입니다.";
			}
		}
		
		request.setAttribute("cnt", session);
		
		
		response.sendRedirect(request.getContextPath() + "/ProdDetail.do?prodId="+prodId);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

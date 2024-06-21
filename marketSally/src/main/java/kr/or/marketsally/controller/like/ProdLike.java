package kr.or.marketsally.controller.like;

import java.io.IOException;
import java.util.List;

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

// 마이페이지 - 상품 찜 목록 출력

@WebServlet("/ProdLike.do")
public class ProdLike extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MemberVO memVO = null;
		List<LikeVO> likeList = null;
		int cnt = 0;
		
		HttpSession session = request.getSession();
		
		// 회원이 로그인중이면 로직을 실행한다.
		if (session.getAttribute("sessionMember") != null) {
			  //세션의 값을 가져오기
			  memVO = (MemberVO)session.getAttribute("sessionMember");
			  
			  ILikeService service = LikeServiceImpl.getInstance();
			  
			  likeList = (List<LikeVO>) service.selectLikes(memVO.getMem_id());
			  cnt = service.likeListCnt(memVO.getMem_id());
		}

		request.setAttribute("likeList", likeList);
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("/WEB-INF/views/mypage/mypage_like.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

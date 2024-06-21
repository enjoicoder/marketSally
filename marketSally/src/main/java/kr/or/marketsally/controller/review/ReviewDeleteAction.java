package kr.or.marketsally.controller.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.marketsally.controller.Action;
import kr.or.marketsally.member.vo.MemberVO;
import kr.or.marketsally.review.service.IReviewService;
import kr.or.marketsally.review.service.ReviewServiceImpl;
import kr.or.marketsally.review.vo.ReviewVO;

public class ReviewDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ReviewVO revVO = new ReviewVO();
		MemberVO memVO = null;
		String prod_id = request.getParameter("prodId");

		//세션을 생성한다.
		HttpSession session = request.getSession();

		// 회원이 로그인중이면 로직을 실행한다.
		if (session.getAttribute("sessionMember") != null) {
			//세션의 값을 가져오기
			memVO = (MemberVO)session.getAttribute("sessionMember");

			revVO.setMem_id(memVO.getMem_id());
			revVO.setProd_id(prod_id);

			IReviewService service = ReviewServiceImpl.getInstance();
			service.deleteReview(revVO);
		}

	}

}

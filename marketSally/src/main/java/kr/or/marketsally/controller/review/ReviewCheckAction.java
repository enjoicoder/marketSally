package kr.or.marketsally.controller.review;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.marketsally.controller.Action;
import kr.or.marketsally.member.vo.MemberVO;
import kr.or.marketsally.review.service.IReviewService;
import kr.or.marketsally.review.service.ReviewServiceImpl;

public class ReviewCheckAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberVO memVO = null;
		int cnt = 0;
		String prod_id = request.getParameter("prodId");

		//세션을 생성한다.
		HttpSession session = request.getSession();

		// 회원이 로그인중이면 로직을 실행한다.
		if (session.getAttribute("sessionMember") != null) {
			//세션의 값을 가져오기
			memVO = (MemberVO)session.getAttribute("sessionMember");

			IReviewService service = ReviewServiceImpl.getInstance();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("prod_id", prod_id);
			map.put("mem_id", memVO.getMem_id());

			cnt = service.purchasedCheck(map);
		}


		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(cnt);
	}

}

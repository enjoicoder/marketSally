package kr.or.marketsally.controller.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.marketsally.controller.Action;
import kr.or.marketsally.member.vo.MemberVO;


public class MyPrivateDataAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		MemberVO memVO = null;
		HttpSession session = request.getSession();
		
		if(session.getAttribute("sessionMember") != null) {
			memVO = (MemberVO)session.getAttribute("sessionMember");
			memVO.getMem_pass();
		}
		
		request.setAttribute("memVo", memVO);
	}

}

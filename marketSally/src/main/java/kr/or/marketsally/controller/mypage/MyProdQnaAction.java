package kr.or.marketsally.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.marketsally.controller.Action;
import kr.or.marketsally.member.vo.MemberVO;
import kr.or.marketsally.prodqna.service.IProdQnaService;
import kr.or.marketsally.prodqna.service.ProdQnaServiceImpl;
import kr.or.marketsally.prodqna.vo.ProdQnaVO;

public class MyProdQnaAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		MemberVO memVO = null;
		List<ProdQnaVO> qnaList = null;
		//세션을 생성한다.
		HttpSession session = request.getSession();
		
		// 회원이 로그인중이면 로직을 실행한다.
		if (session.getAttribute("sessionMember") != null) {
			  //세션의 값을 가져오기
			  memVO = (MemberVO)session.getAttribute("sessionMember");
			  
			  IProdQnaService qnaService = ProdQnaServiceImpl.getInstance();
			  ProdQnaVO pqVO = new ProdQnaVO();
			  pqVO.setMem_id(memVO.getMem_id());
			  qnaList = qnaService.selectProdQnaList(pqVO);
			}
			  
		request.setAttribute("qnaList", qnaList);

	}

}

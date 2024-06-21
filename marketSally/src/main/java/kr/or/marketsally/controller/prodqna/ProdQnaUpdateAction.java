package kr.or.marketsally.controller.prodqna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.marketsally.controller.Action;
import kr.or.marketsally.member.vo.MemberVO;
import kr.or.marketsally.prodqna.service.IProdQnaService;
import kr.or.marketsally.prodqna.service.ProdQnaServiceImpl;
import kr.or.marketsally.prodqna.vo.ProdQnaVO;

public class ProdQnaUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberVO memVO = null;
		ProdQnaVO prqaVO = null;
		String prod_id = request.getParameter("prodQnaProdId");
		String prqa_title = request.getParameter("prodQnaTitle");
		String prqa_cont = request.getParameter("prodQnaCont").replaceAll("<", "&lt;")
				.replaceAll("\r\n", "<br>").replaceAll(" ", "&nbsp;");;
		
		//세션을 생성한다.
		HttpSession session = request.getSession();
		
		// 회원이 로그인중이면 로직을 실행한다.
		if (session.getAttribute("sessionMember") != null) {
			  //세션의 값을 가져오기
			  memVO = (MemberVO)session.getAttribute("sessionMember");
			  
			  IProdQnaService service = ProdQnaServiceImpl.getInstance();

			  prqaVO = new ProdQnaVO();
			  prqaVO.setMem_id(memVO.getMem_id());
			  prqaVO.setProd_id(prod_id);
			  prqaVO.setPrqa_title(prqa_title);
			  prqaVO.setPrqa_qcont(prqa_cont);
			  
			  service.updateProdQna(prqaVO);
			}
	}

}

package kr.or.marketsally.controller.prodqna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.controller.Action;
import kr.or.marketsally.prodqna.service.IProdQnaService;
import kr.or.marketsally.prodqna.service.ProdQnaServiceImpl;
import kr.or.marketsally.prodqna.vo.ProdQnaVO;

public class ProdQnaAnswerAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String prod_id = request.getParameter("prodQnaProdId");
		String mem_id = request.getParameter("prodQnaMemId");
		String prqa_acont = request.getParameter("prodQnaACont").replaceAll("<", "&lt;")
						.replaceAll("\r\n", "<br>").replaceAll(" ", "&nbsp;");
		
		System.out.println(prqa_acont);
		IProdQnaService service = ProdQnaServiceImpl.getInstance();

		ProdQnaVO prqaVO = new ProdQnaVO();
		prqaVO.setMem_id(mem_id);
		prqaVO.setProd_id(prod_id);
		prqaVO.setPrqa_acont(prqa_acont);

		service.answerProdQna(prqaVO);
	}

}

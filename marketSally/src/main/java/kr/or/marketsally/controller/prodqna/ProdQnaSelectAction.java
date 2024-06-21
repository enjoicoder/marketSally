package kr.or.marketsally.controller.prodqna;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.marketsally.controller.Action;
import kr.or.marketsally.member.vo.MemberVO;
import kr.or.marketsally.prodqna.service.IProdQnaService;
import kr.or.marketsally.prodqna.service.ProdQnaServiceImpl;
import kr.or.marketsally.prodqna.vo.ProdQnaVO;

public class ProdQnaSelectAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");

		MemberVO memVO = null;
		String prod_id = request.getParameter("prodId");
		ProdQnaVO setVO = null;
		ProdQnaVO resVO = null;

		Gson gson = new Gson();
		String jsonString = null;
		//세션을 생성한다.
		HttpSession session = request.getSession();

		// 회원이 로그인중이면 로직을 실행한다.
		if (session.getAttribute("sessionMember") != null) {
			//세션의 값을 가져오기
			memVO = (MemberVO)session.getAttribute("sessionMember");

			IProdQnaService service = ProdQnaServiceImpl.getInstance();
			setVO = new ProdQnaVO();
			setVO.setMem_id(memVO.getMem_id());
			setVO.setProd_id(prod_id);

			resVO = service.selectProdQna(setVO);
			
			jsonString = gson.toJson(resVO);
		}


		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(jsonString);
			response.flushBuffer();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}

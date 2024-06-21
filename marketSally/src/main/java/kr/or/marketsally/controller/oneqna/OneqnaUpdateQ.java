package kr.or.marketsally.controller.oneqna;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.oneqna.service.IOneqnaService;
import kr.or.marketsally.oneqna.service.OneqnaServiceImpl;
import kr.or.marketsally.oneqna.vo.OneqnaVO;

@WebServlet("/oneqnaUpdateQ.do")
public class OneqnaUpdateQ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		IOneqnaService service = OneqnaServiceImpl.getInstance();
		OneqnaVO oneqnaVo =new OneqnaVO();
		String oneqTitle = request.getParameter("oneq_title");
		String oneqCont = request.getParameter("oneq_cont");
		String oneqSec = request.getParameter("oneq_sec");
		String oneqId = request.getParameter("oneq_id");
		
		oneqnaVo.setOneq_title(oneqTitle);
		oneqnaVo.setOneq_cont(oneqCont);
		if(oneqSec==null) oneqSec="off";
		oneqnaVo.setOneq_sec(oneqSec);
		oneqnaVo.setOneq_id(oneqId);
		
		service.updateOneQ(oneqnaVo);
		response.sendRedirect(request.getContextPath()+"/oneqnaList.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

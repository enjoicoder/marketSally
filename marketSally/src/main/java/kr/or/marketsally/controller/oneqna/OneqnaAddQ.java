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

/**
 * Servlet implementation class OneqnAddQ
 */
@WebServlet("/oneqnaAddQ.do")
public class OneqnaAddQ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int cnt=0;
		OneqnaVO oneqnaVo = new OneqnaVO(); 
		IOneqnaService service= OneqnaServiceImpl.getInstance();
		
		String oneqTitle=request.getParameter("oneq_title");
		String oneqCont=request.getParameter("oneq_cont");
		String oneqSec=request.getParameter("oneq_sec");
		String memId=request.getParameter("mem_id");
		String oneqStatus=request.getParameter("oneq_status");
		

		oneqnaVo.setOneq_title(oneqTitle);
		oneqnaVo.setOneq_cont(oneqCont);
		oneqnaVo.setOneq_sec(oneqSec);
		oneqnaVo.setMem_id(memId);
		oneqnaVo.setOneq_status(oneqStatus);
		
		cnt= service.insertOneqnaQ(oneqnaVo);
		response.sendRedirect(request.getContextPath()+"/oneqnaList.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

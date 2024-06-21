package kr.or.marketsally.controller.oneqna;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.notice.vo.NoticeVO;
import kr.or.marketsally.oneqna.service.IOneqnaService;
import kr.or.marketsally.oneqna.service.OneqnaServiceImpl;
import kr.or.marketsally.oneqna.vo.OneqnaVO;

@WebServlet("/oneqnaUpdateFormQ.do")
public class OneqnaUpdateFormQ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String memId=request.getParameter("mem_id");
		String oneqId=request.getParameter("oneq_id");
		String oneqTitle=request.getParameter("oneq_title");
		String oneqStatus=request.getParameter("oneq_status");
		String oneqCont=request.getParameter("oneq_cont");
		
		OneqnaVO oneqnaVo = new OneqnaVO();
		
		oneqnaVo.setMem_id(memId);
		oneqnaVo.setOneq_id(oneqId);
		oneqnaVo.setOneq_title(oneqTitle);
		oneqnaVo.setOneq_status(oneqStatus);
		oneqnaVo.setOneq_cont(oneqCont);
		
		IOneqnaService service = OneqnaServiceImpl.getInstance();
				
		List<OneqnaVO> oneqnaList = service.getOneqnaDetail(oneqId);
		
		request.setAttribute("getOneqnaDetail", oneqnaList);
		
		request.getRequestDispatcher("/oneqna_updateFormQ.jsp").forward(request, response);
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

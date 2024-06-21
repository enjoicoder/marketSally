package kr.or.marketsally.controller.oneqna;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.oneqna.service.IOneqnaService;
import kr.or.marketsally.oneqna.service.OneqnaServiceImpl;
import kr.or.marketsally.oneqna.vo.OneqnaVO;

@WebServlet("/oneqnaDetail.do")
public class OneqnaDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String oneqId=request.getParameter("oneq_id");
		IOneqnaService service = OneqnaServiceImpl.getInstance();

		List<OneqnaVO> oneqnaList = service.getOneqnaDetail(oneqId);
		request.setAttribute("getOneqnaDetail", oneqnaList);
		
		request.getRequestDispatcher("/oneqna_detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

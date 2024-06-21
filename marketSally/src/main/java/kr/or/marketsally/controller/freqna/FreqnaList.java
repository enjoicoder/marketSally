package kr.or.marketsally.controller.freqna;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.freqna.service.FreqnaServiceImpl;
import kr.or.marketsally.freqna.service.IFreqnaService;
import kr.or.marketsally.freqna.vo.FreqnaVO;


@WebServlet("/freqnaList.do")
public class FreqnaList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IFreqnaService service = FreqnaServiceImpl.getInstance();
		List<FreqnaVO> freqnaList= service.getAllFreqna();
		System.out.println(freqnaList);
		request.setAttribute("freqnaList", freqnaList);

		RequestDispatcher rd =request.getRequestDispatcher("/freqnaList.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package kr.or.marketsally.controller.freqna;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.freqna.service.FreqnaServiceImpl;
import kr.or.marketsally.freqna.service.IFreqnaService;
import kr.or.marketsally.freqna.vo.FreqnaVO;

/**
 * Servlet implementation class FreqnaAdd
 */
@WebServlet("/freqnaAdd.do")
public class FreqnaAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int cnt=0;
		String freqCate=request.getParameter("freq_cate");
		String freqCont=request.getParameter("freq_cont");
		String freqTitle=request.getParameter("freq_title");
		String memId=request.getParameter("mem_id");
		
		FreqnaVO freqnaVo = new FreqnaVO();
		freqnaVo.setFreq_cate(freqCate);
		freqnaVo.setFreq_cont(freqCont);
		freqnaVo.setFreq_title(freqTitle);
		freqnaVo.setMem_id(memId);
		
		IFreqnaService service = FreqnaServiceImpl.getInstance();
		cnt = service.insertFreqna(freqnaVo);
		response.sendRedirect(request.getContextPath()+"/freqnaList.do");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

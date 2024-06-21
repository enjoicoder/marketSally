package kr.or.marketsally.controller.notice;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.notice.service.INoticeService;
import kr.or.marketsally.notice.service.NoticeServiceImpl;
import kr.or.marketsally.notice.vo.NoticeVO;

/**
 * Servlet implementation class NoticeUpdateForm
 */
@WebServlet("/noticeUpdateForm.do")
public class NoticeUpdateForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String memId= request.getParameter("mem_id");
		String noticeId= request.getParameter("notice_id");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("mem_id", memId);
		map.put("notice_id", noticeId);
		
		INoticeService service=NoticeServiceImpl.getInstance();

		NoticeVO noticeVo= service.getNoticeDetail(map);
		request.setAttribute("getNoticeDetail", noticeVo);
		
		request.getRequestDispatcher("/notice_updateForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

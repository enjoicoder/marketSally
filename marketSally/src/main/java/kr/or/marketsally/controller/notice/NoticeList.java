package kr.or.marketsally.controller.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.notice.service.INoticeService;
import kr.or.marketsally.notice.service.NoticeServiceImpl;
import kr.or.marketsally.notice.vo.NoticeVO;

@WebServlet("/noticeList.do")
public class NoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		INoticeService service=NoticeServiceImpl.getInstance();
		List<NoticeVO> noticeList = service.getNoticeList();
		request.setAttribute("noticeList", noticeList);
		RequestDispatcher rd =request.getRequestDispatcher("/noticeList.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

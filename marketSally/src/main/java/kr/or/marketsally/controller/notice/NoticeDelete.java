package kr.or.marketsally.controller.notice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.notice.service.INoticeService;
import kr.or.marketsally.notice.service.NoticeServiceImpl;
import kr.or.marketsally.notice.vo.NoticeVO;

/**
 * Servlet implementation class NoticeDelete
 */
@WebServlet("/noticeDelete.do")
public class NoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String noticeId= request.getParameter("notice_id");
		String memId= request.getParameter("mem_id");
		
		NoticeVO noticeVo = new NoticeVO();
		noticeVo.setNotice_id(noticeId);
		noticeVo.setMem_id(memId);
		
		System.out.println("notice_id : "+noticeId);
		System.out.println("memid : "+memId);
		INoticeService service=NoticeServiceImpl.getInstance();
		service.deleteNotice(noticeVo);
		response.sendRedirect(request.getContextPath()+"/noticeList.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

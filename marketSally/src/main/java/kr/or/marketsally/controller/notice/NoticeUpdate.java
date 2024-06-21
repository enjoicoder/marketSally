package kr.or.marketsally.controller.notice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.notice.service.INoticeService;
import kr.or.marketsally.notice.service.NoticeServiceImpl;
import kr.or.marketsally.notice.vo.NoticeVO;

/**
 * Servlet implementation class NoticeUpdate
 */
@WebServlet("/noticeUpdate.do")
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String memId= request.getParameter("mem_id");
		String noticeId= request.getParameter("notice_id");
		String noticeCont= request.getParameter("notice_cont");
		String noticeTitle= request.getParameter("notice_title");
		
		System.out.println("memID : "+memId);
		System.out.println("noticeID : "+noticeId);
		System.out.println("noticeCont : "+noticeCont);
		System.out.println("noticeTitle : "+noticeTitle);
		
		NoticeVO noticeVo = new NoticeVO();
		noticeVo.setMem_id(memId);
		noticeVo.setNotice_id(noticeId);
		noticeVo.setNotice_cont(noticeCont);
		noticeVo.setNotice_title(noticeTitle);
		
		INoticeService service = NoticeServiceImpl.getInstance();
		service.updateNotice(noticeVo);
		response.sendRedirect(request.getContextPath()+"/noticeList.do");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

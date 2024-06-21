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
 * Servlet implementation class NoticeAdd
 */
@WebServlet("/noticeAdd.do")
public class NoticeAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int cnt=0;	
		String noticeTitle = request.getParameter("notice_title");
		String noticeCont = request.getParameter("notice_cont");
		String memId= request.getParameter("mem_id");
		NoticeVO noticeVo = new NoticeVO();
		noticeVo.setNotice_title(noticeTitle);
		noticeVo.setNotice_cont(noticeCont);
		noticeVo.setMem_id(memId);
		
		INoticeService service = NoticeServiceImpl.getInstance();
		cnt = service.insertNotice(noticeVo);
		System.out.println("noticeTitle : "+noticeTitle);
		System.out.println("noticeCont : "+noticeCont);
		System.out.println("memId : "+memId);
		System.out.println("return : "+cnt);
		response.sendRedirect(request.getContextPath()+"/noticeList.do");
		
//		request.setAttribute("result", cnt);
		
//		response.sendRedirect(request.getContextPath()+"/");
	
	}

}

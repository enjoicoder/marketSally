package kr.or.marketsally.controller.notice;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
 * Servlet implementation class NoticeDetail
 */
@WebServlet("/noticeDetail.do")
public class NoticeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String mem_id=request.getParameter("mem_id");
		String notice_id=request.getParameter("notice_id");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("mem_id", mem_id);
		map.put("notice_id", notice_id);
		INoticeService service=NoticeServiceImpl.getInstance();

		NoticeVO noticeVo= service.getNoticeDetail(map);
		
		System.out.println("mem_id:" + mem_id);
		System.out.println("notice_id:" + notice_id);
		System.out.println("mem_name:" + noticeVo.getMem_name());
		System.out.println("vo:" + noticeVo);
		request.setAttribute("getNoticeDetail", noticeVo);
		
		request.getRequestDispatcher("/notice_detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

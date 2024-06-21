package kr.or.marketsally.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.marketsally.member.service.IMemberService;
import kr.or.marketsally.member.service.MemberServiceImpl;
import kr.or.marketsally.member.vo.MemberVO;


@WebServlet("/updateSally.do")
public class UpdateSally extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();
		
		String logId = request.getParameter("mem_logid");
		String pass = request.getParameter("mem_pass");
		String email = request.getParameter("mem_email");
		String add = request.getParameter("mem_add");
		
		System.out.println("logId: " + logId);
		
		MemberVO mvo = new MemberVO();
		mvo.setMem_pass(pass);
		mvo.setMem_email(email);
		mvo.setMem_add(add);
		mvo.setMem_logid(logId);
		
		System.out.println("mvo = " + mvo.toString());
		
		IMemberService service = MemberServiceImpl.getInstance();

		int res = 0;
		res = service.updateMember(mvo);
		System.out.println("res: " + res);
		
		if(res == 1) {	// update에 성공했을 경우 세션을 다시 저장후 메인으로 이동

			MemberVO logVo = new MemberVO();
			logVo.setMem_logid(logId);
			logVo.setMem_pass(pass);
			
			MemberVO login = service.compareDBToLogin(logVo);
			session.setAttribute("sessionMember", login);

			String PageUrl = request.getContextPath() + "/index.jsp";
			writer.println("<script>alert('회원정보가 수정되었습니다.'); location.href='"+PageUrl+"';</script>"); 
			writer.flush();
		}
		
		response.sendRedirect(request.getContextPath() + "/WEB-INF/views/mypage/mypage_privateupdate.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

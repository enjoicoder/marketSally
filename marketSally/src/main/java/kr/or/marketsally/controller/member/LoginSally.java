package kr.or.marketsally.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.marketsally.member.service.IMemberService;
import kr.or.marketsally.member.service.MemberServiceImpl;
import kr.or.marketsally.member.vo.MemberVO;


@WebServlet("/loginSally.do")
public class LoginSally extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter writer = response.getWriter();

		
		// 입력창에 적은 로그인아이디와 비밀번호의 데이터를 가져옴
		String logId = request.getParameter("id");
		String logPass = request.getParameter("pass");
		
		System.out.println("id = " + logId );
		System.out.println("pass = " + logPass);
		int res = 0;	// DB와 비교하여 결과물을 저장할 변수
		String result = null;	// 로그인이 실패했을 경우 띄워줄 메시지를 저장할 변수
		
		// 파라미터로 가져온 로그인ID와 비밀번호를 vo에 저장
		MemberVO logVo = new MemberVO();
		logVo.setMem_logid(logId);
		logVo.setMem_pass(logPass);
		// service 객체 호출
		IMemberService service = MemberServiceImpl.getInstance();
		
		// service 결과
		MemberVO memVo = service.compareDBToLogin(logVo);
		
		HttpSession session = request.getSession();
		
		if(memVo != null) {  // 아이디와 비밀번호가 일치 로그인 성공
			
			// 세션 객체 생성
			session.setAttribute("sessionMember", memVo);
		}else {
			String PageUrl = request.getContextPath() + "/member/logOn.jsp";
	        writer.println("<script>alert('아이디, 비밀번호를 확인해주세요'); location.href='"+PageUrl+"';</script>"); 
	        writer.flush();

		}
		
		response.sendRedirect(request.getContextPath() + "/member/logOn.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

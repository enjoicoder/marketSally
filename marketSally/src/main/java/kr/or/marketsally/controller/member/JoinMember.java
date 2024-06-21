package kr.or.marketsally.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.member.service.IMemberService;
import kr.or.marketsally.member.service.MemberServiceImpl;
import kr.or.marketsally.member.vo.MemberVO;


@WebServlet("/joinMember.do")
public class JoinMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String logId = request.getParameter("mem_logid");
		String pass = request.getParameter("mem_pass");
		String name = request.getParameter("mem_name");
		String email = request.getParameter("mem_email");
		String grade = request.getParameter("mem_grade");
		String tel = request.getParameter("mobile1");
		tel += "-" + request.getParameter("mobile2");
		tel += "-" + request.getParameter("mobile3");
		System.out.println("tel: " + tel);
		String add = request.getParameter("mem_add");
		String gender = request.getParameter("mem_gender");
		String bir = request.getParameter("mem_bir");
		int point = Integer.parseInt(request.getParameter("mem_point"));
		
		MemberVO mvo = new MemberVO();
		mvo.setMem_logid(logId);
		mvo.setMem_pass(pass);
		mvo.setMem_name(name);
		mvo.setMem_email(email);
		mvo.setMem_grade(grade);
		mvo.setMem_tel(tel);
		mvo.setMem_add(add);
		mvo.setMem_gender(gender);
		mvo.setMem_bir(bir);
		mvo.setMem_point(point);
		
		System.out.println("mvo = " + mvo);
		
		IMemberService service = MemberServiceImpl.getInstance();
		String memName = service.joinMember(mvo);
		System.out.println("memName: " + memName);
		
//		String flag = "";
//		if(memName == request.getParameter("mem_name")) {
//			flag = "성공";
//		}else {
//			flag = "실패";
//		}
//		request.setAttribute("flag", flag);
//		
//		request.getRequestDispatcher("member/join_test.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}

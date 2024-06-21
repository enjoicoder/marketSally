package kr.or.marketsally.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.marketsally.member.service.IMemberService;
import kr.or.marketsally.member.service.MemberServiceImpl;
import kr.or.marketsally.member.vo.MemberVO;

@WebServlet("/findIdSally.do")
public class FindIdSally extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/jason; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		System.out.println("name, email = " + name + ", " + email);
		
		MemberVO mvo = new MemberVO();
		mvo.setMem_name(name);
		mvo.setMem_email(email);
		
		System.out.println("mvo = " + mvo.toString());
		
		IMemberService service = MemberServiceImpl.getInstance();
		String findId = service.findIdSally(mvo);
		System.out.println("findId = " + findId);
		
		Gson gson = new Gson();	// Gson객체 생성
		String jsonData = "";
		if(findId != null) {
			jsonData = gson.toJson(findId);
		}else {
			jsonData = gson.toJson("회원정보가 일치하지 않습니다.");
		}
		
		out.write(jsonData);
		out.flush();
		
		System.out.println("jsonData: " + jsonData);
		

	}

}

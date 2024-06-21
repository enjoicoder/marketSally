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

@WebServlet("/checkPass.do")
public class CheckPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		String data = request.getParameter("pass");
		String res = "";
		
		System.out.println("data = " + data);
		
		IMemberService service = MemberServiceImpl.getInstance();
		String checkPass = service.checkPass(data);
		System.out.println("checkPass = " + checkPass);
		
		Gson gson = new Gson();
		
		if(checkPass.equals(data) == true) {
			res = gson.toJson("ok");
			System.out.println(res);
		}else {
			res = gson.toJson("reject");
		}
		
		PrintWriter out = response.getWriter();
		out.println(res);
		response.flushBuffer();
	}

}

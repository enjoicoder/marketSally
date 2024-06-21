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


@WebServlet("/checkID.do")
public class CheckID extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		String data = request.getParameter("id");
		
		System.out.println("data = " + data);
		
		IMemberService service = MemberServiceImpl.getInstance();
		String dupId = service.searchID(data);
		
		System.out.println("dupId = " + dupId);
		
		Gson gson = new Gson();
		
		String res = null;
		if(dupId == null) {
			res = gson.toJson("ok");
			System.out.println(res);
		}else {
			res = gson.toJson("fail");
		}
		
		PrintWriter out = response.getWriter();
		out.println(res);
		response.flushBuffer();
		
	}

}

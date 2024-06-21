package kr.or.marketsally.controller.prod;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.product.service.IProdService;
import kr.or.marketsally.product.service.ProdServiceImpl;

@WebServlet("/ProdDelete.do")
public class ProdDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String prodId = request.getParameter("prodID");
		IProdService service = ProdServiceImpl.getInstance();
		
		int cnt = service.deleteProd(prodId);
		
		response.sendRedirect(request.getContextPath() + "/ProdList_Admin.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

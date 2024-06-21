package kr.or.marketsally.controller.prod;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.product.service.IProdService;
import kr.or.marketsally.product.service.ProdServiceImpl;
import kr.or.marketsally.product.vo.ProdVO;

@WebServlet("/ProdList_Admin.do")
public class ProdList_Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		IProdService service = ProdServiceImpl.getInstance();
		
		List<ProdVO> prodList = service.getAllProdList();
		request.setAttribute("prodList", prodList);
		
		RequestDispatcher rd = request.getRequestDispatcher("product/admin_product.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package kr.or.marketsally.controller.prod;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.product.service.IProdService;
import kr.or.marketsally.product.service.ProdServiceImpl;
import kr.or.marketsally.product.vo.ProdVO;

@WebServlet("/ProdUpdateBefore.do")
public class ProdUpdateBefore extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String prodId = request.getParameter("prodID");
		
		IProdService service = ProdServiceImpl.getInstance();
		
		ProdVO prodVo =  service.getProd(prodId);
	
		request.setAttribute("selectedProd", prodVo);
		
		request.getRequestDispatcher("/product/product_update.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

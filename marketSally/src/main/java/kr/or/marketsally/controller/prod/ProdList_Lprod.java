package kr.or.marketsally.controller.prod;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.product.service.IProdService;
import kr.or.marketsally.product.service.ProdServiceImpl;
import kr.or.marketsally.product.vo.ProdVO;


@WebServlet("/ProdList_Lprod.do")
public class ProdList_Lprod extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
			
		String lprodId = request.getParameter("lprodId");
		
		IProdService service = ProdServiceImpl.getInstance();
		
		List<ProdVO> lprodList = service.prodofLprod(lprodId);
		String lname = service.getLprodName(lprodId);
		int cnt = service.getProdCnt(lprodId);
		
		request.setAttribute("lprodList", lprodList);
		request.setAttribute("lprodname", lname);
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("/product/product_list_lprod.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

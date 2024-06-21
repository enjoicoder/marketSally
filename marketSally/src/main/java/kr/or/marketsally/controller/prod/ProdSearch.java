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

@WebServlet("/ProdSearch.do")
public class ProdSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String data = request.getParameter("searched");
		
		IProdService service = ProdServiceImpl.getInstance();
		
		int cnt = service.searchProdCnt(data);
		List<ProdVO> list = service.searchProd(data);
				
		request.setAttribute("searchedResult", list);
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("/product/product_list_searched.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

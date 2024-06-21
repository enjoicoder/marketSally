package kr.or.marketsally.controller.prod;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.prodqna.service.IProdQnaService;
import kr.or.marketsally.prodqna.service.ProdQnaServiceImpl;
import kr.or.marketsally.prodqna.vo.ProdQnaVO;
import kr.or.marketsally.product.service.IProdService;
import kr.or.marketsally.product.service.ProdServiceImpl;
import kr.or.marketsally.product.vo.ProdVO;
import kr.or.marketsally.review.service.IReviewService;
import kr.or.marketsally.review.service.ReviewServiceImpl;
import kr.or.marketsally.review.vo.ReviewVO;

@WebServlet("/ProdDetail.do")
public class ProdDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String prodId = request.getParameter("prodId");
		
		IProdService service = ProdServiceImpl.getInstance();
		
		ProdVO prodVo =  service.getProd(prodId);
	
		// 상품문의리스트 가져오기
		IProdQnaService qnaService = ProdQnaServiceImpl.getInstance();
		ProdQnaVO pqVO = new ProdQnaVO();
		pqVO.setProd_id(prodId);
		List<ProdQnaVO> qnaList = qnaService.selectProdQnaList(pqVO);
		
		// 상품후기 리스트 가져오기
		IReviewService reviewService = ReviewServiceImpl.getInstance();
		List<ReviewVO> reviewList = reviewService.selectReviewList(prodId);
		
		request.setAttribute("reviewList", reviewList);
		
		request.setAttribute("qnaList", qnaList);
		
		request.setAttribute("selectedProd", prodVo);
		
		request.getRequestDispatcher("/product/products_detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

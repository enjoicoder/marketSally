package kr.or.marketsally.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.controller.prodqna.ProdQnaSelectAction;
import kr.or.marketsally.controller.review.ReviewCheckAction;
import kr.or.marketsally.controller.review.SelectMyReviewAction;

@WebServlet("*.ajax")
public class AjaxController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public AjaxController() {}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); // 한글 인코딩
		
		// URL로부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		switch (com) { 
		
		case "/selectMyReview.ajax":
			new SelectMyReviewAction().execute(request, response); 
			break;
			
		case "/ProdQnaSelect.ajax":
			new ProdQnaSelectAction().execute(request, response); 
			break;
			
		// 리뷰 작성전 상품 구매여부 체크
		case "/ReviewCheck.ajax":
			new ReviewCheckAction().execute(request, response); 
			break;
			
		}
		
	}
}

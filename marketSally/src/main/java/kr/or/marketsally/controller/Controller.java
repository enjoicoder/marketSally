package kr.or.marketsally.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.controller.mypage.MyOrderAction;
import kr.or.marketsally.controller.mypage.MyOrderDetailAction;
import kr.or.marketsally.controller.mypage.MyPrivateDataAction;
import kr.or.marketsally.controller.mypage.MyPrivateUpdateAction;
import kr.or.marketsally.controller.mypage.MyProdQnaAction;
import kr.or.marketsally.controller.mypage.MyProdReviewAction;
import kr.or.marketsally.controller.prod.ProdListAction;
import kr.or.marketsally.controller.prodqna.ProdQnaAnswerAction;
import kr.or.marketsally.controller.prodqna.ProdQnaDeleteAction;
import kr.or.marketsally.controller.prodqna.ProdQnaInsertAction;
import kr.or.marketsally.controller.prodqna.ProdQnaUpdateAction;
import kr.or.marketsally.controller.review.ReviewDeleteAction;

@WebServlet("*.do")
public class Controller extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public Controller() {}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
		System.out.println("doGet() 호출");
	}
	

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
		System.out.println("doPost() 호출");
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo() 호출");
		
		request.setCharacterEncoding("utf-8"); // 한글 인코딩
		
		// URL로부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		Action command = null;
		String viewPage = null;
		boolean isRedirect = false;

		
		switch (com) { 
		
		case "/index.do":
			command = new ProdListAction(); // 1. 커맨드(로직) 결정
			command.execute(request, response); // 커맨드 실행
			viewPage = "/WEB-INF/views/index.jsp"; // 2. 페이지(뷰) 결정
			break;
			
		case "/adminMember.do":
			viewPage = "/WEB-INF/views/admin/admin_member.jsp";
			break;
			
		case "/TestLogin.do":
			command = new TestLogin();
			command.execute(request, response);
			viewPage = "/index.jsp";
			break;
		
		// 장바구니
		case "/myCart.do":
			command = new MyCartAction();
			command.execute(request, response);
			viewPage = "/cart.jsp";
			break;
		case "/myCartUpdate.do":
			command = new MyCartUpdateAction();
			command.execute(request, response);
			isRedirect = true; // 리다이렉트로 보낼시 true 으로 변경
			viewPage = request.getContextPath()+"/myCart.do";
			break;
		case "/myCartDelete.do":
			command = new MyCartDeleteAction();
			command.execute(request, response);
			isRedirect = true;
			viewPage = request.getContextPath()+"/myCart.do";
			break;
		
		// 결제 페이지
		case "/payPage.do":
			command = new MyCartAction();
			command.execute(request, response);
			viewPage = "/order_checkout.jsp";
			break;
		// 결제 처리
		case "/orderCheckout.do":
			command = new OrderCheckoutAction(); // 1. 커맨드(로직) 결정
			command.execute(request, response); // 커맨드 실행
			viewPage = "/WEB-INF/views/order/payOk.jsp"; // 2. 페이지(뷰) 결정
			break;
			
		// 마이페이지 주문내역
		case "/mypage_order.do":
			command = new MyOrderAction();
			command.execute(request, response);
			viewPage = "/WEB-INF/views/mypage/mypage_order.jsp";
			break;
			
		// 마이페이지 주문내역 상세정보
		case "/mypage_order_detail.do":
			command = new MyOrderDetailAction();
			command.execute(request, response);
			viewPage = "/WEB-INF/views/mypage/mypage_order_detail.jsp";
			break;
		
		// 마이페이지 상품후기
		case "/mypage_review.do":
			command = new MyProdReviewAction();
			command.execute(request, response);
			viewPage = "/WEB-INF/views/mypage/mypage_review.jsp";
			break;
		
		// 마이페이지 상품후기 삭제
		case "/myReviewDelete.do":
			command = new ReviewDeleteAction();
			command.execute(request, response);
			isRedirect = true;
			viewPage = request.getContextPath()+"/mypage_review.do";
			break;
		
		// 마이페이지 상품문의
		case "/mypage_prodQna.do":
			command = new MyProdQnaAction();
			command.execute(request, response);
			viewPage = "/WEB-INF/views/mypage/mypage_prodQna.jsp";
			break;
		
		// 마이페이지 상품문의 삭제
		case "/myProdQnaDelete.do":
			command = new ProdQnaDeleteAction();
			command.execute(request, response);
			isRedirect = true;
			viewPage = request.getContextPath()+"/mypage_prodQna.do";
			break;
			
		// 마이페이지 상품문의 수정
		case "/myProdQnaUpdate.do":
			command = new ProdQnaUpdateAction();
			command.execute(request, response);
			isRedirect = true;
			viewPage = request.getContextPath()+"/mypage_prodQna.do";
			break;
		
		// 상품디테일 상품후기 삭제
		case "/ReviewDelete.do":
			command = new ReviewDeleteAction();
			command.execute(request, response);
			isRedirect = true;
			viewPage = request.getContextPath()+"/ProdDetail.do?prodId="+request.getParameter("prodId");
			break;
			
		// 상품디테일 상품문의 추가
		case "/ProdQnaInsert.do":
			command = new ProdQnaInsertAction();
			command.execute(request, response);
			isRedirect = true;
			viewPage = request.getContextPath()+"/ProdDetail.do?prodId="+request.getParameter("prodQnaProdId");
			break;
		
		// 상품디테일 상품문의 삭제
		case "/ProdQnaDelete.do":
			command = new ProdQnaDeleteAction();
			command.execute(request, response);
			isRedirect = true;
			viewPage = request.getContextPath()+"/ProdDetail.do?prodId="+request.getParameter("prodId");
			break;
		
		// 상품디테일 상품문의 수정
		case "/ProdQnaUpdate.do":
			command = new ProdQnaUpdateAction();
			command.execute(request, response);
			isRedirect = true;
			viewPage = request.getContextPath()+"/ProdDetail.do?prodId="+request.getParameter("prodQnaProdId");
			break;

		// 상품디테일 상품문의 답변
		case "/ProdQnaAnswer.do":
			command = new ProdQnaAnswerAction();
			command.execute(request, response);
			isRedirect = true;
			viewPage = request.getContextPath()+"/ProdDetail.do?prodId="+request.getParameter("prodQnaProdId");
			break;

		// 마이페이지 개인정보수정(비밀번호 입력)
		case "/mypage_privatedata.do":
			command = new MyPrivateDataAction();
			command.execute(request, response);
			viewPage = "/WEB-INF/views/mypage/mypage_privatedata.jsp";
			break;
				
		// 마이페이지 개인정보수정
		case "/mypage_privateupdate.do":
			command = new  MyPrivateUpdateAction();
			command.execute(request, response);
			viewPage = "/WEB-INF/views/mypage/mypage_privateupdate.jsp";
		
		}
		
		
		if (viewPage != null) {
			if(isRedirect) {
				response.sendRedirect(viewPage);
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			}
		}
		
	}
}

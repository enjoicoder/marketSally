package kr.or.marketsally.controller.like;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.like.service.ILikeService;
import kr.or.marketsally.like.service.LikeServiceImpl;
import kr.or.marketsally.like.vo.LikeVO;


@WebServlet("/DeleteLike.do")
public class DeleteLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		LikeVO lvo = new LikeVO();
		
		String prodId = request.getParameter("prodId");
		String memId = request.getParameter("memId");
		
		lvo.setProd_id(prodId);
		lvo.setMem_id(memId);
		
		ILikeService service = LikeServiceImpl.getInstance();
		service.deleteLike(lvo);
		
		response.sendRedirect(request.getContextPath() + "/ProdLike.do?memId="+memId);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

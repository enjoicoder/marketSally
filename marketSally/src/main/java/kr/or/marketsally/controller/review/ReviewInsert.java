package kr.or.marketsally.controller.review;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import kr.or.marketsally.member.vo.MemberVO;
import kr.or.marketsally.review.service.IReviewService;
import kr.or.marketsally.review.service.ReviewServiceImpl;
import kr.or.marketsally.review.vo.ReviewVO;

@WebServlet("/reviewInsert.do")
@MultipartConfig
public class ReviewInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String defaultPath = request.getServletContext().getRealPath("/");
		String uploadPath = defaultPath + "img/review";
		File fileUploadDir = new File(uploadPath);
		if (!fileUploadDir.exists()) {
			fileUploadDir.mkdirs();
		}

		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		MemberVO memVO = null;
		ReviewVO revVO = null;

		String prod_id =  request.getParameter("prodId");
		String review_title = request.getParameter("reviewTitle");
		String review_cont = request.getParameter("reviewCont");
		String isDetail = request.getParameter("proddetail");
		//세션을 생성한다.
		HttpSession session = request.getSession();

		// 회원이 로그인중이면 로직을 실행한다.
		if (session.getAttribute("sessionMember") != null) {
			//세션의 값을 가져오기
			memVO = (MemberVO)session.getAttribute("sessionMember");

			IReviewService service = ReviewServiceImpl.getInstance();
			revVO = new ReviewVO();
			revVO.setMem_id(memVO.getMem_id());
			revVO.setProd_id(prod_id);
			revVO.setReview_title(review_title);
			revVO.setReview_cont(review_cont);

			Part part = null;
			try {
				part = request.getPart("reviewImg");
			} catch (IOException | ServletException e1) {
				e1.printStackTrace();
			}

			if(part != null) {
				String photo = extractFileName(part);
				if(!"".equals(photo)) {
					try {
						String saveImage = UUID.randomUUID().toString();
						part.write(uploadPath + File.separator + saveImage);
						revVO.setReview_img(saveImage);
					}catch(IOException e) {
						revVO.setReview_img(null);
					}
				}

			}
			service.insertReview(revVO);
		}
		if(isDetail.equals("y")) {
			response.sendRedirect( request.getContextPath() + "/ProdDetail.do?prodId=" + prod_id );
		}else {
			response.sendRedirect( request.getContextPath() + "/mypage_review.do");
		}
	}

	private String extractFileName(Part part) {
		String fileName = ""; 
		String contentDisposition = part.getHeader("Content-Disposition");
		String[] items = contentDisposition.split(";");
		for (String item : items) {
			if (item.trim().startsWith("filename")) {
				fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
			}
		}
		return fileName;
	}
}

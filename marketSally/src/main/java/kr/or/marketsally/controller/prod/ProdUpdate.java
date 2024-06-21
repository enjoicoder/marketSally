package kr.or.marketsally.controller.prod;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import kr.or.marketsally.product.service.IProdService;
import kr.or.marketsally.product.service.ProdServiceImpl;
import kr.or.marketsally.product.vo.ProdVO;

@WebServlet("/ProdUpdate.do")
@MultipartConfig
public class ProdUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String defaultPath = request.getServletContext().getRealPath("/");
		String uploadPath = defaultPath + "img/product";
		
		File fileUploadDir = new File(uploadPath);
		if (!fileUploadDir.exists()) {
			fileUploadDir.mkdirs();
		}
		
		request.setCharacterEncoding("utf-8");
		String prod_id = request.getParameter("prod_id");
		String prod_name = request.getParameter("prod_name");
		String lprod_id = request.getParameter("lprod_id");
		String prod_cont = request.getParameter("prod_cont");
		String price = request.getParameter("prod_price");
		int prod_price = Integer.parseInt(request.getParameter("prod_price"));
		String prod_date = request.getParameter("prod_date");
		String pre_img = request.getParameter("pre_img");

		ProdVO prodVo = new ProdVO();
		prodVo.setProd_id(prod_id);
		prodVo.setProd_name(prod_name);
		prodVo.setProd_cont(prod_cont);
		prodVo.setLprod_id(lprod_id);
		prodVo.setProd_price(prod_price);
		prodVo.setProd_date(prod_date);
		prodVo.setProd_img(pre_img);
		
		Part part = request.getPart("prod_img");
		
		if(part != null) {
			String photo = extractFileName(part);
			if(!"".equals(photo)) {
				try {
					String saveImage = UUID.randomUUID().toString();
					part.write(uploadPath + File.separator + saveImage);
					prodVo.setProd_img(saveImage);
				}catch(IOException e) {
					prodVo.setProd_img(null);
				}
			}
				
		}
		
		
		IProdService service = ProdServiceImpl.getInstance();
		
		int cnt = service.updateProd(prodVo);
		
		response.sendRedirect( request.getContextPath() + "/ProdList_Admin.do");
		
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

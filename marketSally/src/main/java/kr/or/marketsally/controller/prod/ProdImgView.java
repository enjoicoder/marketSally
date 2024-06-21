package kr.or.marketsally.controller.prod;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.product.service.IProdService;
import kr.or.marketsally.product.service.ProdServiceImpl;
import kr.or.marketsally.product.vo.ProdVO;

@WebServlet("/ProdImgView.do")
public class ProdImgView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String prodId = request.getParameter("prodID");
		
		IProdService service = ProdServiceImpl.getInstance();
		
		ProdVO prodvo = service.getProd(prodId);
		
		String fileName = prodvo.getProd_img();
		if(fileName==null) {
			fileName = "noImage.png";
		}
		
		String defaultPath = request.getServletContext().getRealPath("/");
		String downloadPath = defaultPath + "img/product";
		
		String filePath = downloadPath + File.separator + fileName;

		File file = new File(filePath);
		BufferedOutputStream bos = null;
		BufferedInputStream bis = null;

		if (file.exists()) {
			try {
				bos = new BufferedOutputStream(response.getOutputStream());
				
				bis = new BufferedInputStream(new FileInputStream(file));
				
				byte[] buffer = new byte[1024];
				int len = -1;

				while ((len = bis.read(buffer)) > 0 ) {
					bos.write(buffer, 0, len);
				}
			} catch(IOException e) {
				System.out.println("입출력 오류 : " + e.getMessage());
			} finally {				
				if (bis != null) {	bis.close();		}
				if (bos != null) { bos.flush();	bos.close();	}
			}
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

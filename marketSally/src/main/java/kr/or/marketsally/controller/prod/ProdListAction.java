package kr.or.marketsally.controller.prod;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.marketsally.controller.Action;
import kr.or.marketsally.product.service.IProdService;
import kr.or.marketsally.product.service.ProdServiceImpl;
import kr.or.marketsally.product.vo.ProdVO;

public class ProdListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		IProdService service = ProdServiceImpl.getInstance();
		
		List<ProdVO> prodList = service.getAllProdList();
		
		request.setAttribute("prodList", prodList);

	}

}

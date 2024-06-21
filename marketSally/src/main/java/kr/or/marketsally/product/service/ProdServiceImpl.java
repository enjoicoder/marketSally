package kr.or.marketsally.product.service;

import java.util.List;

import kr.or.marketsally.product.dao.IProdDao;
import kr.or.marketsally.product.dao.ProdDaoImpl;
import kr.or.marketsally.product.vo.ProdVO;

public class ProdServiceImpl implements IProdService{
	
	private IProdDao dao;
	private static ProdServiceImpl service;
	
	private ProdServiceImpl() {
		dao = ProdDaoImpl.getInstance();
	}
	public static ProdServiceImpl getInstance() {
		if(service==null) service = new ProdServiceImpl();
		return service;
	}

	@Override
	public List<ProdVO> getAllProdList() {
		return dao.getAllProdList();
	}

	@Override
	public ProdVO getProd(String prod_id) {
		return dao.getProd(prod_id);
	}
	@Override
	public List<ProdVO> prodofLprod(String lprod_id) {
		return dao.prodofLprod(lprod_id);
	}
	@Override
	public String getLprodName(String lprod_id) {
		return dao.getLprodName(lprod_id);
	}
	@Override
	public int insertProd(ProdVO pvo) {
		return dao.insertProd(pvo);
	}
	@Override
	public List<ProdVO> getPurchasedProd(String mem_id) {
		return dao.getPurchasedProd(mem_id);
	}
	@Override
	public int updateProd(ProdVO pvo) {
		return dao.updateProd(pvo);
	}
	@Override
	public int deleteProd(String prod_id) {
		return dao.deleteProd(prod_id);
	}
	@Override
	public List<ProdVO> searchProd(String data) {
		return dao.searchProd(data);
	}
	@Override
	public int searchProdCnt(String data) {
		return dao.searchProdCnt(data);
	}
	@Override
	public int getProdCnt(String lprod_id) {
		return dao.getProdCnt(lprod_id);
	}

	
}

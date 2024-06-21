package kr.or.marketsally.product.dao;

import java.util.List;

import kr.or.marketsally.product.vo.ProdVO;


public interface IProdDao {

	public List<ProdVO> getAllProdList();
	
	public ProdVO getProd(String prod_id);
	
	public List<ProdVO> prodofLprod(String lprod_id);
	
	public String getLprodName(String lprod_id);
	
	public int insertProd(ProdVO pvo);
	
	public List<ProdVO> getPurchasedProd(String mem_id);
	
	public int updateProd(ProdVO pvo);
	
	public int deleteProd(String prod_id);
	
	public List<ProdVO> searchProd(String data);
	
	public int searchProdCnt(String data);
	
	public int getProdCnt(String lprod_id);

}

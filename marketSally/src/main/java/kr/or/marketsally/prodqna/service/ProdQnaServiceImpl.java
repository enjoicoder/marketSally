package kr.or.marketsally.prodqna.service;

import java.util.List;

import kr.or.marketsally.prodqna.dao.IProdQnaDao;
import kr.or.marketsally.prodqna.dao.ProdQnaDaoImpl;
import kr.or.marketsally.prodqna.vo.ProdQnaVO;

public class ProdQnaServiceImpl implements IProdQnaService{
	
	private IProdQnaDao dao;
	private static ProdQnaServiceImpl service;
	
	private ProdQnaServiceImpl() {
		dao = ProdQnaDaoImpl.getInstance();
	}
	public static ProdQnaServiceImpl getInstance() {
		if(service==null) service = new ProdQnaServiceImpl();
		return service;
	}
	
	@Override
	public List<ProdQnaVO> selectProdQnaList(ProdQnaVO prqnVO) {
		return dao.selectProdQnaList(prqnVO);
	}
	
	@Override
	public void insertProdQna(ProdQnaVO prqnVO) {
		dao.insertProdQna(prqnVO);
	}
	
	@Override
	public void deleteProdQna(ProdQnaVO prqnVO) {
		dao.deleteProdQna(prqnVO);
	}
	@Override
	public ProdQnaVO selectProdQna(ProdQnaVO prqnVO) {
		return dao.selectProdQna(prqnVO);
	}
	@Override
	public void updateProdQna(ProdQnaVO prqnVO) {
		dao.updateProdQna(prqnVO);
	}
	@Override
	public void answerProdQna(ProdQnaVO prqnVO) {
		dao.answerProdQna(prqnVO);
	}
	



	
}

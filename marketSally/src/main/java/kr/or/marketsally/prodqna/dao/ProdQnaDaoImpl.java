package kr.or.marketsally.prodqna.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.marketsally.prodqna.vo.ProdQnaVO;
import kr.or.marketsally.util.SqlMapClientFactory;

public class ProdQnaDaoImpl implements IProdQnaDao {

	private SqlMapClient smc;
	
	private static ProdQnaDaoImpl dao;
	
	private ProdQnaDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static ProdQnaDaoImpl getInstance() {
		if(dao==null) dao = new ProdQnaDaoImpl();
		
		return dao;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProdQnaVO> selectProdQnaList(ProdQnaVO prqnVO) {
		List<ProdQnaVO> list = null;
		try {
			list = smc.queryForList("prodQna.selectProdQnaList",prqnVO);
			return list;
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void insertProdQna(ProdQnaVO prqnVO) {
		try {
			smc.insert("prodQna.insertProdQna", prqnVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteProdQna(ProdQnaVO prqnVO) {
		try {
			smc.delete("prodQna.deleteProdQna", prqnVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public ProdQnaVO selectProdQna(ProdQnaVO prqnVO) {
		ProdQnaVO prqaVO = null;
		try {
			prqaVO = (ProdQnaVO) smc.queryForObject("prodQna.selectProdQna", prqnVO);
			return prqaVO;
		} catch (SQLException e) {
			prqaVO = null;
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void updateProdQna(ProdQnaVO prqnVO) {
		try {
			smc.update("prodQna.updateProdQna", prqnVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void answerProdQna(ProdQnaVO prqnVO) {
		try {
			smc.update("prodQna.answerProdQna", prqnVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	


	

}

package kr.or.marketsally.product.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.marketsally.product.vo.ProdVO;
import kr.or.marketsally.util.SqlMapClientFactory;

public class ProdDaoImpl implements IProdDao {

	private SqlMapClient smc;
	
	private static ProdDaoImpl dao;
	
	private ProdDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static ProdDaoImpl getInstance() {
		if(dao==null) dao = new ProdDaoImpl();
		
		return dao;
	}
	

	// 모든 상품 출력
	@Override
	public List<ProdVO> getAllProdList() {
		List<ProdVO> list = null;
		
		try {
			list = smc.queryForList("sallyProd.getAllProdList");
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 선택한 한가지 상품 출력
	@Override
	public ProdVO getProd(String prod_id) {
		ProdVO prodVo = null;
		
		try {
			prodVo = (ProdVO) smc.queryForObject("sallyProd.getProd", prod_id);
		} catch (SQLException e) {
			prodVo = null;
			e.printStackTrace();
		}
		
		return prodVo;
	}
	
	// 선택한 상품분류의 모든 상품 출력
	@Override
	public List<ProdVO> prodofLprod(String lprod_id) {
		List<ProdVO> list = null;
		
		try {
			list = smc.queryForList("sallyProd.prodofLprod", lprod_id);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		
		return list;
	}

	// 선택한 상품분류명 출력
	@Override
	public String getLprodName(String lprod_id) {
		String lname = "";
		
		try {
			lname = (String) smc.queryForObject("sallyProd.getLprodName", lprod_id);
		} catch (SQLException e) {
			lname = null;
			e.printStackTrace();
		}
		return lname;
	}

	// 상품 등록
	@Override
	public int insertProd(ProdVO pvo) {
		int cnt = 0;
		
		try {
			Object obj = smc.insert("sallyProd.insertProd", pvo);
			if(obj==null) cnt = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	// 구매했던 상품 찾기
	@Override
	public List<ProdVO> getPurchasedProd(String mem_id) {
		List<ProdVO> list = null;
		
		try {
			list = smc.queryForList("sallyProd.getPurchasedProd", mem_id);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		
		return list;
	}

	// 상품 수정
	@Override
	public int updateProd(ProdVO pvo) {
		int cnt = 0;
		
		try {
			cnt = smc.update("sallyProd.updateProd", pvo);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	// 상품 삭제
	@Override
	public int deleteProd(String prod_id) {
		int cnt = 0;
		
		try {
			smc.delete("sallyProd.deleteProd", prod_id);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}
	
	// 상품명 일부를 입력하여 상품 검색
	@Override
	public List<ProdVO> searchProd(String data) {
		List<ProdVO> list = null;
		
		try {
			list = smc.queryForList("sallyProd.searchProd", data);
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 검색한 상품 건수를 조회
	@Override
	public int searchProdCnt(String data) {
		int cnt = 0;
		
		try {
			cnt = (int) smc.queryForObject("sallyProd.searchProdCnt", data);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	// 리스트출력 상품 건수를 조회
	@Override
	public int getProdCnt(String lprod_id) {
		int cnt = 0;
		try {
			cnt = (int) smc.queryForObject("sallyProd.getProdCnt", lprod_id);
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}
}

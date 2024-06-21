package kr.or.marketsally.oneqna.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.marketsally.oneqna.vo.OneqnaVO;
import kr.or.marketsally.util.SqlMapClientFactory;

public class OneqnaDaoImpl implements IOneqnaDao {
	
	private static OneqnaDaoImpl dao;
	private SqlMapClient smc;

	private OneqnaDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}

	public static OneqnaDaoImpl getInstance() {
		if (dao == null) dao = new OneqnaDaoImpl();
		return dao;
	}

	@Override
	public List<OneqnaVO> getAllOneqna() {
		List<OneqnaVO> oneqnaList = null;
		try {
			oneqnaList = smc.queryForList("oneqna.getAllOneqna");
		} catch (SQLException e) {
			oneqnaList = null;
			e.printStackTrace();
		}
		return oneqnaList;
	}

	@Override
	public int insertOneqnaQ(OneqnaVO oneqnaVo) {
		int cnt=0;
		try {
			String obj=(String)smc.insert("oneqna.insertOneqnaQ", oneqnaVo);
			if(obj==null) cnt=1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<OneqnaVO> getOneqnaDetail(String oneq_id) {
		List<OneqnaVO> oneqnaList =null;
		try {
			oneqnaList=smc.queryForList("oneqna.getOneqnaDetail",oneq_id);
			System.out.println("dao : oneqid" + oneq_id);
		} catch (SQLException e) {
			oneqnaList=null;
			e.printStackTrace();
		}
		return oneqnaList;
	}

	@Override
	public void updateOneQ(OneqnaVO oneqnaVo) {
		try {
			smc.update("oneqna.updateOneQ", oneqnaVo); 
		} catch (Exception e) {
		}
		
	}

}

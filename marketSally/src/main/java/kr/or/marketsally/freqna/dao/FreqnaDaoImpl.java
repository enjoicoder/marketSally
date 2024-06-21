package kr.or.marketsally.freqna.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.marketsally.freqna.vo.FreqnaVO;
import kr.or.marketsally.util.SqlMapClientFactory;

public class FreqnaDaoImpl implements IFreqnaDao {
	
	private static FreqnaDaoImpl dao;
	private SqlMapClient smc;
	
	private FreqnaDaoImpl() {
		smc=SqlMapClientFactory.getSqlMapClient();
	}
	
	public static FreqnaDaoImpl getInstance() {
		if(dao==null)dao=new FreqnaDaoImpl();
		return dao;
	}
	
	@Override
	public List<FreqnaVO> getAllFreqna() {
		List<FreqnaVO> freqnaList=null;
		try {
			freqnaList=smc.queryForList("freqna.getAllFreqna");
		} catch (Exception e) {
			freqnaList=null;
			e.printStackTrace();
		}
		return freqnaList;
	}
	@Override
	public int insertFreqna(FreqnaVO freqnaVo) {
		int cnt=0;
		try {
			String obj=(String)smc.insert("freqna.insertFreqna", freqnaVo);
			if(obj==null)cnt=1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

}

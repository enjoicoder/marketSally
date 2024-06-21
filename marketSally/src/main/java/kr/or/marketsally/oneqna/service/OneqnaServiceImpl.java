package kr.or.marketsally.oneqna.service;

import java.util.List;

import kr.or.marketsally.oneqna.dao.IOneqnaDao;
import kr.or.marketsally.oneqna.dao.OneqnaDaoImpl;
import kr.or.marketsally.oneqna.vo.OneqnaVO;

public class OneqnaServiceImpl implements IOneqnaService {
	private static OneqnaServiceImpl service;

	public static OneqnaServiceImpl getInstance() {
		if (service == null) service = new OneqnaServiceImpl();
		return service;
	}

	private IOneqnaDao dao;
	
	private OneqnaServiceImpl() {
		dao=OneqnaDaoImpl.getInstance();
	}
	
	@Override
	public List<OneqnaVO> getAllOneqna() {
		return dao.getAllOneqna();
	}

	@Override
	public int insertOneqnaQ(OneqnaVO oneqnaVo) {
		return dao.insertOneqnaQ(oneqnaVo);
	}

	@Override
	public List<OneqnaVO> getOneqnaDetail(String oneq_id) {
		return dao.getOneqnaDetail(oneq_id);
	}

	@Override
	public void updateOneQ(OneqnaVO oneqnaVo) {
		dao.updateOneQ(oneqnaVo);
	}
	


}
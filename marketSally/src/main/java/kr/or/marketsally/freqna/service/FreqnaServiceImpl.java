package kr.or.marketsally.freqna.service;

import java.util.List;

import kr.or.marketsally.freqna.dao.FreqnaDaoImpl;
import kr.or.marketsally.freqna.dao.IFreqnaDao;
import kr.or.marketsally.freqna.vo.FreqnaVO;

public class FreqnaServiceImpl implements IFreqnaService {
	private static FreqnaServiceImpl service;

	public static FreqnaServiceImpl getInstance() {
		if (service == null) service = new FreqnaServiceImpl();
		return service;
	}

	private IFreqnaDao dao;

	private FreqnaServiceImpl() {
		dao = FreqnaDaoImpl.getInstance();
	}

	@Override
	public List<FreqnaVO> getAllFreqna() {
		return dao.getAllFreqna();
	}

	@Override
	public int insertFreqna(FreqnaVO freqnaVo) {
		return dao.insertFreqna(freqnaVo);
	}

}

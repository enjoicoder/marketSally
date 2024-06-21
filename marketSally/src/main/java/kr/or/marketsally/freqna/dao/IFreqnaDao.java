package kr.or.marketsally.freqna.dao;

import java.util.List;

import kr.or.marketsally.freqna.vo.FreqnaVO;

public interface IFreqnaDao {
	public List<FreqnaVO> getAllFreqna();
	public int insertFreqna(FreqnaVO freqnaVo);
}

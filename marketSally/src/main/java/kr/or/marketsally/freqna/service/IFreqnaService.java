package kr.or.marketsally.freqna.service;

import java.util.List;

import kr.or.marketsally.freqna.vo.FreqnaVO;

public interface IFreqnaService {
	public List<FreqnaVO> getAllFreqna();
	public int insertFreqna(FreqnaVO freqnaVo);

}

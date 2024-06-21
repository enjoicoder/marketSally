package kr.or.marketsally.oneqna.service;

import java.util.List;

import kr.or.marketsally.oneqna.vo.OneqnaVO;

public interface IOneqnaService {
	public List<OneqnaVO> getAllOneqna();
	public int insertOneqnaQ(OneqnaVO oneqnaVo);
	public List<OneqnaVO> getOneqnaDetail(String oneq_id);
	public void updateOneQ(OneqnaVO oneqnaVo);
	
	
}

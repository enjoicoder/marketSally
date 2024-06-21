package kr.or.marketsally.like.service;

import java.util.List;

import kr.or.marketsally.like.vo.LikeVO;

public interface ILikeService {
	
	public int insertLike(LikeVO lvo);

	public int selectLikeCnt(LikeVO lvo);
	
	public List<LikeVO> selectLikes(String mem_id);
	
	public int likeListCnt(String mem_id);

	public int deleteLike(LikeVO lvo);
	
}

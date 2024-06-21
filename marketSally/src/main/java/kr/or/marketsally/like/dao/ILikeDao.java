package kr.or.marketsally.like.dao;

import java.util.List;

import kr.or.marketsally.like.vo.LikeVO;

public interface ILikeDao {
	
	public int insertLike(LikeVO lvo);
	
	public int selectLikeCnt(LikeVO lvo);
	
	public List<LikeVO> selectLikes(String mem_id);
	
	public int likeListCnt(String mem_id);

	public int deleteLike(LikeVO lvo);

}

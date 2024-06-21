package kr.or.marketsally.like.service;

import java.util.List;

import kr.or.marketsally.like.dao.ILikeDao;
import kr.or.marketsally.like.dao.LikeDaoImpl;
import kr.or.marketsally.like.vo.LikeVO;

public class LikeServiceImpl implements ILikeService {
	
	private ILikeDao dao;
	private static LikeServiceImpl service;
	
	private LikeServiceImpl() {
		dao = LikeDaoImpl.getInstance();
	}
	public static LikeServiceImpl getInstance() {
		if(service==null) service = new LikeServiceImpl();
		return service;
	}

	@Override
	public int insertLike(LikeVO lvo) {
		return dao.insertLike(lvo);
	}
	@Override
	public int selectLikeCnt(LikeVO lvo) {
		return dao.selectLikeCnt(lvo);
	}
	@Override
	public List<LikeVO> selectLikes(String mem_id) {
		return dao.selectLikes(mem_id);
	}
	@Override
	public int likeListCnt(String mem_id) {
		return dao.likeListCnt(mem_id);
	}
	@Override
	public int deleteLike(LikeVO lvo) {
		return dao.deleteLike(lvo);
	}

}

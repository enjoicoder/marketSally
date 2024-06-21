package kr.or.marketsally.review.service;

import java.util.List;
import java.util.Map;

import kr.or.marketsally.review.dao.IReviewDao;
import kr.or.marketsally.review.dao.ReviewDaoImpl;
import kr.or.marketsally.review.vo.ReviewVO;

public class ReviewServiceImpl implements IReviewService{
	
	private IReviewDao dao;
	private static ReviewServiceImpl service;
	
	private ReviewServiceImpl() {
		dao = ReviewDaoImpl.getInstance();
	}
	public static ReviewServiceImpl getInstance() {
		if(service==null) service = new ReviewServiceImpl();
		return service;
	}
	
	@Override
	public int selectMyReview(ReviewVO reviewVO) {
		return dao.selectMyReview(reviewVO);
	}
	@Override
	public void insertReview(ReviewVO revVO) {
		dao.insertReview(revVO);
	}
	@Override
	public void deleteReview(ReviewVO revVO) {
		dao.deleteReview(revVO);
	}
	@Override
	public List<ReviewVO> selectReviewList(String prod_id) {
		return dao.selectReviewList(prod_id);
	}
	@Override
	public int purchasedCheck(Map<String, Object> map) {
		return dao.purchasedCheck(map);
	}



	
}

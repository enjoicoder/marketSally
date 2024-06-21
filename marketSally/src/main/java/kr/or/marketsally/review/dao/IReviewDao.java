package kr.or.marketsally.review.dao;

import java.util.List;
import java.util.Map;

import kr.or.marketsally.review.vo.ReviewVO;


public interface IReviewDao {

	//멤버의 리뷰작성여부 확인
	public int selectMyReview(ReviewVO reviewVO);
	
	//리뷰 리스트 출력
	public List<ReviewVO> selectReviewList(String prod_id);
	
	// 리뷰추가
	public void insertReview(ReviewVO revVO);
	
	// 리뷰삭제
	public void deleteReview(ReviewVO revVO);
	
	// 상품구매했는지 확인
	public int purchasedCheck(Map<String, Object> map);

}

package kr.or.marketsally.review.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.marketsally.review.vo.ReviewVO;
import kr.or.marketsally.util.SqlMapClientFactory;

public class ReviewDaoImpl implements IReviewDao {

	private SqlMapClient smc;
	
	private static ReviewDaoImpl dao;
	
	private ReviewDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static ReviewDaoImpl getInstance() {
		if(dao==null) dao = new ReviewDaoImpl();
		
		return dao;
	}
	

	@Override
	public int selectMyReview(ReviewVO reviewVO) {
		int cnt = 0;
		
		try {
			cnt = (int) smc.queryForObject("review.selectMyReview", reviewVO);
			return cnt;
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public void insertReview(ReviewVO revVO) {
		try {
			smc.insert("review.insertReview",revVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteReview(ReviewVO revVO) {
		try {
			smc.delete("review.deleteReview", revVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ReviewVO> selectReviewList(String prod_id) {
		List<ReviewVO> list = null;
		try {
			list = smc.queryForList("review.selectReviewList",prod_id);
			return list;
		} catch (SQLException e) {
			list = null;
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int purchasedCheck(Map<String, Object> map) {
		int cnt = 0;
		try {
			cnt = (int) smc.queryForObject("review.purchasedCheck", map);
			return cnt;
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return 0;
	}
	

}

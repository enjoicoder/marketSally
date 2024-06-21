package kr.or.marketsally.like.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.marketsally.like.vo.LikeVO;
import kr.or.marketsally.util.SqlMapClientFactory;

public class LikeDaoImpl implements ILikeDao {
	
	private SqlMapClient smc;
	
	private static LikeDaoImpl dao;
	
	private LikeDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static LikeDaoImpl getInstance() {
		if(dao==null) dao = new LikeDaoImpl();
		
		return dao;
	}

	// 상품 찜 등록하기
		@Override
		public int insertLike(LikeVO lvo) {		
			int cnt = 0;

			try {
				Object obj = smc.insert("sallyLike.insertLike", lvo);
				if(obj==null) cnt = 1;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return cnt;
		}

		// 상품 찜 중복검사
		@Override
		public int selectLikeCnt(LikeVO lvo) {
			int cnt = 0;
			
			try {
				cnt = (int)smc.queryForObject("sallyLike.selectLikeCnt", lvo);
			} catch (SQLException e) {
				cnt = 0;
				e.printStackTrace();
			}
			
			return cnt;
		}
		
		// 찜한 상품 목록 출력하기
		@Override
		public List<LikeVO> selectLikes(String mem_id) {
			
			List<LikeVO> list = null;
			try {
				list = smc.queryForList("sallyLike.selectLikes", mem_id);
			} catch (SQLException e) {
				list = null;
				e.printStackTrace();
			}
			return list;
		}

		// 찜한 상품 수 목록에 출력하기
		@Override
		public int likeListCnt(String mem_id) {
			int cnt = 0;
			try {
				cnt = (int) smc.queryForObject("sallyLike.likeListCnt", mem_id);
			} catch (SQLException e) {
				cnt = 0;
				e.printStackTrace();
			}
			return cnt;
		}

		// 찜한 목록에서 상품 삭제하기
		@Override
		public int deleteLike(LikeVO lvo) {
			int cnt = 0;
			
			try {
				cnt = smc.delete("sallyLike.deleteLike", lvo);
			} catch (SQLException e) {
				cnt = 0;
				e.printStackTrace();
			}
			
			return cnt;
		}

}

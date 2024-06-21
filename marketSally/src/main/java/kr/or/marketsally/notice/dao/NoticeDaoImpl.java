package kr.or.marketsally.notice.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.marketsally.notice.vo.NoticeVO;
import kr.or.marketsally.util.SqlMapClientFactory;

public class NoticeDaoImpl implements INoticeDao {

	private static NoticeDaoImpl dao;
	private SqlMapClient smc;
	private NoticeDaoImpl() {
		smc=SqlMapClientFactory.getSqlMapClient();
	}
	public static NoticeDaoImpl getInstance() {
		if(dao==null) dao= new NoticeDaoImpl();
		return dao;
	}
	
	@Override
	public int insertNotice(NoticeVO noticeVo) {
		int cnt=0;
		try {
			String obj = (String)smc.insert("notice.insertNotice", noticeVo);
			if(obj==null)cnt = 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	@Override
	public List<NoticeVO> getNoticeList() {
		List<NoticeVO> noticeList= null;
		try {
			noticeList= smc.queryForList("notice.getNoticeList");
		} catch (Exception e) {
			noticeList =null;
			e.printStackTrace();
		}
		return noticeList;
	}
	
	@Override
	public NoticeVO getNoticeDetail(Map<String, String>  map) {
		NoticeVO noticeVo=null;
		try {
			noticeVo=(NoticeVO)smc.queryForObject("notice.getNoticeDetail", map);
			System.out.println(noticeVo);
		} catch (Exception e) {
			noticeVo=null;
			e.printStackTrace();
		}
		return noticeVo;
	}
	@Override
	public void deleteNotice(NoticeVO noticeVo) {
		try {
			smc.delete("notice.deleteNotice",noticeVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public void updateNotice(NoticeVO noticeVo) {
		try {
			smc.update("notice.updateNotice", noticeVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	
	
	
}

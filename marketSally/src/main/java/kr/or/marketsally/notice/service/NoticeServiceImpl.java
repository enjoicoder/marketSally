package kr.or.marketsally.notice.service;

import java.util.List;
import java.util.Map;

import kr.or.marketsally.notice.dao.INoticeDao;
import kr.or.marketsally.notice.dao.NoticeDaoImpl;
import kr.or.marketsally.notice.vo.NoticeVO;

public class NoticeServiceImpl implements INoticeService {

	private static NoticeServiceImpl service;

	public static NoticeServiceImpl getInstance() {
		if (service == null) service = new NoticeServiceImpl();
		return service;
	}
	private INoticeDao dao;
	
	private NoticeServiceImpl() {
		dao = NoticeDaoImpl.getInstance();
	}

	@Override
	public int insertNotice(NoticeVO noticeVo) {
		return dao.insertNotice(noticeVo);
	}

	@Override
	public List<NoticeVO> getNoticeList() {
		return dao.getNoticeList();
	}

	@Override
	public NoticeVO getNoticeDetail(Map<String, String>  map) {
		return dao.getNoticeDetail(map);
	}

	@Override
	public void deleteNotice(NoticeVO noticeVo) {
		dao.deleteNotice(noticeVo);
	}

	@Override
	public void updateNotice(NoticeVO noticeVo) {
		dao.updateNotice(noticeVo);
	}

}

package kr.or.marketsally.notice.service;

import java.util.List;
import java.util.Map;

import kr.or.marketsally.notice.vo.NoticeVO;

public interface INoticeService {
	public int insertNotice(NoticeVO noticeVo);
	
	public List<NoticeVO> getNoticeList();
	
	public NoticeVO getNoticeDetail(Map<String, String>  map);
	
	public void deleteNotice(NoticeVO noticeVo);
	
	public void updateNotice(NoticeVO noticeVo);
}

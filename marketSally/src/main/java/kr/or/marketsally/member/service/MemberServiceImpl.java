package kr.or.marketsally.member.service;

import java.util.List;

import kr.or.marketsally.member.dao.IMemberDao;
import kr.or.marketsally.member.dao.MemberDaoImpl;
import kr.or.marketsally.member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {

	private static IMemberDao dao;
	
	private static IMemberService service;
	
	public static IMemberService getInstance() {
		if(service == null) service = new MemberServiceImpl();
		return service;
	}
	
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}
	
	@Override
	public String searchID(String id) {
		return dao.searchID(id);
	}

	@Override
	public String searchEmail(String email) {
		return dao.searchEmail(email);
	}
	
	@Override
	public String checkPass(String pass) {
		return dao.checkPass(pass);
	}
	
	@Override
	public String joinMember(MemberVO mvo) {
		return dao.joinMember(mvo);
	}

	@Override
	public MemberVO compareDBToLogin(MemberVO memVo) {
		return dao.compareDBToLogin(memVo);
	}

	@Override
	public int updateMember(MemberVO memVo) {
		return dao.updateMember(memVo);
	}

	@Override
	public String findIdSally(MemberVO mvo) {
		return dao.findIdSally(mvo);
	}

	@Override
	public String findPassSally(MemberVO mvo) {
		return dao.findPassSally(mvo);
	}

	@Override
	public int updatePass(MemberVO memVo) {
		return dao.updatePass(memVo);
	}

}

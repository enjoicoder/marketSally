package kr.or.marketsally.member.service;

import java.util.List;

import kr.or.marketsally.member.vo.MemberVO;

public interface IMemberService {
	
	public String searchID(String id);
	
	public String searchEmail(String email);
	
	public String checkPass(String pass);
	
	public String findIdSally(MemberVO mvo);
	
	public String findPassSally(MemberVO mvo);

	public String joinMember(MemberVO mvo);
	
	public MemberVO compareDBToLogin(MemberVO memVo);

	public int updateMember(MemberVO memVo);
	
	public int updatePass(MemberVO memVo);
}

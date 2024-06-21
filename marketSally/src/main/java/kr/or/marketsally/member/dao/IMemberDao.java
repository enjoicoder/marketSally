package kr.or.marketsally.member.dao;


import java.util.List;

import kr.or.marketsally.member.vo.MemberVO;

public interface IMemberDao {
		
		public String searchID(String id);
		
		public String searchEmail(String email);
		
		public String checkPass(String pass);
		
		public String findIdSally(MemberVO mvo);
		
		public String findPassSally(MemberVO mvo);
		
		public String joinMember(MemberVO mvo);
		
		public MemberVO compareDBToLogin(MemberVO memVo);
		
		/**
		 * 회원정보를 업데이트 하는 메소드
		 * @param memVo update할 회원 정보가 저장된 MemberVO객체
		 * @return 성공 1, 실패 0
		 */
		public int updateMember(MemberVO memVo);
	
		public int updatePass(MemberVO memVo);
		
	}

package kr.or.marketsally.member.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.marketsally.member.vo.MemberVO;
import kr.or.marketsally.util.SqlMapClientFactory;

public class MemberDaoImpl implements IMemberDao {
	
	private static SqlMapClient smc;
	
	private MemberDaoImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	private static IMemberDao dao;
	
	public static IMemberDao getInstance() {
		if(dao == null) dao = new MemberDaoImpl();
		return dao;
	}

	@Override
	public String searchID(String id) {

		String dbid = "";
		
		try {
			dbid = (String) smc.queryForObject("member.searchID", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dbid;
	}
	
	@Override
	public String searchEmail(String email) {
		
		String dbemail = "";
		
		try {
			dbemail = (String) smc.queryForObject("member.searchEmail", email);
			System.out.println(dbemail);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dbemail;
	}

	@Override
	public String checkPass(String pass) {
		
		String ckpass = "";
		
		try {
			ckpass = (String) smc.queryForObject("member.checkPass", pass);
			System.out.println(ckpass);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ckpass;
	}
	
	@Override
	public String joinMember(MemberVO mvo) {
		
		String memName = null;
		
		try {
			memName = (String) smc.insert("member.joinMember", mvo);
			
			System.out.println("memName = " + memName);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memName;
	}

	@Override
	public MemberVO compareDBToLogin(MemberVO memVo) {

		MemberVO queres = null;
	
		
		try {
			queres = (MemberVO) smc.queryForObject("member.compareDBToLogin", memVo);
		
			System.out.println(queres);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return queres;
	}

	@Override
	public int updateMember(MemberVO memVo) {
		
		int res = 0;
		
		try {
			res = (Integer)smc.update("member.updateMember", memVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public String findIdSally(MemberVO mvo) {
		
		String findId = null;
		
		try {
			findId = (String) smc.queryForObject("member.findIdSally", mvo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return findId;
	}

	@Override
	public String findPassSally(MemberVO mvo) {
		
		String sallyPass = null;
		
		try {
			sallyPass = (String) smc.queryForObject("member.findPassSally", mvo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return sallyPass;
	}

	@Override
	public int updatePass(MemberVO memVo) {

		int tempPass = 0;
		
		try {
			tempPass = (Integer)smc.update("member.updatePass", memVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return tempPass;
	}

}

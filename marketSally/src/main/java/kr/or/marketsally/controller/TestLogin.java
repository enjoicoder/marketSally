package kr.or.marketsally.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.marketsally.member.vo.MemberVO;

public class TestLogin implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberVO vo = new MemberVO();
		vo.setMem_id("1");
		vo.setMem_name("홍길동");
		vo.setMem_email("test1@ddit.com");
		vo.setMem_grade("9");
		vo.setMem_logid("test1");
		vo.setMem_point(7777);
		vo.setMem_tel("010-1111-2222");
		vo.setMem_add("안드로메다");
		
		
		HttpSession session = request.getSession();
		session.setAttribute("sessionMember", vo);
		
		String grade = "";
		int gradeNum = 0;
		switch (vo.getMem_grade()) {
		case "1":
			grade = "브론즈";
			gradeNum = 3;
			break;
		case "2":
			grade = "실버";
			gradeNum = 5;
			break;
		case "3":
			grade = "골드";
			gradeNum = 8;
			break;
		case "4":
			grade = "다이아";
			gradeNum = 10;
			break;
		case "9":
			grade = "관리자";
			break;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("grade", grade);
		map.put("gradeNum", gradeNum);
		session.setAttribute("sessionGrade", map);
		
	}

}

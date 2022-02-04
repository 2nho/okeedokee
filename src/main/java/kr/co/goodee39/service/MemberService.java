package kr.co.goodee39.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.goodee39.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public String getMember(MemberVO vo, HttpSession session) {
		MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMember", vo);
		String path = "";
		if(vo1 != null) {
			// account 세션 등록
			session.setAttribute("account", vo1);
			// 동일한 id와 password가 있으면 아래 영역으로 보내라.
			path = "redirect:/";
		}else {
			path = "redirect:/member/loginPage";
		}
		return path;
	}
	
	public void setMember(MemberVO vo) {
		vo.setLevel("U");
		vo.setDel("N");
		vo.setSignupDay(new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date()));
		sqlSessionTemplate.insert("member.insertMember", vo);
	}
	
	public boolean memberIdCheck(String id) { 
		
		int result = sqlSessionTemplate.selectOne("member.idCheck", id);
		System.out.println(result);
		if(result==0) {return true;}
		else {return false;}
	}

	
}

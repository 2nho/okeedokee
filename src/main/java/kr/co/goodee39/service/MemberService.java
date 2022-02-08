package kr.co.goodee39.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.goodee39.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public String getMember(MemberVO vo, HttpSession session, HttpServletResponse response) throws IOException{
		MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMember", vo);
		String path = "";
		if(vo1 != null) {
			// account 세션 등록
			session.setAttribute("account", vo1);
			// 동일한 id와 password가 있으면 아래 영역으로 보내라.
			response.setContentType("text/html; charset=UTF-8");
			// out 인스턴스 생성
			PrintWriter out = response.getWriter();
			// alert 메시지 생성 및 이동 경로 설정
			out.println("<script>alert('안녕하세요. OKEEDOKEE 입니다.'); location.href='/okeedokee/main';</script>");
			// 출력
			out.flush();
		}else {
			// 데이터 처리 타입
			response.setContentType("text/html; charset=UTF-8");
			// out 인스턴스 생성
			PrintWriter out = response.getWriter();
			// alert 메시지 생성 및 이동 경로 설정
			out.println("<script>alert('로그인에 실패했습니다.'); location.href='/okeedokee/member/loginPage';</script>");
			// 출력
			out.flush();
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

		if(result==0) {return true;}
		else {return false;}
	}
	
	public MemberVO memberFindId(String name, String email) { 
		MemberVO vo = new MemberVO();
		vo.setName(name);
		vo.setEmail(email);
		MemberVO vo1 = sqlSessionTemplate.selectOne("member.findId", vo);
		
		return vo1;
	}
	
	public MemberVO memberFindPw(String name, String email, String id) { 
		MemberVO vo = new MemberVO();
		vo.setName(name);
		vo.setEmail(email);
		vo.setId(id);
		MemberVO vo1 = sqlSessionTemplate.selectOne("member.findPw", vo);
		
		return vo1;
	}
	
	public MemberVO memberFindCpi(String id, String pw) { 
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPw(pw);
		MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMember", vo);
		
		return vo1;
	}

	public void memberUpdateCpi(MemberVO vo, HttpSession session) {

		sqlSessionTemplate.update("member.updateMember", vo);
		MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMember", vo);
		session.setAttribute("account", vo1);
	}
	
	public void memberDeleteCpi(String id) {
		MemberVO vo = new MemberVO();
		vo.setId(id);
		sqlSessionTemplate.update("member.deleteMember", vo);
	}
}

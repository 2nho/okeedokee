package kr.co.goodee39.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.MemberVO;
import kr.co.goodee39.vo.reportVO;

@Service
public class MypageService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	//신고내역 가져오기
	public void selectReportList(HttpSession session, reportVO vo, Model model) {
		
		//세션에 저장된 mnum정보 설정해 신고 내역 가져오기
		MemberVO mvo = (MemberVO)session.getAttribute("account");
		vo.setMnum(mvo.getMnum());
		
		
		//결과 리스트 view로 가져가기
		model.addAttribute("report", sqlSessionTemplate.selectList("rep.selectReportList", vo));
		
	}

}

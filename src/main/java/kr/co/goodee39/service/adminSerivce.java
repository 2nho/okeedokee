package kr.co.goodee39.service;


import java.time.LocalDate;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.DonationVO;
import kr.co.goodee39.vo.MemberVO;
import kr.co.goodee39.vo.adminReportVO;

@Service
public class adminSerivce {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	public void TotalMember(MemberVO vo, Model model) {
		model.addAttribute("total",sqlSessionTemplate.selectOne("member.totalMember", vo));
	}

	public void NewMember(MemberVO vo, Model model) {
		LocalDate now = LocalDate.now();
		String date = now.getMonth().toString();
		vo.setSignupDate(date);
		// new class static 변수 사용 불가능
		model.addAttribute("newMember",sqlSessionTemplate.selectOne("member.newMember", vo));
	}
	
	public void selectMoney(DonationVO vo, Model model) {
		LocalDate now = LocalDate.now();
		String date = now.getMonth().toString();
		vo.setDate(date);
		model.addAttribute("money",sqlSessionTemplate.selectOne("donation.selectMoney", vo));
	}
}

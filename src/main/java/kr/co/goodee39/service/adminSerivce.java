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
	@Autowired
	adminReportVO vo1;
	@Autowired
	DonationVO vo2;
	@Autowired
	MemberVO vo3;

	public void TotalMember(Model model) {
		
		model.addAttribute("total",sqlSessionTemplate.selectOne("member.TotalMember", vo3));
	}

	public void NewMember(Model model) {
		LocalDate now = LocalDate.now();
		String date = now.getMonth().toString();
		vo3.setDate(date);
		model.addAttribute("new",sqlSessionTemplate.selectOne("member.NewMember", vo3));
	}
	
	public void selectMoney(Model model) {
		LocalDate now = LocalDate.now();
		String date = now.getMonth().toString();
		vo2.setDate(date);
		model.addAttribute("money",sqlSessionTemplate.selectOne("donation.selectMoney", vo2));
	}
}

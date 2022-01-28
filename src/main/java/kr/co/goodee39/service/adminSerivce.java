package kr.co.goodee39.service;


import java.time.LocalDate;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.DonationVO;
import kr.co.goodee39.vo.MemberVO;
import kr.co.goodee39.vo.mnwVO;

@Service
public class adminSerivce {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	public void TotalMember(Model model) {
		MemberVO vo = new MemberVO();
		model.addAttribute("total",sqlSessionTemplate.selectOne("member.totalMember", vo));
	}

	public void NewMember(Model model) {
		MemberVO vo =new MemberVO();
		LocalDate now = LocalDate.now();
		//String date = now.getMonthValue()+""; 가능
		String date = String.valueOf(now.getMonthValue());
		vo.setsignupDay(date);
		// new class static 변수 사용 불가능
		model.addAttribute("nMember",sqlSessionTemplate.selectOne("member.newMember", vo));
	}
	
	public void selectMoney(Model model) {
		DonationVO vo = new DonationVO();
		LocalDate now = LocalDate.now();
		String date = String.valueOf(now.getMonthValue());
		vo.setDate(date);
		model.addAttribute("money",sqlSessionTemplate.selectOne("donation.selectMoney", vo));
	}
	
	public void sumBBS(Model model) {
		mnwVO vo = new mnwVO();
		LocalDate now = LocalDate.now();
		String date = String.valueOf(now);
		//System.out.println(date.getClass().getName());
		//System.out.println(date);
		vo.setCreatedate(date);
		model.addAttribute("missing",sqlSessionTemplate.selectOne("misstbl.selectMissing", vo));
		model.addAttribute("witness",sqlSessionTemplate.selectOne("witnesstbl.selectWitness", vo));
	}
	public void memberlist(Model model) {
	    MemberVO vo = new MemberVO();
	    model.addAttribute("list", sqlSessionTemplate.selectList("member.allMember", vo));
	}
}

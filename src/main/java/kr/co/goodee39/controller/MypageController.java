package kr.co.goodee39.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.MypageService;
import kr.co.goodee39.vo.reportVO;

@Controller
public class MypageController {

	@Autowired
	MypageService service;
	
	//마이페이지 이동
	@GetMapping("/mypage")
	public String mypage() {
		
		return "g_mypage";
	}
	
	//상담예약일 이동
	@GetMapping("/reservation")
	public String reservation() {
		
		return "g_mypage_reservation";
	}
	
	//실종, 목격내역 이동
	@GetMapping("/missingList")
	public String missingList() {
		
		return "g_mypage_missing";
	}
	
	@GetMapping("/witnessingList")
	public String witnessingList() {
		
		return "g_mypage_witnessing";
	}
	
	//기부, 자원봉사 이동
	@GetMapping("/donationList")
	public String donationList() {
		
		return "g_mypage_donation";
	}
	@GetMapping("/volunteerList")
	public String volunteerList() {
		
		return "g_mypage_volunteer";
	}
	
	//신고내역 이동
	@GetMapping("/reportList")
	public String reportList(HttpSession session, reportVO vo, Model model) {
		
		service.selectReportList(session, vo, model);
		
		return "g_mypage_report";
	}
	
	//신고내역 글 읽기
	@GetMapping("/readReport")
	public String readReport(@RequestParam int num, HttpSession session, reportVO vo, Model model) {
		
		service.selectReport(num, vo, session, model);
		
		return "d_report_read";
	}
}

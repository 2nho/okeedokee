package kr.co.goodee39.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.MypageService;
import kr.co.goodee39.vo.MemberVO;
import kr.co.goodee39.vo.reportVO;

@Controller
public class MypageController {

	@Autowired
	MypageService service;

	// 마이페이지 이동
	@GetMapping("/mypage")
	public String mypage(HttpSession session) {
		
		String path = "";
		
		// 로그인 정보 없을 시 로그인 페이지로 이동 : 연동시 수정 필수
		if (session.getAttribute("account") != null) {
			path = "g_mypage";
		} else if (session.getAttribute("account") == null) {
			path = "redirect:/member/loginPage";
		}
		
		return path;
	}
	
	// 개인정보 변경 전 불러오기
	@PostMapping("/cpi")
	public String cpi(MemberVO vo, String cpi) {
		return service.cpiMember(vo, cpi);
	}
	
	// 개인정보 변경 페이지 이동
	@PostMapping("/cpiModify")
	public String cpiModify(MemberVO vo) {
		return "g_mypage_cpi";
	}

	// 상담예약일 이동
	@GetMapping("/reservation")
	public String reservation() {

		return "g_mypage_reservation";
	}

	// 실종, 목격내역 이동
	/*
	@GetMapping("/missingList")
	public String missingList() {

		return "g_mypage_missing";
	}

	@GetMapping("/witnessingList")
	public String witnessingList() {

		return "g_mypage_witnessing";
	}
	*/

	// 기부, 자원봉사 이동
	@GetMapping("/donationList")
	public String donationList() {

		return "g_mypage_donation";
	}

	@GetMapping("/volunteerList")
	public String volunteerList() {

		return "g_mypage_volunteer";
	}
	
	//마이페이지의 신고 페이지는 전부 ReportController, ReportService에서 처리

	

}

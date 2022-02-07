package kr.co.goodee39.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.SnvService;
import kr.co.goodee39.vo.DonationVO;
import kr.co.goodee39.vo.MemberVO;
import kr.co.goodee39.vo.voluntaryVO;

@Controller
public class Save_Controller {

	@Autowired
	SnvService service;

	// 후원, 자원봉사 메뉴 이동
	@GetMapping("/Save")
	public String Save(@RequestParam(defaultValue = "1") int num, @RequestParam(defaultValue = "") String careName,
			@RequestParam(defaultValue = "") String addr, Model model) {

		service.selectVoltaList(num, careName, addr, model);

		return "e_snv";
	}

	// 자원봉사리스트 등록 메뉴로 이동
	@GetMapping("/addVoluntary")
	public String addVoluntary(HttpSession session) {

		String path = "";

		MemberVO mvo = (MemberVO) session.getAttribute("account");
		if (mvo.getLevel().equals("A")) {
			path = "e_voluntary_add";
		} else {
			path = "redirect:/member/loginPage";
		}

		return path;
	}

	// 자봉 리스트 등록하기
	@PostMapping("/addVolta")
	public String addVolta(@ModelAttribute("voltaVO") voluntaryVO vo) {

		/*
		 * System.out.println("8개 잘왔니?"); // 잘옴 System.out.println("1."+vo.getId());
		 * System.out.println("2."+vo.getTitle());
		 * System.out.println("3."+vo.getCareName());
		 * System.out.println("4."+vo.getAddr());
		 * System.out.println("5."+vo.getPhNum());
		 * System.out.println("6."+vo.getDetailText());
		 * System.out.println("7."+vo.getDateFrom());
		 * System.out.println("8."+vo.getDateTo());
		 */

		service.insertVoluntaryList(vo);

		return "redirect:/Save";
	}

	// 자봉 리스트 수정하기

	// 자원봉사 신청하기 페이지로 이동
	@GetMapping("/voluntary")
	public String voluntary(@RequestParam int num, Model model, HttpSession session) {
		
		String path = "";

		MemberVO mvo = (MemberVO) session.getAttribute("account");
		
		if (mvo != null) {
			service.selectVoluntary(num, model);
			path = "e_voluntary";
		} 
		else {
			path = "redirect:/member/loginPage";
		}

		return path;

	}

	// 후원하기 메뉴로 이동
	@GetMapping("/donation")
	public String donation() {
		return "e_donation";
	}

	// 기부금 db처리
	@PostMapping("/addDonation")
	public ResponseEntity<DonationVO> addDonation(@RequestBody DonationVO vo) {
		System.out.println("기부금 : " + vo.getDonation());
		System.out.println("기부자 : " + vo.getMnum());
		System.out.println("날짜 : " + vo.getDate());

		// 기부 테이블에 내역 등록
		service.insertDonation(vo);

		ResponseEntity<DonationVO> entity = new ResponseEntity<DonationVO>(vo, HttpStatus.OK);

		return entity;
	}

}

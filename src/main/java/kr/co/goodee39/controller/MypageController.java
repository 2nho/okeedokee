package kr.co.goodee39.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.MypageService;
import kr.co.goodee39.service.SnvService;
import kr.co.goodee39.vo.DonationVO;
import kr.co.goodee39.vo.MemberVO;
import kr.co.goodee39.vo.ReservationVO;

@Controller
public class MypageController {

	@Autowired
	MypageService service;
	
	@Autowired
	SnvService service2;
	

	// 마이페이지 이동
	@GetMapping("/mypage")
	public String mypage(HttpSession session) {
		
		String path = "";
		
		// 로그인 정보 없을 시 로그인 페이지로 이동 : 연동시 수정 필수
		if (session.getAttribute("account") != null) {
			
			MemberVO mvo = (MemberVO) session.getAttribute("account");
			
			if(mvo.getLevel().equals("U")) {
				path = "g_mypage";
			}
			else if(mvo.getLevel().equals("A")) {
				path = "redirect:/admin/adminHome";
			}
			
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
	public String cpiModify() {
		return "g_mypage_cpi";
	}
	
	
	// 상담예약일 이동
	@RequestMapping(value="/reservation", method=RequestMethod.GET)
	public String getNoticeList(Model model, @RequestParam(defaultValue = "1") int num,
											@RequestParam(defaultValue = "") String content) {
		service.selectReserList(model, num, content);
		return "g_mypage_reservation"; 
	}
	
	// 상담 예약 상세
	@GetMapping("/reservationDetail")
	public String reservationDetail(@ModelAttribute("rvo") ReservationVO vo) {
		service.selectReser(vo);
		return "g_mypage_reservation_detail";
	}
		
	
	// 상담 예약 생성
	@PostMapping("/reservationCreate")
	public String reservationCreate(ReservationVO vo) {
		service.reserCreateService(vo);
		return "redirect:/reservation";
	}
	
	// 상담 예약 수정
	@GetMapping("/reservationModify")
	public String reservationModify(@ModelAttribute("rvo") ReservationVO vo, int rnum) {
		vo.setRnum(rnum);
		service.selectReser(vo);
		return "g_mypage_reservation_modify";
	}
	
	// 상담 예약 수정완료
	@PostMapping("/reservationModifyResult")
	public String reservationModifyResult(ReservationVO vo) {
		service.updateReser(vo);
		return "redirect:/reservation";
	}
	
	// 상담 예약 삭제
	@GetMapping("/reservationDelete")
	public String delNotice(ReservationVO vo) {
		service.deleteReser(vo);
		return "redirect:/reservation";
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
	public String donationList(HttpSession session, DonationVO vo, Model model) {

		MemberVO mvo = (MemberVO)session.getAttribute("account");
		vo.setMnum(mvo.getMnum());
		
		service2.selectDonationOne(vo, model);
		
		return "g_mypage_donation";
	}

	/*
	@GetMapping("/volunteerList")
	public String volunteerList() {

		return "g_mypage_volunteer";
	}
	*/
	
	//마이페이지의 신고 페이지는 전부 ReportController, ReportService에서 처리

	

}

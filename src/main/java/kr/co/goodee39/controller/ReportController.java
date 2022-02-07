package kr.co.goodee39.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.ReportService;
import kr.co.goodee39.vo.MemberVO;
import kr.co.goodee39.vo.mnwCmtVO;
import kr.co.goodee39.vo.reportVO;

@Controller
public class ReportController {

	@Autowired
	ReportService service;

	// 신고 게시판 이동
	@GetMapping("/report")
	public String report(
			@RequestParam int bdiv, 
			@RequestParam int num, 
			@ModelAttribute("repVO") reportVO vo,
			HttpServletRequest request, 
			HttpSession session, 
			Model model) {

		String path = "";

		// 로그인 후 신고 가능
		if (session.getAttribute("account") == null) {
			path = "redirect:/member/loginPage";
		} 
		else if (session.getAttribute("account") != null) {
			// 이전 페이지 주소 받아오기
			String boardUrl = request.getHeader("referer");
			System.out.println(boardUrl);

			model.addAttribute("boardUrl", boardUrl);

			// 신고대상 게시글 제목 가져오기
			service.selectTitle(bdiv, num, model);

			path = "d_report";
		}

		return path;
	}

	// 신고 제출
	@PostMapping("/reportResult")
	public String reportResult(@ModelAttribute("repVO") reportVO vo) {

		String path = service.insertReport(vo);

		return "redirect:/" + path;
	}

	// 신고내역 이동
	@GetMapping("/reportList")
	public String reportList(HttpSession session, reportVO vo, Model model) {

		service.selectReportList(session, vo, model);

		return "g_mypage_report";
	}

	// 신고내역 글 읽기
	@GetMapping("/readReport")
	public String readReport(
			@RequestParam int num, 
			HttpSession session, 
			reportVO vo, 
			Model model) {

		System.out.println("컨트 글번호: "+num);
		service.selectReport(num, vo, session, model);

		return "d_report_read";
	}
	
	//신고내역 수정이동
	@GetMapping("/reviseReport")
	public String reviseReport(
			@RequestParam int num, 
			HttpSession session, 
			reportVO vo, 
			Model model) {
		
		service.selectReport(num, vo, session, model);
		
		return "d_report_revise";
	}
	
	//신고내역 수정제출
	@GetMapping("/reviseReportResult")
	public String reviseReportResult(reportVO vo) {
		
		service.updateReport(vo);
		
		return "redirect:/reportList";
	}

	// 신고내역 삭제
	@GetMapping("/isdeleteReport")
	public String isdeleteReport(@RequestParam int num, reportVO vo) {

		service.deleteReport(num, vo);

		return "redirect:/reportList";
	}
	

	// 신고내역 댓글 가져오기
	@GetMapping("/getRepCmt/{num}")
	public ResponseEntity<List<mnwCmtVO>> getRepCmt(@PathVariable int num) {
		
		//게시글 번호 num을 bnum으로 설정
		mnwCmtVO cvo = new mnwCmtVO();
		cvo.setBnum(num);
		System.out.println(cvo.getBnum());
		
		//service통해 코멘트 db긁어오기
		List<mnwCmtVO> list = service.selectRepCmt(cvo);
		
		//리턴타입 변수에 결과 담기 (단, status가 ok인 상황에서만!)
		ResponseEntity<List<mnwCmtVO>> entity = new ResponseEntity<List<mnwCmtVO>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	
	// 신고내역 댓글 추가
	@PostMapping("/createRepCmt")
	public ResponseEntity<mnwCmtVO> createRepCmt(@RequestBody mnwCmtVO vo, HttpSession session, MemberVO level) {
		System.out.println("코멘트 : "+vo.getCmt());
		System.out.println("글번호 : "+vo.getBnum());
		System.out.println("게시판구분 : "+vo.getBdiv());
		
		//세션에서 id정보 가져오기
		MemberVO mvo = (MemberVO)session.getAttribute("account");
		vo.setId(mvo.getId());
		//임시id : 후에 세션정보로 교체 필요
		//vo.setId("sessionId");  
		
		//댓글 작성자 회원 레벨 체크 : admin(A)레벨 댓글 작성시 답변완료 처리 위함
		level.setLevel(mvo.getLevel());

		//코멘트 db추가
		service.insertRepCmt(vo, level);
		
		ResponseEntity<mnwCmtVO> entity = new ResponseEntity<mnwCmtVO>(vo, HttpStatus.OK);
		
		return entity;
	}
	
	// 신고내역 댓글 삭제
	@DeleteMapping("/deleteRepCmt")
	public ResponseEntity<String> deleteRepCmt(@RequestBody mnwCmtVO vo, HttpSession session) {
		
		System.out.println("어떤 댓글 삭제? : "+vo.getNum());
		
		//세션에서 id정보 가져오기
		MemberVO mvo = (MemberVO)session.getAttribute("account");
		vo.setId(mvo.getId());
		//임시id : 후에 세션정보로 교체 필요
		//vo.setId("sessionId");
		
		service.deleteRepCmt(vo);
		
		String msg = "삭제 완.";
		
		ResponseEntity<String> entity = new ResponseEntity<String>(msg, HttpStatus.OK);
		
		return entity;
	}
	
	
	// 신고내역 댓글 수정
	@PatchMapping("/updateRepCmt")
	public ResponseEntity<mnwCmtVO> updateRepCmt(@RequestBody mnwCmtVO vo, HttpSession session) {

		System.out.println("수정 코멘트 : " + vo.getCmt());
		System.out.println("대상 댓글 : " + vo.getNum());

		// 세션에서 id 가져오기
		MemberVO mvo = (MemberVO) session.getAttribute("account");
		vo.setId(mvo.getId());

		// 수정 코멘트 db 반영
		service.updateRepCmt(vo);

		ResponseEntity<mnwCmtVO> entity = new ResponseEntity<mnwCmtVO>(vo, HttpStatus.OK);

		return entity;

	}

}

package kr.co.goodee39.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.MnwService;
import kr.co.goodee39.vo.MemberVO;

@Controller
public class MypageMnwController {

	@Autowired
	MnwService mnwservice;

	// 실종, 목격내역 이동
	@GetMapping("/missingList")
	public String missingList(
			@RequestParam(defaultValue = "1") int num,
			@RequestParam(defaultValue = "") String id,
			@RequestParam(defaultValue = "") String title,
			@RequestParam(defaultValue = "") String content,
			HttpSession session,
			Model model) {
		
		System.out.println("컨트롤로 : "+title);

		//게시판 구분
		int bdiv = 3;
		//내 게시글만 가져오기 위한 세션 정보 확보
		MemberVO mvo = (MemberVO)session.getAttribute("account");
		String myId = mvo.getId();
		
		mnwservice.selectMnw(num, id, title, content, bdiv, myId, model);
		
		return "g_mypage_missing";
	}

	@GetMapping("/witnessingList")
	public String witnessingList(
			@RequestParam(defaultValue = "1") int num,
			@RequestParam(defaultValue = "") String id,
			@RequestParam(defaultValue = "") String title,
			@RequestParam(defaultValue = "") String content,
			HttpSession session,
			Model model) {
		
		//게시판 구분
		int bdiv = 4;
		//내 게시글만 가져오기 위한 세션 정보 확보
		MemberVO mvo = (MemberVO)session.getAttribute("account");
		String myId = mvo.getId();
		
		mnwservice.selectMnw(num, id, title, content, bdiv, myId, model);
		
		return "g_mypage_witnessing";
	}

}

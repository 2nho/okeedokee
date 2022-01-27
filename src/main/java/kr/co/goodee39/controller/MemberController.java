package kr.co.goodee39.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.goodee39.service.MemberService;
import kr.co.goodee39.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	// 테스트 페이지.
	@GetMapping("loginPage")
	public String loginPage() {
		return "login"; 
	}
	
	@PostMapping("login")
	public String isLogin(MemberVO vo, HttpSession session) {
		return memberService.getMember(vo, session);
	}
	
	@GetMapping("logout")
	public String isLogout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	@GetMapping("/signUp")
	public String signUp(MemberVO vo) {
		
		return "signup";
	}
	
	@PostMapping("/signupResult")
	public String signupResult(MemberVO vo) {
		memberService.setMember(vo);
		return "login";
	}
}

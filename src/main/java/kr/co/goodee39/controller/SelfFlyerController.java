package kr.co.goodee39.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.SelfFlyerService;
import kr.co.goodee39.vo.selfFlyerVO;

@Controller
public class SelfFlyerController {

	@Autowired
	SelfFlyerService service;
	
	//셀프 전단지 페이지 이동
	@GetMapping("/selfFlyer")
	public String selfFlyer(Model model) {
		
		service.selectFlyerList(model);
		return "d_selfFlyer";
	}
	
	//전단지 만들기 페이지 이동
	@GetMapping("/makeFlyer")
	public String makeFlyer(HttpSession session) {
		
		String path = "";
		
		//로그인 정보 없을 시 로그인 페이지로 이동 : 연동시 수정 필수
		//if(session.getAttribute("account") != null) {
			path = "d_selfFlyer_make";
		//}
		//else if(session.getAttribute("account") == null) {
		//	path = "redirect:/member/login";
		//}
		
		return path;
	}
	
	//전단지 읽기
	@GetMapping("/readFlyer")
	public String readFlyer(
			@RequestParam int bdiv, 
			@RequestParam int num, 
			@ModelAttribute("selfVO") selfFlyerVO vo, 
			Model model,
			HttpSession session) {
		
		service.selectFlyer(bdiv, num, vo, model);
		
		// 로그인 기능 생성 전 임시 코드//로그인 기능 생성 전 임시 코드
		// 로그인 기능 생성 전 임시 코드//로그인 기능 생성 전 임시 코드
		//session.getAttribute("account");
		//임시세션 정보
		session.setAttribute("account", "sessionId");
		// 로그인 기능 생성 전 임시 코드//로그인 기능 생성 전 임시 코드
		// 로그인 기능 생성 전 임시 코드//로그인 기능 생성 전 임시 코드
		
		return "d_selfFlyer_read";
	}
	
}
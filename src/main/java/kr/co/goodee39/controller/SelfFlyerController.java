package kr.co.goodee39.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class SelfFlyerController {

	
	//셀프 전단지 페이지 이동
	@GetMapping("/selfFlyer")
	public String selfFlyer() {
		
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
		//	path = "redirect:/login";
		//}
		
		return path;
	}
	
}
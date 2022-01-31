package kr.co.goodee39.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {

	//마이페이지 이동
	@GetMapping("/mypage")
	public String mypage() {
		
		return "g_mypage";
	}
}

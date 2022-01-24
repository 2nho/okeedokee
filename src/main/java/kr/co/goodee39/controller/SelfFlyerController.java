package kr.co.goodee39.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class SelfFlyerController {

	
	//셀프 전단지 페이지 이동
	@GetMapping("/selfFlyer")
	public String selfFlyer() {
		
		return "d_selfFlyer";
	}
	
}
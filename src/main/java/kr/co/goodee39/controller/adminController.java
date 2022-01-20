package kr.co.goodee39.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class adminController {
	
	
	@GetMapping("/adminHome")
	public String adminHome() {
		
		return "adminHome";
	}

}

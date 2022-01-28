package kr.co.goodee39.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IntroductionController {

	@GetMapping("/Introduction")
	public String Introduction() {
		
		return "Introduction";
	}
}

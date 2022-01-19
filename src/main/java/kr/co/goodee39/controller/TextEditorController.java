package kr.co.goodee39.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TextEditorController {
	
	
	@GetMapping("/textEditor")
	public String textEditor() {
		
		return "textEditor";
	}

	//레이아웃 확인용 : 나중에 지우기!
	@GetMapping("/layout")
	public String layout() {
		return "layout";
	}
}

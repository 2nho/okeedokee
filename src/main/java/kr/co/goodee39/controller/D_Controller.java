package kr.co.goodee39.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class D_Controller {
	
		//실종, 목격 메뉴 이동
		@GetMapping("/mnw")
		public String mnw() {
			return "d_missing";
		}
		
		//실종/목격 메뉴 내에서 다시 실종게시판으로 이동
		@GetMapping("/missing")
		public String missing() {
			return "redirect:/mnw";
		}
		
		//목격 메뉴로 이동
		@GetMapping("/witnessing")
		public String witnessing() {
			return "d_witnessing";
		}
		
		//셀프 전단지 이동
		@GetMapping("/selfFlyer")
		public String selfFlyer() {
			return "d_selfFlyer";
		}
		
		//실종 글쓰기 이동
		@GetMapping("/writeMissing")
		public String writeMissing() {
			return "d_missing_write";
		}
		
		//목격 글쓰기 이동
		@GetMapping("/writeWitnessing")
		public String writeWitnessing() {
			return "d_witnessing_write";
		}
		
}

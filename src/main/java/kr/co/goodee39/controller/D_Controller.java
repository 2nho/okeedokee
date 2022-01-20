package kr.co.goodee39.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class D_Controller {
	
		//레이아웃 확인용 : 옮기기
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
		
}

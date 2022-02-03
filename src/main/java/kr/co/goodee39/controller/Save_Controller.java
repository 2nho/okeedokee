package kr.co.goodee39.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Save_Controller {
	
		//후원, 자원봉사 메뉴 이동
		@GetMapping("/Save")
		public String Save() {
			return "Save";
		}
		
		//후원/자원봉사 메뉴 내에서 다시 자원봉사 게시판으로 이동
		@GetMapping("/Sav")
		public String Sav() {
			return "redirect:/Save";
		}
		
		//자원봉사리스트 등록 메뉴로 이동
		@GetMapping("/VolunteeList")
		public String VolunteeList() {
			return "VolunteeList";
		}
		//후원하기 메뉴로 이동
		@GetMapping("/supporting")
		public String supporting() {
			  return "supporting";
		}
		//자원봉사 신청하기 페이지로 이동
		@GetMapping("/MemberSave")
		public String MemberSave() {
			  return "MemberSave";
		}
}

package kr.co.goodee39.controller;



import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.co.goodee39.vo.VolunteerVO;


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
		public String VolunteeList(@ModelAttribute VolunteerVO vo, HttpSession session) {
			String path = "";
			
			//로그인 Controller 등록 후 주석 지우기!!!!!!
			//로그인 정보 있어야 접근 가능
			if(session.getAttribute("account") != null) {
				path = "VolunteeList";
			}
			//없다면 로그인 페이지
			else if(session.getAttribute("account") == null){
				path = "redirect:/member/loginPage";
			}
			
			return path;
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

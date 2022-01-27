package kr.co.goodee39.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.goodee39.service.adminSerivce;
import kr.co.goodee39.vo.DonationVO;
import kr.co.goodee39.vo.MemberVO;

@Controller
public class adminController {
	@Autowired
	adminSerivce service;
	
	@GetMapping("/adminHome")
	public String adminHome(MemberVO vo, DonationVO vo1, Model model) {
		service.TotalMember(vo, model);
		service.NewMember(vo, model);
		service.selectMoney(vo1,model);
		return "adminHome";
	}

	@GetMapping("/adminMember")
	public String adminMember() {
		
		return "adminMember";
	}
	@GetMapping("/adminReport")
	public String adminReport() {
		
		return "adminReport";
	}

}

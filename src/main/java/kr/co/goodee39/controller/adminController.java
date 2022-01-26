package kr.co.goodee39.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.goodee39.service.adminSerivce;

@Controller
public class adminController {
	@Autowired
	adminSerivce service;
	
	@GetMapping("/adminHome")
	public String adminHome(Model model) {
		service.TotalMember(model);
		service.NewMember(model);
		service.selectMoney(model);
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

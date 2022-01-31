package kr.co.goodee39.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		service.sumBBS(model);
		return "adminHome";
	}

	@GetMapping("/adminMember")
	public String adminMember(Model model) {
		service.memberlist(model);
		return "adminMember";
	}
	@GetMapping("/adminReport")
	public String adminReport(Model model,  @RequestParam(defaultValue = "1") int num,
			@RequestParam(defaultValue="") String title,
			@RequestParam(defaultValue="") String content,
			@RequestParam(defaultValue="") String status) {
		service.selectReportBBS(model, num, title, content, status);
		return "adminReport";
	}

}

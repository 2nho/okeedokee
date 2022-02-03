package kr.co.goodee39.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.goodee39.service.adminSerivce;

@Controller
@RequestMapping("/admin")
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
	@PostMapping("/ajax")
	public @ResponseBody ResponseEntity<List<Map<String,String>>> getAjax(Model model){
		List<Map<String, String>> list = service.monthMember(model);
		System.out.println(list);
		return new ResponseEntity<List<Map<String,String>>>(list,HttpStatus.OK);
	}

	@GetMapping("/adminMember")
	public String adminMember(Model model, @RequestParam(defaultValue = "1") int num,
			@RequestParam(defaultValue="") String id,
			@RequestParam(defaultValue="") String email,
			@RequestParam(defaultValue="") String level) {
		service.memberlist(model, num, id, email, level);
		return "adminMember";
	}
	@GetMapping("/adminReport")
	public String adminReport(Model model, @RequestParam(defaultValue = "1") int num,
			@RequestParam(defaultValue="") String title,
			@RequestParam(defaultValue="") String content,
			@RequestParam(defaultValue="") String status) {
		service.selectReportBBS(model, num, title, content, status);
		return "adminReport";
	}

}

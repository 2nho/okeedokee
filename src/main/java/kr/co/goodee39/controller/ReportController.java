package kr.co.goodee39.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.goodee39.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	ReportService service;
	
	
	//신고 게시판 이동
	@GetMapping("/report")
	public String report() {
		
		return "d_report";
	}
}

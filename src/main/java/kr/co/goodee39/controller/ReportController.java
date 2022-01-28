package kr.co.goodee39.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.goodee39.service.ReportService;
import kr.co.goodee39.vo.reportVO;

@Controller
public class ReportController {

	@Autowired
	ReportService service;
	
	
	//신고 게시판 이동
	@GetMapping("/report")
	public String report(reportVO vo) {
		
		return "d_report";
	}
	
	//신고 제출
	@PostMapping("/reportResult")
	public String reportResult(@ModelAttribute("repVO") reportVO vo) {
		
		return "";
	}
}

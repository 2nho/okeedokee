package kr.co.goodee39.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.ReportService;
import kr.co.goodee39.vo.reportVO;

@Controller
public class ReportController {

	@Autowired
	ReportService service;
	
	//신고 게시판 이동
	@GetMapping("/report")
	public String report(
			@RequestParam int bdiv, 
			@RequestParam int num, 
			@ModelAttribute("repVO") reportVO vo, 
			HttpServletRequest request,
			Model model) {
		
		//이전 페이지 주소 받아오기
		String boardUrl = request.getHeader("referer"); 
		System.out.println(boardUrl);
		
		model.addAttribute("boardUrl", boardUrl);
		
		//신고대상 게시글 제목 가져오기
		service.selectTitle(bdiv, num, model);
		
		return "d_report";
	}
	
	//신고 제출
	@PostMapping("/reportResult")
	public String reportResult(@ModelAttribute("repVO") reportVO vo) {
		
		String path = service.insertReport(vo);
		
		return "redirect:/"+path;
	}
	
	//신고 수정
	
	
}

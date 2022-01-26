package kr.co.goodee39.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.NoticeService;
import kr.co.goodee39.vo.NoticeVO;

@Controller
@RequestMapping("/Notice")
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@GetMapping("/main")
	public String getNoticeList(Model model, @RequestParam(defaultValue = "1") int num,
											@RequestParam(defaultValue = "") String title,
											@RequestParam(defaultValue = "") String content) {
		service.selectNoticeList(model, num, title, content);
		return "Notice"; 
	}
	
	@GetMapping("/detail")
	public String getNoticeDetail(@ModelAttribute("NoticeVO") NoticeVO vo ,Model model) {
		service.selectNotice(model,vo);
		return "notice_detail";
	}
	
	@GetMapping("/delete_notice")
	public String delNotice(NoticeVO vo) {
		service.deleteNotice(vo);
		return "redirect:/Notice/main";
	}
	
	@GetMapping("/modify_notice")
	public String modifyNotice(@ModelAttribute("NoticeVO")NoticeVO vo, Model model) {
		service.selectNotice(model, vo);
		
		return "notice_modify";
	}
	
	@PostMapping("/modify_result")
	public String modfidyResult(NoticeVO vo) {
		service.updateNotice(vo);
		return "redirect:/Notice/main";
	}
	
	@GetMapping("/notice_create")
	public String getNoticeCreate(@ModelAttribute("NoticeVO") NoticeVO vo) { 
		
		return "notice_create";
	}
	
	@PostMapping("/create_result")
	public String setNoticeCreate(NoticeVO vo) {
//		System.out.println(vo.getTitle());
//		System.out.println(vo.getContent());
//		System.out.println(vo.getOwnerid());
//		System.out.println(vo.getOwnername());
		/* System.out.println(vo.getFilelist()); */
		
		vo.setDate(new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date()));
		service.insertNotice(vo);
		
		return "redirect:/Notice/main";
	}
}

package kr.co.goodee39.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.goodee39.service.adminSerivce;
import kr.co.goodee39.service.calendarService;
import kr.co.goodee39.vo.MemberVO;
import kr.co.goodee39.vo.calendarVO;

@Controller
@RequestMapping("/admin")
public class adminController {
	@Autowired
	adminSerivce service;
	@Autowired
	calendarService cservice;
	@GetMapping("/adminHome")
	public String adminHome(Model model) {
		service.TotalMember(model);
		service.NewMember(model);
		service.selectMoney(model);
		service.sumBBS(model);
		
		return "adminHome";
	}
	// 비동기 통신 차트
	@PostMapping("/ajax")
	public @ResponseBody ResponseEntity<List<Map<String,String>>> getAjax(){
		List<Map<String, String>> list = service.monthMember();
		//System.out.println(list);
		return new ResponseEntity<List<Map<String,String>>>(list,HttpStatus.OK);
		//service.monthMember(model);
		//System.out.println(service.monthMember(model));
		//return new ResponseEntity<List<Map<String,String>>>(service.monthMember(model),HttpStatus.OK);
	}
	
	// 비동기 통신 업데이트 *******************
	 @PatchMapping("/updateLevel") 
	 public @ResponseBody ResponseEntity<MemberVO> updateLevel(@RequestBody MemberVO vo) { 
	    service.updateLevel(vo); 
	   // System.out.println(vo.getMnum());
	   // System.out.println(vo.getLevel());
		ResponseEntity<MemberVO> entity = new ResponseEntity<MemberVO>(vo, HttpStatus.OK);
		return entity;}
	 
	
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

	@GetMapping("/adminCalendar")
	public String adminCalendar(calendarVO vo) {
		
	return "adminCalendar";
	}
	// 달력 삭제
	@DeleteMapping("/delete")
	public @ResponseBody ResponseEntity<calendarVO> deleteC(@RequestBody calendarVO vo) {
		cservice.deleteC(vo);
		ResponseEntity<calendarVO> entity = new ResponseEntity<calendarVO>(vo,HttpStatus.OK);
		return entity;
	}
	// 달력 추가
	@PatchMapping("/insert")
	public @ResponseBody ResponseEntity<calendarVO> insertC(@RequestBody calendarVO vo) {
		cservice.insertC(vo);
		ResponseEntity<calendarVO> entity = new ResponseEntity<calendarVO>(vo,HttpStatus.OK);
		return entity;
	}
	@GetMapping("/select")
	public @ResponseBody ResponseEntity<List<calendarVO>> selectC() {
		//cservice.selectC(vo);
		// 서비스에서 List<calendarVO> 로 리턴하니 컨트롤러에서도 List<calendarVO>로 받아줘야 돌아간다.
		// vo는 필요가 없으니 뻬ㅐ고 @requestbody도 받는값이 없으니 뺀다
		List<calendarVO> select = cservice.selectC();
		ResponseEntity<List<calendarVO>> entity = new ResponseEntity<List<calendarVO>>(select,HttpStatus.OK);
		return entity;
	}
}

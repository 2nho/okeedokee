 package kr.co.goodee39.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.goodee39.service.NoticeService;
import kr.co.goodee39.vo.ImageVO;
import kr.co.goodee39.vo.NoticeVO;

@Controller
@RequestMapping("/Notice")
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String getNoticeList(Model model, @RequestParam(defaultValue = "1") int num,
											@RequestParam(defaultValue = "") String title,
											@RequestParam(defaultValue = "") String content,
											HttpSession session) {
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
	public String setNoticeCreate(NoticeVO vo, HttpSession session) {
		
		vo.setDate(new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date()));
		service.insertNotice(vo,session);
		
		return "redirect:/Notice/main";
	}
	
	@PostMapping("/deleteFileAll")
	public @ResponseBody ResponseEntity<String> deleteImgAll(@RequestBody ImageVO fvo){
		service.deleteImgAll(fvo);
		return new ResponseEntity<String>("deleteFileAll Success",HttpStatus.OK);
	}
	
	@PostMapping("/deleteFile")
	public @ResponseBody ResponseEntity<String> deleteImg(@RequestBody ImageVO[] fvos){
	
		service.deleteImg(fvos);
		return new ResponseEntity<String>("deleteFile Success",HttpStatus.OK);
	}
	
	@PostMapping("/uploadfile")
	public @ResponseBody ResponseEntity<List<ImageVO>> uploadFile(MultipartFile[] uploadFile) throws Exception{
		ArrayList<ImageVO> list = new ArrayList<ImageVO>();
		
		for (MultipartFile file : uploadFile) {
			if(!file.getOriginalFilename().isEmpty()) {
				String name = UUID.randomUUID().toString();
				file.transferTo(new File("D:/temp", name));
				System.out.println(file.getOriginalFilename()+"저장 완료.");
				list.add(new ImageVO(name, file.getOriginalFilename()));
				
			}else {
				System.out.println("데이터가 존재하지 않습니다.");
			}
		}
		System.out.println("모든 데이터가 저장되었습니다.");
		
		ResponseEntity<List<ImageVO>> response = new ResponseEntity<List<ImageVO>>(list,HttpStatus.OK);
		
		return response;
	}
}

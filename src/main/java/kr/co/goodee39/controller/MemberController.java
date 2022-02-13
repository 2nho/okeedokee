package kr.co.goodee39.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.goodee39.service.MemberService;
import kr.co.goodee39.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	

	@GetMapping("/loginPage")
	public String loginPage() {
		return "login"; 
	}
	
	@PostMapping("/login")
	public String isLogin(MemberVO vo, HttpSession session, HttpServletResponse response) throws IOException{
		return memberService.getMember(vo, session, response);
	}
	
	@GetMapping("/logout")
	public void isLogout(HttpSession session, HttpServletResponse response) throws IOException{
		session.invalidate();
		// 동일한 id와 password가 있으면 아래 영역으로 보내라.
		response.setContentType("text/html; charset=UTF-8");
		// out 인스턴스 생성
		PrintWriter out = response.getWriter();
		// alert 메시지 생성 및 이동 경로 설정
		out.println("<script>alert('방문 감사드립니다. 안녕히가세요.'); location.href='/okeedokee/main';</script>");
		// 출력
		out.flush();
	}
	
	@GetMapping("/signUp")
	public String signUp(MemberVO vo) {
		 
		return "signup";
	}
	
	@PostMapping("/signupResult")
	public String signupResult(MemberVO vo) {
		memberService.setMember(vo);
		return "redirect:/member/loginPage";
	}

	@PostMapping("/idCheck")
	public @ResponseBody boolean idCheck(String id) {
		return memberService.memberIdCheck(id);
	}
	
	@GetMapping("/findId")
	public String findId(MemberVO vo) {
		
		return "findId";
	}
	
	@PostMapping("/findIdResult")
	public @ResponseBody ResponseEntity<MemberVO> findIdResult(String name, String email) {

		MemberVO vo1 = memberService.memberFindId(name, email);
		ResponseEntity<MemberVO> response = new ResponseEntity<MemberVO>(vo1,HttpStatus.OK);
		
		return response;
	}
	
	@PostMapping("/findPwResult")
	public @ResponseBody ResponseEntity<MemberVO> findIdResult(String name, String email, String id) {
		
		MemberVO vo1 = memberService.memberFindPw(name, email, id);
		ResponseEntity<MemberVO> response = new ResponseEntity<MemberVO>(vo1,HttpStatus.OK);
		
		return response;
	}
	
	
	//cpi(Change your personal information)
	@PostMapping("/findCpi")
	public @ResponseBody ResponseEntity<MemberVO> findCpi(String id, String pw) {

		MemberVO vo1 = memberService.memberFindCpi(id, pw);
		ResponseEntity<MemberVO> response = new ResponseEntity<MemberVO>(vo1,HttpStatus.OK);
		
		return response;
	}
	
	@PostMapping("/cpiUpdate")
	public String cpiUpdate(MemberVO vo, HttpSession session) {
		memberService.memberUpdateCpi(vo, session);
		
		return "redirect:/";
	}
	
	@GetMapping("/cpiDelete")
	public String cpiDelete(String id) {
		memberService.memberDeleteCpi(id);
		
		return "redirect:/member/logout";
	}
}

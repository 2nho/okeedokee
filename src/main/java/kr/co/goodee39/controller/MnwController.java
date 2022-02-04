package kr.co.goodee39.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.goodee39.service.MnwService;
import kr.co.goodee39.vo.MemberVO;
import kr.co.goodee39.vo.mnwCmtVO;
import kr.co.goodee39.vo.mnwVO;

@Controller
public class MnwController {

	@Autowired
	MnwService service;

	// 실종, 목격 메뉴 이동 = 실종 게시판 이동
	@GetMapping("/missing")
	public String missing(
			@RequestParam(defaultValue = "1") int num,
			@RequestParam(defaultValue = "") String id,
			@RequestParam(defaultValue = "") String title,
			@RequestParam(defaultValue = "") String content,
			Model model) {

		//게시판 구분
		int bdiv = 3;
		//마이페이지-실종글 작성 내역에 필요하나 여기선 필요 없으므로 공백처리
		String myId = "";
		service.selectMnw(num, id, title, content, bdiv, myId, model);

		return "d_missing";
	}

	// 목격 게시판 이동
	@GetMapping("/witnessing")
	public String witnessing(
			@RequestParam(defaultValue = "1") int num,
			@RequestParam(defaultValue = "") String id,
			@RequestParam(defaultValue = "") String title,
			@RequestParam(defaultValue = "") String content,
			Model model) {
		
		//게시판 구분
		int bdiv = 4;
		//마이페이지-실종글 작성 내역에 필요하나 여기선 필요 없으므로 공백처리
		String myId = "";
		service.selectMnw(num, id, title, content, bdiv, myId, model);

		return "d_witnessing";
	}

	
	// 게시글 내용보기
	@GetMapping("/read")
	public String detailMnw(
			@RequestParam int num, 
			@RequestParam int bdiv, 
			@ModelAttribute("mnwVO") mnwVO vo,
			Model model, 
			HttpSession session) {

		String path = "";

		path = service.selectMnwOne(num, bdiv, vo, model);

		
		// 로그인 기능 생성 전 임시 코드//로그인 기능 생성 전 임시 코드
		//session.getAttribute("account");
		//임시세션 정보
		//session.setAttribute("account", "sessionId");
		// 로그인 기능 생성 전 임시 코드//로그인 기능 생성 전 임시 코드

		return path + "read";
	}
	
	// 실종 글쓰기 이동
	@GetMapping("/writeMissing")
	public String writeMissing(@ModelAttribute mnwVO vo, HttpSession session) {
		
		String path = "";
		
		//로그인 Controller 등록 후 주석 지우기!!!!!!
		//로그인 정보 있어야 접근 가능
		if(session.getAttribute("account") != null) {
			path = "d_missing_write";
		}
		//없다면 로그인 페이지
		else if(session.getAttribute("account") == null){
			path = "redirect:/member/loginPage";
		}
		
		return path;
	}

	// 목격 글쓰기 이동
	@GetMapping("/writeWitnessing")
	public String writeWitnessing(@ModelAttribute mnwVO vo, HttpSession session) {
		
		String path = "";
		
		//로그인 Controller 등록 후 주석 지우기!!!!!!
		//로그인 정보 있어야 접근 가능
		if(session.getAttribute("account") != null) {
			path = "d_witnessing_write";
		}
		//없다면 로그인 페이지
		else if(session.getAttribute("account") == null) {
			path = "redirect:/member/loginPage";
		}
		return path;
	}

	// 실종/목격 게시글 제출
	@PostMapping("/createResult")
	private String sendMNWCreate(mnwVO vo) {

		String path = "";

		// 작성일 추가하기
		vo.setCreatedate(new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date()));

		// 도착했는지 뽑아봅시다 : 잘옵니다~
		/*
		 * System.out.println("title : "+vo.getTitle());
		 * System.out.println("mnum : "+vo.getMnum());
		 * System.out.println("id : "+vo.getId());
		 * System.out.println("sp : "+vo.getSpecies());
		 * System.out.println("se : "+vo.getSex());
		 * System.out.println("cha : "+vo.getCharacters());
		 * System.out.println("loca : "+vo.getLocation());
		 * System.out.println("cont : "+vo.getContent());
		 * System.out.println("게시판구분 : "+vo.getBdiv());
		 * System.out.println("fileList : "+vo.getFileList());
		 * System.out.println("작성일 : "+vo.getCreatedate());
		 */

		service.insertMnw(vo);
	
		if (vo.getBdiv() == 3) {
			path = "missing";
		} else if (vo.getBdiv() == 4) {
			path = "witnessing";
		}
		

		// 작성완료시 다시 게시판 리스트 페이지로 이동
		return "redirect:/" + path;
	}

	
	
	//게시글 수정 페이지 이동
	@GetMapping("/revise")
	public String revise(@RequestParam int num, @RequestParam int bdiv, mnwVO vo, Model model) {
		
		String path = "";
		
		path = service.selectMnwOne(num, bdiv, vo, model);
		
		return path+"revise";
	}
	
	
	//게시글 수정완료
	@PostMapping("/reviseResult")
	public String reviseResult(mnwVO vo) {
		
		String path = "";
	
		path = service.updateMnw(vo);
		service.changeHasimg(vo);
		
		return "redirect:/"+path;
	}
	
	//게시글 삭제
	@GetMapping("/isdelete")
	public String isdelete(@RequestParam int bdiv, @RequestParam int num, mnwVO vo) {
		
		String path = "";
		
		path = service.deleteMnw(bdiv, num, vo);
		
		return "redirect:/"+path;
	}
	
	//게시글 귀가처리
	@GetMapping("/back")
	public String back(@RequestParam int bdiv, @RequestParam int num, mnwVO vo) {
		String path = "";
		
		vo.setStatus("B");
		path = service.updateStatus(bdiv, num, vo);
		
		return "redirect:/"+path;
	}
	
	//게시글 종료처리
	@GetMapping("/end")
	public String end(@RequestParam int bdiv, @RequestParam int num, mnwVO vo) {
		String path = "";

		vo.setStatus("E");
		path = service.updateStatus(bdiv, num, vo);
		
		return "redirect:/"+path;
	}
	
	//게시글 신고처리
	public String report(HttpSession session) {
		
		String path = "";
		
		//로그인 Controller 등록 후 주석 지우기!!!!!!
		//로그인 정보 있어야 접근 가능
		if(session.getAttribute("account") != null) {
			path = "g_report";
		}
		//없다면 로그인 페이지
		else if(session.getAttribute("account") == null){
			path = "redirect:/member/loginPage";
		}
		
		return path;
	}
	
	
	//게시글 댓글 가져오기
	@GetMapping("/getComment/{num}/{bdiv}")
	public ResponseEntity<List<mnwCmtVO>> getCommentList(@PathVariable int num, @PathVariable int bdiv) {
		
		//게시글 번호 num을 bnum으로 설정
		mnwCmtVO cvo = new mnwCmtVO();
		cvo.setBnum(num);
		cvo.setBdiv(bdiv);
		
		//service통해 코멘트 db긁어오기
		List<mnwCmtVO> list = service.selectMnwCmt(cvo);
		
		//리턴타입 변수에 결과 담기 (단, status가 ok인 상황에서만!)
		ResponseEntity<List<mnwCmtVO>> entity = new ResponseEntity<List<mnwCmtVO>>(list, HttpStatus.OK);
		
		return entity;
	}
	
	
	//게시글 댓글 추가
	@PostMapping("/createComment")
	public ResponseEntity<mnwCmtVO> createComment(@RequestBody mnwCmtVO vo, HttpSession session) {
		System.out.println("코멘트 : "+vo.getCmt());
		System.out.println("글번호 : "+vo.getBnum());
		System.out.println("게시판구분 : "+vo.getBdiv());
		
		//세션에서 id정보 가져오기
		MemberVO mvo = (MemberVO)session.getAttribute("account");
		vo.setId(mvo.getId());
		//임시id : 후에 세션정보로 교체 필요
		//vo.setId("sessionId");
		
		//코멘트 db추가
		service.insertMnwCmt(vo);
		
		ResponseEntity<mnwCmtVO> entity = new ResponseEntity<mnwCmtVO>(vo, HttpStatus.OK);
		
		return entity;
	}
	
	//게시글 댓글 삭제
	@DeleteMapping("/deleteComment")
	public ResponseEntity<String> deletetComment(@RequestBody mnwCmtVO vo, HttpSession session) {
		
		System.out.println("어떤 댓글 삭제? : "+vo.getNum());
		System.out.println("어디 게시판? : "+vo.getBdiv());
		
		//세션에서 id정보 가져오기
		MemberVO mvo = (MemberVO)session.getAttribute("account");
		vo.setId(mvo.getId());
		//임시id : 후에 세션정보로 교체 필요
		//vo.setId("sessionId");
		
		service.deleteMnwCmt(vo);
		
		String msg = "삭제 완.";
		
		ResponseEntity<String> entity = new ResponseEntity<String>(msg, HttpStatus.OK);
		
		return entity;
	}
	
}

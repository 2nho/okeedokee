package kr.co.goodee39.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.goodee39.service.MnwService;
import kr.co.goodee39.vo.ImageVO;
import kr.co.goodee39.vo.mnwVO;

@Controller
public class MnwController {

	@Autowired
	MnwService service;

	// 실종, 목격 메뉴 이동 = 실종 게시판 이동
	@GetMapping("/missing")
	public String mnw(@RequestParam(defaultValue = "1") int num, Model model) {

		service.selectMiss(num, model);

		return "d_missing";
	}

	// 목격 게시판 이동
	@GetMapping("/witnessing")
	public String witnessing(@RequestParam(defaultValue = "1") int num, mnwVO vo, Model model) {

		service.selectWitness(num, model);

		return "d_witnessing";
	}

	// 셀프 전단지 이동
	@GetMapping("/selfFlyer")
	public String selfFlyer() {
		return "d_selfFlyer";
	}

	// 게시글 상세보기 이동
	@GetMapping("/mnw/detail")
	public String mnwDetail() {

		return "";
	}

	// 실종 글쓰기 이동
	@GetMapping("/writeMissing")
	public String writeMissing(@ModelAttribute mnwVO vo) {
		return "d_missing_write";
	}

	// 목격 글쓰기 이동
	@GetMapping("/writeWitnessing")
	public String writeWitnessing(@ModelAttribute mnwVO vo) {
		return "d_witnessing_write";
	}

	// 실종 게시판 글쓰기
	// 게시글 등록
	// 얘는 지금 form 데이터 통해서 값 받아가는 거니까 커맨드 객체 필요!
	@PostMapping("/createResult")
	private String setMNWCreate(mnwVO vo) {

		String path = "";

		// 작성일 추가하기
		vo.setCreatedate(new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date()));

		// 도착했는지 뽑아봅시다 : 잘옵니다~
		/*
		 * System.out.println("title : "+vo.getTitle());
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

		System.out.println("date : " + vo.getDate());

		if (vo.getBdiv() == 3) {
			service.insertMiss(vo);
			path = "missing";
		} else if (vo.getBdiv() == 4) {
			service.insertWitness(vo);
			path = "witnessing";
		}

		// 작성완료시 다시 게시판 리스트 페이지로 이동
		return "redirect:/" + path;
	}

	// 파일 업로드 : throws Exception없으면 에러남!!!
	@PostMapping("/uploadImage")
	public @ResponseBody ResponseEntity<List<ImageVO>> uploadfile(MultipartFile[] uploadFile) throws Exception {

		ArrayList<ImageVO> list = new ArrayList<ImageVO>();

		for (MultipartFile file : uploadFile) {
			// 파일 이름이 공백이 아니라면 == 파일 이름 有
			if (!file.getOriginalFilename().isEmpty()) {

				// UUID 매번 새로운 이름으로 생성해 파일이름 중복 방지, 보안 유지 가능
				// UUID 생성 후 name 변수에 담아서
				String name = UUID.randomUUID().toString();

				// 파일 이름으로 UUID 설정해 지정된 위치로 전송
				// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				// !!!!!!!!!!!!!!경로 각자 수정 必!!!!!!!!!!!!!!
				// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				file.transferTo(new File("D:/eclipse_project/git/okeedokee/src/main/webapp/resources/media/img",
						file.getOriginalFilename()));
				// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				// !!!!!!!!!!!!!!경로 각자 수정 必!!!!!!!!!!!!!!
				// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

				// 저장됐다면 콘솔창에 출력하기
				System.out.println(file.getOriginalFilename() + " 저장 완");

				// map에 파일 이름 추가
				list.add(new ImageVO(name, file.getOriginalFilename()));
			} else {
				// 파일 이름이 없으면 데이터 x
				System.out.println("데이터 존재하지 않습니다.");
			}
		}
		// 상단 for문 수행 후 결과 출력
		System.out.println("모든 데이터 저장 완.");

		ResponseEntity<List<ImageVO>> response = new ResponseEntity<List<ImageVO>>(list, HttpStatus.OK);

		// 콘솔창에 나타남
		return response;
	}

	
	
	//게시글 내용보기
	@GetMapping("/read")
	public String detailMissing(@RequestParam int num, @ModelAttribute("mnwVO")  mnwVO vo, Model model) {
		
		vo.setNum(num);
		service.selectMissOne(vo, model);
		
		return "d_missing_read";
	}
}

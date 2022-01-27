package kr.co.goodee39.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.goodee39.service.ImageService;
import kr.co.goodee39.vo.ImageVO;

@Controller
public class ImageController {
	
	@Autowired
	ImageService service;

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

	// 게시글 수정 내 등록된 사진 삭제
	@PostMapping("/deleteFile")
	public @ResponseBody ResponseEntity<String> deleteFile(@RequestBody ImageVO[] ivos) {
		for (ImageVO imgVO : ivos) {
			System.out.println("삭제num : " + imgVO.getNum());
		}
		service.deleteImgFile(ivos);
		return new ResponseEntity<String>("DeleteFile Success", HttpStatus.OK);
	}

}

package kr.co.goodee39.service;

import java.util.Arrays;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.google.gson.Gson;

import kr.co.goodee39.vo.ImageVO;
import kr.co.goodee39.vo.mnwVO;

@Service
public class MnwService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//실종 게시글 가져오기 및 페이징
	public void selectMiss(int num, Model model) {
		
		//총 게시글 수 
		int count = sqlSessionTemplate.selectOne("miss.selectMissCount"); 
		//페이지 범위 
		int total = (count/5)+((count%5==0)? 0:1); 
		//페이지 범위 최초숫자 
		int minBlock = (((num-1)/5)*5)+1; 
		//페이지 범위 최후숫자 
		int maxBlock = (((num-1)/5)+1)*5;
		  
		//페이징 처리시 첫 게시글 num설정 
		mnwVO vo = new mnwVO();
		vo.setStart((num -1)*vo.getCount());
		 
		
		//설정된 bdiv타입 게시글만 가져가기
		model.addAttribute("list", sqlSessionTemplate.selectList("miss.selectMiss", vo));
		
		//view단으로 설정 가져가기		
		model.addAttribute("num", num); 
		model.addAttribute("count", count);
		model.addAttribute("total", total); 
		model.addAttribute("minBlock", minBlock);
		model.addAttribute("maxBlock", maxBlock);
		
		//이미지 가져가기
		vo.setBdiv(3);
		selectImg(vo, model);
	}
	
	//목격 게시글 가져오기 및 페이징
	public void selectWitness(int num, Model model) {
		
		//총 게시글 수 
		int count = sqlSessionTemplate.selectOne("witness.selectWitnessCount"); 
		//페이지 범위 
		int total = (count/5)+((count%5==0)? 0:1); 
		//페이지 범위 최초숫자 
		int minBlock = (((num-1)/5)*5)+1; 
		//페이지 범위 최후숫자 
		int maxBlock = (((num-1)/5)+1)*5;
		
		//페이징 처리시 첫 게시글 num설정 
		mnwVO vo = new mnwVO();
		vo.setStart((num -1)*vo.getCount());
		
		
		//설정된 bdiv타입 게시글만 가져가기
		model.addAttribute("list", sqlSessionTemplate.selectList("witness.selectWitness", vo));
		
		//view단으로 설정 가져가기
		model.addAttribute("num", num); 
		model.addAttribute("count", count);
		model.addAttribute("total", total); 
		model.addAttribute("minBlock", minBlock);
		model.addAttribute("maxBlock", maxBlock);
		
		//이미지 가져가기
		vo.setBdiv(4);
		selectImg(vo, model);
	}

	
	
	// 실종 게시글 등록하기
	@Transactional
	public void insertMiss(mnwVO vo) {

		// JSON 객체에 대한 핸들링
		Gson gson = new Gson();
		ImageVO[] fileArray = gson.fromJson(vo.getFileList(), ImageVO[].class);
		List<ImageVO> fileList = Arrays.asList(fileArray);

		// 게시글 삽입
		//파일리스트 있으면 이미지 있음으로 변경 (기본값 : N)
		if(fileList != null) {
			vo.setHasimg("Y");
		}
		else {
			vo.setHasimg(null);
		}
		sqlSessionTemplate.insert("miss.insertMiss", vo);

		// 이미지 이름 삽입 with 조회가능하게 num이름과 함께
		for (ImageVO img : fileList) {
			img.setBnum(vo.getNum());
			img.setBdiv(vo.getBdiv());
			sqlSessionTemplate.insert("img.insertImg", img);
		}
	}
	
	// 목격 게시글 등록하기
	@Transactional
	public void insertWitness(mnwVO vo) {
		
		// JSON 객체에 대한 핸들링
		Gson gson = new Gson();
		ImageVO[] fileArray = gson.fromJson(vo.getFileList(), ImageVO[].class);
		List<ImageVO> fileList = Arrays.asList(fileArray);
		
		// 게시글 삽입
		//파일리스트 있으면 이미지 있음으로 변경 (기본값 : N)
		if(fileList != null) {
			vo.setHasimg("Y");
		}
		else {
			vo.setHasimg(null);
		}
		sqlSessionTemplate.insert("witness.insertWitness", vo);
		
		// 이미지 이름 삽입 with 조회가능하게 num이름과 함께
		for (ImageVO img : fileList) {
			img.setBnum(vo.getNum());
			img.setBdiv(vo.getBdiv());
			sqlSessionTemplate.insert("img.insertImg", img);
		}
	}
	
	//게시판 리스트 이미지 가져오기
	public void selectImg(mnwVO vo, Model model) {
		//uploadfile 테이블에 저장한 게시글 num 가져와서 추가
		ImageVO ivo = new ImageVO();
		ivo.setBdiv(vo.getBdiv());
		System.out.println(vo.getBdiv());
				
		//게시글 num으로 해당하는 파일들 긁어오기
		List<ImageVO> filelist = sqlSessionTemplate.selectList("img.selectImg", ivo);
		System.out.println(filelist);
		
		if(filelist.isEmpty()) {
			model.addAttribute("filelist", "none");
			System.out.println("비었다");
		}
		else {
			//view로 가져가자
			model.addAttribute("filelist", filelist);
		}
	}
	
	//게시글 자세히보기
	public void selectMissOne(mnwVO vo, Model model) {
		model.addAttribute("getMnw", sqlSessionTemplate.selectOne("miss.selectMissOne", vo));
	}
}

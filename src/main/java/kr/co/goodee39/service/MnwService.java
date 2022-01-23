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
		// System.out.println("사진없이 등록 array" + fileArray);
		// System.out.println("사진없이 등록 list" + fileList);

		//게시글 등록
		// 사진 등록하는 경우
		if (!(fileList.isEmpty())) {
			vo.setHasimg("Y");
		}
		// 사진 미등록인 경우
		else if (fileList.isEmpty()) {
			vo.setHasimg("N");
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
		
		// 게시글 등록
		// 사진 등록하는 경우
		if (!(fileList.isEmpty())) {
			vo.setHasimg("Y");
		}
		// 사진 미등록인 경우
		else if(fileList.isEmpty()){
			vo.setHasimg("N");
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
		//System.out.println(vo.getBdiv());
		//System.out.println(vo.getNum());
				
		//게시글 num으로 해당하는 파일들 긁어오기
		List<ImageVO> filelist = sqlSessionTemplate.selectList("img.selectImg", ivo);
		//System.out.println(filelist);
		
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
	public String selectMnwOne(int num, int bdiv, mnwVO vo, Model model) {
		String path = "";
		
		vo.setNum(num);
		vo.setBdiv(bdiv);
		
		
		//게시글 내용 가져오기 및 이동 path 설정
		mnwVO mvo = new mnwVO();
		
		if(vo.getBdiv() == 3) {
			mvo = sqlSessionTemplate.selectOne("miss.selectMissOne", vo);
			path="d_missing_";
		}
		else if (vo.getBdiv() == 4) {
			mvo = sqlSessionTemplate.selectOne("witness.selectWitnessOne", vo);
			path="d_witnessing_";
		}
		
		vo.setNum(mvo.getNum());
		vo.setId(mvo.getId());
		vo.setTitle(mvo.getTitle());
		vo.setSex(mvo.getSex());
		vo.setSpecies(mvo.getSpecies());
		vo.setCharacters(mvo.getCharacters());
		vo.setLocation(mvo.getLocation());
		vo.setDate(mvo.getDate());
		vo.setContent(mvo.getContent());
		vo.setHasimg(mvo.getHasimg());
		
		
		//게시글 사진 가져오기
		ImageVO ivo = new ImageVO();
		ivo.setBnum(vo.getNum());
		ivo.setBdiv(vo.getBdiv());
		//System.out.println("내용보기 게시판번호 : "+vo.getBdiv());
		//System.out.println("내용보기 게시글번호 : "+vo.getNum());
		
		List<ImageVO> filelist = sqlSessionTemplate.selectList("img.selectImg", ivo);
		model.addAttribute("filelist", filelist);
		
		return path;

	}
	
	//게시글 수정하기
	public String updateMnw(mnwVO vo) {
		String path = "";
		
		// JSON 객체에 대한 핸들링
		Gson gson = new Gson();
		ImageVO[] fileArray = gson.fromJson(vo.getFileList(), ImageVO[].class);
		
		
		// 게시판 번호에 따라 다른 쿼리 실행
		if (vo.getBdiv() == 3) {
			sqlSessionTemplate.update("miss.updateMiss", vo);
			path = "missing";

		} else if (vo.getBdiv() == 4) {
			sqlSessionTemplate.update("witness.updateWitness", vo);
			path = "witnessing";

		}

		// 새로 추가한 파일이 1개 이상 있을 때만 아래 로직 실행
		if (fileArray != null) {
			List<ImageVO> fileList = Arrays.asList(fileArray);

			for (ImageVO fileVO : fileList) {
				// 파일 이름 삽입 + 조회가능하게 num이름과 함께
				fileVO.setBnum(vo.getNum());
				fileVO.setBdiv(vo.getBdiv());
				sqlSessionTemplate.insert("img.insertImg", fileVO);
			}
		}
		
		return path;

	}
	
	//게시글 수정시 이미지 지우기
	@Transactional
	public void deleteImgFile(ImageVO[] ivos) {
		for (ImageVO ivo : ivos) {
			sqlSessionTemplate.delete("img.deleteImg", ivo);
		}
		
	}
	
	//게시글 수정 후 이미지 없을 시 hasimg변경
	public void changeHasimg(mnwVO vo) {
		
		// 수정 후 이미지 파일 지우고 없다면 hasimg 'N'변경 위한 작업
		ImageVO vo1 = new ImageVO();
		vo1.setBnum(vo.getNum());
		vo1.setBdiv(vo.getBdiv());
	
		System.out.println(vo1.getBnum());
		System.out.println(vo1.getBdiv());
		
		// 이미지 파일 아예 없다면 hasimg 'N'변경
		if(vo1.getBdiv() == 3) {
			if (sqlSessionTemplate.selectList("img.selectImg", vo1) == null || sqlSessionTemplate.selectList("img.selectImg", vo1).isEmpty()) {
				vo.setHasimg("N");
				sqlSessionTemplate.update("miss.updateMiss", vo);
			}
			else {
				vo.setHasimg("Y");
				sqlSessionTemplate.update("miss.updateMiss", vo);
			}
		}
		
		if(vo1.getBdiv() == 4) {
			if (sqlSessionTemplate.selectList("img.selectImg", vo1) == null || sqlSessionTemplate.selectList("img.selectImg", vo1).isEmpty()) {
				vo.setHasimg("N");
				sqlSessionTemplate.update("witness.updateWitness", vo);
			}else {
				vo.setHasimg("Y");
				sqlSessionTemplate.update("witness.updateWitness", vo);
			}	
		}
		
	}
	
	
	//게시글 삭제
	public String deleteMnw(int bdiv, int num, mnwVO vo) {
		String path = "";
		
		vo.setBdiv(bdiv);
		vo.setNum(num);
		
		if(vo.getBdiv() == 3) {
			sqlSessionTemplate.update("miss.deleteMiss", vo);
			path = "missing";
			
		}
		else if(vo.getBdiv() == 4) {
			sqlSessionTemplate.update("witness.deleteWitness", vo);
			path = "witnessing";
			
		}
		
		return path;
	}
}

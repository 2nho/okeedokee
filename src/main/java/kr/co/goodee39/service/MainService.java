package kr.co.goodee39.service;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.google.gson.Gson;

import kr.co.goodee39.vo.ImageVO;
import kr.co.goodee39.vo.mnwCmtVO;
import kr.co.goodee39.vo.mnwVO;

@Service
public class MainService {

	@Autowired
	MnwService MnwService;
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//게시글 가져오기 및 페이징
	public void selectMnw(
			int num, 
			String id, 
			String title, 
			String content, 
			int bdiv, 
			String myId,
			Model model) {
		
		
		mnwVO vo = new mnwVO();
		
		//이미지 가져가기
		vo.setBdiv(bdiv);
		selectImg(vo, model);
	}
	
	//새로추가 함수
	public List<HashMap<String, Object>> selectSighting (String i_type) {

		int iType = Integer.parseInt(i_type);
		return sqlSessionTemplate.selectList("miss.selectSighting", iType);
	}
	
	//새로추가 함수
	public List<HashMap<String, Object>> selectMissing (String i_type) {

		int iType = Integer.parseInt(i_type);
		return sqlSessionTemplate.selectList("miss.selectMissing", iType);
	}
	
	
	//게시판 리스트 이미지 가져오기
	public void selectImg(mnwVO vo, Model model) {

		//uploadfile 테이블에 저장한 게시글 num 가져와서 추가
		ImageVO ivo = new ImageVO();
		ivo.setBdiv(vo.getBdiv());
		
				
		//게시글 num으로 해당하는 파일들 긁어오기
		List<ImageVO> filelist = sqlSessionTemplate.selectList("img.selectImg", ivo);
		
		if(filelist.isEmpty()) {
			model.addAttribute("filelist", "none");
			System.out.println("비었다");
		}
		else {
			//view로 가져가자
			model.addAttribute("filelist", filelist);
		}
	}
}

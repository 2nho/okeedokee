package kr.co.goodee39.service;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.google.gson.Gson;

import kr.co.goodee39.vo.ImageVO;
import kr.co.goodee39.vo.mnwCmtVO;
import kr.co.goodee39.vo.selfFlyerVO;

@Service
public class SelfFlyerService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//전단지 리스트 가져오기
	public void selectFlyerList(Model model) {
		model.addAttribute("flyers", sqlSessionTemplate.selectList("self.selectFlyer"));
		
		//이미지 가져오기
		int bdiv = 7;
		selectImg(bdiv, model);
	}
	
	//전단지 리스트 이미지 가져오기
	public void selectImg(int bdiv, Model model) {

		// uploadfile 테이블에 저장한 게시글 num 가져와서 추가
		ImageVO ivo = new ImageVO();
		ivo.setBdiv(bdiv);

		// 게시글 num으로 해당하는 파일들 긁어오기
		List<ImageVO> filelist = sqlSessionTemplate.selectList("img.selectImg", ivo);

		if (filelist.isEmpty()) {
			model.addAttribute("filelist", "none");
			System.out.println("비었다");
		} else {
			// view로 가져가자
			model.addAttribute("filelist", filelist);
		}
	}
	
	//전단지 자세히 보기
	public void selectFlyer(int bdiv, int num, selfFlyerVO vo, Model model) {
	
		//전단지 정보 가져오기
		selfFlyerVO svo = new selfFlyerVO();
		vo.setNum(num);
		svo = sqlSessionTemplate.selectOne("self.selectFlyer", vo);

		vo.setMnum(svo.getMnum());
		vo.setNum(svo.getNum());
		vo.setId(svo.getId());
		vo.setPetName(svo.getPetName());
		vo.setSpecies(svo.getSpecies());
		vo.setSex(svo.getSex());
		vo.setAge(svo.getAge());
		vo.setCharacters(svo.getCharacters());
		vo.setLocation(svo.getLocation());
		vo.setGratuity(svo.getGratuity());
		vo.setHasimg(svo.getHasimg());
		vo.setPhone(svo.getPhone());
		vo.setColor(svo.getColor());
		vo.setStatus(svo.getStatus());
		
		//전단지 이미지 가져오기
		ImageVO ivo = new ImageVO();
		ivo.setBnum(num);
		ivo.setBdiv(bdiv);
		
		List<ImageVO> filelist = sqlSessionTemplate.selectList("img.selectImg", ivo);
		model.addAttribute("filelist", filelist);
	}
	
	
	
	//전단지 댓글 가져오기
	public List<mnwCmtVO> selectMnwCmt(mnwCmtVO cvo) {
		
		List<mnwCmtVO> list = null;
		
		list = sqlSessionTemplate.selectList("selfcmt.selectSelfCmt", cvo);
		
		return list;
	}
	
	
	//전단지 댓글 등록
	public void insertMnwCmt(mnwCmtVO vo) {
		
		String today = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date());
		vo.setCreatedate(today);
		
		sqlSessionTemplate.insert("selfcmt.insertSelfCmt", vo);
	}
	  
	
	//전단지 댓글 삭제
	public void deleteMnwCmt(mnwCmtVO vo) {
		
		sqlSessionTemplate.insert("selfcmt.deleteSelfCmt", vo);
	}
	
	
	//전단지 제작 등록
	public void insertSelf(selfFlyerVO vo) {
		
		// JSON 객체에 대한 핸들링
		Gson gson = new Gson();
		ImageVO[] fileArray = gson.fromJson(vo.getFileList(), ImageVO[].class);
		List<ImageVO> fileList = Arrays.asList(fileArray);

		//게시글 등록
		// 사진 등록하는 경우
		if (!(fileList.isEmpty())) {
			vo.setHasimg("Y");
		}
		// 사진 미등록인 경우
		else if (fileList.isEmpty()) {
			vo.setHasimg("N");
		}
		
		//전단지 게시판 db삽입 쿼리 실행
			sqlSessionTemplate.insert("self.insertFlyer", vo);

		// 이미지 이름 삽입 with 조회가능하게 num이름과 함께
		for (ImageVO img : fileList) {
			img.setBnum(vo.getNum());
			img.setBdiv(vo.getBdiv());
			sqlSessionTemplate.insert("img.insertImg", img);
		}
	}
}

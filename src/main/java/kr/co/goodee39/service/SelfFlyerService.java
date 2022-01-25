package kr.co.goodee39.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.ImageVO;
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
		vo.setStatus(svo.getStatus());
		
		//전단지 이미지 가져오기
		ImageVO ivo = new ImageVO();
		ivo.setBnum(bdiv);
		ivo.setBdiv(num);
		
		List<ImageVO> filelist = sqlSessionTemplate.selectList("img.selectImg", ivo);
		model.addAttribute("filelist", filelist);
		
	}
		
}

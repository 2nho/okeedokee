package kr.co.goodee39.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.mnwVO;
import kr.co.goodee39.vo.selfFlyerVO;

@Service
public class ReportService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//신고 대상 게시글 제목 뽑기
	public void selectTitle(int bdiv, int num, Model model) {
		

		mnwVO vo1 = new mnwVO();
		selfFlyerVO vo2 = new selfFlyerVO();
		
		if(bdiv == 3) {
			vo1.setNum(num);
			vo1 = sqlSessionTemplate.selectOne("miss.selectMissOne", vo1);
			model.addAttribute("report", vo1);
		}
		else if(bdiv == 4) {
			vo1.setNum(num);
			vo1 = sqlSessionTemplate.selectOne("witness.selectWitnessOne", vo1);
			model.addAttribute("report", vo1);
		}
		else if(bdiv == 7) {
			vo2.setNum(num);
			vo2 = sqlSessionTemplate.selectOne("self.selectFlyer", vo2);
			model.addAttribute("report", vo2);
		}
		
		
		
	}

}

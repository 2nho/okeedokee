package kr.co.goodee39.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.mnwVO;
import kr.co.goodee39.vo.reportVO;
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
	
	
	//신고 제출
	public String insertReport(reportVO vo) {
		
		String path = "";
		
		//작성일 설정
		String createdate = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date());
		vo.setCreatedate(createdate);
		
		//잘 오는지 뽑아봅시다
		System.out.println(vo.getMnum());
		System.out.println(vo.getId());
		System.out.println(vo.getTitle());
		System.out.println(vo.getContent());
		System.out.println(vo.getCreatedate());
		System.out.println(vo.getBdiv());
		System.out.println(vo.getUrl());
		
		//DB에 추가
		sqlSessionTemplate.insert("rep.insertReport", vo);
		
		//게시글 작성 완료 후 각 게시판 페이지로 이동 경로 설정
		//자원봉사 게시판
		if(vo.getUrl().contains("bdiv=2")) {
			path = "";
		}
		//실종게시판
		else if(vo.getUrl().contains("bdiv=3")) {
			path = "missing";
		}
		//목격게시판
		else if(vo.getUrl().contains("bdiv=4")) {
			path = "witnessing";
		}
		//셀프전단지게시판
		else if(vo.getUrl().contains("bdiv=7")) {
			path = "selfFlyer";
		}
		System.out.println(path);
		
		return path;
	}

}

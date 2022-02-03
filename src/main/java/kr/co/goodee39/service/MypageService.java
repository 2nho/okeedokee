package kr.co.goodee39.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.MemberVO;
import kr.co.goodee39.vo.mnwVO;
import kr.co.goodee39.vo.reportVO;
import kr.co.goodee39.vo.selfFlyerVO;

@Service
public class MypageService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	//신고내역 가져오기
	public void selectReportList(HttpSession session, reportVO vo, Model model) {
		
		//세션에 저장된 mnum정보 설정해 신고 내역 가져오기
		MemberVO mvo = (MemberVO)session.getAttribute("account");
		vo.setMnum(mvo.getMnum());
		
		//임시 mnum설정
		//vo.setMnum(100);
		
		//결과 리스트 view로 가져가기
		model.addAttribute("report", sqlSessionTemplate.selectList("rep.selectReportList", vo));
		
	}
	
	//신고내역 글 1개 가져오기
	public void selectReport(int num, reportVO vo, HttpSession session, Model model) {
		//게시글 번호 설정
		vo.setNum(num);
		
		//번호만 설정해도 나오지만 예방차원에서 멤버넘버 설정
		MemberVO mvo = (MemberVO)session.getAttribute("account");
		vo.setMnum(mvo.getMnum());
		
		//임시 mnum설정
		//vo.setMnum(100);
		
		//view로 정보 가져가기
		model.addAttribute("report", sqlSessionTemplate.selectOne("rep.selectReport", vo));
		
		//게시글 제목 가져오기
		reportVO result = sqlSessionTemplate.selectOne("rep.selectReport", vo);

		int numPos = result.getUrl().indexOf("num=");
		int numResult = Integer.parseInt(result.getUrl().substring(numPos+4));
		System.out.println("글번호 나옴? : "+numResult);
		
		//자봉 글제목 가져오기
		if(result.getUrl().contains("bdiv=2")) {
			
		}
		//실종 글제목 가져오기
		else if(result.getUrl().contains("bdiv=3")) {
			mnwVO mwvo = new mnwVO();
			mwvo.setNum(numResult);
			mnwVO title = sqlSessionTemplate.selectOne("miss.selectMissOne", mwvo);
			model.addAttribute("title", title.getTitle());
			
		}
		//목격 글제목 가져오기
		else if(result.getUrl().contains("bdiv=4")) {
			mnwVO mwvo = new mnwVO();
			mwvo.setNum(numResult);
			mnwVO title = sqlSessionTemplate.selectOne("witness.selectWitnessOne", mwvo);
			model.addAttribute("title", title.getTitle());
		}
		//셀프 글제목 가져오기
		else if(result.getUrl().contains("bdiv=7")) {
			selfFlyerVO sfvo = new selfFlyerVO();
			sfvo.setNum(numResult);
			selfFlyerVO title = sqlSessionTemplate.selectOne("self.selectFlyer", sfvo);
			model.addAttribute("title", title.getId()+"님의 강아지를 찾습니다.");
		}
	}

}

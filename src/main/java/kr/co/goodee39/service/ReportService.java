package kr.co.goodee39.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

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
	

	//마이페이지 신고관련 기능
	
	//신고내역 가져오기
	public void selectReportList(HttpSession session, reportVO vo, Model model) {
		
		//세션에 저장된 mnum정보 설정해 신고 내역 가져오기
		MemberVO mvo = (MemberVO)session.getAttribute("account");
		vo.setMnum(mvo.getMnum());
		//미삭제 글만!
		vo.setDel("N");
		
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
		reportVO rvo = sqlSessionTemplate.selectOne("rep.selectReport", vo);
		vo.setNum(rvo.getNum());
		vo.setMnum(rvo.getMnum());
		vo.setId(rvo.getId());
		vo.setTitle(rvo.getTitle());
		vo.setContent(rvo.getContent());
		vo.setCreatedate(rvo.getCreatedate());
		vo.setBdiv(rvo.getBdiv());
		vo.setStart(rvo.getStart());
		vo.setDel(rvo.getDel());
		vo.setUrl(rvo.getUrl());
		
		
		//게시글 제목 가져오기
		int numPos = vo.getUrl().indexOf("num=");
		int numResult = Integer.parseInt(vo.getUrl().substring(numPos+4));
		System.out.println("글번호 나옴? : "+numResult);
		
		//자봉 글제목 가져오기
		if(vo.getUrl().contains("bdiv=2")) {
			
		}
		//실종 글제목 가져오기
		else if(vo.getUrl().contains("bdiv=3")) {
			mnwVO mwvo = new mnwVO();
			mwvo.setNum(numResult);
			mnwVO title = sqlSessionTemplate.selectOne("miss.selectMissOne", mwvo);
			model.addAttribute("title", title.getTitle());
			
		}
		//목격 글제목 가져오기
		else if(vo.getUrl().contains("bdiv=4")) {
			mnwVO mwvo = new mnwVO();
			mwvo.setNum(numResult);
			mnwVO title = sqlSessionTemplate.selectOne("witness.selectWitnessOne", mwvo);
			model.addAttribute("title", title.getTitle());
		}
		//셀프 글제목 가져오기
		else if(vo.getUrl().contains("bdiv=7")) {
			selfFlyerVO sfvo = new selfFlyerVO();
			sfvo.setNum(numResult);
			selfFlyerVO title = sqlSessionTemplate.selectOne("self.selectFlyer", sfvo);
			model.addAttribute("title", title.getId()+"님의 강아지를 찾습니다.");
		}
	}
	
	//신고내역 수정
	public void updateReport(reportVO vo) {
		sqlSessionTemplate.update("rep.updateReport", vo);
		
	}
	
	
	//신고내역 삭제 (del컬럼만 Y로 변경)
	public void deleteReport(int num, reportVO vo) {
		vo.setNum(num);
		sqlSessionTemplate.update("rep.deleteReport", vo);
	}

}

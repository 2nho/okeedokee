package kr.co.goodee39.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.DonationVO;
import kr.co.goodee39.vo.MemberVO;
import kr.co.goodee39.vo.mnwVO;
import kr.co.goodee39.vo.reportVO;

@Service
public class adminSerivce {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 총 회원
	public void TotalMember(Model model) {
		MemberVO vo = new MemberVO();
		model.addAttribute("total", sqlSessionTemplate.selectOne("member.totalMember", vo));
	}

	// 이번달 새로 가입한 회원
	public void NewMember(Model model) {
		MemberVO vo = new MemberVO();
		LocalDate now = LocalDate.now();
		// String date = now.getMonthValue()+""; 가능
		String date = String.valueOf(now.getMonthValue());
		vo.setSignupDay(date);
		// new class static 변수 사용 불가능
		model.addAttribute("nMember", sqlSessionTemplate.selectOne("member.newMember", vo));
	}
	// 이번달 모금액
	public void selectMoney(Model model) {
		DonationVO vo = new DonationVO();
		LocalDate now = LocalDate.now();
		String date = String.valueOf(now.getMonthValue());
		vo.setDate(date);
		int a = sqlSessionTemplate.selectOne("dona.selectDona", vo);
		String format = String.format("%,d", a);
		model.addAttribute("money", format);
	}
	// 각 달 가입한 멤버 
		public List<Map<String,String>> monthMember() {
			return sqlSessionTemplate.selectList("member.monthMember");
		}

	// 관리자 메인페이지 실종 목격 게시판 합
	public void sumBBS(Model model) {
		mnwVO vo = new mnwVO();
		LocalDate now = LocalDate.now();
		String date = String.valueOf(now);
		// System.out.println(date.getClass().getName());
		// System.out.println(date);
		vo.setCreatedate(date);
		model.addAttribute("missing", sqlSessionTemplate.selectOne("misstbl.selectMissing", vo));
		model.addAttribute("witness", sqlSessionTemplate.selectOne("witnesstbl.selectWitness", vo));
	}

	// 멤버 리스트
	public void memberlist(Model model, int num, String id, String email, String level) {
		MemberVO vo = new MemberVO();
		int count = sqlSessionTemplate.selectOne("member.CountMember",vo);
		// 현재 페이지
		model.addAttribute("num", num);
		// 전체 데이터 개수
		model.addAttribute("count", count);
		// 전체 페이지 개수
		model.addAttribute("total", count / 10 + ((count % 10 == 0) ? 0 : 1));
		int total = count / 10 + ((count % 10 == 0) ? 0 : 1);
		// 한 블럭에서 가장 작은 번호를 가지는 페이지 번호
		int minBlock = (((num - 1) / 10) * 10) + 1;
		// 한 블럭에서 가장 큰 번호를 가지는 페이지 번호
		int maxBlock = (((num - 1) / 10) + 1) * 10;
		
		model.addAttribute("total", total);
		model.addAttribute("minBlock", minBlock);
		model.addAttribute("maxBlock", maxBlock);
		
		String query = "";
		if (id != null) {
			query += "&id=" + id;
		}
		if (email != null) {
			query += "&email=" + email;
		}
		if (level != null) {
			query += "&level=" + level;
		}
		model.addAttribute("query", query);
		
		vo.setStart((num - 1) * vo.getCount());
		if (!id.equals("")) {
			vo.setId("%" + id + "%");
			model.addAttribute("id", id);
		}
		if (!email.equals("")) {
			vo.setEmail("%" + email + "%");
			model.addAttribute("email", email);
		}
		if (!level.equals("")) {
			vo.setLevel("%" + level + "%");
			model.addAttribute("level", level);
		}
		model.addAttribute("list", sqlSessionTemplate.selectList("member.allMember", vo));
	}
	// 회원게시판 삭제 버튼 시 N값을 Y값으로 변경
	public void updateM(MemberVO vo) {
		sqlSessionTemplate.update("member.updateM",vo);
	}
		// 신고 게시판 
	public void selectReportBBS(Model model, int num, String title, String content, String status) {
		reportVO vo = new reportVO();
		int count = sqlSessionTemplate.selectOne("reporttbl.CountReport", vo);
		// 현재 페이지
		model.addAttribute("num", num);
		// 전체 데이터 개수
		model.addAttribute("count", count);
		// 전체 페이지 개수
		model.addAttribute("total", count / 10 + ((count % 10 == 0) ? 0 : 1));
		int total = count / 10 + ((count % 10 == 0) ? 0 : 1);
		// 한 블럭에서 가장 작은 번호를 가지는 페이지 번호
		int minBlock = (((num - 1) / 10) * 10) + 1;
		// 한 블럭에서 가장 큰 번호를 가지는 페이지 번호
		int maxBlock = (((num - 1) / 10) + 1) * 10;

		model.addAttribute("total", total);
		model.addAttribute("minBlock", minBlock);
		model.addAttribute("maxBlock", maxBlock);

		// 검색 데이터 연동
		String query = "";

		if (title != null) {
			query += "&title=" + title;
		}

		if (content != null) {
			query += "&content=" + content;
		}
		if (status != null) {
			query += "&status=" + status;
		}

		model.addAttribute("query", query);
		/////////////////////////////////////////
		vo.setStart((num - 1) * vo.getCount());
		if (!title.equals("")) {
			vo.setTitle("%" + title + "%");
			model.addAttribute("title", title);
		}
		if (!content.equals("")) {
			vo.setContent("%" + content + "%");
			model.addAttribute("content", content);
		}
		if (!status.equals("")) {
			vo.setStatus(status);
			model.addAttribute("status", status);
		}
		model.addAttribute("report", sqlSessionTemplate.selectList("reporttbl.selectReport", vo));
	}
	// 회원게시판 level 구분 업데이트
	public void updateLevel(MemberVO vo) {
		 sqlSessionTemplate.update("member.updateLevel",vo);
	}
}

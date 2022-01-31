package kr.co.goodee39.service;


import java.time.LocalDate;


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
	public void TotalMember(Model model) {
		MemberVO vo = new MemberVO();
		model.addAttribute("total",sqlSessionTemplate.selectOne("member.totalMember", vo));
	}

	public void NewMember(Model model) {
		MemberVO vo =new MemberVO();
		LocalDate now = LocalDate.now();
		//String date = now.getMonthValue()+""; 가능
		String date = String.valueOf(now.getMonthValue());
		vo.setsignupDay(date);
		// new class static 변수 사용 불가능
		model.addAttribute("nMember",sqlSessionTemplate.selectOne("member.newMember", vo));
	}
	
	public void selectMoney(Model model) {
		DonationVO vo = new DonationVO();
		LocalDate now = LocalDate.now();
		String date = String.valueOf(now.getMonthValue());
		vo.setDate(date);
		model.addAttribute("money",sqlSessionTemplate.selectOne("donation.selectMoney", vo));
	}
	
	public void sumBBS(Model model) {
		mnwVO vo = new mnwVO();
		LocalDate now = LocalDate.now();
		String date = String.valueOf(now);
		//System.out.println(date.getClass().getName());
		//System.out.println(date);
		vo.setCreatedate(date);
		model.addAttribute("missing",sqlSessionTemplate.selectOne("misstbl.selectMissing", vo));
		model.addAttribute("witness",sqlSessionTemplate.selectOne("witnesstbl.selectWitness", vo));
	}
	public void memberlist(Model model) {
	    MemberVO vo = new MemberVO();
	    model.addAttribute("list", sqlSessionTemplate.selectList("member.allMember", vo));
	}
	public void selectReportBBS(Model model, int num, String title, String content, String status) {
		reportVO vo = new reportVO();
		int count = sqlSessionTemplate.selectOne("reporttbl.CountReport", vo);
			// 현재 페이지
			model.addAttribute("num", num);
			// 전체 데이터 개수
			model.addAttribute("count", count);
			// 전체 페이지 개수
			model.addAttribute("total",count/10+((count%10==0)?0:1));
			int total = count/10+((count%10==0)?0:1);
			// 한 블럭에서 가장 작은 번호를 가지는 페이지 번호
			int minBlock = (((num-1)/10)*10)+1;
			// 한 블럭에서 가장 큰 번호를 가지는 페이지 번호
			int maxBlock = (((num-1)/10)+1)*10;
			
			model.addAttribute("total", total);
			model.addAttribute("minBlock", minBlock);
			model.addAttribute("maxBlock", maxBlock);
			
			// 검색 데이터 연동
			String query = "";
			
			if(title != null){
				query += "&title="+title;
			}
			
			if(content != null){
				query += "&content="+content;
			}
			if(status != null){
				query += "&status="+status;
			}
			
			model.addAttribute("query", query);
			/////////////////////////////////////////
			vo.setStart((num-1)*vo.getCount());
			if(!title.equals("")) {
				model.addAttribute("title", title);
				vo.setTitle("%"+title+"%");
			}
			if(!content.equals("")) {
				model.addAttribute("content", content);
				vo.setContent("%"+content+"%");
			}
			if(!status.equals("")) {
				model.addAttribute("status", status);
				vo.setContent("%"+status+"%");
			}
		model.addAttribute("report",sqlSessionTemplate.selectList("reporttbl.selectReport", vo));
	}
}

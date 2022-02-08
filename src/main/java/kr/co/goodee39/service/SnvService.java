package kr.co.goodee39.service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.DonationVO;
import kr.co.goodee39.vo.mnwCmtVO;
import kr.co.goodee39.vo.voluntaryVO;
import kr.co.goodee39.vo.volunteerVO;

@Service
public class SnvService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 봉사자 모집 리스트 가져오기
	public void selectVoltaList(int num, String careName, String addr, Model model) {

		// 페이징 처리시 첫 게시글 num설정
		voluntaryVO vo = new voluntaryVO();
		vo.setStart((num - 1) * vo.getCount());

		// 검색결과 추려내기 및 페이징 버튼 반영 쿼리
		String query = "";

		if (!careName.equals("")) {
			vo.setCareName("%" + careName + "%");
			query += "&careName=" + careName;
		}
		if (!addr.equals("")) {
			vo.setAddr("%" + addr + "%");
			query += "&addr=" + addr;
		}

		model.addAttribute("query", query);

		// 총 게시글 수 : 설정된 bdiv타입따라 쿼리 결정
		// 마이페이지 : id설정해서 본인 작성글만 긁어가기
		int count = sqlSessionTemplate.selectOne("volta.selectVoltaCnt", vo);

		// 페이지 범위
		int total = (count / 5) + ((count % 5 == 0) ? 0 : 1);
		// 페이지 범위 최초숫자
		int minBlock = (((num - 1) / 5) * 5) + 1;
		// 페이지 범위 최후숫자
		int maxBlock = (((num - 1) / 5) + 1) * 5;

		// view단으로 리스트 가져가기
		model.addAttribute("list", sqlSessionTemplate.selectList("volta.selectVolta", vo));

		// view단으로 설정 가져가기
		model.addAttribute("num", num);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("minBlock", minBlock);
		model.addAttribute("maxBlock", maxBlock);
	}

	// 봉사자 모집글 1개 가져오기
	public void selectVoluntary(int num, voluntaryVO vo) {

		vo.setNum(num);
		
		voluntaryVO vvo = new voluntaryVO();
		vvo = sqlSessionTemplate.selectOne("volta.selectVoltaOne", vo);
		
		vo.setNum(vvo.getNum());
		vo.setId(vvo.getId());
		vo.setTitle(vvo.getTitle());
		vo.setCareName(vvo.getCareName());
		vo.setAddr(vvo.getAddr());
		vo.setPhNum(vvo.getPhNum());
		vo.setDetailText(vvo.getDetailText());
		vo.setDateFrom(vvo.getDateFrom());
		vo.setDateTo(vvo.getDateTo());
		
	}
	

	
	
	
	
	// 봉사자 모집 댓글 가져오기
	public List<volunteerVO> selectVolteCmt(volunteerVO vo) {
		return sqlSessionTemplate.selectList("volte.selectVolte", vo);
	}

	// 봉사자 모집 댓글 추가
	public void insertVolteCmt(volunteerVO vo) {
		//오늘 날짜 추가(사실 기본값 CURDATE라서 없어도 됨)
		String today = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA).format(new Date());
		vo.setCreatedate(today);

		sqlSessionTemplate.insert("volte.insertVolte", vo);

	}
	// 봉사자 모집 댓글 삭제 및 아예 리스트 삭제
	public void deleteVolteCmt(volunteerVO vo) {
		
		sqlSessionTemplate.delete("volte.deleteVolte", vo);
	}
	
	
	
	
	//마이페이지 봉사 신청 리스트 가져오기
	public void selectVolteList(volunteerVO vo, Model model) {
		model.addAttribute("list", sqlSessionTemplate.selectList("volte.selectVolte", vo));
	}

	
	
	
	// 관리자의 봉사자 모집 리스트 등록
	public void insertVoluntaryList(voluntaryVO vo) {
		sqlSessionTemplate.insert("volta.insertVoltaList", vo);
	}

	//봉사자 모집글 삭제
	public void deleteVoluntary(int num) {
		sqlSessionTemplate.delete("volta.deleteVolta", num);
	}
	
	
	//봉사자 모집글 수정
	public void updateVoluntary(int num, voluntaryVO vo) {
		vo.setNum(num);
		sqlSessionTemplate.update("volta.updateVolta", vo);
	}
	
	
	
	
	// 기부 테이블에 기부내역 등록하기
	public void insertDonation(DonationVO vo) {
		sqlSessionTemplate.insert("dona.insertDona", vo);
	}

	// 회원별 총 기부금액
	public void selectDonationOne(DonationVO vo, Model model) {

		// 단위 ,로 변환
		String donationAmt = "";
		if(sqlSessionTemplate.selectOne("dona.selectMyDona", vo) != null) {
			int dAmount = sqlSessionTemplate.selectOne("dona.selectMyDona", vo);
			DecimalFormat formatter = new DecimalFormat("###,###");
			donationAmt = formatter.format(dAmount);
		}
		else {
			donationAmt = "0";
		}

		model.addAttribute("donationAmt", donationAmt);

	}

}
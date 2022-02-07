package kr.co.goodee39.service;

import java.text.DecimalFormat;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import kr.co.goodee39.vo.DonationVO;
import kr.co.goodee39.vo.mnwVO;
import kr.co.goodee39.vo.voluntaryVO;

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

		//view단으로 리스트 가져가기
		model.addAttribute("list", sqlSessionTemplate.selectList("volta.selectVolta", vo));

		// view단으로 설정 가져가기
		model.addAttribute("num", num);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("minBlock", minBlock);
		model.addAttribute("maxBlock", maxBlock);
	}

	// 기부 테이블에 기부내역 등록하기
	public void insertDonation(DonationVO vo) {
		sqlSessionTemplate.insert("dona.insertDona", vo);
	}

	// 회원별 총 기부금액
	public void selectDonationOne(DonationVO vo, Model model) {

		// 단위 ,로 변환
		int dAmount = sqlSessionTemplate.selectOne("dona.selectMyDona", vo);
		DecimalFormat formatter = new DecimalFormat("###,###");
		String donationAmt = formatter.format(dAmount);

		model.addAttribute("donationAmt", donationAmt);

	}

}
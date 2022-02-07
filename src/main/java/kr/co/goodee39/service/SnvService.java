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

@Service
public class SnvService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 게시글 가져오기 및 페이징
	public void selectVolunteer(String title, int mnum, String perid, Model model) {
	}
	
	
	//기부 테이블에 기부내역 등록하기
	public void insertDonation(DonationVO vo) {
		sqlSessionTemplate.insert("dona.insertDona", vo);
	}
	
	//회원별 총 기부금액
	public void selectDonationOne(DonationVO vo, Model model) {
	
		//단위 ,로 변환
		int dAmount = sqlSessionTemplate.selectOne("dona.selectMyDona", vo);		
		DecimalFormat formatter = new DecimalFormat("###,###");
		String donationAmt = formatter.format(dAmount);
		
		model.addAttribute("donationAmt", donationAmt);
		
	}
	
	

	
}
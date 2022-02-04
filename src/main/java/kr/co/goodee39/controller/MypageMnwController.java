package kr.co.goodee39.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.goodee39.service.MnwService;

@Controller
public class MypageMnwController {

	@Autowired
	MnwService mnwservice;

	// 실종, 목격내역 이동
	@GetMapping("/missingList")
	public String missingList() {

		return "g_mypage_missing";
	}

	@GetMapping("/witnessingList")
	public String witnessingList() {

		return "g_mypage_witnessing";
	}

}

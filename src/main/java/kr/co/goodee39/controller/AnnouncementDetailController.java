package kr.co.goodee39.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.goodee39.service.ApiService;
import kr.co.goodee39.vo.ReservationVO;

@Controller
public class AnnouncementDetailController {
	

	@Autowired
	ApiService service;
	
	@RequestMapping(value = "/Announcement/Announcement_detail", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public ModelAndView Announcement_detail(HttpServletRequest request, Model model) {
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		String dog_img = request.getParameter("dog_img").toString();
		String dog_kindCd = request.getParameter("dog_kindCd").toString();
		String dog_orgNm = request.getParameter("dog_orgNm").toString();
		String dog_age = request.getParameter("dog_age").toString();
		String dog_sexCd = request.getParameter("dog_sexCd").toString();
		String dog_noticeSdt = request.getParameter("dog_noticeSdt").toString();
		String dog_careNm = request.getParameter("dog_careNm").toString();
		String dog_happenPlace = request.getParameter("dog_happenPlace").toString();
		
		String dog_processState = request.getParameter("dog_processState").toString();
		String dog_specialMark = request.getParameter("dog_specialMark").toString();
		String dog_careTel = request.getParameter("dog_careTel").toString();
		String dog_chargeNm = request.getParameter("dog_chargeNm").toString();
		String dog_careAddr = request.getParameter("dog_careAddr").toString();
		
		hashMap.put("dog_img", dog_img);
		hashMap.put("dog_kindCd", dog_kindCd);
		hashMap.put("dog_orgNm", dog_orgNm);
		hashMap.put("dog_age", dog_age);
		hashMap.put("dog_sexCd", dog_sexCd);
		hashMap.put("dog_noticeSdt", dog_noticeSdt);
		hashMap.put("dog_careNm", dog_careNm);
		hashMap.put("dog_happenPlace", dog_happenPlace);
		hashMap.put("dog_processState", dog_processState);
		hashMap.put("dog_specialMark", dog_specialMark);
		hashMap.put("dog_careTel", dog_careTel);
		hashMap.put("dog_chargeNm", dog_chargeNm);
		hashMap.put("dog_careAddr", dog_careAddr);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("Announcement_detail");
		modelAndView.addObject("dog", hashMap);
		
		// 이제승_commit form 태그 사용하기 위해 추가
		ReservationVO rvo = new ReservationVO();
		model.addAttribute("rvo", rvo);

        return modelAndView;
    }
	
	@GetMapping("/dogDetailPage")
	   public String finalPage(HttpServletRequest request, Model model) {
	      return "/Announcement_detail";
	}
	
	//@PostMapping("/setprofile.json")
	@RequestMapping(value="/setprofile.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> setProfile(HttpServletRequest request) {
		
		//최종 산출물을 담기 위한 변수 설정
		Map<String, Object> resultMap = new HashMap<String, Object>();

		try {
			//constroller에서 받아온 xmlFile 
			String xmlFile = service.getXml();
			
			//String타입 xmlFile을 JSON화 하기
			//String타입이지만 XML구조로 되어있기 때문에 XML.tojosn~
			JSONObject xmlToJsonObj = XML.toJSONObject(xmlFile);
			String xmlToJsonString = xmlToJsonObj.toString();
			/*
			 * System.out.println("####################### xmlToJsonString"+xmlToJsonString)
			 * ;
			 */
			
			//String을 JSON화 하기
			//pom에 추가한 Jackson에서 제공되는 객체로 내용물 파싱에 필요한 커스터마이징 가능
			ObjectMapper objMapper = new ObjectMapper();
			//objectMapper로 파싱해올 내용 담을 map 변수 선언
			Map<String, Object> map = new HashMap<>();
			//map에 xmlToJsonString 파싱해 담기
            map = objMapper.readValue(xmlToJsonString, new TypeReference<Map<String, Object>>(){});
            //XML각 블럭 뽑아오기
            Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
            Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
            Map<String, Object> items = null;
            List<Map<String, Object>> item = null; //전체

            items = (Map<String, Object>) body.get("items");
            item = (List<Map<String, Object>>) items.get("item");
            
            
            
          
            
            List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>(); //결과 DATA
            Map<String, Object> hashMap = new HashMap<String, Object>(); //API 임시 HashMap
            
          //strTargetDesertionNo
    		String strDesertionNo = request.getParameter("strTargetDesertionNo");
            //API ALL GET
            //item >> ALL GET
            for (int i = 0; i < strDesertionNo.length(); i++) {

            	if (strDesertionNo.equalsIgnoreCase(item.get(i).get("desertionNo").toString())) {
            	
            		if ("M".equalsIgnoreCase(item.get(i).get("sexCd").toString())) {
            			item.get(i).put("sexCd", "수컷");
            		} else if ("F".equalsIgnoreCase(item.get(i).get("sexCd").toString())) {
            			item.get(i).put("sexCd", "암컷");
            		} else {;}
            		
            		if ("[개] 슈나우져".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "슈나우져");
            		} else if ("[개] 믹스견".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "믹스견");
            		} else if ("[개] 진도견".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "진도견");
            		} else if ("[개] 프렌치 불독".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "프렌치 불독");
            		} else if ("[개] 푸들".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "푸들");
            		} else if ("[개] 포메라니안".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "포메라니안");
            		} else if ("[개] 비숑 프리제".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "비숑 프리제");
            		} else if ("[개] 말티즈".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "말티즈");
            		} else if ("[개] 시베리안 허스키".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "시베리안 허스키");
            		} else if ("[개] 알라스칸 말라뮤트".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "알라스칸 말라뮤트");
            		} else if ("[개] 시츄".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "시츄");
            		} else if ("[개] 골든 리트리버".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "골든 리트리버");
            		} else if ("[개] 저먼 포인터".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "저먼 포인터");
            		} else if ("[개] 라브라도 리트리버".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "라브라도 리트리버");
            		} else if ("[개] 미니어처 핀셔".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "미니어처 핀셔");
            		} else if ("[개] 베들링턴 테리어".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "베들링턴 테리어");
            		} else if ("[개] 아메리칸불리".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "아메리칸불리");
            		} else if ("[개] 베들링턴 테리어".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "베들링턴 테리어");
            		} else if ("[개] 말라뮤트".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "말라뮤트");
            		} else if ("[개] 사모예드".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "사모예드");
            		} else if ("[개] 웰시 코기 펨브로크".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "미니어처 핀셔");
            		} else if ("[개] 요키 믹스".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "요키 믹스");
            		} else if ("[개] 보르조이".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "보르조이");
            		} else if ("[개] 시바".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "시바");
            		} else if ("[개] 보더 콜리".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "보더 콜리");
            		} else if ("[개] 치와와".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "치와와");
            		} else if ("[개] 올드 잉글리쉬 쉽독".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "올드 잉글리쉬 쉽독");
            		} else if ("[개] 포인터".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "포인터");
            		} else if ("[개] 닥스훈트".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
	            		item.get(i).put("kindCd", "닥스훈트");
            		} else if ("[개] 웰시코기 믹스".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "웰시코기 믹스");
            		} else if ("[개] 스피츠".equalsIgnoreCase(item.get(i).get("kindCd").toString())) {
            			item.get(i).put("kindCd", "스피츠");
	            	} else {;}
            		
            		if ("2010(년생)".equalsIgnoreCase(item.get(i).get("age").toString())) {
            			item.get(i).put("age", "13살");
            		} else if ("2011(년생)".equalsIgnoreCase(item.get(i).get("age").toString())) {
            			item.get(i).put("age", "12살");
            		} else if ("2012(년생)".equalsIgnoreCase(item.get(i).get("age").toString())) {
            			item.get(i).put("age", "11살");
            		} else if ("2013(년생)".equalsIgnoreCase(item.get(i).get("age").toString())) {
            			item.get(i).put("age", "10살");
            		} else if ("2014(년생)".equalsIgnoreCase(item.get(i).get("age").toString())) {
            			item.get(i).put("age", "9살");
            		} else if ("2015(년생)".equalsIgnoreCase(item.get(i).get("age").toString())) {
            			item.get(i).put("age", "8살");
            		} else if ("2016(년생)".equalsIgnoreCase(item.get(i).get("age").toString())) {
            			item.get(i).put("age", "7살");
            		} else if ("2017(년생)".equalsIgnoreCase(item.get(i).get("age").toString())) {
            			item.get(i).put("age", "6살");
            		} else if ("2018(년생)".equalsIgnoreCase(item.get(i).get("age").toString())) {
            			item.get(i).put("age", "5살");
            		} else if ("2019(년생)".equalsIgnoreCase(item.get(i).get("age").toString())) {
            			item.get(i).put("age", "4살");
            		} else if ("2020(년생)".equalsIgnoreCase(item.get(i).get("age").toString())) {
            			item.get(i).put("age", "3살");
            		} else if ("2021(년생)".equalsIgnoreCase(item.get(i).get("age").toString())) {
            			item.get(i).put("age", "2살");
            		} else if ("2022(년생)".equalsIgnoreCase(item.get(i).get("age").toString())) {
            			item.get(i).put("age", "1살");
            		} else {;}
            		
            		hashMap.put("happenPlace", item.get(i).get("happenPlace").toString());
            		hashMap.put("kindCd", item.get(i).get("kindCd").toString());
            		hashMap.put("processState", item.get(i).get("processState").toString());
            		hashMap.put("sexCd", item.get(i).get("sexCd").toString());
            		hashMap.put("age", item.get(i).get("age").toString());
            		
            		break;
            	} else {;}
            }

            //뽑아온 내용 최종 산출물 변수에 담아주기
            resultMap.put("Result", "0000");
            resultMap.put("numOfRows", body.get("numOfRows"));
            resultMap.put("pageNo", body.get("pageNo"));
            resultMap.put("totalCount", body.get("totalCount"));
            resultMap.put("item", hashMap);
            
            //AnnouncementService
            //view로 가져가기
            //model.addAttribute("strTargetDesertionNo", resultMap);
            //model.addAttribute("result", resultMap);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return resultMap;
	}
	
	// 상담예약 페이지 이동
	@PostMapping("/Announcement/reservationMove")
	public String reservationMove(@ModelAttribute("rvo") ReservationVO vo, Model model) {
		model.addAttribute("vo", vo);
		return "g_mypage_reservation_create";
	}
	
}

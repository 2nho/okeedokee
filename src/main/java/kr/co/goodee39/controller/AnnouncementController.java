package kr.co.goodee39.controller;

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

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.goodee39.service.ApiService;

@Controller
public class AnnouncementController {
//	유기견공고
	@Autowired
	ApiService service;

	@GetMapping("/Announcement")
	public String Announcement(HttpServletRequest request, Model model) {
		
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
		            List<Map<String, Object>> item = null;

		            items = (Map<String, Object>) body.get("items");
		            item = (List<Map<String, Object>>) items.get("item");

					/*
					 * System.out.println("### map="+map);
					 * System.out.println("### dataResponse="+dataResponse);
					 * System.out.println("### body="+body); System.out.println("### items="+items);
					 * System.out.println("### item="+item);
					 */
		 
		            //뽑아온 내용 최종 산출물 변수에 담아주기
		            resultMap.put("Result", "0000");
		            resultMap.put("numOfRows", body.get("numOfRows"));
		            resultMap.put("pageNo", body.get("pageNo"));
		            resultMap.put("totalCount", body.get("totalCount"));
		            resultMap.put("item", item);
		            
		            //view로 가져가기
		            model.addAttribute("result", resultMap);

					

				} catch (Exception e) {
					e.printStackTrace();
				}
		
		return "Announcement";
	}
}

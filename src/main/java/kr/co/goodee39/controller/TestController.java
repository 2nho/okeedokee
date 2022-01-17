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
public class TestController {

	@Autowired
	ApiService service;

	@GetMapping("/api")
	public String xmlToObject(HttpServletRequest request, Model model) {

		Map<String, Object> resultMap = new HashMap<String, Object>();

		try {
			String xmlFile = service.getXml();
			
			JSONObject xmlToJsonObj = XML.toJSONObject(xmlFile);
			String xmlToJsonString = xmlToJsonObj.toString();
			/*
			 * System.out.println("####################### xmlToJsonString"+xmlToJsonString)
			 * ;
			 */
			
			ObjectMapper objMapper = new ObjectMapper();
			
			Map<String, Object> map = new HashMap<>();
            map = objMapper.readValue(xmlToJsonString, new TypeReference<Map<String, Object>>(){});
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
 
            resultMap.put("Result", "0000");
            resultMap.put("numOfRows", body.get("numOfRows"));
            resultMap.put("pageNo", body.get("pageNo"));
            resultMap.put("totalCount", body.get("totalCount"));
            resultMap.put("item", item);
            
            model.addAttribute("result", resultMap);

			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "api";
	}
} 
  
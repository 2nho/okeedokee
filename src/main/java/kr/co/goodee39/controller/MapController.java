package kr.co.goodee39.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MapController {

	@GetMapping("/Map_api")
	public String MapAPI() {
		
		return "Map_api";
	}

}

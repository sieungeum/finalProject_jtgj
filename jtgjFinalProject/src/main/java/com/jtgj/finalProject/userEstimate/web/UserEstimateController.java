package com.jtgj.finalProject.userEstimate.web;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jtgj.finalProject.estimate.dto.EstimateDTO;

@Controller
public class UserEstimateController {
	
	
	@ResponseBody
	@PostMapping("/saveMaterials")
	public String saveMaterials(String basicMater) {
		System.out.println(" - saveMaterials - ");
		
		System.out.println(basicMater);
		
		// Jackson : JSON 객체 사용 시 필요한 라이브러리
		ObjectMapper objectMapper = new ObjectMapper();
		
		// JSONString map으로 변환
		Map<String, Object> jsonMap = null;
		try {
			// JSON 문자열을 Java 객체 map으로 변환
			jsonMap = objectMapper.readValue(basicMater, Map.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(jsonMap);
		
		return "good";
	}

}

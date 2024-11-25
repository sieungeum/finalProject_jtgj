package com.jtgj.finalProject.userEstimate.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jtgj.finalProject.estimate.dto.EstimateDTO;
import com.jtgj.finalProject.estimate.service.EstimateService;
import com.jtgj.finalProject.userEstimate.service.UserEstimateService;

@Controller
public class UserEstimateController {
	
	@Autowired
	UserEstimateService userEstimateService;

	@Autowired
	EstimateService estimateService;

	@ResponseBody
	@PostMapping("/saveMaterials")
	public String saveMaterials(String basicMater, String userId) {
		System.out.println(" - saveMaterials - ");

		// 테스트 시 사용 (실전에서 주석처리)
		basicMater = "{\"0\":{\"materNo\":\"37\",\"materCategory\":\"거실\",\"materName\":\"석고 보드\",\"materGasKg\":\"0.12\",\"materPrice\":\"2000\",\"materKg\":\"13\"},\"1\":{\"materNo\":\"39\",\"materCategory\":\"방\",\"materName\":\"점토 석고\",\"materGasKg\":\"0.11\",\"materPrice\":\"2500\",\"materKg\":\"12\"},\"2\":{\"materNo\":\"41\",\"materCategory\":\"외장재\",\"materName\":\"구리 시트\",\"materGasKg\":\"1.52\",\"materPrice\":\"8000\",\"materKg\":\"23\"},\"3\":{\"materNo\":\"41\",\"materCategory\":\"지붕재\",\"materName\":\"구리 시트\",\"materGasKg\":\"1.52\",\"materPrice\":\"8000\",\"materKg\":\"13\"},\"4\":{\"materNo\":\"42\",\"materCategory\":\"외장재\",\"materName\":\"클링커 - 석기\",\"materGasKg\":\"0.3\",\"materPrice\":\"4250\",\"materKg\":\"44\"},\"5\":{\"materNo\":\"42\",\"materCategory\":\"지붕재\",\"materName\":\"클링커 - 석기\",\"materGasKg\":\"0.3\",\"materPrice\":\"4250\",\"materKg\":\"1\"},\"6\":{\"materNo\":\"43\",\"materCategory\":\"욕실\",\"materName\":\"PE 필름 (증기 차단)\",\"materGasKg\":\"1.98\",\"materPrice\":\"3500\",\"materKg\":\"123\"},\"7\":{\"materNo\":\"45\",\"materCategory\":\"주방\",\"materName\":\"세라믹 타일\",\"materGasKg\":\"0.52\",\"materPrice\":\"6500\",\"materKg\":\"412\"},\"8\":{\"materNo\":\"60\",\"materCategory\":\"창호재\",\"materName\":\"삼중 유리창\",\"materGasKg\":\"1.9\",\"materPrice\":\"7500\",\"materKg\":\"12\"},\"9\":{\"materNo\":\"61\",\"materCategory\":\"창호재\",\"materName\":\"이중 유리창\",\"materGasKg\":\"1.79\",\"materPrice\":\"7000\",\"materKg\":\"42\"}}";
		System.out.println(basicMater);
		System.out.println(userId);

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

		String[] matCateArr = { "외장재", "지붕재", "창호재", "거실", "욕실", "주방", "방" };
		int estiNo = userEstimateService.getEstiNo() + 1; // estiNo 구하기
		
		for (Map.Entry<String, Object> entry : jsonMap.entrySet()) {
			Map<String, String> materDict = (Map<String, String>) entry.getValue();
			
			EstimateDTO mater = new EstimateDTO();

			mater.setMaterName(materDict.get("materName"));
			mater.setMaterCategory(materDict.get("materCategory"));
			
			mater = estimateService.getSubMaterInfo(mater);
			
			System.out.println(mater);
		}
		
		return "good";
	}

}

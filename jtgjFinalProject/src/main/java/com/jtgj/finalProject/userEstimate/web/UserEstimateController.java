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
import com.jtgj.finalProject.userEstimate.dto.UserEstimateDTO;
import com.jtgj.finalProject.userEstimate.service.UserEstimateService;

@Controller
public class UserEstimateController {
	
	@Autowired
	UserEstimateService userEstimateService;

	@Autowired
	EstimateService estimateService;

	@ResponseBody
	@PostMapping("/saveMaterials")
	public String saveMaterials(String basicMater, String subMatInfo, String userId) {
		System.out.println(" - saveMaterials - ");

		// 테스트 시 사용 (실전에서 주석처리)
		// basicMater = "{\"0\":{\"materNo\":\"41\",\"materCategory\":\"외장재\",\"materName\":\"구리 시트\",\"materGasKg\":\"1.52\",\"materPrice\":\"8000\",\"materKg\":\"144\"},\"1\":{\"materNo\":\"42\",\"materCategory\":\"지붕재\",\"materName\":\"클링커 - 석기\",\"materGasKg\":\"0.3\",\"materPrice\":\"4250\",\"materKg\":\"96\"},\"2\":{\"materNo\":\"45\",\"materCategory\":\"욕실1\",\"materName\":\"세라믹 타일\",\"materGasKg\":\"0.52\",\"materPrice\":\"6500\",\"materKg\":\"96\"},\"3\":{\"materNo\":\"47\",\"materCategory\":\"거실\",\"materName\":\"석고 섬유 보드 (종이)\",\"materGasKg\":\"-0.03\",\"materPrice\":\"2500\",\"materKg\":\"120\"},\"4\":{\"materNo\":\"47\",\"materCategory\":\"방1\",\"materName\":\"석고 섬유 보드 (종이)\",\"materGasKg\":\"-0.03\",\"materPrice\":\"2500\",\"materKg\":\"180\"},\"5\":{\"materNo\":\"61\",\"materCategory\":\"창호재\",\"materName\":\"이중 유리창\",\"materGasKg\":\"1.79\",\"materPrice\":\"7000\",\"materKg\":\"96\"},\"6\":{\"materNo\":\"76\",\"materCategory\":\"주방1\",\"materName\":\"천연 대리석\",\"materGasKg\":\"1.0\",\"materPrice\":\"10000\",\"materKg\":\"240\"}}\r\n";
		// subMatInfo = "{\"0\":{\"materNo\":80,\"materCategory\":\"외장재\",\"materName\":\"경량 구리\",\"materGasKg\":1.1,\"materPrice\":8000,\"materKg\":\"144\"},\"1\":{\"materNo\":31,\"materCategory\":\"지붕재\",\"materName\":\"재활용 석기\",\"materGasKg\":0.2,\"materPrice\":4000,\"materKg\":\"96\"},\"2\":{\"materNo\":97,\"materCategory\":\"창호재\",\"materName\":\"재활용 유리창\",\"materGasKg\":1.2,\"materPrice\":6000,\"materKg\":\"96\"},\"3\":{\"materNo\":36,\"materCategory\":\"거실\",\"materName\":\"재활용 석고 보드\",\"materGasKg\":-0.05,\"materPrice\":2500,\"materKg\":\"120\"},\"4\":{\"materNo\":84,\"materCategory\":\"욕실\",\"materName\":\"경량 세라믹\",\"materGasKg\":0.25,\"materPrice\":5000,\"materKg\":\"180\"},\"5\":{\"materNo\":34,\"materCategory\":\"주방\",\"materName\":\"재활용 세라믹\",\"materGasKg\":0.3,\"materPrice\":5500,\"materKg\":\"96\"},\"6\":{\"materNo\":36,\"materCategory\":\"방\",\"materName\":\"재활용 석고 보드\",\"materGasKg\":-0.05,\"materPrice\":2500,\"materKg\":\"240\"}}\r\n";
		
		System.out.println(basicMater);
		System.out.println(subMatInfo);
		System.out.println(userId);

		// Jackson : JSON 객체 사용 시 필요한 라이브러리
		ObjectMapper objectMapper = new ObjectMapper();

		// JSONString map으로 변환(기본 자제)
		Map<String, Object> jsonMap = null;
		try {
			// JSON 문자열을 Java 객체 map으로 변환
			jsonMap = objectMapper.readValue(basicMater, Map.class);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// Jackson : JSON 객체 사용 시 필요한 라이브러리
		objectMapper = new ObjectMapper();

		// JSONString map으로 변환(대체 자제)
		Map<String, Object> jsonMapSub = null;
		try {
			// JSON 문자열을 Java 객체 map으로 변환
			jsonMapSub = objectMapper.readValue(subMatInfo, Map.class);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String[] matCateArr = { "외장재", "지붕재", "창호재", "거실", "욕실", "주방", "방" };
		int estiNo = userEstimateService.getEstiNo() + 1; // estiNo 구하기
		
		for (Map.Entry<String, Object> entry : jsonMap.entrySet()) {
			Map<String, String> materDict = (Map<String, String>) entry.getValue();
			
			EstimateDTO mater = new EstimateDTO();

			mater.setMaterName(materDict.get("materName"));
			mater.setMaterCategory(materDict.get("materCategory").replaceAll("\\d+", ""));
			
			mater = estimateService.getSubMaterInfo(mater);

			System.out.println(materDict);
			System.out.println(mater);
			
			UserEstimateDTO userEsti = new UserEstimateDTO();
			
			userEsti.setUserId(userId);
			userEsti.setEstiNo(estiNo);
			userEsti.setMaterNo(mater.getMaterNo());
			userEsti.setMaterCategory(materDict.get("materCategory"));
			userEsti.setMaterName(mater.getMaterName());
			userEsti.setMaterGasKg(mater.getMaterGasKg());
			userEsti.setMaterImg(mater.getMaterImg());
			userEsti.setMaterPrice(mater.getMaterPrice());
			userEsti.setMaterDurability(mater.getMaterDurability());
			userEsti.setMaterInfo(mater.getMaterInfo());
			userEsti.setMaterClassify(mater.getMaterClassify());
			userEsti.setKgPerPyeong(Integer.parseInt(materDict.get("materKg")));
			
			userEstimateService.setUserEstimate(userEsti);
		}
		
		for (Map.Entry<String, Object> entry : jsonMapSub.entrySet()) {
			Map<String, String> materDict = (Map<String, String>) entry.getValue();
			
			EstimateDTO mater = new EstimateDTO();

			mater.setMaterName(materDict.get("materName"));
			mater.setMaterCategory(materDict.get("materCategory").replaceAll("\\d+", ""));
			
			mater = estimateService.getSubMaterInfo(mater);
			
			System.out.println(materDict);
			System.out.println(mater);
			
			UserEstimateDTO userEsti = new UserEstimateDTO();
			
			userEsti.setUserId(userId);
			userEsti.setEstiNo(estiNo);
			userEsti.setMaterNo(mater.getMaterNo());
			userEsti.setMaterCategory(materDict.get("materCategory"));
			userEsti.setMaterName(mater.getMaterName());
			userEsti.setMaterGasKg(mater.getMaterGasKg());
			userEsti.setMaterImg(mater.getMaterImg());
			userEsti.setMaterPrice(mater.getMaterPrice());
			userEsti.setMaterDurability(mater.getMaterDurability());
			userEsti.setMaterInfo(mater.getMaterInfo());
			userEsti.setMaterClassify(mater.getMaterClassify());
			userEsti.setKgPerPyeong(Integer.parseInt(materDict.get("materKg")));
			
			userEstimateService.setUserEstimate(userEsti);
		}
		
		return "good";
	}

}

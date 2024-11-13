package com.jtgj.finalProject.estimate.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jtgj.finalProject.estimate.dto.EstimateDTO;
import com.jtgj.finalProject.estimate.service.EstimateService;
import com.jtgj.finalProject.subMatch.service.SubMatchService;

@Controller
public class EstimateController {

	@Autowired
	EstimateService estimateService;
	
	@Autowired
	SubMatchService subMatchService;

	@RequestMapping("/estimateHome")
	public String estimateHome(Model model) {
		System.out.println(" - estimateHome - ");

		List<EstimateDTO> basicMatter = estimateService.basic_mater();

		System.out.println(basicMatter);

		model.addAttribute("basicMatter", basicMatter);

		return "estimate/estimateHome";
	}

	@ResponseBody
	@PostMapping("/getMaterials")
	public List<EstimateDTO> getMaterials(String materCategory) {
		System.out.println(" - getMaterials - ");

		// ajax 통신으로 현재 누른 카테고리에 맞는 데이터 보내기
		List<EstimateDTO> categoryMater = estimateService.categoryMater(materCategory);

		return categoryMater;
	}

	// 최종적으로 계산 반환
	@ResponseBody
	@PostMapping("/calMaterial")
	public List<EstimateDTO> calMaterial(String sendMaterials) {
		System.out.println(" - calMaterial - ");
		
		System.out.println(sendMaterials);
		
		// 테스트 데이터, 사용 안할 때 주석처리
		// String sendMaterials = "{\"0\":{\"matCategory\":\"외장재\",\"matName\":\"가문비 나무 소나무 (클래딩)\",\"matKg\":\"12\"},\"1\":{\"matCategory\":\"외장재\",\"matName\":\"변형 목재(가열)\",\"matKg\":\"42\"},\"2\":{\"matCategory\":\"외장재\",\"matName\":\"개량된 목재(수분)\",\"matKg\":\"11\"},\"3\":{\"matCategory\":\"지붕재\",\"matName\":\"구리 시트\",\"matKg\":\"45\"},\"4\":{\"matCategory\":\"지붕재\",\"matName\":\"벽돌 지붕 타일\",\"matKg\":\"18\"},\"5\":{\"matCategory\":\"지붕재\",\"matName\":\"지붕 펠트 v60\",\"matKg\":\"22\"},\"6\":{\"matCategory\":\"창호재\",\"matName\":\"삼중 유리창\",\"matKg\":\"37\"},\"7\":{\"matCategory\":\"창호재\",\"matName\":\"나무 프레임 창\",\"matKg\":\"71\"},\"8\":{\"matCategory\":\"창호재\",\"matName\":\"목재 알루미늄 프레임 창\",\"matKg\":\"26\"},\"9\":{\"matCategory\":\"주방\",\"matName\":\"세라믹 타일\",\"matKg\":\"111\"},\"10\":{\"matCategory\":\"욕실\",\"matName\":\"PE 필름 (증기 차단)\",\"matKg\":\"22\"},\"11\":{\"matCategory\":\"욕실\",\"matName\":\"섬유 시멘트 보드\",\"matKg\":\"12\"},\"12\":{\"matCategory\":\"거실\",\"matName\":\"(세공된)참나무밤나무\",\"matKg\":\"44\"},\"13\":{\"matCategory\":\"거실\",\"matName\":\"확장된 코르크\",\"matKg\":\"32\"},\"14\":{\"matCategory\":\"거실\",\"matName\":\"(마모된)참나무밤나무\",\"matKg\":\"65\"},\"15\":{\"matCategory\":\"방\",\"matName\":\"벽토\",\"matKg\":\"12\"},\"16\":{\"matCategory\":\"방\",\"matName\":\"석고 보드\",\"matKg\":\"45\"}}\r\n" + "";

		// Jackson : JSON 객체 사용 시 필요한 라이브러리
		ObjectMapper objectMapper = new ObjectMapper();
		
		// JSONString map으로 변환
		Map<String, Object> jsonMap = null;
		try {
			// JSON 문자열을 Java 객체 map으로 변환
			jsonMap = objectMapper.readValue(sendMaterials, Map.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/* 최적의 대체 자제 구하기 */
		List<EstimateDTO> subMaterList = new ArrayList<EstimateDTO>();
		
		for (Map.Entry<String, Object> entry : jsonMap.entrySet()) {
			// 카테고리, 자제명만 추가
			Map<String, String> materDict = (Map<String, String>) entry.getValue();
			
			EstimateDTO estimate = new EstimateDTO();
			estimate.setMaterCategory(materDict.get("matCategory"));
			estimate.setMaterName(materDict.get("matName"));
			
			// 해당 자제의 대체 자제 정보
			List<EstimateDTO> subMaterInfo = estimateService.getMaterToSub(estimate);

			Map<String, String> optimalMater = new HashMap<>();
			optimalMater.put("materCategory", "");
			optimalMater.put("materName", "");
			double optimalNormal = 999999999.0;
			for (EstimateDTO mater : subMaterInfo) {
				int matPrice = mater.getMaterPrice();
				double matCarbon = mater.getMaterGasKg();
				
				double normalize = Math.pow(matPrice / 1000 * Integer.parseInt(materDict.get("matKg")), 2)
						+ Math.pow((matCarbon + 10.0) * Integer.parseInt(materDict.get("matKg")), 2);

				System.out.println(mater.getMaterName());
				System.out.println(normalize);
				System.out.println(matPrice);
				System.out.println(matCarbon);
				
				if (normalize < optimalNormal) {
					System.out.println(normalize);
					System.out.println("------------");
					optimalMater.put("materCategory", mater.getMaterCategory());
					optimalMater.put("materName", mater.getMaterName());
					optimalNormal = normalize;
				}
			}
			
			EstimateDTO addEstimate = new EstimateDTO();
			addEstimate.setMaterCategory(optimalMater.get("materCategory"));
			addEstimate.setMaterName(optimalMater.get("materName"));
			
			System.out.println(addEstimate);
			
			subMaterList.add(estimateService.getSubMaterInfo(addEstimate));
			
		}
		
		System.out.println(subMaterList);
		
		return subMaterList;
	}
}
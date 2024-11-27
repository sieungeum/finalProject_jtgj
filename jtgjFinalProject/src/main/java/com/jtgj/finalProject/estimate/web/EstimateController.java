package com.jtgj.finalProject.estimate.web;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
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

	// 처음 들어올 때 기본자제들 정보 model로 가져오기
	@RequestMapping("/estimateHome")
	public String estimateHome(Model model) {
		System.out.println(" - estimateHome - ");

		List<EstimateDTO> basicMatter = estimateService.basic_mater();
		model.addAttribute("basicMatter", basicMatter);

		return "estimate/estimateHome";
	}

	// "자제 추가하기" 버튼 클릭 시
	@ResponseBody
	@PostMapping("/getMaterials")
	public List<EstimateDTO> getMaterials(String materCategory) {
		System.out.println(" - getMaterials - ");

		// ajax 통신으로 현재 누른 카테고리에 맞는 데이터 보내기
		List<EstimateDTO> categoryMater = estimateService.categoryMater(materCategory);
		System.out.println(categoryMater);

		return categoryMater;
	}

	// 최종적으로 계산 반환
	@ResponseBody
	@PostMapping("/calMaterial")
	public List<EstimateDTO> calMaterial(String sendMaterials, int calRange) {
		System.out.println(" - calMaterial - ");
		
		System.out.println(sendMaterials);
		System.out.println(calRange);
		
		// 테스트 데이터, 사용 안할 때 주석처리
		// String sendMaterials = "{\"0\":{\"matCategory\":\"외장재\",\"matName\":\"가문비 나무 소나무 (클래딩)\",\"matKg\":\"12\"},\"1\":{\"matCategory\":\"외장재\",\"matName\":\"변형 목재(가열)\",\"matKg\":\"42\"},\"2\":{\"matCategory\":\"외장재\",\"matName\":\"개량된 목재(수분)\",\"matKg\":\"11\"},\"3\":{\"matCategory\":\"지붕재\",\"matName\":\"구리 시트\",\"matKg\":\"45\"},\"4\":{\"matCategory\":\"지붕재\",\"matName\":\"벽돌 지붕 타일\",\"matKg\":\"18\"},\"5\":{\"matCategory\":\"지붕재\",\"matName\":\"지붕 펠트 v60\",\"matKg\":\"22\"},\"6\":{\"matCategory\":\"창호재\",\"matName\":\"삼중 유리창\",\"matKg\":\"37\"},\"7\":{\"matCategory\":\"창호재\",\"matName\":\"나무 프레임 창\",\"matKg\":\"71\"},\"8\":{\"matCategory\":\"창호재\",\"matName\":\"목재 알루미늄 프레임 창\",\"matKg\":\"26\"},\"9\":{\"matCategory\":\"주방\",\"matName\":\"세라믹 타일\",\"matKg\":\"111\"},\"10\":{\"matCategory\":\"욕실\",\"matName\":\"PE 필름 (증기 차단)\",\"matKg\":\"22\"},\"11\":{\"matCategory\":\"욕실\",\"matName\":\"섬유 시멘트 보드\",\"matKg\":\"12\"},\"12\":{\"matCategory\":\"거실\",\"matName\":\"(세공된)참나무밤나무\",\"matKg\":\"44\"},\"13\":{\"matCategory\":\"거실\",\"matName\":\"확장된 코르크\",\"matKg\":\"32\"},\"14\":{\"matCategory\":\"거실\",\"matName\":\"(마모된)참나무밤나무\",\"matKg\":\"65\"},\"15\":{\"matCategory\":\"방\",\"matName\":\"벽토\",\"matKg\":\"12\"},\"16\":{\"matCategory\":\"방\",\"matName\":\"석고 보드\",\"matKg\":\"45\"}}\r\n" + "";

		// Jackson : JSON 객체 사용 시 필요한 라이브러리
		ObjectMapper objectMapper = new ObjectMapper();
		
		// JSONString map으로 변환
		Map<String, Object> jsonMap = new LinkedHashMap<>();
		try {
			// JSON 문자열을 Java 객체 map으로 변환
			jsonMap = objectMapper.readValue(sendMaterials, Map.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/* 최적의 대체 자제 구하기 */
		List<EstimateDTO> subMaterList = new ArrayList<EstimateDTO>(); // 최종적으로 보낼 List
		for (Map.Entry<String, Object> entry : jsonMap.entrySet()) {
			// 카테고리, 자제명만 추가
			Map<String, String> materDict = (LinkedHashMap<String, String>) entry.getValue();
			
			// MyBatis에서 사용할 EstimateDTO 객체
			EstimateDTO estimate = new EstimateDTO();
			estimate.setMaterCategory(materDict.get("matCategory")); // 카테고리
			estimate.setMaterName(materDict.get("matName")); // 자제명
			
			// 해당 자제의 대체 자제 정보
			List<EstimateDTO> subMaterInfo = estimateService.getMaterToSub(estimate);

			/* 최적의 대체 자제가 저장될 map 객체 */
			Map<String, String> optimalMater = new HashMap<>();
			optimalMater.put("materCategory", "");
			optimalMater.put("materName", "");
			double optimalNormal = 99999999999999999999999.0; // min 수치(작을수록 최적의 수치임)
			
			/* 최적 대체 자제 알고리즘 */
			for (EstimateDTO mater : subMaterInfo) {
				int matPrice = mater.getMaterPrice(); // 자제 가격
				double matCarbon = mater.getMaterGasKg(); // 자제 탄소배출량
				
				// 가격, 탄소배출량 수치로 정규화? 이걸 정규화라 하는게 맞나? 흠냐륑
				double normalize = Math.pow(matPrice / (1 * calRange) * Integer.parseInt(materDict.get("matKg")), 2)
						+ Math.pow((matCarbon + 3.0) * Integer.parseInt(materDict.get("matKg")), 2);
				
				normalize = Math.round(normalize * 100.0) / 100.0; // 가끔 수치가 크면 double을 넘어서 소수점 둘째짜리까지 표기

				// 그냥 눈으로 보려고 만듬
				System.out.println("자제명 : " + materDict.get("matName"));
				System.out.println("대체 자제명 : " + mater.getMaterName());
				System.out.println("정규화 수치 : " + normalize);
				System.out.println("가격" + matPrice);
				System.out.println("탄소배출량" + matCarbon);
				
				// 정규화 수치가 기존보다 작을 경우(최적)
				if (normalize < optimalNormal) {
					System.out.println("------ 0 ------");
					System.out.println("수치 : " + normalize);
					optimalMater.put("materCategory", mater.getMaterCategory());
					optimalMater.put("materName", mater.getMaterName());
					System.out.println("------ 0 ------");
					
					optimalNormal = normalize; // 최적 정규화 수치 정상화
				}
			}
			
			EstimateDTO addEstimate = new EstimateDTO();
			addEstimate.setMaterCategory(optimalMater.get("materCategory"));
			addEstimate.setMaterName(optimalMater.get("materName"));
			
			// 최적의 대체 자제
			System.out.println("최종 당선");
			System.out.println(addEstimate);
			System.out.println("");
			System.out.println("");
			
			// 최종 return List에 저장
			subMaterList.add(estimateService.getSubMaterInfo(addEstimate));
		}
		
		System.out.println(subMaterList.size());
		
		return subMaterList;
	}
}
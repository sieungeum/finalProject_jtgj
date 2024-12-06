package com.jtgj.finalProject.userEstimate.web;

import java.io.ByteArrayOutputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jtgj.finalProject.estimate.dto.EstimateDTO;
import com.jtgj.finalProject.estimate.service.EstimateService;
import com.jtgj.finalProject.user.dto.UserDTO;
import com.jtgj.finalProject.userEstimate.dto.UserEstimateDTO;
import com.jtgj.finalProject.userEstimate.service.UserEstimateService;

@Controller
public class UserEstimateController {

	@Autowired
	UserEstimateService userEstimateService;

	@Autowired
	EstimateService estimateService;

	// 유저 견적 마이페이지에 보이게 하는거
	@ResponseBody
	@PostMapping("/userEstimate")
	public List<UserEstimateDTO> userEstimate(HttpSession session) {
		System.out.println(" - userEstimate - ");
		
		UserDTO user = (UserDTO) session.getAttribute("login"); 
		String userId = user.getUserId();
		
		System.out.println(userId);

		List<UserEstimateDTO> userEstimate = userEstimateService.getUserEstimate(userId);

		System.out.println(userEstimate);

		return userEstimate;
	}

	// 유저 견적 마이페이지에서 삭제 시키기
	@ResponseBody
	@PostMapping("/estimateDelete")
	public List<UserEstimateDTO> estimateDelete(String deleteNo, HttpSession session) {
		System.out.println(" - estimateDelete - ");
		
		UserDTO user = (UserDTO) session.getAttribute("login");
		String userId = user.getUserId();
		
		System.out.println(userId);
		
		// 선택 견적 삭제
		System.out.println(deleteNo);
		UserEstimateDTO delEsti = new UserEstimateDTO();
		
		delEsti.setEstiNo(Integer.parseInt(deleteNo));
		delEsti.setUserId(userId);
		userEstimateService.delUserEstimate(delEsti);

		// 데이터 보내기
		List<UserEstimateDTO> userEstimate = userEstimateService.getUserEstimate(userId);

		System.out.println(userEstimate);

		return userEstimate;
	}

	@RequestMapping("/testUserEstimateView")
	public String testUserEstimateView() {
		System.out.println(" - testUserEstimateView - ");

		return "estimate/testUserEstimate";
	}

	@ResponseBody
	@PostMapping("/saveMaterials")
	public String saveMaterials(String basicMater, String subMatInfo, String estiTitle, String userId, String estiPyeong) {
		System.out.println(" - saveMaterials - ");

		// 테스트 시 사용 (실전에서 주석처리)
		// basicMater =
		// "{\"0\":{\"materNo\":\"41\",\"materCategory\":\"외장재\",\"materName\":\"구리
		// 시트\",\"materGasKg\":\"1.52\",\"materPrice\":\"8000\",\"materKg\":\"144\"},\"1\":{\"materNo\":\"42\",\"materCategory\":\"지붕재\",\"materName\":\"클링커
		// -
		// 석기\",\"materGasKg\":\"0.3\",\"materPrice\":\"4250\",\"materKg\":\"96\"},\"2\":{\"materNo\":\"45\",\"materCategory\":\"욕실1\",\"materName\":\"세라믹
		// 타일\",\"materGasKg\":\"0.52\",\"materPrice\":\"6500\",\"materKg\":\"96\"},\"3\":{\"materNo\":\"47\",\"materCategory\":\"거실\",\"materName\":\"석고
		// 섬유 보드
		// (종이)\",\"materGasKg\":\"-0.03\",\"materPrice\":\"2500\",\"materKg\":\"120\"},\"4\":{\"materNo\":\"47\",\"materCategory\":\"방1\",\"materName\":\"석고
		// 섬유 보드
		// (종이)\",\"materGasKg\":\"-0.03\",\"materPrice\":\"2500\",\"materKg\":\"180\"},\"5\":{\"materNo\":\"61\",\"materCategory\":\"창호재\",\"materName\":\"이중
		// 유리창\",\"materGasKg\":\"1.79\",\"materPrice\":\"7000\",\"materKg\":\"96\"},\"6\":{\"materNo\":\"76\",\"materCategory\":\"주방1\",\"materName\":\"천연
		// 대리석\",\"materGasKg\":\"1.0\",\"materPrice\":\"10000\",\"materKg\":\"240\"}}\r\n";
		// subMatInfo =
		// "{\"0\":{\"materNo\":80,\"materCategory\":\"외장재\",\"materName\":\"경량
		// 구리\",\"materGasKg\":1.1,\"materPrice\":8000,\"materKg\":\"144\"},\"1\":{\"materNo\":31,\"materCategory\":\"지붕재\",\"materName\":\"재활용
		// 석기\",\"materGasKg\":0.2,\"materPrice\":4000,\"materKg\":\"96\"},\"2\":{\"materNo\":97,\"materCategory\":\"창호재\",\"materName\":\"재활용
		// 유리창\",\"materGasKg\":1.2,\"materPrice\":6000,\"materKg\":\"96\"},\"3\":{\"materNo\":36,\"materCategory\":\"거실\",\"materName\":\"재활용
		// 석고
		// 보드\",\"materGasKg\":-0.05,\"materPrice\":2500,\"materKg\":\"120\"},\"4\":{\"materNo\":84,\"materCategory\":\"욕실\",\"materName\":\"경량
		// 세라믹\",\"materGasKg\":0.25,\"materPrice\":5000,\"materKg\":\"180\"},\"5\":{\"materNo\":34,\"materCategory\":\"주방\",\"materName\":\"재활용
		// 세라믹\",\"materGasKg\":0.3,\"materPrice\":5500,\"materKg\":\"96\"},\"6\":{\"materNo\":36,\"materCategory\":\"방\",\"materName\":\"재활용
		// 석고 보드\",\"materGasKg\":-0.05,\"materPrice\":2500,\"materKg\":\"240\"}}\r\n";

		System.out.println(basicMater);
		System.out.println(subMatInfo);
		System.out.println(estiTitle);
		System.out.println(userId);
		System.out.println(estiPyeong);

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
			userEsti.setEstiTitle(estiTitle);
			userEsti.setEstiPyeong(Integer.parseInt(estiPyeong));

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
			userEsti.setEstiTitle(estiTitle);
			userEsti.setEstiPyeong(Integer.parseInt(estiPyeong));

			userEstimateService.setUserEstimate(userEsti);
		}

		return "good";
	}

	
	
	@ResponseBody
	@PostMapping("/download/excel")
	public ResponseEntity<byte[]> downloadExcel(String basicMater, String subMatInfo, String estiTitle, String estiPyeong) {

		System.out.println(" - download - ");

		// 테스트 시 사용 (실전에서 주석처리)
		// basicMater = "{\"0\":{\"materNo\":\"41\",\"materCategory\":\"외장재\",\"materName\":\"구리 시트\",\"materGasKg\":\"1.52\",\"materPrice\":\"8000\",\"materKg\":\"144\"},\"1\":{\"materNo\":\"42\",\"materCategory\":\"지붕재\",\"materName\":\"클링커 - 석기\",\"materGasKg\":\"0.3\",\"materPrice\":\"4250\",\"materKg\":\"96\"},\"2\":{\"materNo\":\"45\",\"materCategory\":\"욕실1\",\"materName\":\"세라믹 타일\",\"materGasKg\":\"0.52\",\"materPrice\":\"6500\",\"materKg\":\"96\"},\"3\":{\"materNo\":\"47\",\"materCategory\":\"거실\",\"materName\":\"석고 섬유 보드 (종이)\",\"materGasKg\":\"-0.03\",\"materPrice\":\"2500\",\"materKg\":\"120\"},\"4\":{\"materNo\":\"47\",\"materCategory\":\"방1\",\"materName\":\"석고 섬유 보드 (종이)\",\"materGasKg\":\"-0.03\",\"materPrice\":\"2500\",\"materKg\":\"180\"},\"5\":{\"materNo\":\"61\",\"materCategory\":\"창호재\",\"materName\":\"이중 유리창\",\"materGasKg\":\"1.79\",\"materPrice\":\"7000\",\"materKg\":\"96\"},\"6\":{\"materNo\":\"76\",\"materCategory\":\"주방1\",\"materName\":\"천연 대리석\",\"materGasKg\":\"1.0\",\"materPrice\":\"10000\",\"materKg\":\"240\"}}\r\n";
		// subMatInfo = "{\"0\":{\"materNo\":80,\"materCategory\":\"외장재\",\"materName\":\"경량 구리\",\"materGasKg\":1.1,\"materPrice\":8000,\"materKg\":\"144\"},\"1\":{\"materNo\":31,\"materCategory\":\"지붕재\",\"materName\":\"재활용 석기\",\"materGasKg\":0.2,\"materPrice\":4000,\"materKg\":\"96\"},\"2\":{\"materNo\":97,\"materCategory\":\"창호재\",\"materName\":\"재활용 유리창\",\"materGasKg\":1.2,\"materPrice\":6000,\"materKg\":\"96\"},\"3\":{\"materNo\":36,\"materCategory\":\"거실\",\"materName\":\"재활용 석고 보드\",\"materGasKg\":-0.05,\"materPrice\":2500,\"materKg\":\"120\"},\"4\":{\"materNo\":84,\"materCategory\":\"욕실\",\"materName\":\"경량 세라믹\",\"materGasKg\":0.25,\"materPrice\":5000,\"materKg\":\"180\"},\"5\":{\"materNo\":34,\"materCategory\":\"주방\",\"materName\":\"재활용 세라믹\",\"materGasKg\":0.3,\"materPrice\":5500,\"materKg\":\"96\"},\"6\":{\"materNo\":36,\"materCategory\":\"방\",\"materName\":\"재활용 석고 보드\",\"materGasKg\":-0.05,\"materPrice\":2500,\"materKg\":\"240\"}}\r\n";
		
		System.out.println(basicMater);
		System.out.println(subMatInfo);
		System.out.println(estiTitle);
		System.out.println(estiPyeong);

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
		
		try (Workbook workbook = new XSSFWorkbook()) {
			// 데이터 생성
			List<List<String>> sheet1Data = new ArrayList<>();
			sheet1Data.add(new ArrayList<>(Arrays.asList("mater_category", "mater_name", "mater_gas_kg"
					, "mater_img", "mater_price", "mater_durability", "mater_info", "kg_per_pyeong", "esti_pyeong")));
			
			for (Map.Entry<String, Object> entry : jsonMap.entrySet()) {
				Map<String, String> materDict = (Map<String, String>) entry.getValue();
				
				EstimateDTO mater = new EstimateDTO();

				mater.setMaterName(materDict.get("materName"));
				mater.setMaterCategory(materDict.get("materCategory").replaceAll("\\d+", ""));
				
				mater = estimateService.getSubMaterInfo(mater);

				System.out.println(materDict);
				System.out.println(mater);
				
				sheet1Data.add(new ArrayList<>(Arrays.asList(materDict.get("materCategory"), mater.getMaterName(), mater.getMaterGasKg() + ""
						, mater.getMaterImg(), mater.getMaterPrice() + "", mater.getMaterDurability(), mater.getMaterInfo(), Integer.parseInt(materDict.get("materKg")) + ""
						, estiPyeong)));
			}
			
			// 첫 번째 시트 생성 및 데이터 추가
            Sheet sheet1 = workbook.createSheet("basic_materials");
            populateSheet(sheet1, sheet1Data);
            

			List<List<String>> sheet2Data = new ArrayList<>();
			sheet2Data.add(new ArrayList<>(Arrays.asList("mater_category", "mater_name", "mater_gas_kg"
					, "mater_img", "mater_price", "mater_durability", "mater_info", "kg_per_pyeong", "esti_pyeong")));
			
			for (Map.Entry<String, Object> entry : jsonMapSub.entrySet()) {
				Map<String, String> materDict = (Map<String, String>) entry.getValue();
				
				EstimateDTO mater = new EstimateDTO();

				mater.setMaterName(materDict.get("materName"));
				mater.setMaterCategory(materDict.get("materCategory").replaceAll("\\d+", ""));
				
				mater = estimateService.getSubMaterInfo(mater);

				System.out.println(materDict);
				System.out.println(mater);
				
				sheet2Data.add(new ArrayList<>(Arrays.asList(materDict.get("materCategory"), mater.getMaterName(), mater.getMaterGasKg() + ""
						, mater.getMaterImg(), mater.getMaterPrice() + "", mater.getMaterDurability(), mater.getMaterInfo(), Integer.parseInt(materDict.get("materKg")) + ""
						, estiPyeong)));
			}
			
			// 두 번째 시트 생성 및 데이터 추가
            Sheet sheet2 = workbook.createSheet("sub_materials");
            populateSheet(sheet2, sheet2Data);

			// 엑셀 데이터를 바이트 배열로 변환
			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			workbook.write(outputStream);

			// HTTP 응답 설정
			System.out.println(estiTitle.replace("\"", ""));
            // 파일명 설정 (한글 파일명)
            String fileName = estiTitle.replace("\"", "") + ".xlsx";
            String encodedFileName = URLEncoder.encode(fileName, StandardCharsets.UTF_8.toString()).replace("+", "%20");
            
            
			HttpHeaders headers = new HttpHeaders();
			headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + encodedFileName);
			headers.add(HttpHeaders.CONTENT_TYPE, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

			return ResponseEntity.ok().headers(headers).body(outputStream.toByteArray());

		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}

	// 시트에 데이터를 채우는 유틸리티 메서드
	private void populateSheet(Sheet sheet, List<List<String>> data) {
		for (int i = 0; i < data.size(); i++) {
			Row row = sheet.createRow(i);
			List<String> rowData = data.get(i);
			for (int j = 0; j < rowData.size(); j++) {
				Cell cell = row.createCell(j);
				cell.setCellValue(rowData.get(j));
			}
		}
	}
	
	// 견적 불러오기
	@RequestMapping("/estiLoadDo")
	public String estiLoadDo(Model model, int estiNo) {
		System.out.println(" - estiLoadDo - ");
		
		System.out.println(estiNo);
		
		List<UserEstimateDTO> estiList = userEstimateService.estiNoToUserEstimate(estiNo);
		
		System.out.println(estiList);    
		
		// ObjectMapper로 Java 리스트를 JSON 문자열로 변환
	    ObjectMapper mapper = new ObjectMapper();
	    String jsonList;
		try {
			jsonList = mapper.writeValueAsString(estiList);
			model.addAttribute("jsonList", jsonList);
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		List<EstimateDTO> basicMatter = estimateService.basic_mater();
		model.addAttribute("basicMatter", basicMatter);
		
		return "estimate/estimateHome";
	}

}

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

		// �׽�Ʈ �� ��� (�������� �ּ�ó��)
		// basicMater = "{\"0\":{\"materNo\":\"41\",\"materCategory\":\"������\",\"materName\":\"���� ��Ʈ\",\"materGasKg\":\"1.52\",\"materPrice\":\"8000\",\"materKg\":\"144\"},\"1\":{\"materNo\":\"42\",\"materCategory\":\"������\",\"materName\":\"Ŭ��Ŀ - ����\",\"materGasKg\":\"0.3\",\"materPrice\":\"4250\",\"materKg\":\"96\"},\"2\":{\"materNo\":\"45\",\"materCategory\":\"���1\",\"materName\":\"����� Ÿ��\",\"materGasKg\":\"0.52\",\"materPrice\":\"6500\",\"materKg\":\"96\"},\"3\":{\"materNo\":\"47\",\"materCategory\":\"�Ž�\",\"materName\":\"���� ���� ���� (����)\",\"materGasKg\":\"-0.03\",\"materPrice\":\"2500\",\"materKg\":\"120\"},\"4\":{\"materNo\":\"47\",\"materCategory\":\"��1\",\"materName\":\"���� ���� ���� (����)\",\"materGasKg\":\"-0.03\",\"materPrice\":\"2500\",\"materKg\":\"180\"},\"5\":{\"materNo\":\"61\",\"materCategory\":\"âȣ��\",\"materName\":\"���� ����â\",\"materGasKg\":\"1.79\",\"materPrice\":\"7000\",\"materKg\":\"96\"},\"6\":{\"materNo\":\"76\",\"materCategory\":\"�ֹ�1\",\"materName\":\"õ�� �븮��\",\"materGasKg\":\"1.0\",\"materPrice\":\"10000\",\"materKg\":\"240\"}}\r\n";
		// subMatInfo = "{\"0\":{\"materNo\":80,\"materCategory\":\"������\",\"materName\":\"�淮 ����\",\"materGasKg\":1.1,\"materPrice\":8000,\"materKg\":\"144\"},\"1\":{\"materNo\":31,\"materCategory\":\"������\",\"materName\":\"��Ȱ�� ����\",\"materGasKg\":0.2,\"materPrice\":4000,\"materKg\":\"96\"},\"2\":{\"materNo\":97,\"materCategory\":\"âȣ��\",\"materName\":\"��Ȱ�� ����â\",\"materGasKg\":1.2,\"materPrice\":6000,\"materKg\":\"96\"},\"3\":{\"materNo\":36,\"materCategory\":\"�Ž�\",\"materName\":\"��Ȱ�� ���� ����\",\"materGasKg\":-0.05,\"materPrice\":2500,\"materKg\":\"120\"},\"4\":{\"materNo\":84,\"materCategory\":\"���\",\"materName\":\"�淮 �����\",\"materGasKg\":0.25,\"materPrice\":5000,\"materKg\":\"180\"},\"5\":{\"materNo\":34,\"materCategory\":\"�ֹ�\",\"materName\":\"��Ȱ�� �����\",\"materGasKg\":0.3,\"materPrice\":5500,\"materKg\":\"96\"},\"6\":{\"materNo\":36,\"materCategory\":\"��\",\"materName\":\"��Ȱ�� ���� ����\",\"materGasKg\":-0.05,\"materPrice\":2500,\"materKg\":\"240\"}}\r\n";
		
		System.out.println(basicMater);
		System.out.println(subMatInfo);
		System.out.println(userId);

		// Jackson : JSON ��ü ��� �� �ʿ��� ���̺귯��
		ObjectMapper objectMapper = new ObjectMapper();

		// JSONString map���� ��ȯ(�⺻ ����)
		Map<String, Object> jsonMap = null;
		try {
			// JSON ���ڿ��� Java ��ü map���� ��ȯ
			jsonMap = objectMapper.readValue(basicMater, Map.class);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// Jackson : JSON ��ü ��� �� �ʿ��� ���̺귯��
		objectMapper = new ObjectMapper();

		// JSONString map���� ��ȯ(��ü ����)
		Map<String, Object> jsonMapSub = null;
		try {
			// JSON ���ڿ��� Java ��ü map���� ��ȯ
			jsonMapSub = objectMapper.readValue(subMatInfo, Map.class);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String[] matCateArr = { "������", "������", "âȣ��", "�Ž�", "���", "�ֹ�", "��" };
		int estiNo = userEstimateService.getEstiNo() + 1; // estiNo ���ϱ�
		
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

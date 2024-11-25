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

		// �׽�Ʈ �� ��� (�������� �ּ�ó��)
		basicMater = "{\"0\":{\"materNo\":\"37\",\"materCategory\":\"�Ž�\",\"materName\":\"���� ����\",\"materGasKg\":\"0.12\",\"materPrice\":\"2000\",\"materKg\":\"13\"},\"1\":{\"materNo\":\"39\",\"materCategory\":\"��\",\"materName\":\"���� ����\",\"materGasKg\":\"0.11\",\"materPrice\":\"2500\",\"materKg\":\"12\"},\"2\":{\"materNo\":\"41\",\"materCategory\":\"������\",\"materName\":\"���� ��Ʈ\",\"materGasKg\":\"1.52\",\"materPrice\":\"8000\",\"materKg\":\"23\"},\"3\":{\"materNo\":\"41\",\"materCategory\":\"������\",\"materName\":\"���� ��Ʈ\",\"materGasKg\":\"1.52\",\"materPrice\":\"8000\",\"materKg\":\"13\"},\"4\":{\"materNo\":\"42\",\"materCategory\":\"������\",\"materName\":\"Ŭ��Ŀ - ����\",\"materGasKg\":\"0.3\",\"materPrice\":\"4250\",\"materKg\":\"44\"},\"5\":{\"materNo\":\"42\",\"materCategory\":\"������\",\"materName\":\"Ŭ��Ŀ - ����\",\"materGasKg\":\"0.3\",\"materPrice\":\"4250\",\"materKg\":\"1\"},\"6\":{\"materNo\":\"43\",\"materCategory\":\"���\",\"materName\":\"PE �ʸ� (���� ����)\",\"materGasKg\":\"1.98\",\"materPrice\":\"3500\",\"materKg\":\"123\"},\"7\":{\"materNo\":\"45\",\"materCategory\":\"�ֹ�\",\"materName\":\"����� Ÿ��\",\"materGasKg\":\"0.52\",\"materPrice\":\"6500\",\"materKg\":\"412\"},\"8\":{\"materNo\":\"60\",\"materCategory\":\"âȣ��\",\"materName\":\"���� ����â\",\"materGasKg\":\"1.9\",\"materPrice\":\"7500\",\"materKg\":\"12\"},\"9\":{\"materNo\":\"61\",\"materCategory\":\"âȣ��\",\"materName\":\"���� ����â\",\"materGasKg\":\"1.79\",\"materPrice\":\"7000\",\"materKg\":\"42\"}}";
		System.out.println(basicMater);
		System.out.println(userId);

		// Jackson : JSON ��ü ��� �� �ʿ��� ���̺귯��
		ObjectMapper objectMapper = new ObjectMapper();

		// JSONString map���� ��ȯ
		Map<String, Object> jsonMap = null;
		try {
			// JSON ���ڿ��� Java ��ü map���� ��ȯ
			jsonMap = objectMapper.readValue(basicMater, Map.class);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String[] matCateArr = { "������", "������", "âȣ��", "�Ž�", "���", "�ֹ�", "��" };
		int estiNo = userEstimateService.getEstiNo() + 1; // estiNo ���ϱ�
		
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

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

	// ó�� ���� �� �⺻������ ���� model�� ��������
	@RequestMapping("/estimateHome")
	public String estimateHome(Model model) {
		System.out.println(" - estimateHome - ");

		List<EstimateDTO> basicMatter = estimateService.basic_mater();
		model.addAttribute("basicMatter", basicMatter);

		return "estimate/estimateHome";
	}

	// "���� �߰��ϱ�" ��ư Ŭ�� ��
	@ResponseBody
	@PostMapping("/getMaterials")
	public List<EstimateDTO> getMaterials(String materCategory) {
		System.out.println(" - getMaterials - ");

		// ajax ������� ���� ���� ī�װ��� �´� ������ ������
		List<EstimateDTO> categoryMater = estimateService.categoryMater(materCategory);
		System.out.println(categoryMater);

		return categoryMater;
	}

	// ���������� ��� ��ȯ
	@ResponseBody
	@PostMapping("/calMaterial")
	public List<EstimateDTO> calMaterial(String sendMaterials, int calRange) {
		System.out.println(" - calMaterial - ");
		
		System.out.println(sendMaterials);
		System.out.println(calRange);
		
		// �׽�Ʈ ������, ��� ���� �� �ּ�ó��
		// String sendMaterials = "{\"0\":{\"matCategory\":\"������\",\"matName\":\"������ ���� �ҳ��� (Ŭ����)\",\"matKg\":\"12\"},\"1\":{\"matCategory\":\"������\",\"matName\":\"���� ����(����)\",\"matKg\":\"42\"},\"2\":{\"matCategory\":\"������\",\"matName\":\"������ ����(����)\",\"matKg\":\"11\"},\"3\":{\"matCategory\":\"������\",\"matName\":\"���� ��Ʈ\",\"matKg\":\"45\"},\"4\":{\"matCategory\":\"������\",\"matName\":\"���� ���� Ÿ��\",\"matKg\":\"18\"},\"5\":{\"matCategory\":\"������\",\"matName\":\"���� ��Ʈ v60\",\"matKg\":\"22\"},\"6\":{\"matCategory\":\"âȣ��\",\"matName\":\"���� ����â\",\"matKg\":\"37\"},\"7\":{\"matCategory\":\"âȣ��\",\"matName\":\"���� ������ â\",\"matKg\":\"71\"},\"8\":{\"matCategory\":\"âȣ��\",\"matName\":\"���� �˷�̴� ������ â\",\"matKg\":\"26\"},\"9\":{\"matCategory\":\"�ֹ�\",\"matName\":\"����� Ÿ��\",\"matKg\":\"111\"},\"10\":{\"matCategory\":\"���\",\"matName\":\"PE �ʸ� (���� ����)\",\"matKg\":\"22\"},\"11\":{\"matCategory\":\"���\",\"matName\":\"���� �ø�Ʈ ����\",\"matKg\":\"12\"},\"12\":{\"matCategory\":\"�Ž�\",\"matName\":\"(������)�������㳪��\",\"matKg\":\"44\"},\"13\":{\"matCategory\":\"�Ž�\",\"matName\":\"Ȯ��� �ڸ�ũ\",\"matKg\":\"32\"},\"14\":{\"matCategory\":\"�Ž�\",\"matName\":\"(�����)�������㳪��\",\"matKg\":\"65\"},\"15\":{\"matCategory\":\"��\",\"matName\":\"����\",\"matKg\":\"12\"},\"16\":{\"matCategory\":\"��\",\"matName\":\"���� ����\",\"matKg\":\"45\"}}\r\n" + "";

		// Jackson : JSON ��ü ��� �� �ʿ��� ���̺귯��
		ObjectMapper objectMapper = new ObjectMapper();
		
		// JSONString map���� ��ȯ
		Map<String, Object> jsonMap = new LinkedHashMap<>();
		try {
			// JSON ���ڿ��� Java ��ü map���� ��ȯ
			jsonMap = objectMapper.readValue(sendMaterials, Map.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/* ������ ��ü ���� ���ϱ� */
		List<EstimateDTO> subMaterList = new ArrayList<EstimateDTO>(); // ���������� ���� List
		for (Map.Entry<String, Object> entry : jsonMap.entrySet()) {
			// ī�װ�, ������ �߰�
			Map<String, String> materDict = (LinkedHashMap<String, String>) entry.getValue();
			
			// MyBatis���� ����� EstimateDTO ��ü
			EstimateDTO estimate = new EstimateDTO();
			estimate.setMaterCategory(materDict.get("matCategory")); // ī�װ�
			estimate.setMaterName(materDict.get("matName")); // ������
			
			// �ش� ������ ��ü ���� ����
			List<EstimateDTO> subMaterInfo = estimateService.getMaterToSub(estimate);

			/* ������ ��ü ������ ����� map ��ü */
			Map<String, String> optimalMater = new HashMap<>();
			optimalMater.put("materCategory", "");
			optimalMater.put("materName", "");
			double optimalNormal = 99999999999999999999999.0; // min ��ġ(�������� ������ ��ġ��)
			
			/* ���� ��ü ���� �˰��� */
			for (EstimateDTO mater : subMaterInfo) {
				int matPrice = mater.getMaterPrice(); // ���� ����
				double matCarbon = mater.getMaterGasKg(); // ���� ź�ҹ��ⷮ
				
				// ����, ź�ҹ��ⷮ ��ġ�� ����ȭ? �̰� ����ȭ�� �ϴ°� �³�? ��ķ�
				double normalize = Math.pow(matPrice / (1 * calRange) * Integer.parseInt(materDict.get("matKg")), 2)
						+ Math.pow((matCarbon + 3.0) * Integer.parseInt(materDict.get("matKg")), 2);
				
				normalize = Math.round(normalize * 100.0) / 100.0; // ���� ��ġ�� ũ�� double�� �Ѿ �Ҽ��� ��°¥������ ǥ��

				// �׳� ������ ������ ����
				System.out.println("������ : " + materDict.get("matName"));
				System.out.println("��ü ������ : " + mater.getMaterName());
				System.out.println("����ȭ ��ġ : " + normalize);
				System.out.println("����" + matPrice);
				System.out.println("ź�ҹ��ⷮ" + matCarbon);
				
				// ����ȭ ��ġ�� �������� ���� ���(����)
				if (normalize < optimalNormal) {
					System.out.println("------ 0 ------");
					System.out.println("��ġ : " + normalize);
					optimalMater.put("materCategory", mater.getMaterCategory());
					optimalMater.put("materName", mater.getMaterName());
					System.out.println("------ 0 ------");
					
					optimalNormal = normalize; // ���� ����ȭ ��ġ ����ȭ
				}
			}
			
			EstimateDTO addEstimate = new EstimateDTO();
			addEstimate.setMaterCategory(optimalMater.get("materCategory"));
			addEstimate.setMaterName(optimalMater.get("materName"));
			
			// ������ ��ü ����
			System.out.println("���� �缱");
			System.out.println(addEstimate);
			System.out.println("");
			System.out.println("");
			
			// ���� return List�� ����
			subMaterList.add(estimateService.getSubMaterInfo(addEstimate));
		}
		
		System.out.println(subMaterList.size());
		
		return subMaterList;
	}
}
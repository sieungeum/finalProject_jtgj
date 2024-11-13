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

		// ajax ������� ���� ���� ī�װ��� �´� ������ ������
		List<EstimateDTO> categoryMater = estimateService.categoryMater(materCategory);

		return categoryMater;
	}

	// ���������� ��� ��ȯ
	@ResponseBody
	@PostMapping("/calMaterial")
	public List<EstimateDTO> calMaterial(String sendMaterials) {
		System.out.println(" - calMaterial - ");
		
		System.out.println(sendMaterials);
		
		// �׽�Ʈ ������, ��� ���� �� �ּ�ó��
		// String sendMaterials = "{\"0\":{\"matCategory\":\"������\",\"matName\":\"������ ���� �ҳ��� (Ŭ����)\",\"matKg\":\"12\"},\"1\":{\"matCategory\":\"������\",\"matName\":\"���� ����(����)\",\"matKg\":\"42\"},\"2\":{\"matCategory\":\"������\",\"matName\":\"������ ����(����)\",\"matKg\":\"11\"},\"3\":{\"matCategory\":\"������\",\"matName\":\"���� ��Ʈ\",\"matKg\":\"45\"},\"4\":{\"matCategory\":\"������\",\"matName\":\"���� ���� Ÿ��\",\"matKg\":\"18\"},\"5\":{\"matCategory\":\"������\",\"matName\":\"���� ��Ʈ v60\",\"matKg\":\"22\"},\"6\":{\"matCategory\":\"âȣ��\",\"matName\":\"���� ����â\",\"matKg\":\"37\"},\"7\":{\"matCategory\":\"âȣ��\",\"matName\":\"���� ������ â\",\"matKg\":\"71\"},\"8\":{\"matCategory\":\"âȣ��\",\"matName\":\"���� �˷�̴� ������ â\",\"matKg\":\"26\"},\"9\":{\"matCategory\":\"�ֹ�\",\"matName\":\"����� Ÿ��\",\"matKg\":\"111\"},\"10\":{\"matCategory\":\"���\",\"matName\":\"PE �ʸ� (���� ����)\",\"matKg\":\"22\"},\"11\":{\"matCategory\":\"���\",\"matName\":\"���� �ø�Ʈ ����\",\"matKg\":\"12\"},\"12\":{\"matCategory\":\"�Ž�\",\"matName\":\"(������)�������㳪��\",\"matKg\":\"44\"},\"13\":{\"matCategory\":\"�Ž�\",\"matName\":\"Ȯ��� �ڸ�ũ\",\"matKg\":\"32\"},\"14\":{\"matCategory\":\"�Ž�\",\"matName\":\"(�����)�������㳪��\",\"matKg\":\"65\"},\"15\":{\"matCategory\":\"��\",\"matName\":\"����\",\"matKg\":\"12\"},\"16\":{\"matCategory\":\"��\",\"matName\":\"���� ����\",\"matKg\":\"45\"}}\r\n" + "";

		// Jackson : JSON ��ü ��� �� �ʿ��� ���̺귯��
		ObjectMapper objectMapper = new ObjectMapper();
		
		// JSONString map���� ��ȯ
		Map<String, Object> jsonMap = null;
		try {
			// JSON ���ڿ��� Java ��ü map���� ��ȯ
			jsonMap = objectMapper.readValue(sendMaterials, Map.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/* ������ ��ü ���� ���ϱ� */
		List<EstimateDTO> subMaterList = new ArrayList<EstimateDTO>();
		
		for (Map.Entry<String, Object> entry : jsonMap.entrySet()) {
			// ī�װ�, ������ �߰�
			Map<String, String> materDict = (Map<String, String>) entry.getValue();
			
			EstimateDTO estimate = new EstimateDTO();
			estimate.setMaterCategory(materDict.get("matCategory"));
			estimate.setMaterName(materDict.get("matName"));
			
			// �ش� ������ ��ü ���� ����
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
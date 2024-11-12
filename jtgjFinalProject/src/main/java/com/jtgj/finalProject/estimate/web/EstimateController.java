package com.jtgj.finalProject.estimate.web;

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

@Controller
public class EstimateController {

	@Autowired
	EstimateService estimateService;

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

		List<EstimateDTO> categoryMater = estimateService.categoryMater(materCategory);

		return categoryMater;
	}

	@ResponseBody
	@PostMapping("/calMaterial")
	public String calMaterial(String sendMaterials) {
		System.out.println(" - calMaterial - ");

		// System.out.println(sendMaterials); // ������
		String testData = "{\"0\":{\"matCategory\":\"������\",\"matName\":\"������ ���� �ҳ��� (Ŭ����)\",\"matKg\":\"12\"},\"1\":{\"matCategory\":\"������\",\"matName\":\"���� ����(����)\",\"matKg\":\"42\"},\"2\":{\"matCategory\":\"������\",\"matName\":\"������ ����(����)\",\"matKg\":\"11\"},\"3\":{\"matCategory\":\"������\",\"matName\":\"���� ��Ʈ\",\"matKg\":\"45\"},\"4\":{\"matCategory\":\"������\",\"matName\":\"���� ���� Ÿ��\",\"matKg\":\"18\"},\"5\":{\"matCategory\":\"������\",\"matName\":\"���� ��Ʈ v60\",\"matKg\":\"22\"},\"6\":{\"matCategory\":\"âȣ��\",\"matName\":\"���� ����â\",\"matKg\":\"37\"},\"7\":{\"matCategory\":\"âȣ��\",\"matName\":\"���� ������ â\",\"matKg\":\"71\"},\"8\":{\"matCategory\":\"âȣ��\",\"matName\":\"���� �˷�̴� ������ â\",\"matKg\":\"26\"},\"9\":{\"matCategory\":\"�ֹ�\",\"matName\":\"����� Ÿ��\",\"matKg\":\"111\"},\"10\":{\"matCategory\":\"���\",\"matName\":\"PE �ʸ� (���� ����)\",\"matKg\":\"22\"},\"11\":{\"matCategory\":\"���\",\"matName\":\"���� �ø�Ʈ ����\",\"matKg\":\"12\"},\"12\":{\"matCategory\":\"�Ž�\",\"matName\":\"(������)�������㳪��\",\"matKg\":\"44\"},\"13\":{\"matCategory\":\"�Ž�\",\"matName\":\"Ȯ��� �ڸ�ũ\",\"matKg\":\"32\"},\"14\":{\"matCategory\":\"�Ž�\",\"matName\":\"(�����)�������㳪��\",\"matKg\":\"65\"},\"15\":{\"matCategory\":\"��\",\"matName\":\"����\",\"matKg\":\"12\"},\"16\":{\"matCategory\":\"��\",\"matName\":\"���� ����\",\"matKg\":\"45\"}}\r\n"
				+ "";

		ObjectMapper objectMapper = new ObjectMapper();
		
		Map<String, Object> map = null;
		try {
			// JSON ���ڿ��� Java ��ü�� ��ȯ
			map = objectMapper.readValue(testData, Map.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(map.get("0"));
		
		return "good";

	}

}
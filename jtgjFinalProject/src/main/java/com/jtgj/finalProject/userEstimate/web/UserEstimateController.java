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
import com.jtgj.finalProject.userEstimate.dto.BathroomDTO;
import com.jtgj.finalProject.userEstimate.dto.ExteriorDTO;
import com.jtgj.finalProject.userEstimate.dto.KitchenDTO;
import com.jtgj.finalProject.userEstimate.dto.LivingDTO;
import com.jtgj.finalProject.userEstimate.dto.RoofingDTO;
import com.jtgj.finalProject.userEstimate.dto.RoomDTO;
import com.jtgj.finalProject.userEstimate.dto.WindowDTO;
import com.jtgj.finalProject.userEstimate.service.UserEstimateService;

@Controller
public class UserEstimateController {
	
	@Autowired
	UserEstimateService userEstimateService;

	@ResponseBody
	@PostMapping("/saveMaterials")
	public String saveMaterials(String basicMater, String userId) {
		System.out.println(" - saveMaterials - ");

		// �׽�Ʈ �� ��� (�������� �ּ�ó��)
		// basicMater = "{\"0\":{\"materNo\":\"37\",\"materCategory\":\"�Ž�\",\"materName\":\"���� ����\",\"materGasKg\":\"0.12\",\"materPrice\":\"2000\",\"materKg\":\"13\"},\"1\":{\"materNo\":\"39\",\"materCategory\":\"��\",\"materName\":\"���� ����\",\"materGasKg\":\"0.11\",\"materPrice\":\"2500\",\"materKg\":\"12\"},\"2\":{\"materNo\":\"41\",\"materCategory\":\"������\",\"materName\":\"���� ��Ʈ\",\"materGasKg\":\"1.52\",\"materPrice\":\"8000\",\"materKg\":\"23\"},\"3\":{\"materNo\":\"41\",\"materCategory\":\"������\",\"materName\":\"���� ��Ʈ\",\"materGasKg\":\"1.52\",\"materPrice\":\"8000\",\"materKg\":\"13\"},\"4\":{\"materNo\":\"42\",\"materCategory\":\"������\",\"materName\":\"Ŭ��Ŀ - ����\",\"materGasKg\":\"0.3\",\"materPrice\":\"4250\",\"materKg\":\"44\"},\"5\":{\"materNo\":\"42\",\"materCategory\":\"������\",\"materName\":\"Ŭ��Ŀ - ����\",\"materGasKg\":\"0.3\",\"materPrice\":\"4250\",\"materKg\":\"1\"},\"6\":{\"materNo\":\"43\",\"materCategory\":\"���\",\"materName\":\"PE �ʸ� (���� ����)\",\"materGasKg\":\"1.98\",\"materPrice\":\"3500\",\"materKg\":\"123\"},\"7\":{\"materNo\":\"45\",\"materCategory\":\"�ֹ�\",\"materName\":\"����� Ÿ��\",\"materGasKg\":\"0.52\",\"materPrice\":\"6500\",\"materKg\":\"412\"},\"8\":{\"materNo\":\"60\",\"materCategory\":\"âȣ��\",\"materName\":\"���� ����â\",\"materGasKg\":\"1.9\",\"materPrice\":\"7500\",\"materKg\":\"12\"},\"9\":{\"materNo\":\"61\",\"materCategory\":\"âȣ��\",\"materName\":\"���� ����â\",\"materGasKg\":\"1.79\",\"materPrice\":\"7000\",\"materKg\":\"42\"}}";
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
			Map<String, String> basicMatMap = (Map<String, String>) entry.getValue();

			String category = basicMatMap.get("materCategory"); // ī�װ�
			if (category.equals(matCateArr[0])) {
				ExteriorDTO exterior = new ExteriorDTO();
				exterior.setEstiNo(estiNo);
				exterior.setExteriorCategory(basicMatMap.get("materCategory"));
				exterior.setExteriorName(basicMatMap.get("materName"));
				exterior.setExteriorKg(Integer.parseInt(basicMatMap.get("materKg")));
				exterior.setExteriorCarbon(Float.parseFloat(basicMatMap.get("materGasKg")));
				exterior.setExteriorCost(Integer.parseInt(basicMatMap.get("materPrice")));
				exterior.setMaterClassify("N");
				
				System.out.println(exterior);
				
				userEstimateService.insertExterior(exterior);
			} else if (category.equals(matCateArr[1])) {
				RoofingDTO roofing = new RoofingDTO();
				roofing.setEstiNo(estiNo);
				roofing.setRoofingCategory(basicMatMap.get("materCategory"));
				roofing.setRoofingName(basicMatMap.get("materName"));
				roofing.setRoofingKg(Integer.parseInt(basicMatMap.get("materKg")));
				roofing.setRoofingCarbon(Float.parseFloat(basicMatMap.get("materGasKg")));
				roofing.setRoofingCost(Integer.parseInt(basicMatMap.get("materPrice")));
				roofing.setMaterClassify("N");
				
				System.out.println(roofing);
				
				userEstimateService.insertRoofing(roofing);
			} else if (category.equals(matCateArr[2])) {
				WindowDTO window = new WindowDTO();
				window.setEstiNo(estiNo);
				window.setWindowCategory(basicMatMap.get("materCategory"));
				window.setWindowName(basicMatMap.get("materName"));
				window.setWindowKg(Integer.parseInt(basicMatMap.get("materKg")));
				window.setWindowCarbon(Float.parseFloat(basicMatMap.get("materGasKg")));
				window.setWindowCost(Integer.parseInt(basicMatMap.get("materPrice")));
				window.setMaterClassify("N");
				
				System.out.println(window);
				
				userEstimateService.insertWindow(window);
			} else if (category.equals(matCateArr[3])) {
				LivingDTO living = new LivingDTO();
				living.setEstiNo(estiNo);
				living.setLivingCategory(basicMatMap.get("materCategory"));
				living.setLivingName(basicMatMap.get("materName"));
				living.setLivingKg(Integer.parseInt(basicMatMap.get("materKg")));
				living.setLivingCarbon(Float.parseFloat(basicMatMap.get("materGasKg")));
				living.setLivingCost(Integer.parseInt(basicMatMap.get("materPrice")));
				living.setMaterClassify("N");
				
				System.out.println(living);
				
				userEstimateService.insertLiving(living);
			} else if (category.equals(matCateArr[4])) {
				BathroomDTO bath = new BathroomDTO();
				bath.setEstiNo(estiNo);
				bath.setBathroomCategory(basicMatMap.get("materCategory"));
				bath.setBathroomName(basicMatMap.get("materName"));
				bath.setBathroomKg(Integer.parseInt(basicMatMap.get("materKg")));
				bath.setBathroomCarbon(Float.parseFloat(basicMatMap.get("materGasKg")));
				bath.setBathroomCost(Integer.parseInt(basicMatMap.get("materPrice")));
				bath.setMaterClassify("N");
				
				System.out.println(bath);
				
				userEstimateService.insertBathroom(bath);
			} else if (category.equals(matCateArr[5])) {
				KitchenDTO kitchen = new KitchenDTO();
				kitchen.setEstiNo(estiNo);
				kitchen.setKitchenCategory(basicMatMap.get("materCategory"));
				kitchen.setKitchenName(basicMatMap.get("materName"));
				kitchen.setKitchenKg(Integer.parseInt(basicMatMap.get("materKg")));
				kitchen.setKitchenCarbon(Float.parseFloat(basicMatMap.get("materGasKg")));
				kitchen.setKitchenCost(Integer.parseInt(basicMatMap.get("materPrice")));
				kitchen.setMaterClassify("N");
				
				System.out.println(kitchen);
				
				userEstimateService.insertKitchen(kitchen);
			} else if (category.equals(matCateArr[6])) {
				RoomDTO room = new RoomDTO();
				room.setEstiNo(estiNo);
				room.setRoomCategory(basicMatMap.get("materCategory"));
				room.setRoomName(basicMatMap.get("materName"));
				room.setRoomKg(Integer.parseInt(basicMatMap.get("materKg")));
				room.setRoomCarbon(Float.parseFloat(basicMatMap.get("materGasKg")));
				room.setRoomCost(Integer.parseInt(basicMatMap.get("materPrice")));
				room.setMaterClassify("N");
				
				System.out.println(room);
				
				userEstimateService.insertRoom(room);
			}
			
		}

		return "good";
	}

}

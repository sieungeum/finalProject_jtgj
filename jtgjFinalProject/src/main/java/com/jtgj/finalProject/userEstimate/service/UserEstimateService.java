package com.jtgj.finalProject.userEstimate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgj.finalProject.userEstimate.dao.IUserEstimateDAO;
import com.jtgj.finalProject.userEstimate.dto.BathroomDTO;
import com.jtgj.finalProject.userEstimate.dto.ExteriorDTO;
import com.jtgj.finalProject.userEstimate.dto.KitchenDTO;
import com.jtgj.finalProject.userEstimate.dto.LivingDTO;
import com.jtgj.finalProject.userEstimate.dto.RoofingDTO;
import com.jtgj.finalProject.userEstimate.dto.RoomDTO;
import com.jtgj.finalProject.userEstimate.dto.WindowDTO;

@Service
public class UserEstimateService {
	
	@Autowired
	IUserEstimateDAO dao;
	
	// estiNo ±¸ÇÏ±â
	public int getEstiNo() {
		int result = dao.getEstiNo();
		
		return result;
	}
	
	// bathroom »ðÀÔ
	public int insertBathroom(BathroomDTO bathroom) {
		int result = dao.insertBathroom(bathroom);
		
		return result;
	}
	
	// exterior »ðÀÔ
	public int insertExterior(ExteriorDTO exterior) {
		int result = dao.insertExterior(exterior);
		
		return result;
	}
	
	// kitchen »ðÀÔ
	public int insertKitchen(KitchenDTO kitchen) {
		int result = dao.insertKitchen(kitchen);
		
		return result;
	}
	
	// living »ðÀÔ
	public int insertLiving(LivingDTO living) {
		int result = dao.insertLiving(living);
		
		return result;
	}
	
	// roofing »ðÀÔ
	public int insertRoofing(RoofingDTO roofing) {
		int result = dao.insertRoofing(roofing);
		
		return result;
	}
	
	// window »ðÀÔ
	public int insertWindow(WindowDTO window) {
		int result = dao.insertWindow(window);
		
		return result;
	}
	
	// room»ðÀÔ 
	public int insertRoom(RoomDTO room) {
		int result = dao.insertRoom(room);
		
		return result;
	}
}

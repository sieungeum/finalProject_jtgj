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
	
	
}

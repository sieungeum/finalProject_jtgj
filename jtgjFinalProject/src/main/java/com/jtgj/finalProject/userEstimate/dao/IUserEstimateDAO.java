package com.jtgj.finalProject.userEstimate.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.jtgj.finalProject.userEstimate.dto.BathroomDTO;
import com.jtgj.finalProject.userEstimate.dto.ExteriorDTO;
import com.jtgj.finalProject.userEstimate.dto.KitchenDTO;
import com.jtgj.finalProject.userEstimate.dto.LivingDTO;
import com.jtgj.finalProject.userEstimate.dto.RoofingDTO;
import com.jtgj.finalProject.userEstimate.dto.RoomDTO;
import com.jtgj.finalProject.userEstimate.dto.WindowDTO;

@Mapper
public interface IUserEstimateDAO {
	// estiNo ±¸ÇÏ±â
	int getEstiNo();
	
	
	
}

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
	// estiNo 구하기
	int getEstiNo();
	
	// bathroom 채우기
	int insertBathroom(BathroomDTO bathroom);
	
	
	
	
	// exterior 채우기
	int insertExterior(ExteriorDTO exterior);
	
	
	
	
	// kitchen 채우기
	int insertKitchen(KitchenDTO kitchen);
	
	
	
	
	// living 채우기
	int insertLiving(LivingDTO living);
	
	
	
	
	// roofing 채우기
	int insertRoofing(RoofingDTO roofing);
	
	
	
	
	// window 채우기
	int insertWindow(WindowDTO window);
	
	
	
	
	// room 채우기
	int insertRoom(RoomDTO room);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

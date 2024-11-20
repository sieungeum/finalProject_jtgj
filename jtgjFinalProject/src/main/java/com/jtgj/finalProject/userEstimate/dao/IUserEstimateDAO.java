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
	// estiNo ���ϱ�
	int getEstiNo();
	
	// bathroom ä���
	int insertBathroom(BathroomDTO bathroom);
	
	
	
	
	// exterior ä���
	int insertExterior(ExteriorDTO exterior);
	
	
	
	
	// kitchen ä���
	int insertKitchen(KitchenDTO kitchen);
	
	
	
	
	// living ä���
	int insertLiving(LivingDTO living);
	
	
	
	
	// roofing ä���
	int insertRoofing(RoofingDTO roofing);
	
	
	
	
	// window ä���
	int insertWindow(WindowDTO window);
	
	
	
	
	// room ä���
	int insertRoom(RoomDTO room);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

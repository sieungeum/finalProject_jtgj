package com.jtgj.finalProject.userEstimate.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.jtgj.finalProject.estimate.dto.EstimateDTO;
import com.jtgj.finalProject.userEstimate.dto.BathroomDTO;
import com.jtgj.finalProject.userEstimate.dto.ExteriorDTO;
import com.jtgj.finalProject.userEstimate.dto.KitchenDTO;
import com.jtgj.finalProject.userEstimate.dto.LivingDTO;
import com.jtgj.finalProject.userEstimate.dto.RoofingDTO;
import com.jtgj.finalProject.userEstimate.dto.RoomDTO;
import com.jtgj.finalProject.userEstimate.dto.UserEstimateDTO;
import com.jtgj.finalProject.userEstimate.dto.WindowDTO;

@Mapper
public interface IUserEstimateDAO {
	// estiNo 구하기
	int getEstiNo();
	
	// 최종 자제들 기본 자제랑 대체 자제 저장하기 (insert)
	int setUserEstimate(UserEstimateDTO esti);
	
	// 유저의 견적 가져오기
	List<UserEstimateDTO> getUserEstimate(String userId);
}

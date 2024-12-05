package com.jtgj.finalProject.userEstimate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgj.finalProject.estimate.dto.EstimateDTO;
import com.jtgj.finalProject.userEstimate.dao.IUserEstimateDAO;
import com.jtgj.finalProject.userEstimate.dto.BathroomDTO;
import com.jtgj.finalProject.userEstimate.dto.ExteriorDTO;
import com.jtgj.finalProject.userEstimate.dto.KitchenDTO;
import com.jtgj.finalProject.userEstimate.dto.LivingDTO;
import com.jtgj.finalProject.userEstimate.dto.RoofingDTO;
import com.jtgj.finalProject.userEstimate.dto.RoomDTO;
import com.jtgj.finalProject.userEstimate.dto.UserEstimateDTO;
import com.jtgj.finalProject.userEstimate.dto.WindowDTO;

@Service
public class UserEstimateService {
	
	@Autowired
	IUserEstimateDAO dao;
	
	// estiNo 구하기
	public int getEstiNo() {
		int result = dao.getEstiNo();
		
		return result;
	}
	
	// 최종 자제들 기본 자제랑 대체 자제 저장하기 (insert)
	public int setUserEstimate(UserEstimateDTO esti) {
		int result = dao.setUserEstimate(esti);
		
		return result;
	}
	
	// 유저의 견적 가져오기
	public List<UserEstimateDTO> getUserEstimate(String userId){
		List<UserEstimateDTO> result = dao.getUserEstimate(userId);
		
		return result;
	}
	
	// 견적 삭제하기
	public int delUserEstimate(UserEstimateDTO esti) {
		int result = dao.delUserEstimate(esti);
		
		return result;
	}
	
	// 견적 번호로 유저 견적 가져오기
	public List<UserEstimateDTO> estiNoToUserEstimate(int estiNo){
		List<UserEstimateDTO> result = dao.estiNoToUserEstimate(estiNo);
		
		return result;
	}
}

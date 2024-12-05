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
	
	// estiNo ���ϱ�
	public int getEstiNo() {
		int result = dao.getEstiNo();
		
		return result;
	}
	
	// ���� ������ �⺻ ������ ��ü ���� �����ϱ� (insert)
	public int setUserEstimate(UserEstimateDTO esti) {
		int result = dao.setUserEstimate(esti);
		
		return result;
	}
	
	// ������ ���� ��������
	public List<UserEstimateDTO> getUserEstimate(String userId){
		List<UserEstimateDTO> result = dao.getUserEstimate(userId);
		
		return result;
	}
	
	// ���� �����ϱ�
	public int delUserEstimate(UserEstimateDTO esti) {
		int result = dao.delUserEstimate(esti);
		
		return result;
	}
	
	// ���� ��ȣ�� ���� ���� ��������
	public List<UserEstimateDTO> estiNoToUserEstimate(int estiNo){
		List<UserEstimateDTO> result = dao.estiNoToUserEstimate(estiNo);
		
		return result;
	}
}

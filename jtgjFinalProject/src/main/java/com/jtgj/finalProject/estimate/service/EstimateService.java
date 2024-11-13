package com.jtgj.finalProject.estimate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgj.finalProject.estimate.dao.IEstimateDAO;
import com.jtgj.finalProject.estimate.dto.EstimateDTO;

@Service
public class EstimateService {
	
	@Autowired
	IEstimateDAO dao;
	
	// ��� ������ ��������
	public List<EstimateDTO> basic_mater() {
		List<EstimateDTO> result = dao.basic_mater();
		
		return result;
	}
	
	// ������ ī�װ��� �´� ������ ��������
	public List<EstimateDTO> categoryMater(String materCategory){
		List<EstimateDTO> result = dao.categoryMater(materCategory);
		
		return result;
	}
	
	// ajax�� ������ �������� ��ü������ ���� ��������
	public List<EstimateDTO> getMaterToSub(EstimateDTO estimate) {
		List<EstimateDTO> result =  dao.getMaterToSub(estimate);
		
		return result;
	}
	
	// ������ ��ü ������ ���� ���� ��������
	public EstimateDTO getSubMaterInfo(EstimateDTO estimate) {
		EstimateDTO result = dao.getSubMaterInfo(estimate);
		
		return result;
	}
}

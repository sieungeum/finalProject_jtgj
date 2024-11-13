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
	
	// 모든 자제들 가져오기
	public List<EstimateDTO> basic_mater() {
		List<EstimateDTO> result = dao.basic_mater();
		
		return result;
	}
	
	// 선택한 카테고리에 맞는 자제만 가져오기
	public List<EstimateDTO> categoryMater(String materCategory){
		List<EstimateDTO> result = dao.categoryMater(materCategory);
		
		return result;
	}
	
	// ajax로 가져온 자제들의 대체자제들 전부 가져오기
	public List<EstimateDTO> getMaterToSub(EstimateDTO estimate) {
		List<EstimateDTO> result =  dao.getMaterToSub(estimate);
		
		return result;
	}
	
	// 선정된 대체 자제들 정보 단일 가져오기
	public EstimateDTO getSubMaterInfo(EstimateDTO estimate) {
		EstimateDTO result = dao.getSubMaterInfo(estimate);
		
		return result;
	}
}

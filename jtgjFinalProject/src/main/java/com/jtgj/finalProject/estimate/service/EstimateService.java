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
}

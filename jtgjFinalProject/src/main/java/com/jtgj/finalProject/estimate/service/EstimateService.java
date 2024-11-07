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
	
	public List<EstimateDTO> basic_mater() {
		List<EstimateDTO> result = dao.basic_mater();
		
		return result;
	}
}

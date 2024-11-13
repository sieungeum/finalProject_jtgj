package com.jtgj.finalProject.subMatch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgj.finalProject.estimate.dto.EstimateDTO;
import com.jtgj.finalProject.subMatch.dao.ISubMatchDAO;

@Service
public class SubMatchService {
	
	@Autowired
	ISubMatchDAO dao;
	
	// materNo�� ��ü ���� ��������
	public List<String> getSubMaterial(int materNo){
		List<String> result = dao.getSubMaterial(materNo);
		
		return result;
	}
}


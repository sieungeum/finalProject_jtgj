package com.jtgj.finalProject.companyBoard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgj.finalProject.companyBoard.dao.ICompanyBoardDAO;
import com.jtgj.finalProject.companyBoard.dto.CompanyBoardDTO;

@Service
public class CompanyBoardService {
	
	@Autowired
	ICompanyBoardDAO dao;
	
	public List<CompanyBoardDTO> getCompanyBoardList() {
		List<CompanyBoardDTO> result = dao.getCompanyBoardList();
		return result;
	}
	
}

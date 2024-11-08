package com.jtgj.finalProject.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgj.finalProject.faq.dao.IFaqDAO;
import com.jtgj.finalProject.faq.dto.FaqDTO;

@Service
public class FaqService {
	
	@Autowired
	IFaqDAO dao;
	
	public List<FaqDTO> getFaqList() {
		List<FaqDTO> result = dao.getFaqList();
		return result;
	}
	
	public int writeFaq(FaqDTO faq) {
		int result = dao.writeFaq(faq);
		return result;
	}
	
}

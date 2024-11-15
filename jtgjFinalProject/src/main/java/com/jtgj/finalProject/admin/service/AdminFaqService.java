package com.jtgj.finalProject.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgj.finalProject.admin.dao.IAdminDAO;
import com.jtgj.finalProject.common.vo.PageSearchVO;
import com.jtgj.finalProject.faq.dto.CommentDTO;
import com.jtgj.finalProject.faq.dto.FaqDTO;

@Service
public class AdminFaqService {
	
	@Autowired
	IAdminDAO dao;
	
	public List<FaqDTO> getFaqList(){
		List<FaqDTO> result = dao.getFaqList();
		return result;
	}
	
	public List<FaqDTO> getFaqCount() {
        return dao.getFaqCount();
    }
	
	public List<FaqDTO> getUserId() {
		List<FaqDTO> result = dao.getUserId();
		return result;
	}
	

}

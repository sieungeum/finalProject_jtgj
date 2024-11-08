package com.jtgj.finalProject.attach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgj.finalProject.attach.dao.IAttachDAO;
import com.jtgj.finalProject.attach.dto.AttachDTO;

@Service
public class AttachService {
	
	@Autowired
	IAttachDAO dao;
	
	public int insertAttach(AttachDTO attach) {
		int result = dao.insertAttach(attach);
		return result;
	}
	
	public List<AttachDTO> getAttachList(int faqNo){
		List<AttachDTO> result = dao.getAttachList(faqNo);
		return result;
	}
}

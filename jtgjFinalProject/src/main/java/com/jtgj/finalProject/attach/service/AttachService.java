package com.jtgj.finalProject.attach.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<AttachDTO> getAttachList(int faqNo, String atchType){
		Map<String, Object> params = new HashMap<>();
        params.put("faqNo", faqNo);    // 부모 글 번호
        params.put("atchType", atchType); // 게시판 타입
        return dao.getAttachList(params);
	}
}

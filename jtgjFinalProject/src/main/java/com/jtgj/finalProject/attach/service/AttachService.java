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
        params.put("faqNo", faqNo);    // �θ� �� ��ȣ
        params.put("atchType", atchType); // �Խ��� Ÿ��
        return dao.getAttachList(params);
	}
}

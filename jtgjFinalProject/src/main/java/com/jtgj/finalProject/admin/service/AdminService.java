package com.jtgj.finalProject.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgj.finalProject.admin.dao.IAdminDAO;
import com.jtgj.finalProject.user.dto.UserDTO;

@Service
public class AdminService {
	
	@Autowired
	IAdminDAO dao;
	
	public List<UserDTO> getUserList(){
		List<UserDTO> result = dao.getUserList();
		return result;
	}

}

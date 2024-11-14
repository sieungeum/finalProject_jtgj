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
	
	public int userDo(UserDTO user) {
		int result = dao.userDo(user);
		return result;
	}
	
	public int userProDo(UserDTO user) {
		int result = dao.userProDo(user);
		return result;
	}
	
	public int userDelDo(UserDTO user) {
		int result = dao.userDelDo(user);
		return result;
	}
	


}

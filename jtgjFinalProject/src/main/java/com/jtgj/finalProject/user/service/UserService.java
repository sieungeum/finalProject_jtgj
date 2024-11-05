package com.jtgj.finalProject.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgj.finalProject.user.dao.IUserDAO;
import com.jtgj.finalProject.user.dto.UserDTO;

@Service
public class UserService {
	
	@Autowired
	IUserDAO dao;
	
	public List<UserDTO> userSelect() {
		List<UserDTO> result = dao.userSelect();
		
		System.out.println(result);
		
		return result;
	}
}

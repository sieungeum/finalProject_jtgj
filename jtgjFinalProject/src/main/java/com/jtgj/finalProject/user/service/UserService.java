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
	
	// �α��� ����
	public UserDTO loginUser(UserDTO user) {
		UserDTO result = dao.loginUser(user);
		
		return result;
	}
	
	// ���� ȸ������ ����
	public Integer registPersonalUser(UserDTO user) {
		Integer result = dao.registPersonalUser(user);
		
		System.out.println(result);
		
		return result;
	}
	
	// ���̵� �ߺ�üũ
	public boolean confirmId(String id) {
		boolean result = dao.confirmId(id);
	
		return result;
	}
	
	// �г��� �ߺ�üũ
	public boolean confirmName(String name) {
		boolean result = dao.confirmName(name);
	
		return result;
	}
	
	// ������ �̹��� �̸� �� ��
	public int editProfImg(UserDTO user) {
		int result = dao.editProfImg(user);
		return result;
	}
}

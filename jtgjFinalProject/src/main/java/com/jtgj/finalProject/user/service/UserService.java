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
	
	// 로그인 구현
	public UserDTO loginUser(UserDTO user) {
		UserDTO result = dao.loginUser(user);
		
		return result;
	}
	
	// 개인 회원가입 구현
	public Integer registPersonalUser(UserDTO user) {
		Integer result = dao.registPersonalUser(user);
		
		System.out.println(result);
		
		return result;
	}
	
	// 아이디 중복체크
	public boolean confirmId(String id) {
		boolean result = dao.confirmId(id);
	
		return result;
	}
	
	// 닉네임 중복체크
	public boolean confirmName(String name) {
		boolean result = dao.confirmName(name);
	
		return result;
	}
	
	// 프로필 이미지 이름 삽 입
	public int editProfImg(UserDTO user) {
		int result = dao.editProfImg(user);
		return result;
	}
}

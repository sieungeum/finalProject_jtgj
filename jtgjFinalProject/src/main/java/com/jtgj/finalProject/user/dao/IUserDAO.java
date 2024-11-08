package com.jtgj.finalProject.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgj.finalProject.user.dto.UserDTO;

@Mapper
public interface IUserDAO {
	
	List<UserDTO> userSelect();
	
	// 로그인 구현
	UserDTO loginUser(UserDTO user);
	
	// 개인회원가입 구현
	Integer registPersonalUser(UserDTO user);
	
	// 아이디 중복확인
	boolean confirmId(String id);
	
	// 닉네임 중복확인
	boolean confirmName(String name);
	
	// user_prof_img에 값 넣기
	int editProfImg(UserDTO user);
}

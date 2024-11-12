package com.jtgj.finalProject.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
	
	// 이메일 중복확인
	boolean confirmEmail(String email);
	
	// 이메일을 통한 아이디값 받아오기
	String getIdUsedEmail(String email);
	
	// 이전 비밀번호 가져오기
	String getPwUsedEmail(String email);
	
	// 새로운 비밀번호로 update
	int updateNewPw(@Param("password") String password, @Param("email") String email);
	
	// user_prof_img에 값 넣기
	int editProfImg(UserDTO user);
}

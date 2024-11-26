package com.jtgj.finalProject.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jtgj.finalProject.user.dto.CompanyDTO;
import com.jtgj.finalProject.user.dto.UserDTO;

@Mapper
public interface IUserDAO {
	
	List<UserDTO> userSelect();
	
	// 로그인 구현
	UserDTO loginUser(UserDTO user);
	
	// 개인회원가입 구현
	Integer registPersonalUser(UserDTO user);
	
	// 기업회원가입 구현
	Integer registC(UserDTO user);
	Integer registCMore(CompanyDTO company);
	
	// 아이디 중복확인
	boolean confirmId(String id);
	
	// 닉네임 중복확인
	boolean confirmName(String name);
	
	// 이메일 중복확인
	boolean confirmEmail(String email);
	
	// 해당 이메일을 값으로 갖고있는 유저의 전체 정보 받아오기
	UserDTO getUserUsedEmail(String email);
	
	// 기업회원 정보 가져오기
	CompanyDTO getCompanyUsedRegiNum(String regiNum);
	
	// 이전 비밀번호 가져오기
	String getPwUsedEmail(String email);
	
	// 새로운 비밀번호로 update
	int updateNewPw(@Param("password") String password, @Param("email") String email);
	
	// user_prof_img에 값 넣기
	int editProfImg(UserDTO user);
	
	// sessionScope를 이용해서 userId를 대조해서 가지고오는 곳
	UserDTO getUserById(String userId);
	CompanyDTO getCompanyByUserId(String userId);
	
	// 기업회원 정보 수정(user)
	public int updateC(UserDTO user);
	
	// 기업회원 정보 수정(company)
	public int updateCMore(CompanyDTO company);
}

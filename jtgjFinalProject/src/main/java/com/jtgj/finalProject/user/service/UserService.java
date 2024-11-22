package com.jtgj.finalProject.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgj.finalProject.user.dao.IUserDAO;
import com.jtgj.finalProject.user.dto.CompanyDTO;
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
		
		return result;
	}
	
	// 기업 회원가입 구현
	public Integer registC(UserDTO user) {
		Integer result = dao.registC(user);
		
		return result;
	}
	
	public Integer registCMore(CompanyDTO company) {
		Integer result = dao.registCMore(company);
		
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
	
	// 이메일 중복체크
	public boolean confirmEmail(String email) {
		boolean result = dao.confirmEmail(email);
		
		return result;
	}
	
	// 이메일을 통해 아이디 받아오기
	public UserDTO getUserUsedEmail(String email) {
		UserDTO result = dao.getUserUsedEmail(email);
		
		return result;
	}
	
	// 이메일을 통해 이전 패스워드 가져오기
	public String getPwUsedEmail(String email) {
		String result = dao.getPwUsedEmail(email);
		
		return result;
	}
	
	// 이메일을 통해 이전 패스워드 변경
	public int updateNewPw(String password, String email) {
		int result = dao.updateNewPw(password, email);
		
		return result;
	}
	
	// 사업자등록번호를 통해 기업회원의 정보 가져오기
	public CompanyDTO getCompanyUsedRegiNum(String regiNum) {
		CompanyDTO result = dao.getCompanyUsedRegiNum(regiNum);
		
		return result;
	}
	
	// 프로필 이미지 이름 삽 입
	public int editProfImg(UserDTO user) {
		int result = dao.editProfImg(user);
		return result;
	}
	
	// CompanyBoard에서 사용
	public UserDTO getUserById(String userId) {
        return dao.getUserById(userId);
    }
	public CompanyDTO getCompanyByUserId(String userId) {
        return dao.getCompanyByUserId(userId);
    }
}

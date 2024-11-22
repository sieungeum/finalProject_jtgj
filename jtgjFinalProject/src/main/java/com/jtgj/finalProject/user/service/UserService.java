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
	
	// �α��� ����
	public UserDTO loginUser(UserDTO user) {
		UserDTO result = dao.loginUser(user);
		
		return result;
	}
	
	// ���� ȸ������ ����
	public Integer registPersonalUser(UserDTO user) {
		Integer result = dao.registPersonalUser(user);
		
		return result;
	}
	
	// ��� ȸ������ ����
	public Integer registC(UserDTO user) {
		Integer result = dao.registC(user);
		
		return result;
	}
	
	public Integer registCMore(CompanyDTO company) {
		Integer result = dao.registCMore(company);
		
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
	
	// �̸��� �ߺ�üũ
	public boolean confirmEmail(String email) {
		boolean result = dao.confirmEmail(email);
		
		return result;
	}
	
	// �̸����� ���� ���̵� �޾ƿ���
	public UserDTO getUserUsedEmail(String email) {
		UserDTO result = dao.getUserUsedEmail(email);
		
		return result;
	}
	
	// �̸����� ���� ���� �н����� ��������
	public String getPwUsedEmail(String email) {
		String result = dao.getPwUsedEmail(email);
		
		return result;
	}
	
	// �̸����� ���� ���� �н����� ����
	public int updateNewPw(String password, String email) {
		int result = dao.updateNewPw(password, email);
		
		return result;
	}
	
	// ����ڵ�Ϲ�ȣ�� ���� ���ȸ���� ���� ��������
	public CompanyDTO getCompanyUsedRegiNum(String regiNum) {
		CompanyDTO result = dao.getCompanyUsedRegiNum(regiNum);
		
		return result;
	}
	
	// ������ �̹��� �̸� �� ��
	public int editProfImg(UserDTO user) {
		int result = dao.editProfImg(user);
		return result;
	}
	
	// CompanyBoard���� ���
	public UserDTO getUserById(String userId) {
        return dao.getUserById(userId);
    }
	public CompanyDTO getCompanyByUserId(String userId) {
        return dao.getCompanyByUserId(userId);
    }
}

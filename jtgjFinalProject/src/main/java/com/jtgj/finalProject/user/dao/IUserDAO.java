package com.jtgj.finalProject.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jtgj.finalProject.user.dto.CompanyDTO;
import com.jtgj.finalProject.user.dto.UserDTO;

@Mapper
public interface IUserDAO {
	
	List<UserDTO> userSelect();
	
	// �α��� ����
	UserDTO loginUser(UserDTO user);
	
	// ����ȸ������ ����
	Integer registPersonalUser(UserDTO user);
	
	// ���ȸ������ ����
	Integer registC(UserDTO user);
	Integer registCMore(CompanyDTO company);
	
	// ���̵� �ߺ�Ȯ��
	boolean confirmId(String id);
	
	// �г��� �ߺ�Ȯ��
	boolean confirmName(String name);
	
	// �̸��� �ߺ�Ȯ��
	boolean confirmEmail(String email);
	
	// �ش� �̸����� ������ �����ִ� ������ ��ü ���� �޾ƿ���
	UserDTO getUserUsedEmail(String email);
	
	// ���ȸ�� ���� ��������
	CompanyDTO getCompanyUsedRegiNum(String regiNum);
	
	// ���� ��й�ȣ ��������
	String getPwUsedEmail(String email);
	
	// ���ο� ��й�ȣ�� update
	int updateNewPw(@Param("password") String password, @Param("email") String email);
	
	// user_prof_img�� �� �ֱ�
	int editProfImg(UserDTO user);
	
	// sessionScope�� �̿��ؼ� userId�� �����ؼ� ��������� ��
	UserDTO getUserById(String userId);
	CompanyDTO getCompanyByUserId(String userId);
	
	// ���ȸ�� ���� ����(user)
	public int updateC(UserDTO user);
	
	// ���ȸ�� ���� ����(company)
	public int updateCMore(CompanyDTO company);
}

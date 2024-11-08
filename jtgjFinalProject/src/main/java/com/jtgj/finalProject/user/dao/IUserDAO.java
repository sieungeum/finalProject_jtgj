package com.jtgj.finalProject.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgj.finalProject.user.dto.UserDTO;

@Mapper
public interface IUserDAO {
	
	List<UserDTO> userSelect();
	
	// �α��� ����
	UserDTO loginUser(UserDTO user);
	
	// ����ȸ������ ����
	Integer registPersonalUser(UserDTO user);
	
	// ���̵� �ߺ�Ȯ��
	boolean confirmId(String id);
	
	// �г��� �ߺ�Ȯ��
	boolean confirmName(String name);
	
	// user_prof_img�� �� �ֱ�
	int editProfImg(UserDTO user);
}

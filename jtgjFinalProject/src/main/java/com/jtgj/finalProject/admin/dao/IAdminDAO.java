package com.jtgj.finalProject.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgj.finalProject.common.vo.PageSearchVO;
import com.jtgj.finalProject.faq.dto.FaqDTO;
import com.jtgj.finalProject.user.dto.UserDTO;

@Mapper
public interface IAdminDAO {
	List<UserDTO> getUserList();
	int userDo(UserDTO user);
	int userProDo(UserDTO user);
	int userDelDo(UserDTO user);
	List<FaqDTO> getFaqList();
	List<FaqDTO> getFaqCount();
	List<FaqDTO> getUserId();
	int getUserId(UserDTO userId);
}

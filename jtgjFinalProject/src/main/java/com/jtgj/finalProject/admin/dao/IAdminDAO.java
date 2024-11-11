package com.jtgj.finalProject.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgj.finalProject.user.dto.UserDTO;

@Mapper
public interface IAdminDAO {
	List<UserDTO> getUserList();
}

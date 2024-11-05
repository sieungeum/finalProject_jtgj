package com.jtgj.finalProject.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgj.finalProject.user.dto.UserDTO;

@Mapper
public interface IUserDAO {
	
	List<UserDTO> userSelect();
}

package com.jtgj.finalProject.subMatch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ISubMatchDAO {
	
	// materNo�� ��ü ���� ��������
	List<String> getSubMaterial(int materNo);
}

package com.jtgj.finalProject.subMatch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ISubMatchDAO {
	
	// materNo로 대체 자제 가져오기
	List<String> getSubMaterial(int materNo);
}

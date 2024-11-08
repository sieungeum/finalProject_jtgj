package com.jtgj.finalProject.estimate.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgj.finalProject.estimate.dto.EstimateDTO;

@Mapper
public interface IEstimateDAO {
	
	// 기본 자제만 가져오기
	List<EstimateDTO> basic_mater();
	
	// 카테고리에 맞는 데이터만 가져오기
	List<EstimateDTO> categoryMater(String materCategory);
}

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
	
	// ajax로 가져온 자제들의 대체자제들 전부 가져오기
	List<EstimateDTO> getMaterToSub(EstimateDTO estimate);
	
	// 선정된 대체 자제들 정보 단일 가져오기
	EstimateDTO getSubMaterInfo(EstimateDTO estimate);
}

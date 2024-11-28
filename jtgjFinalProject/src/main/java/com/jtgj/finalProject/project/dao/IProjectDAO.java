package com.jtgj.finalProject.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jtgj.finalProject.project.dto.ProjectDTO;

@Mapper
public interface IProjectDAO {
	// 초기 데이터 로드
	public List<ProjectDTO> getInitialProjects(int limit);
	
	// 추가 데이터 로드
    public List<ProjectDTO> getRandomProjects(@Param("displayedPtNos") List<Integer>displayedPtNos, @Param("limit") int limit);
}
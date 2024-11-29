package com.jtgj.finalProject.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jtgj.finalProject.project.dto.ProjectDTO;

@Mapper
public interface IProjectDAO {
	// �ʱ� ������ �ε�
	public List<ProjectDTO> getInitialProjects(int limit);
	
	// �߰� ������ �ε�
    public List<ProjectDTO> getRandomProjects(@Param("displayedPtNos") List<Integer>displayedPtNos, @Param("limit") int limit);
}
package com.jtgj.finalProject.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgj.finalProject.project.dao.IProjectDAO;
import com.jtgj.finalProject.project.dto.ProjectDTO;

@Service
public class ProjectService {

	@Autowired
	IProjectDAO projectDAO;
	
	// �ʱ� ������ �ε�
    public List<ProjectDTO> getInitialProjects(int limit) {
        return projectDAO.getInitialProjects(limit);
    }

    // �߰� ������ �ε�
    public List<ProjectDTO> getRandomProjects(List<Integer> displayedPtNos, int limit) {
        return projectDAO.getRandomProjects(displayedPtNos, limit);
    }
}

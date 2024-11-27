package com.jtgj.finalProject.project.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jtgj.finalProject.project.service.ProjectService;

@Controller
public class ProjectController {

	@Autowired
	ProjectService projectService;
}

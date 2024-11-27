package com.jtgj.finalProject;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jtgj.finalProject.project.dto.ProjectDTO;
import com.jtgj.finalProject.project.service.ProjectService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	ProjectService projectService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		
		// 초기 프로젝트 4개를 화면에 띄웁니다 
		int limit = 2; 
		List<ProjectDTO> projectList = projectService.getInitialProjects(limit); 
		model.addAttribute("projectList", projectList);
			 
		return "home";
	}

	
	@PostMapping("/projectsLoad")
	@ResponseBody
	public List<ProjectDTO> loadMoreProjects(@RequestBody Map<String, Object> request) {
		System.out.println("Request Data: " + request);
		
		int lastProjectNum = (int) request.get("lastProjectNum");
		int limit = (int) request.get("limit");
		
		System.out.println(lastProjectNum);
		System.out.println(limit);
		
		return projectService.getProjectsAfter(lastProjectNum, limit);
	}
			 
}

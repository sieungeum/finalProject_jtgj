package com.jtgj.finalProject;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jtgj.finalProject.admin.service.AdminFaqService;
import com.jtgj.finalProject.admin.service.AdminService;
import com.jtgj.finalProject.common.util.FileUploadUtils;
import com.jtgj.finalProject.estimate.dto.EstimateDTO;
import com.jtgj.finalProject.estimate.service.EstimateService;
import com.jtgj.finalProject.faq.dto.FaqDTO;
import com.jtgj.finalProject.faq.service.FaqService;
import com.jtgj.finalProject.project.dto.ProjectDTO;
import com.jtgj.finalProject.project.service.ProjectService;
import com.jtgj.finalProject.user.dto.UserDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	ProjectService projectService;
	
	// 임시..
	@Autowired
	AdminService adminService;
	
	@Autowired
	FaqService faqService;
	
	@Autowired
	AdminFaqService adminfaqService;
	
	@Autowired
	EstimateService estimateService;
	
	@Autowired
	FileUploadUtils fileUploadUtils;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		// 서버 시간 추가
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
			 
		// 초기 프로젝트 2개 가져오기
		List<ProjectDTO> initialProjects = projectService.getInitialProjects(2);
		
		// 초기 ptNo 목록 생성
		List<Integer> displayedPtNos = initialProjects.stream().map(ProjectDTO::getPtNo).collect(Collectors.toList());
		
		// JSON 으로 변환
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			String displayedPtNosJson = objectMapper.writeValueAsString(displayedPtNos);
			model.addAttribute("displayedPtNosJson", displayedPtNosJson);
			
			String initialProjectsJson = objectMapper.writeValueAsString(initialProjects);
			model.addAttribute("initialProjectsJson", initialProjectsJson);
		} catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return "home";
	}
	
	@PostMapping("/projectsLoadRandom")
	@ResponseBody
	public List<ProjectDTO> loadRandomProjects(@RequestBody Map<String, Object> request) {
		System.out.println("Request Data: " + request);
		
		List<Integer> displayedPtNos = (List<Integer>) request.get("displayedPtNos");
		int limit = (int) request.get("limit");
		
		System.out.println(displayedPtNos);
		System.out.println(limit);
		
		return projectService.getRandomProjects(displayedPtNos, limit);
	}
	
}

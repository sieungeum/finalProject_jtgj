package com.jtgj.finalProject;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ServletContext servletContext;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

	    String jsonData = "";
	    try {
	        // 파일의 실제 경로 가져오기
	        String filePath = servletContext.getRealPath("/resources/json/Builders.json");

	        Path path = Path.of(filePath);
	        if (!Files.exists(path)) {
	            System.err.println("File not found at path: " + filePath);
	            throw new Exception("File not found at path: " + filePath);
	        }

	        // 파일 읽기
	        jsonData = Files.readString(path, StandardCharsets.UTF_8);
	    } catch (Exception e) {
	        logger.error("Failed to read JSON file: {}", e.getMessage());
	        e.printStackTrace();
	    }
		
		model.addAttribute("jsonData", jsonData);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/editView")
	public String editView() {
		System.out.println("- editView - ");
		
		return "myPage/editView";
	}
	

	
}

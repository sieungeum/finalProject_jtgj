package com.jtgj.finalProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.mail.Session;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jtgj.finalProject.user.dto.UserDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
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
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/personalEditView")
	public String personalEditView(HttpSession session, HttpServletResponse response) throws IOException {
		System.out.println("- personalEditView - ");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		UserDTO login = (UserDTO) session.getAttribute("login");
		
		if(login == null) {
			return "redirect:/";
		}
		
		if (login.getUserAccount().equals("C")) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('개인회원만 접근 가능합니다!');");
			out.println("history.go(-1);</script>");
			out.close();
        } 
		
		return "myPage/personalEditView";
	}
	
	@RequestMapping("/companyEditView")
	public String companyEditView(HttpSession session, HttpServletResponse response) throws IOException{
		System.out.println("- companyEditView - ");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		UserDTO login = (UserDTO) session.getAttribute("login");
		
		if(login == null) {
			return "redirect:/";
		}
		
		if (login.getUserAccount().equals("P")) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('기업회원만 접근 가능합니다!');");
			out.println("history.go(-1);</script>");
			out.close();
        } 
		
		return "myPage/companyEditView";
	}
	

	
}

 package com.jtgj.finalProject.admin.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jtgj.finalProject.admin.service.AdminFaqService;
import com.jtgj.finalProject.admin.service.AdminService;
import com.jtgj.finalProject.faq.dto.FaqDTO;
import com.jtgj.finalProject.user.dto.UserDTO;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	AdminFaqService adminfaqService;
	
	@RequestMapping("/adminPage")
	public String adminPage(Model model) {
		System.out.println("- adminPage - ");
		List<UserDTO> userList = adminService.getUserList();
		
		model.addAttribute("userList", userList);
		
		List<FaqDTO> faqList = adminfaqService.getFaqList();
		
		model.addAttribute("faqList", faqList);
		
		return "myPage/adminPage";
	}
	
	@PostMapping("/userDo")
	public String userDo(UserDTO user) {
		System.out.println(user);
		
		adminService.userDo(user);
		
		return "redirect:/adminPage";
		
	}
	
	@PostMapping("/userDelDo")
	public String userDelDo(UserDTO user) { 
		System.out.println(user);
		
		adminService.userDelDo(user);
		
		return "redirect:/adminPage";
		
	}
	
	
	@RequestMapping("/myPage")
	public String myPage(Model model) {
		System.out.println("- myPage - ");
		
		
		List<FaqDTO> faqList = adminfaqService.getFaqList();
		
		model.addAttribute("faqList", faqList);
		
		return "myPage/index";
	}
	
	
}

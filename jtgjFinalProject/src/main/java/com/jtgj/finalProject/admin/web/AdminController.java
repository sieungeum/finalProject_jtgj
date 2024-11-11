 package com.jtgj.finalProject.admin.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jtgj.finalProject.admin.service.AdminService;
import com.jtgj.finalProject.user.dto.UserDTO;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/adminPage")
	public String adminPage(Model model) {
		System.out.println("- adminPage - ");
		List<UserDTO> userList = adminService.getUserList();
		
		model.addAttribute("userList", userList);
		
		return "myPage/adminPage";
	}
}

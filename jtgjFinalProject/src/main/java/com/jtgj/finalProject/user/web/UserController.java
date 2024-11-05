package com.jtgj.finalProject.user.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jtgj.finalProject.user.dto.UserDTO;
import com.jtgj.finalProject.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/home")
	public String test() {
		System.out.println(" - test - ");
		
		List<UserDTO> user = userService.userSelect();
		
		System.out.println(user);
		
		return "redirect:/";
	}
}

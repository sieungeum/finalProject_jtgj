package com.jtgj.finalProject.user.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	// �α��� ȭ�� ����
	@RequestMapping("/loginView")
	public String loginView() {
		System.out.println(" - Login Page - ");
		
		return "member/loginView";
	}
	
	// �α��� ����
	@PostMapping("/loginDo")
	public String loginDo(UserDTO user, HttpSession session) {
		System.out.println(user);
		
		UserDTO login = userService.loginUser(user);
		
		System.out.println(login);
		
		session.setAttribute("login", login);
		
		return "redirect:/";
	}
	
	// ����ȸ�� ���� ȭ�� ����
	@RequestMapping("/personalRegistView")
	public String personalRegistView() {
		System.out.println(" - Personal Regist Page - ");
		
		return "member/personalRegistView";
	}
	
	// ����ȸ�� ���� ����
	@PostMapping("/personalRegistDo")
	public String personalregistDo(UserDTO user) {
		System.out.println(user);
		
		userService.registPersonalUser(user);
		
		return "member/loginView";
	}
	
	
	// ���ȸ�� ���� ȭ�� ����
	@RequestMapping("/corporationRegistView")
	public String corporationRegistView() {
		System.out.println(" - Corporation Regist Page - ");
		
		return "member/corporationRegistView";
	}
}

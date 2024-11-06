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
	
	// 로그인 화면 실행
	@RequestMapping("/loginView")
	public String loginView() {
		System.out.println(" - Login Page - ");
		
		return "member/loginView";
	}
	
	// 로그인 실행
	@PostMapping("/loginDo")
	public String loginDo(UserDTO user, HttpSession session) {
		System.out.println(user);
		
		UserDTO login = userService.loginUser(user);
		
		System.out.println(login);
		
		session.setAttribute("login", login);
		
		return "redirect:/";
	}
	
	// 개인회원 가입 화면 실행
	@RequestMapping("/personalRegistView")
	public String personalRegistView() {
		System.out.println(" - Personal Regist Page - ");
		
		return "member/personalRegistView";
	}
	
	// 개인회원 가입 실행
	@PostMapping("/personalRegistDo")
	public String personalregistDo(UserDTO user) {
		System.out.println(user);
		
		userService.registPersonalUser(user);
		
		return "member/loginView";
	}
	
	
	// 기업회원 가입 화면 실행
	@RequestMapping("/corporationRegistView")
	public String corporationRegistView() {
		System.out.println(" - Corporation Regist Page - ");
		
		return "member/corporationRegistView";
	}
}

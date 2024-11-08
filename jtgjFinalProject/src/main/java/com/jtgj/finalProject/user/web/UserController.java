package com.jtgj.finalProject.user.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String loginDo(UserDTO user, HttpSession session, boolean rememberId, HttpServletResponse response, HttpServletRequest request) throws IOException {
		UserDTO login = userService.loginUser(user);

		System.out.println(user);
		System.out.println(login);
		
	    response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");
		
		if(login == null) { // �α��� ����(���̵� �����Ϳ� �������� ���� ���
			PrintWriter out = response.getWriter();
			out.println("<script>alert('�������� �ʴ� ���̵� �Դϴ�!');");
			out.println("history.go(-1);</script>");
			out.close();
			
			return null;
		} else if (!user.getUserPw().equals(login.getUserPw())){
			PrintWriter out = response.getWriter();
			out.println("<script>alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�!');");
			out.println("history.go(-1);</script>");
			out.close();
			
			return null;
		} else {
			session.setAttribute("login", login);
			session.setMaxInactiveInterval(60 * 200);
			
			if(rememberId) {
				Cookie cookie = new Cookie("rememberId", user.getUserId());
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("rememberId", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			PrintWriter out = response.getWriter();
	        out.println("<script>alert('ȯ���մϴ�!'); location.href='" + request.getContextPath() + "/';</script>");
	        out.close();
			
			return null;
		}
	}
	
	// �α׾ƿ� ����
	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session) {
		// ���� ����
		session.invalidate();
		
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
	public String personalregistDo(UserDTO user, HttpServletResponse response, HttpServletRequest request) throws IOException {
	    response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");
		
		System.out.println(user);
		
		// ���̵� �ߺ����� �� alert�� ���
		if(userService.confirmId(user.getUserId())) {
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>alert('���̵� �ߺ��ƽ��ϴ�! �ٸ� ���̵� �Է����ּ���!');");
			out.println("history.go(-1);</script>");
			out.close();
			
			return null;
		} else {
			userService.registPersonalUser(user);
			
			PrintWriter out = response.getWriter();
			out.println("<script>alert('ȯ���մϴ�!'); location.href='" + request.getContextPath() + "/loginView';</script>");
	        out.close();
			
			return null;
		}	
	}
	
	// ���ȸ�� ���� ȭ�� ����
	@RequestMapping("/corporationRegistView")
	public String corporationRegistView() {
		System.out.println(" - Corporation Regist Page - ");
		
		return "member/corporationRegistView";
	}
	
	// ���̵� �ߺ� ���� üũ
	@PostMapping("/ConfirmId")
	@ResponseBody
	public ResponseEntity<Boolean> confirmId(String id){
		boolean result = true;
		
		System.out.println(id);
		
		if(id.trim().isEmpty()) {
			result = false;
		} else {
			if(userService.confirmId(id)) {
				result = false;
			} else {
				result = true;
			}
		}
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
}

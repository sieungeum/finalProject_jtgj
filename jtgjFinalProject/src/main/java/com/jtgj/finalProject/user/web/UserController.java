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
	
	// 로그인 화면 실행
	@RequestMapping("/loginView")
	public String loginView() {
		System.out.println(" - Login Page - ");
		
		return "member/loginView";
	}
	
	// 로그인 실행
	@PostMapping("/loginDo")
	public String loginDo(UserDTO user, HttpSession session, boolean rememberId, HttpServletResponse response, HttpServletRequest request) throws IOException {
		UserDTO login = userService.loginUser(user);

		System.out.println(user);
		System.out.println(login);
		
	    response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");
		
		if(login == null) { // 로그인 실패(아이디가 데이터에 존재하지 않을 경우
			PrintWriter out = response.getWriter();
			out.println("<script>alert('존재하지 않는 아이디 입니다!');");
			out.println("history.go(-1);</script>");
			out.close();
			
			return null;
		} else if (!user.getUserPw().equals(login.getUserPw())){
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호가 일치하지 않습니다!');");
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
	        out.println("<script>alert('환영합니다!'); location.href='" + request.getContextPath() + "/';</script>");
	        out.close();
			
			return null;
		}
	}
	
	// 로그아웃 실행
	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session) {
		// 세션 종료
		session.invalidate();
		
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
	public String personalregistDo(UserDTO user, HttpServletResponse response, HttpServletRequest request) throws IOException {
	    response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");
		
		System.out.println(user);
		
		// 아이디가 중복됐을 시 alert로 경고
		if(userService.confirmId(user.getUserId())) {
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>alert('아이디가 중복됐습니다! 다른 아이디를 입력해주세요!');");
			out.println("history.go(-1);</script>");
			out.close();
			
			return null;
		} else {
			userService.registPersonalUser(user);
			
			PrintWriter out = response.getWriter();
			out.println("<script>alert('환영합니다!'); location.href='" + request.getContextPath() + "/loginView';</script>");
	        out.close();
			
			return null;
		}	
	}
	
	// 기업회원 가입 화면 실행
	@RequestMapping("/corporationRegistView")
	public String corporationRegistView() {
		System.out.println(" - Corporation Regist Page - ");
		
		return "member/corporationRegistView";
	}
	
	// 아이디 중복 여부 체크
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

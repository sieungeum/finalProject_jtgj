package com.jtgj.finalProject.user.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.logging.Logger;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jtgj.finalProject.attach.dto.AttachDTO;
import com.jtgj.finalProject.common.util.FileUploadUtils;
import com.jtgj.finalProject.user.dto.UserDTO;
import com.jtgj.finalProject.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	FileUploadUtils fileUploadUtils;
	
	@Inject // 서비스를 호출하기 위해서 의존성 주입
	JavaMailSender mailSender; // 메일 서비스를 사용하기 위해 의존성 주입
	
	
	@RequestMapping("/home")
	public String test() {
		System.out.println(" - test - ");
		
		List<UserDTO> user = userService.userSelect();
		
		System.out.println(user);
		
		return "redirect:/";
	}
	
	// 로그인 화면 실행
	@RequestMapping("/loginView")
	public String loginView(HttpServletRequest request, Model model) {
		System.out.println(" - Login Page - ");
		
		String fromUrl = request.getHeader("Referer");
		System.out.println(fromUrl + "에서 /loginView 요청");
		model.addAttribute("fromUrl", fromUrl);
		
		return "member/loginView";
	}
	
	// 로그인 실행
	@PostMapping("/loginDo")
	public String loginDo(UserDTO user, HttpSession session, boolean rememberId, HttpServletResponse response, 
			HttpServletRequest request, String fromUrl) throws IOException {
		UserDTO login = userService.loginUser(user);
		
		System.out.println(fromUrl);
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
			if(fromUrl.contains("Do")) {
				out.println("<script>alert('환영합니다!'); location.href='" + request.getContextPath() + "/';</script>");
		        out.close();
			}
			out.println("<script>alert('환영합니다!'); location.href='" + fromUrl + "';</script>");
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
	public void personalregistDo(UserDTO user, HttpServletResponse response, HttpServletRequest request) throws IOException {
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
		} else if(userService.confirmName(user.getUserName())) { // 닉네임이 중복됐을 시 alert로 경고
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>alert('닉네임이 중복됐습니다! 다른 닉네임을 입력해주세요!');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			userService.registPersonalUser(user);
			
			PrintWriter out = response.getWriter();
			out.println("<script>alert('환영합니다!'); location.href='" + request.getContextPath() + "/loginView';</script>");
	        out.close();
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
	public ResponseEntity<Boolean> ConfirmId(String id){
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
	
	// 닉네임 중복 여부 체크
	@PostMapping("/ConfirmName")
	@ResponseBody
	public ResponseEntity<Boolean> ConfirmName(String name){
		boolean result = true;
		System.out.println(name);
		
		if(name.trim().isEmpty()) {
			result = false;
		} else {
			if(userService.confirmName(name)) {
				result = false;
			} else {
				result = true;
			}
		}
	
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	
	// 프로필 이미지 업로드
	@ResponseBody
	@PostMapping(value="/uploadProfile", produces="application/json; charset=utf-8")
	public Map<String, Object> uploadProfile(Model model, HttpSession session, MultipartFile file){
		// 첨부된 이미지 파일을 로컬에 저장 -> 저장된 이미지 파일명을 Map에 담아 리턴
		Map<String, Object> result = new HashMap<>();
		
		String profImgName = null;
		
		if(file != null) {
			try {
				AttachDTO attach = fileUploadUtils.getAttachByMultipart(file);
				profImgName = attach.getAtchFileName(); // UUID 로 생성한 파일명
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("이미지 파일 저장 실패");
			}
		}
		
		// 현재 로그인 중인 사용자의 정보 가져오기
		UserDTO login = (UserDTO)session.getAttribute("login");
		
		// 방금 로컬에 저장된 프로필 이미지의 파일명을 login 객체 내부에 저장
		login.setUserProfImg(profImgName);
		
		// DB에 회원정보 수정을 통해 프로필 이미지명 반영!
		userService.editProfImg(login);
		
		result.put("result", profImgName);
		
		return result;
	}
	
	
	// mailSending 코드
	// 인증번호를 보낸다!
	@ResponseBody
	@RequestMapping (value="/ConfirmEmail", method=RequestMethod.POST)
	public ResponseEntity<Boolean> ConfirmEmail(HttpServletRequest request, String email, HttpServletResponse response_email) throws IOException{
		boolean result = false;
		
		Random r = new Random();
		int dice = r.nextInt(4589362) + 493111; // 이메일로 받는 인증코드 부분(난수)
		
		String setfrom = "jjjjkuul@gmail.com";
		String tomail = request.getParameter("email"); // 받는 사람 이메일
		String title = "저탄고집 웹사이트 회원가입 인증 이메일 입니다."; // 제목
		String content =
	            
	            System.getProperty("line.separator") + // 한 줄씩 줄간격을 두기위해 작성
	            
	            System.getProperty("line.separator") + 
	            
	            "안녕하세요 회원님! 저희 홈페이지를 찾아주셔서 감사합니다."
	            
	            + System.getProperty("line.separator")
	            
	            + System.getProperty("line.separator") 
	            
	            + "인증번호는 " + dice + " 입니다!"; // 내용
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동하지 않음
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략 가능!
			messageHelper.setText(content); // 메일 내용
			
			mailSender.send(message);
			System.out.println("메일 성공적으로 보내짐!");
			
			result = true;
			
		} catch(Exception e) {
			System.out.println(e);
			
			result = false;
		}
		
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	
	// 이메일로 받은 인증번호를 입력하고 확인버튼을 누르면 맵핑되는 메소드
	// 인증번호가 일치하면 true 반환, 일치하지 않으면 false 반환
	@ResponseBody
	@RequestMapping (value="/ReConfirmEmail", method=RequestMethod.POST)
	public ResponseEntity<Boolean> ReConfirmEmail(String number) throws IOException{
		System.out.println("인증실행");
		
		boolean result = true;		
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
}

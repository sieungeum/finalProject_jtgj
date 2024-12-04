package com.jtgj.finalProject.user.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jtgj.finalProject.admin.service.AdminService;
import com.jtgj.finalProject.attach.dto.AttachDTO;
import com.jtgj.finalProject.common.util.FileUploadUtils;
import com.jtgj.finalProject.estimate.dto.EstimateDTO;
import com.jtgj.finalProject.user.dto.CompanyDTO;
import com.jtgj.finalProject.user.dto.UserDTO;
import com.jtgj.finalProject.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@Autowired
	FileUploadUtils fileUploadUtils;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	AdminService adminService;

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
	public void loginDo(UserDTO user, HttpSession session, boolean rememberId, HttpServletResponse response,
			HttpServletRequest request, String fromUrl) throws IOException {
		UserDTO login = userService.loginUser(user);
		
		System.out.println(fromUrl);
		System.out.println(user);
		System.out.println(login);

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		if (login == null) { // 로그인 실패(아이디가 데이터에 존재하지 않을 경우
			PrintWriter out = response.getWriter();
			out.println("<script>alert('존재하지 않는 아이디 입니다!');");
			out.println("history.go(-1);</script>");
			out.close();

			return;
		} 
		
		// 사용자가 입력한 비밀번호가 암호화된 비밀번호와 일치하는지 체크
		boolean isMatch = passwordEncoder.matches(user.getUserPw(), login.getUserPw());
		System.out.println(isMatch);
		
		if (!isMatch) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호가 일치하지 않습니다!');");
			out.println("history.go(-1);</script>");
			out.close();

			return;
		} else {
			CompanyDTO company = userService.getCompanyByUserId(login.getUserId());
			
			if(company != null) {
				// 시간 포맷 수정(시,분,초 삭제)
				String v_companyDate = company.getCpOpenDate();
				v_companyDate = v_companyDate.split(" ")[0];
				company.setCpOpenDate(v_companyDate);
				
				// 주소 상세 저장
				String address = company.getCpAddress();
				String[] arr = address.split("\\|");
				
				List<String> addressDetails = new ArrayList<>();
				for(int i = 0; i < arr.length; i++) {			
					addressDetails.add(arr[i]);
				}
				
				session.setAttribute("address", addressDetails);
			}
				
			session.setAttribute("company", company);
			session.setAttribute("login", login);
			// 나중에 주석해제!
			/* session.setMaxInactiveInterval(60 * 200); */

			if (rememberId) {
				Cookie cookie = new Cookie("rememberId", user.getUserId());
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("rememberId", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}

			PrintWriter out = response.getWriter();
			if (fromUrl.contains("Do") || fromUrl.contains("find") || fromUrl.contains("Regist")) {
				out.println("<script>location.href='" + request.getContextPath() + "/';</script>");
				out.close();
			}
			out.println("<script>location.href='" + fromUrl + "';</script>");
			out.close();

			return;
		}
	}

	// 로그아웃 실행
	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session) {
		// 세션 종료
		session.invalidate();

		return "redirect:/";
	}
	
	// 회원가입 선택창 실행
	@RequestMapping("/selectSignUpView")
	public String selectSignUpView() {
		System.out.println(" - Regist Page - ");
		
		return "member/selectSignUpView";
	}

	// 개인회원 가입 화면 실행
	@RequestMapping("/personalRegistView")
	public String personalRegistView() {
		System.out.println(" - Personal Regist Page - ");

		return "member/personalRegistView";
	}

	// 개인회원 가입 실행
	@PostMapping("/personalRegistDo")
	public void personalregistDo(UserDTO user, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		System.out.println(user);

		// 아이디가 중복됐을 시 alert로 경고
		if (userService.confirmId(user.getUserId())) {
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>alert('아이디가 중복됐습니다! 다른 아이디를 입력해주세요!');");
			out.println("history.go(-1);</script>");
			out.close();
		} else if (userService.confirmName(user.getUserName())) { // 닉네임이 중복됐을 시 alert로 경고
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>alert('닉네임이 중복됐습니다! 다른 닉네임을 입력해주세요!');");
			out.println("history.go(-1);</script>");
			out.close();
		} else {
			
			String encodePw = passwordEncoder.encode(user.getUserPw());
			System.out.println(encodePw);
			user.setUserPw(encodePw);
			System.out.println(user);
			
			userService.registPersonalUser(user);

			PrintWriter out = response.getWriter();
			out.println(
					"<script>alert('환영합니다!'); location.href='" + request.getContextPath() + "/loginView';</script>");
			out.close();
		}
	}

	// 기업회원 가입 화면 실행
	@RequestMapping("/corporationRegistView")
	public String corporationRegistView() {
		System.out.println(" - Corporation Regist Page - ");

		return "member/corporationRegistView";
	}
	
	// 기업회원 가입 실행
	@ResponseBody
	@PostMapping("/corporationRegistDo")
	public ResponseEntity<Boolean> corporationRegistDo(@RequestBody Map<String, Object> requestData) {
		System.out.println(" - Corporation Regist Do - ");
		
		boolean result = false;
		
		System.out.println(requestData);

		int cpCarbonEmissions = Integer.parseInt((String) requestData.get("cpCarbonEmissions"));
		
		// UserDTO 매핑
		UserDTO user = new UserDTO();
		user.setUserId((String) requestData.get("userId"));
		user.setUserName((String) requestData.get("userName"));
		user.setUserPw((String) requestData.get("userPw"));
		user.setUserPhone((String) requestData.get("userPhone"));
		user.setUserEmail((String) requestData.get("userEmail"));
		System.out.println(user);

		// CompanyDTO 매핑
		CompanyDTO company = new CompanyDTO();
		company.setUserId((String) requestData.get("userId"));
		company.setCpRegiNum((String) requestData.get("cpRegiNum"));
		company.setCpOpenDate((String) requestData.get("cpOpenDate"));
		company.setCpAddress((String) requestData.get("cpAddress"));
		company.setCpCeoName((String) requestData.get("cpCeoName"));
		company.setCpCarbonEmissions(cpCarbonEmissions);
		System.out.println(company);
		
		// 데이터 베이스에 insert
		if(user != null && company != null) {
			// 비밀번호 암호화
			String encodePw = passwordEncoder.encode(user.getUserPw());
			user.setUserPw(encodePw);
			System.out.println(encodePw);
			
			userService.registC(user);
			userService.registCMore(company);

			result = true;
			
			return new ResponseEntity<>(result, HttpStatus.OK);
		} else {
			
			return new ResponseEntity<>(result, HttpStatus.OK);
		}

	}

	// 아이디 중복 여부 체크
	@PostMapping("/ConfirmId")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> ConfirmId(@Valid @RequestBody UserDTO userDTO, BindingResult errResult) {
		Map<String, Object> responseMap = new HashMap<>();
		String warning;
		boolean result = true;
		
		// 유효성 검사 결과 확인
		if(errResult.hasErrors()) {
			warning = "아이디는 영문 소문자 혹은 숫자로 구성된 4 ~ 20 자리입니다.";
			responseMap.put("success", result);
	        responseMap.put("warning", warning);
	        
	        System.out.println(responseMap);
	        
	        return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
		
		String id = userDTO.getUserId();		
		System.out.println(id);
		result = userService.confirmId(id);
		System.out.println(result);
		
		if(!result) {
			warning = "사용 가능한 아이디 입니다!";
			responseMap.put("success", result);
	        responseMap.put("warning", warning);
	        
	        System.out.println(responseMap);
	        
	        return new ResponseEntity<>(responseMap, HttpStatus.OK);
		} else {
			warning = "이미 존재하는 아이디 입니다!";
			responseMap.put("success", result);
	        responseMap.put("warning", warning);
	        
	        System.out.println(responseMap);
	        
	        return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
	}

	// 닉네임 중복 여부 체크
	@PostMapping("/ConfirmName")
	@ResponseBody
	public ResponseEntity<Boolean> ConfirmName(String name) {
		boolean result = true;
		System.out.println(name);

		if (name.trim().isEmpty()) {
			result = false;
		} else {
			if (userService.confirmName(name)) {
				result = false;
			} else {
				result = true;
			}
		}

		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	// 비밀번호 중복 여부 체크
	@ResponseBody
	@PostMapping("/ConfirmPassword")
	public ResponseEntity<Boolean> ConfirmPassword(String email, String password) {
		boolean result = true;
		
		String nowPw = userService.getPwUsedEmail(email);
		
		boolean isMatch = passwordEncoder.matches(password, nowPw);
		
		if(isMatch) {
			result = false;
			
			return new ResponseEntity<>(result, HttpStatus.OK);
		}
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	// 비밀번호 유효성 체크
	@PostMapping("/pwValidation")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> pwValidation(@Valid @RequestBody UserDTO userDTO, BindingResult errResult) {
		Map<String, Object> responseMap = new HashMap<>();
		String msg;
		boolean result = false;
		
		System.out.println(userDTO);
		
		// 유효성 검사 결과 확인
		if(errResult.hasErrors()) {
			msg = "비밀번호는 소문자 알파벳과 숫자만을 섞은 8 ~ 12자리여야 합니다.";
			responseMap.put("success", result);
	        responseMap.put("msg", msg);
	        
	        return new ResponseEntity<>(responseMap, HttpStatus.OK);
		} 
		
		result = true;
		msg = "사용가능한 비밀번호 입니다! 비밀번호 중복체크를 진행해주세요!";
		responseMap.put("success", result);
        responseMap.put("msg", msg);
        
        return new ResponseEntity<>(responseMap, HttpStatus.OK);
	}
	
	// 계정 찾기 페이지
	@RequestMapping("/findAccountView")
	public String findPersonalId() {
		System.out.println(" - Find Account Page - ");

		return "member/findAccountView";
	}

	// 개인 계정 ID 찾기 페이지
	@RequestMapping("/findPersonalIdView")
	public String findPersonalIdView() {
		System.out.println(" - Find Personal ID Page - ");

		return "member/findPersonalIdView";
	}
	
	// 개인 계정 PW 찾기 페이지
	@RequestMapping("/findPersonalPwView")
	public String findPersonalPwView() {
		System.out.println(" - Find Personal PW Page - ");

		return "member/findPersonalPwView";
	}
	
	// 기업 계정 ID 찾기 페이지
	@RequestMapping("/findCorporationIdView")
	public String findCorporationIdView() {
		System.out.println(" - Find Corporation ID Page");
		
		return "member/findCorporationIdView";
	}
	
	// 기업 계정 PW 찾기 페이지
	@RequestMapping("/findCorporationPwView")
	public String findCorporationPwView() {
		System.out.println(" - Find Corporation PW Page");
		
		return "member/findCorporationPwView";
	}
	
	// mailSending 코드
	// 인증번호를 보낸다!
	// 이메일 인증(회원가입시) -> 이후에 이메일로 인증하는 모든 페이지에 통합할 수 있도록 만들고 싶은데
	@ResponseBody
	@RequestMapping(value = "/ConfirmEmail", method = RequestMethod.POST)
	public ResponseEntity<Boolean> ConfirmEmail(HttpServletRequest request, String email,
			HttpServletResponse response_email) throws IOException {
		
		boolean result = false;
		
		System.out.println(email);
		// 이미 가입한 이메일이라면 아이디 찾기로 보내기
		if(userService.confirmEmail(email)) {
			System.out.println("이미 존재하는 이메일");
			result = false;
			
			return new ResponseEntity<>(result, HttpStatus.OK);
		}
			
		Random r = new Random();
		int dice = r.nextInt(4589362) + 493111; // 이메일로 받는 인증코드 부분(난수)

		// 인증코드 세션에 저장
		request.getSession().setAttribute("dice_" + email, dice);
		
		String setfrom = "jjjjkuul@gmail.com";
		String tomail = request.getParameter("email"); // 받는 사람 이메일
		String title = "저탄고집 웹사이트 회원가입 인증 이메일 입니다."; // 제목
		String content = "<!DOCTYPE html>"
		        + "<html>"
		        + "<head><meta charset='UTF-8'><title>저탄고집 회원가입 인증 이메일</title></head>"
		        + "<body style='margin: 0; padding: 0; font-family: Arial, sans-serif;'>"
		        + "<table width='100%' border='0' cellspacing='0' cellpadding='0' style='background-color: #f9f9f9; padding: 20px 0;'>"
		        + "<tr>"
		        + "<td align='center'>"
		        + "<table width='700' border='0' cellspacing='0' cellpadding='0' style='background-color: #ffffff; border: 3px solid #eeeeee; border-radius: 10px; padding: 20px;'>"
		        + "<tr>"
		        + "<td align='center' style='padding: 20px;'>"
		        + "<h2 style='color: #4CAF50; margin: 0;'>Project JTGJ</h2>"
		        + "</td>"
		        + "</tr>"
		        + "<tr>"
		        + "<td align='center' style='padding: 15px; font-size: 16px; color: #333;'>"
		        + "<p style='margin: 0;'>안녕하세요 회원님! 저희 홈페이지를 찾아주셔서 감사합니다.</p>"
		        + "</td>"
		        + "</tr>"
		        + "<tr>"
		        + "<td align='center' style='padding: 15px; font-size: 16px; color: #333;'>"
		        + "<p style='margin: 0;'>아래 인증번호를 입력해 회원가입을 완료해주세요.</p>"
		        + "</td>"
		        + "</tr>"
		        + "<tr>"
		        + "<td align='center' style='padding: 15px;'>"
		        + "<table border='0' cellspacing='0' cellpadding='0' style='background-color: #f9f9f9; border: 1px solid #ddd; padding: 10px; width: 40%;'>"
		        + "<tr>"
		        + "<td align='center' style='font-size: 20px; font-weight: bold; color: #333;'>"
		        + "인증번호: <span style='color: #4CAF50;'>" + dice + "</span>"
		        + "</td>"
		        + "</tr>"
		        + "</table>"
		        + "</td>"
		        + "</tr>"
		        + "<tr>"
		        + "<td align='center' style='padding: 15px; font-size: 12px; color: #888;'>"
		        + "본 이메일은 발신 전용이며, 회신은 처리되지 않습니다."
		        + "</td>"
		        + "</tr>"
		        + "</table>"
		        + "</td>"
		        + "</tr>"
		        + "</table>"
		        + "</body>"
		        + "</html>";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동하지 않음
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략 가능!
			messageHelper.setText(content, true); // HTML 내용 설정
			mailSender.send(message);
			System.out.println("메일 성공적으로 보내짐!");
			
			System.out.println(message);

			result = true;

		} catch (Exception e) {
			System.out.println(e);

			result = false;
		}

		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	// 이메일로 받은 인증번호를 입력하고 확인버튼을 누르면 맵핑되는 메소드
	// 인증번호가 일치하면 true 반환, 일치하지 않으면 false 반환
	@ResponseBody
	@RequestMapping(value = "/ReConfirmEmail", method = RequestMethod.POST)
	public ResponseEntity<Boolean> ReConfirmEmail(HttpServletRequest request, int number, String email) throws IOException {
		System.out.println("인증실행");
		
		boolean result = true;
		
		int storedDice = (int) request.getSession().getAttribute("dice_" + email); 
		
		System.out.println(storedDice);

		if(storedDice == number) {
			System.out.println("인증번호 일치");
			
			request.getSession().removeAttribute("dice_" + email);
			
			return new ResponseEntity<>(result, HttpStatus.OK);
		} else {
			System.out.println("인증번호 불일치");
			
			result = false;
			return new ResponseEntity<>(result, HttpStatus.OK);
		}
	}	
	
	// 계정찾기 이메일 인증번호 보내기
	@ResponseBody
	@RequestMapping(value = "/findAccountConfirmEmail", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> findAccountConfirmEmail(HttpServletRequest request, String email, String account,
			HttpServletResponse response_email, HttpServletResponse response) throws IOException, MessagingException {
		Map<String, Object> responseMap = new HashMap<>();

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		request.getSession().removeAttribute("findAccountDice_" + email);
		
		// js로 보낼 데이터들
		boolean result = false;
		String warning;
		String type;
		UserDTO userAccount = userService.getUserUsedEmail(email);
		
		if(userAccount == null) { // 이메일 가입 여부 확인
			System.out.println("가입되지 않은 이메일");
			
			result = false;
			type = "a";
			
			warning = "가입되지 않은 이메일 입니다.";
			
			responseMap.put("success", result);
	        responseMap.put("warning", warning);
	        responseMap.put("type", type);
	        
	        return new ResponseEntity<>(responseMap, HttpStatus.OK);
		} else if(!account.equals(userAccount.getUserAccount())){ // 이메일이 존재하나 userAccount가 일치하지 않으면?
			System.out.println("이메일이 존재하나 userAccount 불일치");
			
			result = false;
			type = "b";
			responseMap.put("success", result);
			responseMap.put("type", type);
			
			if(account.equals("P")) {
				warning = "기업회원으로 가입된 이메일입니다.";
		        responseMap.put("warning", warning);
		        return new ResponseEntity<>(responseMap, HttpStatus.OK);
			} else {
				warning = "개인회원으로 가입된 이메일입니다.";
		        responseMap.put("warning", warning);
		        return new ResponseEntity<>(responseMap, HttpStatus.OK);
			}
		} else {
			result = true;
			type = "c";
			
			Random r = new Random();
			int findAccountDice = r.nextInt(4589362) + 493111; // 이메일로 받는 인증코드 부분(난수)
			System.out.println(findAccountDice);
			
			// 세션에 고유 ID와 함께 난수 저장
			request.getSession().setAttribute("findAccountDice_" + email, findAccountDice);
			
			String setfrom = "jjjjkuul@gmail.com";
			String tomail = request.getParameter("email"); // 받는 사람 이메일
			String title = "저탄고집 웹사이트 아이디/비밀번호 찾기 인증 이메일 입니다."; // 제목
			String content = "<!DOCTYPE html>"
			        + "<html>"
			        + "<head><meta charset='UTF-8'><title>저탄고집 아이디/비밀번호 찾기 인증 이메일</title></head>"
			        + "<body style='margin: 0; padding: 0; font-family: Arial, sans-serif;'>"
			        + "<table width='100%' border='0' cellspacing='0' cellpadding='0' style='background-color: #f9f9f9; padding: 20px 0;'>"
			        + "<tr>"
			        + "<td align='center'>"
			        + "<table width='700' border='0' cellspacing='0' cellpadding='0' style='background-color: #ffffff; border: 3px solid #eeeeee; border-radius: 10px; padding: 20px;'>"
			        + "<tr>"
			        + "<td align='center' style='padding: 20px;'>"
			        + "<h2 style='color: #4CAF50; margin: 0;'>Project JTGJ</h2>"
			        + "</td>"
			        + "</tr>"
			        + "<tr>"
			        + "<td align='center' style='padding: 15px; font-size: 16px; color: #333;'>"
			        + "<p style='margin: 0;'>안녕하세요 회원님! 저희 홈페이지를 찾아주셔서 감사합니다.</p>"
			        + "</td>"
			        + "</tr>"
			        + "<tr>"
			        + "<td align='center' style='padding: 15px; font-size: 16px; color: #333;'>"
			        + "<p style='margin: 0;'>아래 인증번호를 입력해 아이디/비밀번호 찾기를 완료해주세요.</p>"
			        + "</td>"
			        + "</tr>"
			        + "<tr>"
			        + "<td align='center' style='padding: 15px;'>"
			        + "<table border='0' cellspacing='0' cellpadding='0' style='background-color: #f9f9f9; border: 1px solid #ddd; padding: 10px; width: 40%; text-align: center;'>"
			        + "<tr>"
			        + "<td style='font-size: 20px; font-weight: bold; color: #333;'>"
			        + "인증번호: <span style='color: #4CAF50;'>" + findAccountDice + "</span>"
			        + "</td>"
			        + "</tr>"
			        + "</table>"
			        + "</td>"
			        + "</tr>"
			        + "<tr>"
			        + "<td align='center' style='padding: 15px; font-size: 12px; color: #888;'>"
			        + "본 이메일은 발신 전용이며, 회신은 처리되지 않습니다."
			        + "</td>"
			        + "</tr>"
			        + "</table>"
			        + "</td>"
			        + "</tr>"
			        + "</table>"
			        + "</body>"
			        + "</html>";



			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동하지 않음
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략 가능!
			messageHelper.setText(content, true); // 메일 내용
	
			mailSender.send(message);
			System.out.println("메일 성공적으로 보내짐!");
			
			responseMap.put("success", result);
	        responseMap.put("warning", null);
	        responseMap.put("type", type);
			
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
	}	
	
	// 계정 찾기 인증 메소드(ID)
	@ResponseBody
	@RequestMapping(value = "/findIdDo", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> findIdDo(HttpServletRequest request, HttpServletResponse response, int authNumber, String email) throws IOException {		
		Map<String, Object> responseMap = new HashMap<>();
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		boolean result = false;
		
		Integer storedDice = (Integer) request.getSession().getAttribute("findAccountDice_" + email); 
		
		if(storedDice == null) {
	        System.out.println("세션에 findAccountDice가 없습니다. 인증 요청이 만료되었거나 잘못되었습니다.");

	        String warning = "이메일 인증을 진행해주세요!";
	        
	        result = false;
	        
	        responseMap.put("success", result);
	        responseMap.put("warning", warning);
	        responseMap.put("userId", null);
	        
	        return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}

		if(storedDice == authNumber) {
			System.out.println("인증번호와 입력값 일치");
			
			request.getSession().removeAttribute("findAccountDice_" + email);
			request.getSession().removeAttribute("userId");
			
			String userId = userService.getUserUsedEmail(email).getUserId();
			
			result = true;
			
	        responseMap.put("success", result);
	        responseMap.put("warning", null);
	        responseMap.put("userId", userId);
	        
	        return new ResponseEntity<>(responseMap, HttpStatus.OK);
		} else {
			String warning = "인증번호와 입력값이 일치하지 않습니다!";
			
	        responseMap.put("success", result);
	        responseMap.put("warning", warning);
	        responseMap.put("userId", null);
			
	        return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
	}
	
	// 계정 찾기 인증 메소드(PW, Personal)
	@ResponseBody
	@RequestMapping(value = "/findPersonalPwDo", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> findPwDo(HttpServletRequest request, HttpServletResponse response, 
				int authNumber, String id, String email) throws IOException {		
		Map<String, Object> responseMap = new HashMap<>();
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		boolean result = false;
		Integer storedDice = (Integer) request.getSession().getAttribute("findAccountDice_" + email); 
		
		System.out.println(storedDice);
		
		if(storedDice == null) {
			System.out.println("세션에 인증번호가 존재하지 않음. 인증 요청이 만료됐거나 잘못됌");
			String warningReason = "세션에 인증번호가 존재하지 않습니다. 인증 요청이 만료됐거나 잘못됐습니다.";
			
			result = false;
			responseMap.put("success", result);
			responseMap.put("warning", warningReason);
			
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
		
		UserDTO user = userService.getUserUsedEmail(email);
		System.out.println(id);
		System.out.println(email);
		System.out.println(user);
		
		if(!user.getUserId().equals(id)) {
			System.out.println("아이디와 이메일이 일치하지 않음");
			
			String warningReason = "입력하신 아이디와 이메일이 서로 연동되어있지 않습니다.";
			
			result = false;
			
			responseMap.put("success", result);
			responseMap.put("warning", warningReason);
	
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
		
		if(storedDice == authNumber) {
			request.getSession().removeAttribute("findAccountDice_" + email);
			result = true;
			responseMap.put("success", result);
			responseMap.put("warning", null);
			
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		} else {
			String warningReason = "인증번호와 입력값이 일치하지 않습니다. 다시 한 번 확인해주세요.";
			
			result = false;
			responseMap.put("success", result);
			responseMap.put("warning", warningReason);
			
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
	}
	
	// 계정 찾기 인증 메소드(PW, Company)
	@ResponseBody
	@RequestMapping(value = "/findCompanyPwDo", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> findCompanyPwDo(HttpServletRequest request, HttpServletResponse response, 
				int authNumber, String id, String email, String regiNum) throws IOException {		
		Map<String, Object> responseMap = new HashMap<>();
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		boolean result = false;
		Integer storedDice = (Integer) request.getSession().getAttribute("findAccountDice_" + email); 
		
		System.out.println(storedDice);
		
		// 인증번호 체크
		if(storedDice == null) {
			System.out.println("세션에 인증번호가 존재하지 않음. 인증 요청이 만료됐거나 잘못됌");
			String warningReason = "세션에 인증번호가 존재하지 않습니다. 인증 요청이 만료됐거나 잘못됐습니다.";
			
			result = false;
			responseMap.put("success", result);
			responseMap.put("warning", warningReason);
			
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
		
		// 이메일로 UserDTO에 계정이 존재하는지(일치여부) 확인
		UserDTO user = userService.getUserUsedEmail(email);
		boolean userOn = user.getUserId().equals(id);

		// 등록번호로 CompanyDTO에 계정이 존재하는지(일치여부) 확인
		CompanyDTO company = userService.getCompanyUsedRegiNum(regiNum);
		boolean companyOn = company.getUserId().equals(id);
		
		if(!userOn) {
			System.out.println("아이디와 이메일이 일치하지 않음");
			
			String warningReason = "입력하신 아이디와 이메일이 서로 연동되어있지 않습니다.";
			
			result = false;
			
			responseMap.put("success", result);
			responseMap.put("warning", warningReason);
	
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
		
		if(!companyOn) {
			System.out.println("사업자등록번호와 아이디가 일치하지 않음");
			
			String warningReason = "입력하신 아이디에 등록된 사업자등록번호와 첨부하신 파일의 사업자등록번호가 일치하지 않습니다.";
			
			result = false;
			
			responseMap.put("success", result);
			responseMap.put("warning", warningReason);
	
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
		
		if(storedDice == authNumber) {
			request.getSession().removeAttribute("findAccountDice_" + email);
			result = true;
			responseMap.put("success", result);
			responseMap.put("warning", null);
			
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		} else {
			String warningReason = "인증번호와 입력값이 일치하지 않습니다. 다시 한 번 확인해주세요.";
			
			result = false;
			responseMap.put("success", result);
			responseMap.put("warning", warningReason);
			
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
	}
	
	// 분실한 아이디 이메일로 보내기
	@PostMapping("/sendLostId")
	public ResponseEntity<Void> sendLostId(String id, String email, HttpServletRequest request, 
	                                       HttpServletResponse response_email) throws IOException, MessagingException {
	    System.out.println("분실 아이디 메일 보내기 실행");
	    
	    String setfrom = "jjjjkuul@gmail.com";
	    String tomail = request.getParameter("email"); // 받는 사람 이메일
	    String title = "<저탄고집 웹사이트> 분실하신 아이디 입니다."; // 제목
	    String content = 
	            "<!DOCTYPE html>"
	            + "<html>"
	            + "<head><meta charset='UTF-8'><title>분실 아이디</title></head>"
	            + "<body style='margin: 0; padding: 0; font-family: Arial, sans-serif;'>"
	            + "<table width='100%' border='0' cellspacing='0' cellpadding='0' style='background-color: #f9f9f9; padding: 20px 0;'>"
	            + "<tr>"
	            + "<td align='center'>"
	            + "<table width='700' border='0' cellspacing='0' cellpadding='0' style='background-color: #ffffff; border: 3px solid #eeeeee; border-radius: 10px; padding: 20px;'>"
	            + "<tr>"
	            + "<td align='center' style='padding: 20px;'>"
	            + "<h2 style='color: #4CAF50; margin: 0;'>Project JTGJ</h2>"
	            + "</td>"
	            + "</tr>"
	            + "<tr>"
	            + "<td align='center' style='padding: 15px; font-size: 16px; color: #333;'>"
	            + "<p style='margin: 0;'>안녕하세요 회원님! 저희 홈페이지를 찾아주셔서 감사합니다.</p>"
	            + "</td>"
	            + "</tr>"
	            + "<tr>"
	            + "<td align='center' style='padding: 15px; font-size: 16px; color: #333;'>"
	            + "<p style='margin: 0;'>분실하신 아이디입니다! 확인이 됐으면 메일을 지워주세요!</p>"
	            + "</td>"
	            + "</tr>"
	            + "<tr>"
	            + "<td align='center' style='padding: 15px;'>"
	            + "<table border='0' cellspacing='0' cellpadding='0' style='background-color: #f9f9f9; border: 1px solid #ddd; padding: 10px; width: 40%; text-align: center;'>"
	            + "<tr>"
	            + "<td style='font-size: 20px; font-weight: bold; color: #333;'>"
	            + "아이디: <span style='color: #4CAF50;'>" + request.getParameter("id") + "</span>"
	            + "</td>"
	            + "</tr>"
	            + "</table>"
	            + "</td>"
	            + "</tr>"
	            + "<tr>"
	            + "<td align='center' style='padding: 15px; font-size: 12px; color: #888;'>"
	            + "본 이메일은 발신 전용이며, 회신은 처리되지 않습니다."
	            + "</td>"
	            + "</tr>"
	            + "</table>"
	            + "</td>"
	            + "</tr>"
	            + "</table>"
	            + "</body>"
	            + "</html>";

	    
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	    messageHelper.setFrom(setfrom);
	    messageHelper.setTo(tomail);
	    messageHelper.setSubject(title);
	    messageHelper.setText(content, true);
	    
	    mailSender.send(message);
	    System.out.println("메일 성공적으로 보내짐!");
	    
	    return ResponseEntity.ok().build(); // 빈 응답 전송 (200 OK)
	}	
	
	// 비밀번호 변경 메소드
	@ResponseBody
	@RequestMapping(value = "/changeUserPw", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> changeUserPw(String email, String password) {
		Map<String, Object> responseMap = new HashMap<>();
		
		boolean result = false;
		
		// 현재 비밀번호 불러오기
		String beforePw = userService.getPwUsedEmail(email);
		
		// 현재 비밀번호와 입력 비밀번호가 일치하는지 체크
		boolean isMatch = passwordEncoder.matches(password, beforePw);
		
		// 이전 비밀번호와 같다면?
		if(isMatch) {
			String warning = "이전 비밀번호와 같습니다. 다른 비밀번호를 입력해주세요!";
			
			responseMap.put("success", result);
			responseMap.put("warning", warning);
			
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
		
		// 다르다면 새로운 비밀번호로 암호화 후 update
		String encodePw = passwordEncoder.encode(password);
		userService.updateNewPw(encodePw, email);
		
		result = true;
		
		responseMap.put("success", result);
		responseMap.put("warning", null);
		
		return new ResponseEntity<>(responseMap, HttpStatus.OK);
	}
	
	// 사업자등록번호 중복체크 메서드
	@ResponseBody
	@RequestMapping(value = "/regiNumDuplicateCheck", method = RequestMethod.POST)
	public ResponseEntity<Boolean> regiNumDuplicateCheck(String regiNum) {
		Map<String, Object> responseMap = new HashMap<>();
		
		boolean result = false;
		
		System.out.println("사업자등록번호는 " + regiNum);
		
		CompanyDTO company = userService.getCompanyUsedRegiNum(regiNum);
		
		if(company == null) {
			System.out.println("중복된 사업자등록번호 존재하지 않음");
			
			result = true;
			return new ResponseEntity<>(result, HttpStatus.OK);
		}
		System.out.println("중복된 사업자등록번호 존재");

		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	
	// 프로필 이미지 업로드
	@ResponseBody
	@PostMapping(value = "/uploadProfile", produces = "application/json; charset=utf-8") 
	public Map<String, Object> uploadProfile(Model model, HttpSession session, MultipartFile file) { // 첨부된 이미지 파일을 로컬에 저장 -> 저장된 이미지 파일명을 Map에 담아 리턴 
	  
		Map<String, Object> result = new HashMap<>();
  
		String profImgName = null;
		
		if(file != null) {
			try {
				AttachDTO attach = fileUploadUtils.getAttachByMultipart(file, "prof_img");
				profImgName = attach.getAtchFileName(); // UUID 로 생성한 파일명
			} catch(IOException e) {
				e.printStackTrace();
				System.out.println("이미지 파일 저장 실패");
			}
		}
		
		UserDTO login = (UserDTO)session.getAttribute("login");
		login.setUserProfImg(profImgName);
		userService.editProfImg(login);
		result.put("result", profImgName);
		return result;
	}
	
	// 개인회원수정 페이지
	@RequestMapping("/personalEditView")
	public String personalEditView(HttpSession session, HttpServletResponse response) throws IOException {
		System.out.println("- personalEditView - ");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		UserDTO login = (UserDTO) session.getAttribute("login");
		session.setAttribute("atchtype", "prof_img");
		
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
	
	// 기업회원수정 페이지
	@RequestMapping("/companyEditView")
	public String companyEditView(HttpSession session, HttpServletResponse response) throws IOException{
		System.out.println("- companyEditView - ");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		UserDTO login = (UserDTO) session.getAttribute("login");
		session.setAttribute("atchtype", "prof_img");
		
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
	
	
	// 개인회원 회원수정
	@ResponseBody
	@PostMapping("/personalEditDo")
	public ResponseEntity<Boolean> personalEditDo(@RequestBody Map<String, Object> requestData, HttpSession session){
		System.out.println(" - Personal Edit Do - ");
		
		boolean result = false;
		
		System.out.println(requestData);
		
		String email = (String)requestData.get("userEmail");
		
		String encodePw;
		
		// UserDTO 매핑
		UserDTO user = new UserDTO();
		user.setUserId((String) requestData.get("userId"));
		user.setUserName((String) requestData.get("userName"));
		if(!requestData.get("userPw").equals("")) {
			encodePw = passwordEncoder.encode((String) requestData.get("userPw"));
			user.setUserPw(encodePw);
		} else {
			user.setUserPw(userService.getPwUsedEmail(email));
		}
		user.setUserPhone((String) requestData.get("userPhone"));
		user.setUserEmail((String) requestData.get("userEmail"));
		
		userService.updateC(user);
		
		result = true;
		
		UserDTO login = userService.getUserById(user.getUserId());
		session.setAttribute("login", login);
		
		return new ResponseEntity<>(result, HttpStatus.OK);

	}
	
	// 기업회원 회원수정
	@ResponseBody
	@PostMapping("/companyEditDo")
	public ResponseEntity<Boolean> companyEditDo(@RequestBody Map<String, Object> requestData, HttpSession session) {
		System.out.println(" - Company Edit Do - ");
		
		boolean result = false;
		
		System.out.println(requestData);
		
		int cpCarbonEmissions = Integer.parseInt((String) requestData.get("cpCarbonEmissions"));
		String email = (String)requestData.get("userEmail");
		
		String encodePw;
		
		// UserDTO 매핑
		UserDTO user = new UserDTO();
		user.setUserId((String) requestData.get("userId"));
		user.setUserName((String) requestData.get("userName"));
		if(!requestData.get("userPw").equals("")) {
			encodePw = passwordEncoder.encode((String) requestData.get("userPw"));
			user.setUserPw(encodePw);
		} else {
			user.setUserPw(userService.getPwUsedEmail(email));
		}
		user.setUserPhone((String) requestData.get("userPhone"));
		user.setUserEmail((String) requestData.get("userEmail"));

		// CompanyDTO 매핑
		CompanyDTO company = new CompanyDTO();
		company.setUserId((String) requestData.get("userId"));
		company.setCpOpenDate((String) requestData.get("cpOpenDate"));
		company.setCpAddress((String) requestData.get("cpAddress"));
		company.setCpCeoName((String) requestData.get("cpCeoName"));
		company.setCpCarbonEmissions(cpCarbonEmissions);

		// 데이터 베이스에 insert
		if(user != null && company != null) {
			userService.updateC(user);
			userService.updateCMore(company);

			result = true;
			
			// 세션 업데이트(user, company, address)
			UserDTO login = userService.getUserById(user.getUserId());
			CompanyDTO company_info = userService.getCompanyByUserId(company.getUserId());
			
			// 시간 포맷 수정(시,분,초 삭제)
			String v_companyDate = company_info.getCpOpenDate();
			v_companyDate = v_companyDate.split(" ")[0];
			company_info.setCpOpenDate(v_companyDate);
			
			String address = company.getCpAddress();
			String[] arr = address.split("\\|");
			
			List<String> addressDetails = new ArrayList<>();
			for(int i = 0; i < arr.length; i++) {			
				addressDetails.add(arr[i]);
			}
			
			session.setAttribute("login", login);
			session.setAttribute("company", company_info);
			session.setAttribute("address", addressDetails);
			
			return new ResponseEntity<>(result, HttpStatus.OK);
		} else {
			
			return new ResponseEntity<>(result, HttpStatus.OK);
		}
	}
	
}

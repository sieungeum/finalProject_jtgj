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

	@Inject // ���񽺸� ȣ���ϱ� ���ؼ� ������ ����
	JavaMailSender mailSender; // ���� ���񽺸� ����ϱ� ���� ������ ����	

	@RequestMapping("/home")
	public String test() {
		System.out.println(" - test - ");

		List<UserDTO> user = userService.userSelect();

		System.out.println(user);

		return "redirect:/";
	}

	// �α��� ȭ�� ����
	@RequestMapping("/loginView")
	public String loginView(HttpServletRequest request, Model model) {
		System.out.println(" - Login Page - ");

		String fromUrl = request.getHeader("Referer");
		System.out.println(fromUrl + "���� /loginView ��û");
		model.addAttribute("fromUrl", fromUrl);

		return "member/loginView";
	}

	// �α��� ����
	@PostMapping("/loginDo")
	public void loginDo(UserDTO user, HttpSession session, boolean rememberId, HttpServletResponse response,
			HttpServletRequest request, String fromUrl) throws IOException {
		UserDTO login = userService.loginUser(user);
		
		System.out.println(fromUrl);
		System.out.println(user);
		System.out.println(login);

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		if (login == null) { // �α��� ����(���̵� �����Ϳ� �������� ���� ���
			PrintWriter out = response.getWriter();
			out.println("<script>alert('�������� �ʴ� ���̵� �Դϴ�!');");
			out.println("history.go(-1);</script>");
			out.close();

			return;
		} 
		
		// ����ڰ� �Է��� ��й�ȣ�� ��ȣȭ�� ��й�ȣ�� ��ġ�ϴ��� üũ
		boolean isMatch = passwordEncoder.matches(user.getUserPw(), login.getUserPw());
		System.out.println(isMatch);
		
		if (!isMatch) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�!');");
			out.println("history.go(-1);</script>");
			out.close();

			return;
		} else {
			CompanyDTO company = userService.getCompanyByUserId(login.getUserId());
			
			if(company != null) {
				// �ð� ���� ����(��,��,�� ����)
				String v_companyDate = company.getCpOpenDate();
				v_companyDate = v_companyDate.split(" ")[0];
				company.setCpOpenDate(v_companyDate);
				
				// �ּ� �� ����
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
			// ���߿� �ּ�����!
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

	// �α׾ƿ� ����
	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session) {
		// ���� ����
		session.invalidate();

		return "redirect:/";
	}
	
	// ȸ������ ����â ����
	@RequestMapping("/selectSignUpView")
	public String selectSignUpView() {
		System.out.println(" - Regist Page - ");
		
		return "member/selectSignUpView";
	}

	// ����ȸ�� ���� ȭ�� ����
	@RequestMapping("/personalRegistView")
	public String personalRegistView() {
		System.out.println(" - Personal Regist Page - ");

		return "member/personalRegistView";
	}

	// ����ȸ�� ���� ����
	@PostMapping("/personalRegistDo")
	public void personalregistDo(UserDTO user, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		System.out.println(user);

		// ���̵� �ߺ����� �� alert�� ���
		if (userService.confirmId(user.getUserId())) {
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>alert('���̵� �ߺ��ƽ��ϴ�! �ٸ� ���̵� �Է����ּ���!');");
			out.println("history.go(-1);</script>");
			out.close();
		} else if (userService.confirmName(user.getUserName())) { // �г����� �ߺ����� �� alert�� ���
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			out.println("<script>alert('�г����� �ߺ��ƽ��ϴ�! �ٸ� �г����� �Է����ּ���!');");
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
					"<script>alert('ȯ���մϴ�!'); location.href='" + request.getContextPath() + "/loginView';</script>");
			out.close();
		}
	}

	// ���ȸ�� ���� ȭ�� ����
	@RequestMapping("/corporationRegistView")
	public String corporationRegistView() {
		System.out.println(" - Corporation Regist Page - ");

		return "member/corporationRegistView";
	}
	
	// ���ȸ�� ���� ����
	@ResponseBody
	@PostMapping("/corporationRegistDo")
	public ResponseEntity<Boolean> corporationRegistDo(@RequestBody Map<String, Object> requestData) {
		System.out.println(" - Corporation Regist Do - ");
		
		boolean result = false;
		
		System.out.println(requestData);

		int cpCarbonEmissions = Integer.parseInt((String) requestData.get("cpCarbonEmissions"));
		
		// UserDTO ����
		UserDTO user = new UserDTO();
		user.setUserId((String) requestData.get("userId"));
		user.setUserName((String) requestData.get("userName"));
		user.setUserPw((String) requestData.get("userPw"));
		user.setUserPhone((String) requestData.get("userPhone"));
		user.setUserEmail((String) requestData.get("userEmail"));
		System.out.println(user);

		// CompanyDTO ����
		CompanyDTO company = new CompanyDTO();
		company.setUserId((String) requestData.get("userId"));
		company.setCpRegiNum((String) requestData.get("cpRegiNum"));
		company.setCpOpenDate((String) requestData.get("cpOpenDate"));
		company.setCpAddress((String) requestData.get("cpAddress"));
		company.setCpCeoName((String) requestData.get("cpCeoName"));
		company.setCpCarbonEmissions(cpCarbonEmissions);
		System.out.println(company);
		
		// ������ ���̽��� insert
		if(user != null && company != null) {
			// ��й�ȣ ��ȣȭ
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

	// ���̵� �ߺ� ���� üũ
	@PostMapping("/ConfirmId")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> ConfirmId(@Valid @RequestBody UserDTO userDTO, BindingResult errResult) {
		Map<String, Object> responseMap = new HashMap<>();
		String warning;
		boolean result = true;
		
		// ��ȿ�� �˻� ��� Ȯ��
		if(errResult.hasErrors()) {
			warning = "���̵�� ���� �ҹ��� Ȥ�� ���ڷ� ������ 4 ~ 20 �ڸ��Դϴ�.";
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
			warning = "��� ������ ���̵� �Դϴ�!";
			responseMap.put("success", result);
	        responseMap.put("warning", warning);
	        
	        System.out.println(responseMap);
	        
	        return new ResponseEntity<>(responseMap, HttpStatus.OK);
		} else {
			warning = "�̹� �����ϴ� ���̵� �Դϴ�!";
			responseMap.put("success", result);
	        responseMap.put("warning", warning);
	        
	        System.out.println(responseMap);
	        
	        return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
	}

	// �г��� �ߺ� ���� üũ
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
	
	// ��й�ȣ �ߺ� ���� üũ
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
	
	// ��й�ȣ ��ȿ�� üũ
	@PostMapping("/pwValidation")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> pwValidation(@Valid @RequestBody UserDTO userDTO, BindingResult errResult) {
		Map<String, Object> responseMap = new HashMap<>();
		String msg;
		boolean result = false;
		
		System.out.println(userDTO);
		
		// ��ȿ�� �˻� ��� Ȯ��
		if(errResult.hasErrors()) {
			msg = "��й�ȣ�� �ҹ��� ���ĺ��� ���ڸ��� ���� 8 ~ 12�ڸ����� �մϴ�.";
			responseMap.put("success", result);
	        responseMap.put("msg", msg);
	        
	        return new ResponseEntity<>(responseMap, HttpStatus.OK);
		} 
		
		result = true;
		msg = "��밡���� ��й�ȣ �Դϴ�! ��й�ȣ �ߺ�üũ�� �������ּ���!";
		responseMap.put("success", result);
        responseMap.put("msg", msg);
        
        return new ResponseEntity<>(responseMap, HttpStatus.OK);
	}
	
	// ���� ã�� ������
	@RequestMapping("/findAccountView")
	public String findPersonalId() {
		System.out.println(" - Find Account Page - ");

		return "member/findAccountView";
	}

	// ���� ���� ID ã�� ������
	@RequestMapping("/findPersonalIdView")
	public String findPersonalIdView() {
		System.out.println(" - Find Personal ID Page - ");

		return "member/findPersonalIdView";
	}
	
	// ���� ���� PW ã�� ������
	@RequestMapping("/findPersonalPwView")
	public String findPersonalPwView() {
		System.out.println(" - Find Personal PW Page - ");

		return "member/findPersonalPwView";
	}
	
	// ��� ���� ID ã�� ������
	@RequestMapping("/findCorporationIdView")
	public String findCorporationIdView() {
		System.out.println(" - Find Corporation ID Page");
		
		return "member/findCorporationIdView";
	}
	
	// ��� ���� PW ã�� ������
	@RequestMapping("/findCorporationPwView")
	public String findCorporationPwView() {
		System.out.println(" - Find Corporation PW Page");
		
		return "member/findCorporationPwView";
	}
	
	// mailSending �ڵ�
	// ������ȣ�� ������!
	// �̸��� ����(ȸ�����Խ�) -> ���Ŀ� �̸��Ϸ� �����ϴ� ��� �������� ������ �� �ֵ��� ����� ������
	@ResponseBody
	@RequestMapping(value = "/ConfirmEmail", method = RequestMethod.POST)
	public ResponseEntity<Boolean> ConfirmEmail(HttpServletRequest request, String email,
			HttpServletResponse response_email) throws IOException {
		
		boolean result = false;
		
		System.out.println(email);
		// �̹� ������ �̸����̶�� ���̵� ã��� ������
		if(userService.confirmEmail(email)) {
			System.out.println("�̹� �����ϴ� �̸���");
			result = false;
			
			return new ResponseEntity<>(result, HttpStatus.OK);
		}
			
		Random r = new Random();
		int dice = r.nextInt(4589362) + 493111; // �̸��Ϸ� �޴� �����ڵ� �κ�(����)

		// �����ڵ� ���ǿ� ����
		request.getSession().setAttribute("dice_" + email, dice);
		
		String setfrom = "jjjjkuul@gmail.com";
		String tomail = request.getParameter("email"); // �޴� ��� �̸���
		String title = "��ź���� ������Ʈ ȸ������ ���� �̸��� �Դϴ�."; // ����
		String content = "<!DOCTYPE html>"
		        + "<html>"
		        + "<head><meta charset='UTF-8'><title>��ź���� ȸ������ ���� �̸���</title></head>"
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
		        + "<p style='margin: 0;'>�ȳ��ϼ��� ȸ����! ���� Ȩ�������� ã���ּż� �����մϴ�.</p>"
		        + "</td>"
		        + "</tr>"
		        + "<tr>"
		        + "<td align='center' style='padding: 15px; font-size: 16px; color: #333;'>"
		        + "<p style='margin: 0;'>�Ʒ� ������ȣ�� �Է��� ȸ�������� �Ϸ����ּ���.</p>"
		        + "</td>"
		        + "</tr>"
		        + "<tr>"
		        + "<td align='center' style='padding: 15px;'>"
		        + "<table border='0' cellspacing='0' cellpadding='0' style='background-color: #f9f9f9; border: 1px solid #ddd; padding: 10px; width: 40%;'>"
		        + "<tr>"
		        + "<td align='center' style='font-size: 20px; font-weight: bold; color: #333;'>"
		        + "������ȣ: <span style='color: #4CAF50;'>" + dice + "</span>"
		        + "</td>"
		        + "</tr>"
		        + "</table>"
		        + "</td>"
		        + "</tr>"
		        + "<tr>"
		        + "<td align='center' style='padding: 15px; font-size: 12px; color: #888;'>"
		        + "�� �̸����� �߽� �����̸�, ȸ���� ó������ �ʽ��ϴ�."
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
			messageHelper.setFrom(setfrom); // �����»�� �����ϸ� �����۵����� ����
			messageHelper.setTo(tomail); // �޴»�� �̸���
			messageHelper.setSubject(title); // ���������� ���� ����!
			messageHelper.setText(content, true); // HTML ���� ����
			mailSender.send(message);
			System.out.println("���� ���������� ������!");
			
			System.out.println(message);

			result = true;

		} catch (Exception e) {
			System.out.println(e);

			result = false;
		}

		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	// �̸��Ϸ� ���� ������ȣ�� �Է��ϰ� Ȯ�ι�ư�� ������ ���εǴ� �޼ҵ�
	// ������ȣ�� ��ġ�ϸ� true ��ȯ, ��ġ���� ������ false ��ȯ
	@ResponseBody
	@RequestMapping(value = "/ReConfirmEmail", method = RequestMethod.POST)
	public ResponseEntity<Boolean> ReConfirmEmail(HttpServletRequest request, int number, String email) throws IOException {
		System.out.println("��������");
		
		boolean result = true;
		
		int storedDice = (int) request.getSession().getAttribute("dice_" + email); 
		
		System.out.println(storedDice);

		if(storedDice == number) {
			System.out.println("������ȣ ��ġ");
			
			request.getSession().removeAttribute("dice_" + email);
			
			return new ResponseEntity<>(result, HttpStatus.OK);
		} else {
			System.out.println("������ȣ ����ġ");
			
			result = false;
			return new ResponseEntity<>(result, HttpStatus.OK);
		}
	}	
	
	// ����ã�� �̸��� ������ȣ ������
	@ResponseBody
	@RequestMapping(value = "/findAccountConfirmEmail", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> findAccountConfirmEmail(HttpServletRequest request, String email, String account,
			HttpServletResponse response_email, HttpServletResponse response) throws IOException, MessagingException {
		Map<String, Object> responseMap = new HashMap<>();

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		request.getSession().removeAttribute("findAccountDice_" + email);
		
		// js�� ���� �����͵�
		boolean result = false;
		String warning;
		String type;
		UserDTO userAccount = userService.getUserUsedEmail(email);
		
		if(userAccount == null) { // �̸��� ���� ���� Ȯ��
			System.out.println("���Ե��� ���� �̸���");
			
			result = false;
			type = "a";
			
			warning = "���Ե��� ���� �̸��� �Դϴ�.";
			
			responseMap.put("success", result);
	        responseMap.put("warning", warning);
	        responseMap.put("type", type);
	        
	        return new ResponseEntity<>(responseMap, HttpStatus.OK);
		} else if(!account.equals(userAccount.getUserAccount())){ // �̸����� �����ϳ� userAccount�� ��ġ���� ������?
			System.out.println("�̸����� �����ϳ� userAccount ����ġ");
			
			result = false;
			type = "b";
			responseMap.put("success", result);
			responseMap.put("type", type);
			
			if(account.equals("P")) {
				warning = "���ȸ������ ���Ե� �̸����Դϴ�.";
		        responseMap.put("warning", warning);
		        return new ResponseEntity<>(responseMap, HttpStatus.OK);
			} else {
				warning = "����ȸ������ ���Ե� �̸����Դϴ�.";
		        responseMap.put("warning", warning);
		        return new ResponseEntity<>(responseMap, HttpStatus.OK);
			}
		} else {
			result = true;
			type = "c";
			
			Random r = new Random();
			int findAccountDice = r.nextInt(4589362) + 493111; // �̸��Ϸ� �޴� �����ڵ� �κ�(����)
			System.out.println(findAccountDice);
			
			// ���ǿ� ���� ID�� �Բ� ���� ����
			request.getSession().setAttribute("findAccountDice_" + email, findAccountDice);
			
			String setfrom = "jjjjkuul@gmail.com";
			String tomail = request.getParameter("email"); // �޴� ��� �̸���
			String title = "��ź���� ������Ʈ ���̵�/��й�ȣ ã�� ���� �̸��� �Դϴ�."; // ����
			String content = "<!DOCTYPE html>"
			        + "<html>"
			        + "<head><meta charset='UTF-8'><title>��ź���� ���̵�/��й�ȣ ã�� ���� �̸���</title></head>"
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
			        + "<p style='margin: 0;'>�ȳ��ϼ��� ȸ����! ���� Ȩ�������� ã���ּż� �����մϴ�.</p>"
			        + "</td>"
			        + "</tr>"
			        + "<tr>"
			        + "<td align='center' style='padding: 15px; font-size: 16px; color: #333;'>"
			        + "<p style='margin: 0;'>�Ʒ� ������ȣ�� �Է��� ���̵�/��й�ȣ ã�⸦ �Ϸ����ּ���.</p>"
			        + "</td>"
			        + "</tr>"
			        + "<tr>"
			        + "<td align='center' style='padding: 15px;'>"
			        + "<table border='0' cellspacing='0' cellpadding='0' style='background-color: #f9f9f9; border: 1px solid #ddd; padding: 10px; width: 40%; text-align: center;'>"
			        + "<tr>"
			        + "<td style='font-size: 20px; font-weight: bold; color: #333;'>"
			        + "������ȣ: <span style='color: #4CAF50;'>" + findAccountDice + "</span>"
			        + "</td>"
			        + "</tr>"
			        + "</table>"
			        + "</td>"
			        + "</tr>"
			        + "<tr>"
			        + "<td align='center' style='padding: 15px; font-size: 12px; color: #888;'>"
			        + "�� �̸����� �߽� �����̸�, ȸ���� ó������ �ʽ��ϴ�."
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
			messageHelper.setFrom(setfrom); // �����»�� �����ϸ� �����۵����� ����
			messageHelper.setTo(tomail); // �޴»�� �̸���
			messageHelper.setSubject(title); // ���������� ���� ����!
			messageHelper.setText(content, true); // ���� ����
	
			mailSender.send(message);
			System.out.println("���� ���������� ������!");
			
			responseMap.put("success", result);
	        responseMap.put("warning", null);
	        responseMap.put("type", type);
			
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
	}	
	
	// ���� ã�� ���� �޼ҵ�(ID)
	@ResponseBody
	@RequestMapping(value = "/findIdDo", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> findIdDo(HttpServletRequest request, HttpServletResponse response, int authNumber, String email) throws IOException {		
		Map<String, Object> responseMap = new HashMap<>();
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		boolean result = false;
		
		Integer storedDice = (Integer) request.getSession().getAttribute("findAccountDice_" + email); 
		
		if(storedDice == null) {
	        System.out.println("���ǿ� findAccountDice�� �����ϴ�. ���� ��û�� ����Ǿ��ų� �߸��Ǿ����ϴ�.");

	        String warning = "�̸��� ������ �������ּ���!";
	        
	        result = false;
	        
	        responseMap.put("success", result);
	        responseMap.put("warning", warning);
	        responseMap.put("userId", null);
	        
	        return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}

		if(storedDice == authNumber) {
			System.out.println("������ȣ�� �Է°� ��ġ");
			
			request.getSession().removeAttribute("findAccountDice_" + email);
			request.getSession().removeAttribute("userId");
			
			String userId = userService.getUserUsedEmail(email).getUserId();
			
			result = true;
			
	        responseMap.put("success", result);
	        responseMap.put("warning", null);
	        responseMap.put("userId", userId);
	        
	        return new ResponseEntity<>(responseMap, HttpStatus.OK);
		} else {
			String warning = "������ȣ�� �Է°��� ��ġ���� �ʽ��ϴ�!";
			
	        responseMap.put("success", result);
	        responseMap.put("warning", warning);
	        responseMap.put("userId", null);
			
	        return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
	}
	
	// ���� ã�� ���� �޼ҵ�(PW, Personal)
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
			System.out.println("���ǿ� ������ȣ�� �������� ����. ���� ��û�� ����ưų� �߸���");
			String warningReason = "���ǿ� ������ȣ�� �������� �ʽ��ϴ�. ���� ��û�� ����ưų� �߸��ƽ��ϴ�.";
			
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
			System.out.println("���̵�� �̸����� ��ġ���� ����");
			
			String warningReason = "�Է��Ͻ� ���̵�� �̸����� ���� �����Ǿ����� �ʽ��ϴ�.";
			
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
			String warningReason = "������ȣ�� �Է°��� ��ġ���� �ʽ��ϴ�. �ٽ� �� �� Ȯ�����ּ���.";
			
			result = false;
			responseMap.put("success", result);
			responseMap.put("warning", warningReason);
			
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
	}
	
	// ���� ã�� ���� �޼ҵ�(PW, Company)
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
		
		// ������ȣ üũ
		if(storedDice == null) {
			System.out.println("���ǿ� ������ȣ�� �������� ����. ���� ��û�� ����ưų� �߸���");
			String warningReason = "���ǿ� ������ȣ�� �������� �ʽ��ϴ�. ���� ��û�� ����ưų� �߸��ƽ��ϴ�.";
			
			result = false;
			responseMap.put("success", result);
			responseMap.put("warning", warningReason);
			
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
		
		// �̸��Ϸ� UserDTO�� ������ �����ϴ���(��ġ����) Ȯ��
		UserDTO user = userService.getUserUsedEmail(email);
		boolean userOn = user.getUserId().equals(id);

		// ��Ϲ�ȣ�� CompanyDTO�� ������ �����ϴ���(��ġ����) Ȯ��
		CompanyDTO company = userService.getCompanyUsedRegiNum(regiNum);
		boolean companyOn = company.getUserId().equals(id);
		
		if(!userOn) {
			System.out.println("���̵�� �̸����� ��ġ���� ����");
			
			String warningReason = "�Է��Ͻ� ���̵�� �̸����� ���� �����Ǿ����� �ʽ��ϴ�.";
			
			result = false;
			
			responseMap.put("success", result);
			responseMap.put("warning", warningReason);
	
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
		
		if(!companyOn) {
			System.out.println("����ڵ�Ϲ�ȣ�� ���̵� ��ġ���� ����");
			
			String warningReason = "�Է��Ͻ� ���̵� ��ϵ� ����ڵ�Ϲ�ȣ�� ÷���Ͻ� ������ ����ڵ�Ϲ�ȣ�� ��ġ���� �ʽ��ϴ�.";
			
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
			String warningReason = "������ȣ�� �Է°��� ��ġ���� �ʽ��ϴ�. �ٽ� �� �� Ȯ�����ּ���.";
			
			result = false;
			responseMap.put("success", result);
			responseMap.put("warning", warningReason);
			
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
	}
	
	// �н��� ���̵� �̸��Ϸ� ������
	@PostMapping("/sendLostId")
	public ResponseEntity<Void> sendLostId(String id, String email, HttpServletRequest request, 
	                                       HttpServletResponse response_email) throws IOException, MessagingException {
	    System.out.println("�н� ���̵� ���� ������ ����");
	    
	    String setfrom = "jjjjkuul@gmail.com";
	    String tomail = request.getParameter("email"); // �޴� ��� �̸���
	    String title = "<��ź���� ������Ʈ> �н��Ͻ� ���̵� �Դϴ�."; // ����
	    String content = 
	            "<!DOCTYPE html>"
	            + "<html>"
	            + "<head><meta charset='UTF-8'><title>�н� ���̵�</title></head>"
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
	            + "<p style='margin: 0;'>�ȳ��ϼ��� ȸ����! ���� Ȩ�������� ã���ּż� �����մϴ�.</p>"
	            + "</td>"
	            + "</tr>"
	            + "<tr>"
	            + "<td align='center' style='padding: 15px; font-size: 16px; color: #333;'>"
	            + "<p style='margin: 0;'>�н��Ͻ� ���̵��Դϴ�! Ȯ���� ������ ������ �����ּ���!</p>"
	            + "</td>"
	            + "</tr>"
	            + "<tr>"
	            + "<td align='center' style='padding: 15px;'>"
	            + "<table border='0' cellspacing='0' cellpadding='0' style='background-color: #f9f9f9; border: 1px solid #ddd; padding: 10px; width: 40%; text-align: center;'>"
	            + "<tr>"
	            + "<td style='font-size: 20px; font-weight: bold; color: #333;'>"
	            + "���̵�: <span style='color: #4CAF50;'>" + request.getParameter("id") + "</span>"
	            + "</td>"
	            + "</tr>"
	            + "</table>"
	            + "</td>"
	            + "</tr>"
	            + "<tr>"
	            + "<td align='center' style='padding: 15px; font-size: 12px; color: #888;'>"
	            + "�� �̸����� �߽� �����̸�, ȸ���� ó������ �ʽ��ϴ�."
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
	    System.out.println("���� ���������� ������!");
	    
	    return ResponseEntity.ok().build(); // �� ���� ���� (200 OK)
	}	
	
	// ��й�ȣ ���� �޼ҵ�
	@ResponseBody
	@RequestMapping(value = "/changeUserPw", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> changeUserPw(String email, String password) {
		Map<String, Object> responseMap = new HashMap<>();
		
		boolean result = false;
		
		// ���� ��й�ȣ �ҷ�����
		String beforePw = userService.getPwUsedEmail(email);
		
		// ���� ��й�ȣ�� �Է� ��й�ȣ�� ��ġ�ϴ��� üũ
		boolean isMatch = passwordEncoder.matches(password, beforePw);
		
		// ���� ��й�ȣ�� ���ٸ�?
		if(isMatch) {
			String warning = "���� ��й�ȣ�� �����ϴ�. �ٸ� ��й�ȣ�� �Է����ּ���!";
			
			responseMap.put("success", result);
			responseMap.put("warning", warning);
			
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
		
		// �ٸ��ٸ� ���ο� ��й�ȣ�� ��ȣȭ �� update
		String encodePw = passwordEncoder.encode(password);
		userService.updateNewPw(encodePw, email);
		
		result = true;
		
		responseMap.put("success", result);
		responseMap.put("warning", null);
		
		return new ResponseEntity<>(responseMap, HttpStatus.OK);
	}
	
	// ����ڵ�Ϲ�ȣ �ߺ�üũ �޼���
	@ResponseBody
	@RequestMapping(value = "/regiNumDuplicateCheck", method = RequestMethod.POST)
	public ResponseEntity<Boolean> regiNumDuplicateCheck(String regiNum) {
		Map<String, Object> responseMap = new HashMap<>();
		
		boolean result = false;
		
		System.out.println("����ڵ�Ϲ�ȣ�� " + regiNum);
		
		CompanyDTO company = userService.getCompanyUsedRegiNum(regiNum);
		
		if(company == null) {
			System.out.println("�ߺ��� ����ڵ�Ϲ�ȣ �������� ����");
			
			result = true;
			return new ResponseEntity<>(result, HttpStatus.OK);
		}
		System.out.println("�ߺ��� ����ڵ�Ϲ�ȣ ����");

		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	
	// ������ �̹��� ���ε�
	@ResponseBody
	@PostMapping(value = "/uploadProfile", produces = "application/json; charset=utf-8") 
	public Map<String, Object> uploadProfile(Model model, HttpSession session, MultipartFile file) { // ÷�ε� �̹��� ������ ���ÿ� ���� -> ����� �̹��� ���ϸ��� Map�� ��� ���� 
	  
		Map<String, Object> result = new HashMap<>();
  
		String profImgName = null;
		
		if(file != null) {
			try {
				AttachDTO attach = fileUploadUtils.getAttachByMultipart(file, "prof_img");
				profImgName = attach.getAtchFileName(); // UUID �� ������ ���ϸ�
			} catch(IOException e) {
				e.printStackTrace();
				System.out.println("�̹��� ���� ���� ����");
			}
		}
		
		UserDTO login = (UserDTO)session.getAttribute("login");
		login.setUserProfImg(profImgName);
		userService.editProfImg(login);
		result.put("result", profImgName);
		return result;
	}
	
	// ����ȸ������ ������
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
			out.println("<script>alert('����ȸ���� ���� �����մϴ�!');");
			out.println("history.go(-1);</script>");
			out.close();
        } 
		
		return "myPage/personalEditView";
	}
	
	// ���ȸ������ ������
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
			out.println("<script>alert('���ȸ���� ���� �����մϴ�!');");
			out.println("history.go(-1);</script>");
			out.close();
        } 
		
		return "myPage/companyEditView";
	}
	
	
	// ����ȸ�� ȸ������
	@ResponseBody
	@PostMapping("/personalEditDo")
	public ResponseEntity<Boolean> personalEditDo(@RequestBody Map<String, Object> requestData, HttpSession session){
		System.out.println(" - Personal Edit Do - ");
		
		boolean result = false;
		
		System.out.println(requestData);
		
		String email = (String)requestData.get("userEmail");
		
		String encodePw;
		
		// UserDTO ����
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
	
	// ���ȸ�� ȸ������
	@ResponseBody
	@PostMapping("/companyEditDo")
	public ResponseEntity<Boolean> companyEditDo(@RequestBody Map<String, Object> requestData, HttpSession session) {
		System.out.println(" - Company Edit Do - ");
		
		boolean result = false;
		
		System.out.println(requestData);
		
		int cpCarbonEmissions = Integer.parseInt((String) requestData.get("cpCarbonEmissions"));
		String email = (String)requestData.get("userEmail");
		
		String encodePw;
		
		// UserDTO ����
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

		// CompanyDTO ����
		CompanyDTO company = new CompanyDTO();
		company.setUserId((String) requestData.get("userId"));
		company.setCpOpenDate((String) requestData.get("cpOpenDate"));
		company.setCpAddress((String) requestData.get("cpAddress"));
		company.setCpCeoName((String) requestData.get("cpCeoName"));
		company.setCpCarbonEmissions(cpCarbonEmissions);

		// ������ ���̽��� insert
		if(user != null && company != null) {
			userService.updateC(user);
			userService.updateCMore(company);

			result = true;
			
			// ���� ������Ʈ(user, company, address)
			UserDTO login = userService.getUserById(user.getUserId());
			CompanyDTO company_info = userService.getCompanyByUserId(company.getUserId());
			
			// �ð� ���� ����(��,��,�� ����)
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

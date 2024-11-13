package com.jtgj.finalProject.user.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;
import java.util.logging.Logger;

import javax.inject.Inject;
import javax.mail.MessagingException;
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
	public String loginDo(UserDTO user, HttpSession session, boolean rememberId, HttpServletResponse response,
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

			return null;
		} else if (!user.getUserPw().equals(login.getUserPw())) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�!');");
			out.println("history.go(-1);</script>");
			out.close();

			return null;
		} else {
			session.setAttribute("login", login);
			session.setMaxInactiveInterval(60 * 200);

			if (rememberId) {
				Cookie cookie = new Cookie("rememberId", user.getUserId());
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("rememberId", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}

			PrintWriter out = response.getWriter();
			if (fromUrl.contains("Do") || fromUrl.contains("find")) {
				out.println("<script>alert('ȯ���մϴ�!'); location.href='" + request.getContextPath() + "/';</script>");
				out.close();
			}
			out.println("<script>alert('ȯ���մϴ�!'); location.href='" + fromUrl + "';</script>");
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

	// ���̵� �ߺ� ���� üũ
	@PostMapping("/ConfirmId")
	@ResponseBody
	public ResponseEntity<Boolean> ConfirmId(String id) {
		boolean result = true;

		System.out.println(id);

		if (id.trim().isEmpty()) {
			result = false;
		} else {
			if (userService.confirmId(id)) {
				result = false;
			} else {
				result = true;
			}
		}

		return new ResponseEntity<>(result, HttpStatus.OK);
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

	// ������ �̹��� ���ε�
	@ResponseBody
	@PostMapping(value = "/uploadProfile", produces = "application/json; charset=utf-8")
	public Map<String, Object> uploadProfile(Model model, HttpSession session, MultipartFile file) {
		// ÷�ε� �̹��� ������ ���ÿ� ���� -> ����� �̹��� ���ϸ��� Map�� ��� ����
		Map<String, Object> result = new HashMap<>();

		String profImgName = null;

		if (file != null) {
			try {
				AttachDTO attach = fileUploadUtils.getAttachByMultipart(file);
				profImgName = attach.getAtchFileName(); // UUID �� ������ ���ϸ�
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("�̹��� ���� ���� ����");
			}
		}

		// ���� �α��� ���� ������� ���� ��������
		UserDTO login = (UserDTO) session.getAttribute("login");

		// ��� ���ÿ� ����� ������ �̹����� ���ϸ��� login ��ü ���ο� ����
		login.setUserProfImg(profImgName);

		// DB�� ȸ������ ������ ���� ������ �̹����� �ݿ�!
		userService.editProfImg(login);

		result.put("result", profImgName);

		return result;
	}

	// mailSending �ڵ�
	// ������ȣ�� ������!
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
		String content =

				System.getProperty("line.separator") + // �� �پ� �ٰ����� �α����� �ۼ�

						System.getProperty("line.separator") +

						"�ȳ��ϼ��� ȸ����! ���� Ȩ�������� ã���ּż� �����մϴ�."

						+ System.getProperty("line.separator")

						+ System.getProperty("line.separator")

						+ "������ȣ�� " + dice + " �Դϴ�!"; // ����

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom); // �����»�� �����ϸ� �����۵����� ����
			messageHelper.setTo(tomail); // �޴»�� �̸���
			messageHelper.setSubject(title); // ���������� ���� ����!
			messageHelper.setText(content); // ���� ����

			mailSender.send(message);
			System.out.println("���� ���������� ������!");

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
	
	// ����ã�� �̸��� ������ȣ ������
	@ResponseBody
	@RequestMapping(value = "/findAccountConfirmEmail", method = RequestMethod.POST)
	public ResponseEntity<Boolean> findIdConfirmEmail(HttpServletRequest request, String email,
			HttpServletResponse response_email) throws IOException, MessagingException {
		
		request.getSession().removeAttribute("findAccountDice_" + email);
		
		// result == true -> ���Ե� �̸���
		boolean result = false;
		
		if(!userService.confirmEmail(email)) {
			System.out.println("���Ե��� ���� �̸���");
			
			result = false;
			
			return new ResponseEntity<>(result, HttpStatus.OK);
		} else {
			Random r = new Random();
			int findAccountDice = r.nextInt(4589362) + 493111; // �̸��Ϸ� �޴� �����ڵ� �κ�(����)
			
			// ���ǿ� ���� ID�� �Բ� ���� ����
			request.getSession().setAttribute("findAccountDice_" + email, findAccountDice);
			
			String setfrom = "jjjjkuul@gmail.com";
			String tomail = request.getParameter("email"); // �޴� ��� �̸���
			String title = "��ź���� ������Ʈ ���̵� ã�� ���� �̸��� �Դϴ�."; // ����
			String content =

					System.getProperty("line.separator") + // �� �پ� �ٰ����� �α����� �ۼ�

							System.getProperty("line.separator") +

							"�ȳ��ϼ��� ȸ����! ���� Ȩ�������� ã���ּż� �����մϴ�."

							+ System.getProperty("line.separator")

							+ System.getProperty("line.separator")

							+ "������ȣ�� " + findAccountDice + " �Դϴ�!"; // ����


			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom); // �����»�� �����ϸ� �����۵����� ����
			messageHelper.setTo(tomail); // �޴»�� �̸���
			messageHelper.setSubject(title); // ���������� ���� ����!
			messageHelper.setText(content); // ���� ����
	
			mailSender.send(message);
			System.out.println("���� ���������� ������!");
	
			result = true;
			
			return new ResponseEntity<>(result, HttpStatus.OK);
		}
		
	}	
	
	// ���� ã�� ���� �޼ҵ�(ID)
	@ResponseBody
	@RequestMapping(value = "/findPersonalIdDo", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> findPersonalIdDo(HttpServletRequest request, HttpServletResponse response, int authNumber, String email) throws IOException {		
		Map<String, Object> responseMap = new HashMap<>();
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		boolean result = false;
		
		Integer storedDice = (Integer) request.getSession().getAttribute("findAccountDice_" + email); 
		
		if(storedDice == null) {
	        System.out.println("���ǿ� findAccountDice�� �����ϴ�. ���� ��û�� ����Ǿ��ų� �߸��Ǿ����ϴ�.");

	        String warning = "�̸��� ������ ���� �������ּ���!";
	        
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
			
			String userId = userService.getIdUsedEmail(email);
			
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
	
	// ���� ã�� ���� �޼ҵ�(PW)
	@ResponseBody
	@RequestMapping(value = "/findPersonalPwDo", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> findPersonalPwDo(HttpServletRequest request, HttpServletResponse response, 
				int authNumber, String id, String email) throws IOException {		
		Map<String, Object> responseMap = new HashMap<>();
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		boolean result = false;
		Integer storedDice = (Integer) request.getSession().getAttribute("findAccountDice_" + email); 
		
		if(storedDice == null) {
			System.out.println("���ǿ� ������ȣ�� �������� ����. ���� ��û�� ����ưų� �߸���");
			String warningReason = "���ǿ� ������ȣ�� �������� �ʽ��ϴ�. ���� ��û�� ����ưų� �߸��ƽ��ϴ�.";
			
			result = false;
			responseMap.put("success", result);
			responseMap.put("warning", warningReason);
			
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
		
		boolean check = id.equals(userService.getIdUsedEmail(email));
		System.out.println(id);
		System.out.println(email);
		System.out.println(check);
		
		if(!check) {
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
	
	// ��й�ȣ ���� �޼ҵ�
	@ResponseBody
	@RequestMapping(value = "/changeUserPw", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> changeUserPw(String email, String password) {
		Map<String, Object> responseMap = new HashMap<>();
		
		boolean result = false;
		
		// ���� ��й�ȣ �ҷ�����
		String beforePw = userService.getPwUsedEmail(email);
		
		// ���� ��й�ȣ�� ���ٸ�?
		if(beforePw.equals(password)) {
			String warning = "���� ��й�ȣ�� �����ϴ�. �ٸ� ��й�ȣ�� �Է����ּ���!";
			
			responseMap.put("success", result);
			responseMap.put("warning", warning);
			
			return new ResponseEntity<>(responseMap, HttpStatus.OK);
		}
		
		// �ٸ��ٸ� ���ο� ��й�ȣ�� update
		userService.updateNewPw(password, email);
		
		result = true;
		
		responseMap.put("success", result);
		responseMap.put("warning", null);
		
		return new ResponseEntity<>(responseMap, HttpStatus.OK);
	}
}

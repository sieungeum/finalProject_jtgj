package com.jtgj.finalProject.faq.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jtgj.finalProject.faq.dto.FaqDTO;
import com.jtgj.finalProject.faq.service.FaqService;
import com.jtgj.finalProject.user.dto.UserDTO;

@Controller
public class FaqController {
	
	@Autowired
	FaqService faqService;
	
	@RequestMapping("/faqView")
	public String FaqView(Model model) {
		
		List<FaqDTO> faqList = faqService.getFaqList();
		
		model.addAttribute("faqList", faqList);
		
		return "faq/faqView";
	}
	
	@RequestMapping("/faqWriteView")
	public String faqWriteView(HttpSession session) {
		
		if(session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		
		return "faq/faqWriteView";
	}
	
	@PostMapping("faqWriteDo")
	public String faqWriteDo(FaqDTO faq, HttpSession session) {
		System.out.println(faq);
		
		UserDTO login = (UserDTO)session.getAttribute("login");
	    if (login != null) {
	        String userId = login.getUserId();
	        faq.setUserId(userId);  // FaqDTO에 userId를 설정
	    } else {
	        return "redirect:/loginView";  // 로그인 정보가 없으면 로그인 페이지로 리다이렉트
	    }
		
		faqService.writeFaq(faq);
		
		return "redirect:/faqView";
		
	}
	
}

 package com.jtgj.finalProject.admin.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jtgj.finalProject.admin.service.AdminFaqService;
import com.jtgj.finalProject.admin.service.AdminService;
import com.jtgj.finalProject.estimate.dto.EstimateDTO;
import com.jtgj.finalProject.estimate.service.EstimateService;
import com.jtgj.finalProject.faq.dto.CommentDTO;
import com.jtgj.finalProject.faq.dto.FaqDTO;
import com.jtgj.finalProject.user.dto.UserDTO;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	AdminFaqService adminfaqService;
	
	@Autowired
	EstimateService estimateService;
	
	@RequestMapping("/adminPage")
	public String adminPage(Model model) {
		System.out.println("- adminPage - ");
		

		
		List<UserDTO> userList = adminService.getUserList();
		model.addAttribute("userList", userList);
		
		List<FaqDTO> faqList = adminfaqService.getFaqList();
		model.addAttribute("faqList", faqList);
		
		List<EstimateDTO> basicMatter = estimateService.basic_mater();
		model.addAttribute("basicMatter", basicMatter);
		
		return "myPage/adminPage";
	}
	
	@RequestMapping("/adminMateEditView")
	public String adminMateEditView(int materNo, Model model) {
		System.out.println("- adminMateEditView - ");
		
		List<EstimateDTO> basicMatter = estimateService.basic_mater();
		model.addAttribute("basicMatter", basicMatter);
		
		return "myPage/adminMateEditView";
	}
	
	
	
	@PostMapping("/userDo")
	public String userDo(UserDTO user) {
		System.out.println(user);
		
		adminService.userDo(user);
		
		return "redirect:/adminPage";
		
	}
	
	@PostMapping("/userProDo")
	public String userProDo(UserDTO user) {
		System.out.println(user);
		
		adminService.userProDo(user);
		
		return "redirect:/adminPage";
		
	}
	
	@PostMapping("/userLDo")
	public String userLDo(UserDTO user) {
		System.out.println(user);
		
		adminService.userLDo(user);
		
		return "redirect:/adminPage";
		
	}
	
	@PostMapping("/userDelDo")
	public String userDelDo(UserDTO user) { 
		System.out.println(user);
		
		adminService.userDelDo(user);
		
		return "redirect:/adminPage";
		
	}
	
	
	@RequestMapping("/myPage")
	public String myPage(Model model) {
		System.out.println("- myPage - ");
		
		
		List<FaqDTO> faqList = adminfaqService.getFaqList();
		
		model.addAttribute("faqList", faqList);
		
		return "myPage/index";
	}
	
	@RequestMapping("/promotion")
	public String promotion(Model model) {
		System.out.println("- promotion - ");
		List<FaqDTO> faqList = adminfaqService.getFaqList();
		
		model.addAttribute("faqList", faqList);
		
		return "myPage/promotion";
	}
	
	

	
	
}


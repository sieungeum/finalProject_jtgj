 package com.jtgj.finalProject.admin.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jtgj.finalProject.admin.service.AdminFaqService;
import com.jtgj.finalProject.admin.service.AdminService;
import com.jtgj.finalProject.attach.dto.AttachDTO;
import com.jtgj.finalProject.common.util.FileUploadUtils;
import com.jtgj.finalProject.estimate.dto.EstimateDTO;
import com.jtgj.finalProject.estimate.service.EstimateService;
import com.jtgj.finalProject.faq.dto.CommentDTO;
import com.jtgj.finalProject.faq.dto.FaqDTO;
import com.jtgj.finalProject.faq.dto.NoticeDTO;
import com.jtgj.finalProject.faq.service.FaqService;
import com.jtgj.finalProject.user.dto.UserDTO;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	FaqService faqService;
	
	@Autowired
	AdminFaqService adminfaqService;
	
	@Autowired
	EstimateService estimateService;
	
	@Autowired
	FileUploadUtils fileUploadUtils;
	
	
	@RequestMapping("/adminPage")
	public String adminPage(Model model) {
		System.out.println("- adminPage - ");
		
		
		List<UserDTO> userList = adminService.getUserList();
		model.addAttribute("userList", userList);
		
		List<FaqDTO> faqList = adminfaqService.getFaqList();
		model.addAttribute("faqList", faqList);
		
		
		List<EstimateDTO> allMatter = adminService.all_mater();
		model.addAttribute("allMatter", allMatter);
		
		return "myPage/adminPage";
	}
	
	@RequestMapping("/adminMateEditView")
	public String adminMateEditView(int materNo, Model model) {
		System.out.println("- adminMateEditView - ");
		
		EstimateDTO mater = adminService.getMater(materNo);
		
		model.addAttribute("mater", mater);
		
		return "myPage/adminMateEditView";
	}
	
	@PostMapping("/editMater")
	public String editMater(EstimateDTO mater) {
		
		adminService.editMater(mater);
		
		return "redirect:/adminPage";
	}
	
	@RequestMapping("/materWriteView")
	public String materWriteView() {
		System.out.println("- materWriteView - ");
		
		return "myPage/materWriteView";
	}
	
	
	@PostMapping("/writeMater")
	public String writeMater(EstimateDTO mater) {
		
		adminService.writeMater(mater);
		
		return "redirect:/adminPage";
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
	
	@PostMapping("/faqAstDo")
	public String faqAstDo(FaqDTO faqAst) {
		System.out.println(faqAst);
		
		adminService.faqAstDo(faqAst);
		
		return "redirect:/adminPage";
		
	}
	
	@PostMapping("/faqAstDelDo")
	public String faqAstDelDo(FaqDTO faqAst) {
		System.out.println(faqAst);
		
		adminService.faqAstDelDo(faqAst);
		
		return "redirect:/adminPage";
		
	}
	

	
	
	@RequestMapping("/myPage")
	public String myPage(Model model) {
		System.out.println("- myPage - ");
		
		List<NoticeDTO> notiList = adminService.getNotiList();
		model.addAttribute("notiList", notiList);
		
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


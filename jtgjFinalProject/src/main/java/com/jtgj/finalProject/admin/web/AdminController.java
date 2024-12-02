 package com.jtgj.finalProject.admin.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jtgj.finalProject.admin.service.AdminFaqService;
import com.jtgj.finalProject.admin.service.AdminService;
import com.jtgj.finalProject.attach.dto.AttachDTO;
import com.jtgj.finalProject.common.util.FileUploadUtils;
import com.jtgj.finalProject.companyBoard.dto.CompanyBoardDTO;
import com.jtgj.finalProject.companyBoard.service.CompanyBoardService;
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
	
	@Autowired
	CompanyBoardService companyBoardService;
	
	
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
		
		// adminService.editMater(mater);
		
		return "redirect:/adminPage";
	}
	
	@RequestMapping("/materWriteView")
	public String materWriteView() {
		System.out.println("- materWriteView - ");
		
		return "myPage/materWriteView";
	}
	
	
	// 자재 추가
	@ResponseBody
	@PostMapping("/writeMater")
	public ResponseEntity<Boolean> writeMaterTest(
	@RequestParam("materCategory") String materCategory,
	@RequestParam("beforeCategory") String beforeCategory,
    @RequestParam("materName") String materName,
    @RequestParam("materGasKg") double materGasKg,
    @RequestParam("materPrice") int materPrice,
    @RequestParam("materDurabilit") String materDurabilit,
    @RequestParam("materInfo") String materInfo,
    @RequestParam("materClassify") String materClassify,
    @RequestParam("materNo") int materNo,
    @RequestParam("roleClassification") String roleClassification,
    @RequestPart(value = "file", required = false) MultipartFile file) {
		
		EstimateDTO estimate = new EstimateDTO();
		
		System.out.println(materNo);
		
		estimate.setMaterCategory(materCategory);
		estimate.setMaterName(materName);
		estimate.setMaterGasKg(materGasKg);
		estimate.setMaterPrice(materPrice);
		estimate.setMaterDurability(materDurabilit);
		estimate.setMaterInfo(materInfo);
		estimate.setMaterClassify(materClassify);

		String profImgName = null;
		
        if (file != null && !file.isEmpty()) {
			try {
				AttachDTO attach = fileUploadUtils.getAttachByMultipart(file, "mater_img");
				profImgName = attach.getAtchFileName(); // UUID 로 생성한 파일명
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("이미지 파일 저장 실패");
			}
        } else {
        	profImgName = "N";
        }
        
        estimate.setMaterImg(profImgName);

//        if(roleClassification.equals("edit")) {
//    		estimate.setMaterNo(materNo);        	
//        	System.out.println(estimate);
//			adminService.editMater(estimate); 
//        	
//        	return new ResponseEntity<>(true, HttpStatus.OK);
//        }
        if(roleClassification.equals("edit")) {
    		estimate.setMaterNo(materNo);
        	System.out.println(estimate);
			adminService.editMater(estimate, beforeCategory); 
        	
        	return new ResponseEntity<>(true, HttpStatus.OK);
        }
        
		
		 adminService.writeMater(estimate);
		 
		return new ResponseEntity<>(true, HttpStatus.OK);
	}
	
	// 자재 삭제
	@ResponseBody
	@PostMapping("/deleteMater")
	public ResponseEntity<Boolean> deleteMater(int materNo) {
		
		System.out.println(materNo);
		
		adminService.deleteMater(materNo);
		
		return new ResponseEntity<>(true, HttpStatus.OK);
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
	
	@RequestMapping("/companyBoardWriteViewAd")
	public String companyBoardWriteViewAd(HttpSession session) {
		System.out.println();
		System.out.println("companyBoardWriteViewAd");

		// sjm
		UserDTO login = (UserDTO) session.getAttribute("login");
		
		int cpNum;
		try {
			cpNum = companyBoardService.getNumComBoard(login.getUserId());
			
			String v_url = "?cpBoardNo=" + cpNum;
			
			System.out.println(v_url);
			
			return "redirect:/companyBoardDetailView" + v_url;
		} catch (Exception e) {
			cpNum = 0;
			return "companyBoard/companyBoardWriteView";
		}
		
		
	}
	
	@PostMapping("/companyBoardDetailView")
	public String companyBoardDetailView() {
		System.out.println();
		
		
		return "companyBoard/companyBoardDetailView";
		
	}
	
	@GetMapping("/noinjungCompany")
	public String noinjungCompany() {
		System.out.println("되나?");
		
		
		return "myPage/noinjungCompany";
		
	}
	
	
	@RequestMapping("/myPage")
	public String myPage(Model model) {
		System.out.println("- myPage - ");
		
		List<NoticeDTO> notiList = adminService.getNotiList();
		model.addAttribute("notiList", notiList);
		
		List<FaqDTO> faqList = adminfaqService.getFaqList();
		model.addAttribute("faqList", faqList);
		
		List<CompanyBoardDTO> CBList = adminService.getCBList();
		model.addAttribute("CBList", CBList);
		
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


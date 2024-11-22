package com.jtgj.finalProject.companyBoard.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jtgj.finalProject.companyBoard.dto.CompanyBoardDTO;
import com.jtgj.finalProject.companyBoard.service.CompanyBoardService;
import com.jtgj.finalProject.user.dto.UserDTO;

@Controller
public class CompanyBoardController {
	
	@Autowired
	CompanyBoardService companyBoardService;
	
	@RequestMapping("/companyBoardView")
	public String companyBoardView(Model model) {
		
		List<CompanyBoardDTO> companyBoardList = companyBoardService.getCompanyBoardList();
		
		model.addAttribute("companyBoardList", companyBoardList);
		
		return "companyBoard/companyBoardView";
		
	}
	
	@RequestMapping("/companyBoardWriteView")
	public String companyBoardWriteView(HttpSession session) {
		
		if(session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		
		return "companyBoard/companyBoardWriteView";
		
	}
	
	@PostMapping("/companyBoardWriteDo")
	public String  companyBoardWriteDo(CompanyBoardDTO companyBoard, HttpSession session) {
		
		System.out.println(companyBoard);
		
		UserDTO login = (UserDTO)session.getAttribute("login");
		String userId = login.getUserId();
		companyBoard.setUserId(userId);
		
		companyBoardService.writeCompanyBoard(companyBoard);
		
		return "redirect:/companyBoardView";
		
	}
	
}

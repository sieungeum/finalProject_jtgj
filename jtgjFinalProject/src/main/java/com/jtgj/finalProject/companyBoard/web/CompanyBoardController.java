package com.jtgj.finalProject.companyBoard.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jtgj.finalProject.companyBoard.dto.CompanyBoardDTO;
import com.jtgj.finalProject.companyBoard.service.CompanyBoardService;

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
	
}

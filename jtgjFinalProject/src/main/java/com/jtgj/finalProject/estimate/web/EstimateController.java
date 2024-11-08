package com.jtgj.finalProject.estimate.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jtgj.finalProject.estimate.dto.EstimateDTO;
import com.jtgj.finalProject.estimate.service.EstimateService;

@Controller
public class EstimateController {
	
	@Autowired
	EstimateService estimateService;
	
	@RequestMapping("/estimateHome")
	public String estimateHome(Model model) {
		System.out.println(" - estimateHome - ");
		
		List<EstimateDTO> basicMatter = estimateService.basic_mater();
		
		System.out.println(basicMatter);
		
		model.addAttribute("basicMatter", basicMatter);
		
		return "estimate/estimateHome";
	}
	
	@ResponseBody
	@PostMapping("/getMaterials")
	public List<EstimateDTO> getMaterials(String materCategory) {
		System.out.println(" - getMaterials - ");
		
		List<EstimateDTO> categoryMater = estimateService.categoryMater(materCategory);
		
		return categoryMater;
	}
}

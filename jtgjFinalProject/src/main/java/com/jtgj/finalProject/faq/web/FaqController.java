package com.jtgj.finalProject.faq.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jtgj.finalProject.common.dto.SearchDTO;
import com.jtgj.finalProject.common.vo.PageSearchVO;
import com.jtgj.finalProject.faq.dto.CommentDTO;
import com.jtgj.finalProject.faq.dto.FaqDTO;
import com.jtgj.finalProject.faq.service.FaqService;
import com.jtgj.finalProject.user.dto.UserDTO;

@Controller
public class FaqController {
	
	@Autowired
	FaqService faqService;
	
	@RequestMapping("/faqView")
	public String FaqView(Model model, PageSearchVO pageSearch) {
		
		System.out.println(pageSearch);
		
		int totalRowCount = faqService.getFaqCount(pageSearch);
		
		pageSearch.setTotalRowCount(totalRowCount);
		pageSearch.pageSetting();
		
		List<FaqDTO> faqList = faqService.getFaqList(pageSearch);
		
		model.addAttribute("faqList", faqList);
		model.addAttribute("pageSearch", pageSearch);
		
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
	        String userName = login.getUserName();
	        faq.setUserName(userName);
	    } else {
	        return "redirect:/loginView";  // 로그인 정보가 없으면 로그인 페이지로 리다이렉트
	    }
		
		faqService.writeFaq(faq);
		
		return "redirect:/faqView";
		
	}
	
	@RequestMapping("/faqDetailView")
	public String faqDeatailView(int faqNo, Model model) {
		System.out.println("클릭한 게시글의 번호: "  +  faqNo + "번");
		
		FaqDTO faq = faqService.getFaq(faqNo);
		
		List<CommentDTO> comList = faqService.getCommentList(faqNo);
		
		model.addAttribute("faq", faq);
		model.addAttribute("comList", comList);
		
		return "faq/faqDetailView";
	}
	
	@RequestMapping(value = "/faqEditView", method=RequestMethod.POST)
	public String faqEditView(int faqNo, Model model) {
		FaqDTO faq = faqService.getFaq(faqNo);
		model.addAttribute("faq", faq);
		return "faq/faqEditView";
	}
	
	@PostMapping("faqEditDo")
	public String faqEditDo(FaqDTO faq) {
		faqService.editFaq(faq);
		return "redirect:/faqView";
	}
	
	@PostMapping("faqDeleteDo")
	public String faqDeleteDo(int faqNo) {
		faqService.deleteFaq(faqNo);
		
		return "redirect:/faqView";
	}
	
	@ResponseBody
	@PostMapping("writeComDo")
	public CommentDTO writeComDo(CommentDTO com) {
		System.out.println("======= writeComDo start ========");
		System.out.println(com);
		
		// 유니크 아이디 생성
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
		String uniqueId = sdf.format(date);
		
		for(int i = 0; i < 3; i++) {
			uniqueId += (int)(Math.random() * 10);
		}
		
		com.setComNo(uniqueId);
		
		// 체크박스 value가 null일때 'N'으로 바꾸기
		if (com.getComSicYn() == null || com.getComSicYn().isEmpty()) {
	        com.setComSicYn("N");
	    }
		
		System.out.println(com);
		faqService.writeComment(com);
		
		CommentDTO result = faqService.getComment(uniqueId);
		System.out.println(result);
		System.out.println("=======writeComDo end=======");
		return result;
		
	}
	
	@ResponseBody
	@PostMapping("/delComDo")
	public String delComDo(@RequestBody CommentDTO com) {
		System.out.println(com);
		String result = "fail";
		
		int cnt = faqService.delComment(com.getComNo());
		
		if(cnt > 0) {
			result = "success";
		}
		
		return result;
		
	}
	
}

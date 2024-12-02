package com.jtgj.finalProject.faq.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Multipart;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jtgj.finalProject.attach.dto.AttachDTO;
import com.jtgj.finalProject.attach.service.AttachService;
import com.jtgj.finalProject.common.dto.SearchDTO;
import com.jtgj.finalProject.common.util.FileUploadUtils;
import com.jtgj.finalProject.common.vo.PageSearchVO;
import com.jtgj.finalProject.faq.dto.CommentDTO;
import com.jtgj.finalProject.faq.dto.FaqDTO;
import com.jtgj.finalProject.faq.dto.NoticeDTO;
import com.jtgj.finalProject.faq.service.FaqService;
import com.jtgj.finalProject.user.dto.UserDTO;
import com.jtgj.finalProject.user.service.UserService;

@Controller
public class FaqController {
	
	@Autowired
	FaqService faqService;
	
	@Autowired
	AttachService attachService;
	
	@Autowired
	FileUploadUtils fileUploadUtils;
	
	@RequestMapping("/faqView")
	public String FaqView(Model model, PageSearchVO pageSearch) {
		
		System.out.println(pageSearch);
		
		int totalRowCount = faqService.getFaqCount(pageSearch);
		
		pageSearch.setTotalRowCount(totalRowCount);
		pageSearch.pageSetting();
		
		List<FaqDTO> faqList = faqService.getFaqList(pageSearch);
		List<NoticeDTO> noticeList = faqService.getNoticeList();
		
		model.addAttribute("faqList", faqList);
		model.addAttribute("pageSearch", pageSearch);
		model.addAttribute("noticeList", noticeList);
		
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
	public String faqWriteDo(FaqDTO faq, HttpSession session, MultipartFile[] boFile) {
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
	    
	    // 글번호 가져오기
	    int atchParentNo = faqService.getFaqNo();
	    
	    // 첨부된 파일 존재할시 로컬에 저장후 db에 전
	    if(boFile != null && boFile.length > 0 && !boFile[0].isEmpty()) {
	    	System.out.println("파일 개수: " + boFile.length);
	    	try {
	    		List<AttachDTO> attachList = fileUploadUtils.getAttachListByMultiparts(boFile, "faq");
	    		if(!attachList.isEmpty()) {
	    			for(AttachDTO attach : attachList) {
	    				attach.setAtchParentNo(atchParentNo);
	    				attachService.insertAttach(attach);
	    			}
	    			
	    		}
	    	} catch (IOException e) {
	    		e.printStackTrace();
	    		System.out.println("첨부 파일 업로드중 오류 발생");
	    		return "error/errorPath500";
	    	}
	    }
		
		faqService.writeFaq(faq);
		
		return "redirect:/faqView";
		
	}
	
	@RequestMapping("/faqDetailView")
	public String faqDeatailView(int faqNo, Model model) {
		System.out.println("클릭한 게시글의 번호: "  +  faqNo + "번");
		
		FaqDTO faq = faqService.getFaq(faqNo);
		
		// 해당 게시글의 댓글
		List<CommentDTO> comList = faqService.getCommentList(faqNo);
		
		// 해당 게시글의 첨부 파일
		List<AttachDTO> attachList = attachService.getAttachList(faqNo, "faq");
		
		model.addAttribute("faq", faq);
		model.addAttribute("comList", comList);
		model.addAttribute("attachList", attachList);
		
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
		
		// 체크박스가 체크되지 않은 경우 'N'으로 설정
	    if (faq.getFaqSicYn() == null || faq.getFaqSicYn().isEmpty()) {
	        faq.setFaqSicYn("N");
	    }
		
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
	
	// 공지사항
	
	@RequestMapping("/noticeWriteView")
	public String noticeWriteView(HttpSession session) {
		
		if(session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		
		return "faq/noticeWriteView";
		
	}
	
	@PostMapping("/noticeWriteDo")
	public String faqWriteDo(NoticeDTO notice, HttpSession session, MultipartFile[] boFile) {
		System.out.println(notice);
		
		UserDTO login = (UserDTO)session.getAttribute("login");
	    if (login != null) {
	        String userId = login.getUserId();
	        notice.setUserId(userId);  // FaqDTO에 userId를 설정
	        String userName = login.getUserName();
	        notice.setUserName(userName);
	    } else {
	        return "redirect:/loginView";  // 로그인 정보가 없으면 로그인 페이지로 리다이렉트
	    }
	    
	    // 글번호 가져오기
	    int atchParentNo = faqService.getNoticeNo();
	    
	    // 첨부된 파일 존재할시 로컬에 저장후 db에 전
	    if(boFile != null && boFile.length > 0 && !boFile[0].isEmpty()) {
	    	System.out.println("파일 개수: " + boFile.length);
	    	try {
	    		List<AttachDTO> attachList = fileUploadUtils.getAttachListByMultiparts(boFile, "notice");
	    		if(!attachList.isEmpty()) {
	    			for(AttachDTO attach : attachList) {
	    				attach.setAtchParentNo(atchParentNo);
	    				attachService.insertAttach(attach);
	    			}
	    			
	    		}
	    	} catch (IOException e) {
	    		e.printStackTrace();
	    		System.out.println("첨부 파일 업로드중 오류 발생");
	    		return "error/errorPath500";
	    	}
	    }
		
		faqService.writeNotice(notice);
		
		return "redirect:/faqView";
		
	}
	
	@RequestMapping("/noticeDetailView")
	public String noticeDetailView(int noticeNo, Model model) {
		System.out.println("클릭한 게시글의 글번호: " + noticeNo);
		
		NoticeDTO notice = faqService.getNotice(noticeNo);
		
		// 해당 게시글의 첨부 파일
		List<AttachDTO> attachList = attachService.getAttachList(noticeNo, "notice");
		
		model.addAttribute("notice", notice);
		model.addAttribute("attachList", attachList);
		
		return "faq/noticeDetailView";
	}
	
	@RequestMapping(value = "/noticeEditView", method=RequestMethod.POST)
	public String noticeEditView(int noticeNo, Model model) {
		NoticeDTO notice = faqService.getNotice(noticeNo);
		model.addAttribute("notice", notice);
		return "faq/noticeEditView";
	}
	
	@PostMapping("noticeEditDo")
	public String noticeEditDo(NoticeDTO notice) {
		
		faqService.editNotice(notice);
		
		return "redirect:/faqView";
	}
	
	@PostMapping("/noticeDeleteDo")
	public String noticeDeleteDo(int noticeNo) {
		
		faqService.deleteNotice(noticeNo);
		
		return "redirect:/faqView";
		
	}
	
	@RequestMapping("/faqOnlyAnnouncementView")
	public String faqOnlyAnnouncementView(Model model, PageSearchVO pageSearch) {
	
	  System.out.println(pageSearch);
	  
	  int totalRowCount = faqService.getNoticeCount(pageSearch);
	  
	  pageSearch.setTotalRowCount(totalRowCount); 
	  pageSearch.pageSetting(); 
		 
	  System.out.println(totalRowCount);

		
	  List<NoticeDTO> noticeList = faqService.getAllNoticeList();
	  model.addAttribute("pageSearch", pageSearch);
	  model.addAttribute("noticeList", noticeList);
		 
		
		return "faq/faqOnlyAnnouncementView";
	}
}

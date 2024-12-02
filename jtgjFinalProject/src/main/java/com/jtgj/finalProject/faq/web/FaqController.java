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
	        faq.setUserId(userId);  // FaqDTO�� userId�� ����
	        String userName = login.getUserName();
	        faq.setUserName(userName);
	    } else {
	        return "redirect:/loginView";  // �α��� ������ ������ �α��� �������� �����̷�Ʈ
	    }
	    
	    // �۹�ȣ ��������
	    int atchParentNo = faqService.getFaqNo();
	    
	    // ÷�ε� ���� �����ҽ� ���ÿ� ������ db�� ��
	    if(boFile != null && boFile.length > 0 && !boFile[0].isEmpty()) {
	    	System.out.println("���� ����: " + boFile.length);
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
	    		System.out.println("÷�� ���� ���ε��� ���� �߻�");
	    		return "error/errorPath500";
	    	}
	    }
		
		faqService.writeFaq(faq);
		
		return "redirect:/faqView";
		
	}
	
	@RequestMapping("/faqDetailView")
	public String faqDeatailView(int faqNo, Model model) {
		System.out.println("Ŭ���� �Խñ��� ��ȣ: "  +  faqNo + "��");
		
		FaqDTO faq = faqService.getFaq(faqNo);
		
		// �ش� �Խñ��� ���
		List<CommentDTO> comList = faqService.getCommentList(faqNo);
		
		// �ش� �Խñ��� ÷�� ����
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
		
		// üũ�ڽ��� üũ���� ���� ��� 'N'���� ����
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
		
		// ����ũ ���̵� ����
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
		String uniqueId = sdf.format(date);
		
		for(int i = 0; i < 3; i++) {
			uniqueId += (int)(Math.random() * 10);
		}
		
		com.setComNo(uniqueId);
		
		// üũ�ڽ� value�� null�϶� 'N'���� �ٲٱ�
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
	
	// ��������
	
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
	        notice.setUserId(userId);  // FaqDTO�� userId�� ����
	        String userName = login.getUserName();
	        notice.setUserName(userName);
	    } else {
	        return "redirect:/loginView";  // �α��� ������ ������ �α��� �������� �����̷�Ʈ
	    }
	    
	    // �۹�ȣ ��������
	    int atchParentNo = faqService.getNoticeNo();
	    
	    // ÷�ε� ���� �����ҽ� ���ÿ� ������ db�� ��
	    if(boFile != null && boFile.length > 0 && !boFile[0].isEmpty()) {
	    	System.out.println("���� ����: " + boFile.length);
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
	    		System.out.println("÷�� ���� ���ε��� ���� �߻�");
	    		return "error/errorPath500";
	    	}
	    }
		
		faqService.writeNotice(notice);
		
		return "redirect:/faqView";
		
	}
	
	@RequestMapping("/noticeDetailView")
	public String noticeDetailView(int noticeNo, Model model) {
		System.out.println("Ŭ���� �Խñ��� �۹�ȣ: " + noticeNo);
		
		NoticeDTO notice = faqService.getNotice(noticeNo);
		
		// �ش� �Խñ��� ÷�� ����
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

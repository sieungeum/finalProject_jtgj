package com.jtgj.finalProject.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgj.finalProject.common.dto.SearchDTO;
import com.jtgj.finalProject.common.vo.PageSearchVO;
import com.jtgj.finalProject.faq.dao.IFaqDAO;
import com.jtgj.finalProject.faq.dto.CommentDTO;
import com.jtgj.finalProject.faq.dto.FaqDTO;

@Service
public class FaqService {
	
	@Autowired
	IFaqDAO dao;
	
	public List<FaqDTO> getFaqList(PageSearchVO pageSearch) {
		List<FaqDTO> result = dao.getFaqList(pageSearch);
		return result;
	}
	
	public int getFaqCount(PageSearchVO pageSearch) {
		int result = dao.getFaqCount(pageSearch);
		return result;
	}
	
	public int writeFaq(FaqDTO faq) {
		int result = dao.writeFaq(faq);
		return result;
	}
	
	public FaqDTO getFaq(int faqNo) {
		FaqDTO result = dao.getFaq(faqNo);
		return result;
	}
	
	public int editFaq(FaqDTO faq) {
		int result = dao.editFaq(faq);
		return result;
	}
	
	public int deleteFaq(int faqNo) {
		int result = dao.deleteFaq(faqNo);
		return result;
	}
	
	// 여기서 부터 댓글 관련 서비스
	
	public int writeComment(CommentDTO com) {
		int result = dao.writeComment(com);
		return result;
	}
	
	public CommentDTO getComment(String comNo) {
		CommentDTO result = dao.getComment(comNo);
		return result;
	}
	
	public List<CommentDTO> getCommentList(int comNo) {
		List<CommentDTO> result = dao.getCommentList(comNo);
		return result;
	}
	
	public int delComment(String comNo) {
		int result = dao.delComment(comNo);
		return result;
	}
	// 여기 부터 교안 250페이지 이어서 하기
	
}

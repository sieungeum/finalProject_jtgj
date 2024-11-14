package com.jtgj.finalProject.faq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgj.finalProject.common.dto.SearchDTO;
import com.jtgj.finalProject.common.vo.PageSearchVO;
import com.jtgj.finalProject.faq.dto.CommentDTO;
import com.jtgj.finalProject.faq.dto.FaqDTO;

@Mapper
public interface IFaqDAO {
	
	// ���� ���� ����
	List<FaqDTO> getFaqList(PageSearchVO pageSearch);
	int getFaqCount(PageSearchVO pageSearch);
	int writeFaq(FaqDTO faq);
	FaqDTO getFaq(int faqNo);
	int editFaq(FaqDTO faq);
	int deleteFaq(int faqNo);
	int getFaqNo();
	
	// ���ǻ��� ��� ����
	int writeComment(CommentDTO com);
	CommentDTO getComment(String comNo);
	List<CommentDTO> getCommentList(int comNo);
	int delComment(String comNo);
}

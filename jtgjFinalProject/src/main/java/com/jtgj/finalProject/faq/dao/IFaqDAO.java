package com.jtgj.finalProject.faq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgj.finalProject.common.dto.SearchDTO;
import com.jtgj.finalProject.common.vo.PageSearchVO;
import com.jtgj.finalProject.faq.dto.CommentDTO;
import com.jtgj.finalProject.faq.dto.FaqDTO;
import com.jtgj.finalProject.faq.dto.NoticeDTO;

@Mapper
public interface IFaqDAO {
	
	// 건의 사항 관련
	List<FaqDTO> getFaqList(PageSearchVO pageSearch);
	int getFaqCount(PageSearchVO pageSearch);
	int writeFaq(FaqDTO faq);
	FaqDTO getFaq(int faqNo);
	int editFaq(FaqDTO faq);
	int deleteFaq(int faqNo);
	int getFaqNo();
	
	// 건의사항 댓글 관련
	int writeComment(CommentDTO com);
	CommentDTO getComment(String comNo);
	List<CommentDTO> getCommentList(int comNo);
	int delComment(String comNo);
	
	// 공지사항 관련
	List<NoticeDTO> getNoticeList();
	List<NoticeDTO> getAllNoticeList(PageSearchVO pageSearch);
	int getNoticeCount(PageSearchVO pageSearch);
	int writeNotice(NoticeDTO notice);
	int getNoticeNo();
	NoticeDTO getNotice(int noticeNo);
	int editNotice(NoticeDTO notice);
	int deleteNotice(int noticeNo);
	
}

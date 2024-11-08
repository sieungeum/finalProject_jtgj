package com.jtgj.finalProject.faq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgj.finalProject.faq.dto.FaqDTO;

@Mapper
public interface IFaqDAO {
	List<FaqDTO> getFaqList();
	int writeFaq(FaqDTO faq);
	FaqDTO getFaq(int faqNo);
	int editFaq(FaqDTO faq);
	int deleteFaq(int faqNo);
}

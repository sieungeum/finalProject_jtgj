package com.jtgj.finalProject.companyBoard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgj.finalProject.companyBoard.dto.CompanyBoardDTO;

@Mapper
public interface ICompanyBoardDAO {
	List<CompanyBoardDTO> getCompanyBoardList();
	int writeCompanyBoard(CompanyBoardDTO companyBoard);
	
	 // 사용자 ID로 게시글 작성 여부 확인
    int checkIfPosted(String userId);
}

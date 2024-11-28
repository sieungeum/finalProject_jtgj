package com.jtgj.finalProject.companyBoard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgj.finalProject.companyBoard.dto.CompanyBoardDTO;
import com.jtgj.finalProject.companyBoard.dto.CompanyProjectDTO;

@Mapper
public interface ICompanyBoardDAO {
	List<CompanyBoardDTO> getCompanyBoardList();
	int writeCompanyBoard(CompanyBoardDTO companyBoard);
	
	 // 사용자 ID로 게시글 작성 여부 확인
    int checkIfPosted(String userId);
    
    CompanyBoardDTO getCompanyBoardDetail(int cpBoardNo);
    
    int updateCompanyBoard(CompanyBoardDTO companyBoard);
    
    void writeCompanyProject(CompanyProjectDTO companyProjectDTO);
    
    List<CompanyProjectDTO> getCompanyProjectsByUserId(String userId);
    
    // 특정 프로젝트 가져오기
    CompanyProjectDTO getCompanyProjectDetail(int ptNo);

    // 프로젝트 수정
    void updateCompanyProject(CompanyProjectDTO companyProjectDTO);
    
    // userId로 CompanyBoardDTO 가져오기
    CompanyBoardDTO getCompanyBoardByUserId(String userId);
    
}

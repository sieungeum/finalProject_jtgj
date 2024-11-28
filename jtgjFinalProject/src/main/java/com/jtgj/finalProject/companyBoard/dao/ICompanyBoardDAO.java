package com.jtgj.finalProject.companyBoard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgj.finalProject.companyBoard.dto.CompanyBoardDTO;
import com.jtgj.finalProject.companyBoard.dto.CompanyProjectDTO;

@Mapper
public interface ICompanyBoardDAO {
	List<CompanyBoardDTO> getCompanyBoardList();
	int writeCompanyBoard(CompanyBoardDTO companyBoard);
	
	 // ����� ID�� �Խñ� �ۼ� ���� Ȯ��
    int checkIfPosted(String userId);
    
    CompanyBoardDTO getCompanyBoardDetail(int cpBoardNo);
    
    int updateCompanyBoard(CompanyBoardDTO companyBoard);
    
    void writeCompanyProject(CompanyProjectDTO companyProjectDTO);
    
    List<CompanyProjectDTO> getCompanyProjectsByUserId(String userId);
    
    // Ư�� ������Ʈ ��������
    CompanyProjectDTO getCompanyProjectDetail(int ptNo);

    // ������Ʈ ����
    void updateCompanyProject(CompanyProjectDTO companyProjectDTO);
    
    // userId�� CompanyBoardDTO ��������
    CompanyBoardDTO getCompanyBoardByUserId(String userId);
    
}

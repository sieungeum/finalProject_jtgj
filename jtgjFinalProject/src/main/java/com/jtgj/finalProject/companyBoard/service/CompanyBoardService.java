package com.jtgj.finalProject.companyBoard.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jtgj.finalProject.attach.dto.AttachDTO;
import com.jtgj.finalProject.attach.service.AttachService;
import com.jtgj.finalProject.common.util.FileUploadUtils;
import com.jtgj.finalProject.companyBoard.dao.ICompanyBoardDAO;
import com.jtgj.finalProject.companyBoard.dto.CompanyBoardDTO;
import com.jtgj.finalProject.companyBoard.dto.CompanyProjectDTO;

@Service
public class CompanyBoardService {
	
	@Autowired
	ICompanyBoardDAO dao;
	
	@Autowired
    FileUploadUtils fileUploadUtils;
	
	@Autowired
    AttachService attachService;
	
	public List<CompanyBoardDTO> getCompanyBoardList() {
		List<CompanyBoardDTO> result = dao.getCompanyBoardList();
		return result;
	}
	
	public int writeCompanyBoard(CompanyBoardDTO companyBoard, MultipartFile cpBoardReperImgFile) throws IOException {
        if (cpBoardReperImgFile != null && !cpBoardReperImgFile.isEmpty()) {
            // 파일 업로드 처리
            AttachDTO attach = fileUploadUtils.getAttachByMultipart(cpBoardReperImgFile, "companyBoard");

            // `addExtensionToFile` 호출 제거
            // 업로드된 파일 경로를 게시글에 설정
            companyBoard.setCpBoardReperImg(attach.getAtchFileName());

            // 첨부파일 DB 저장
            attachService.insertAttach(attach);
        }

        // 게시글 DB 저장
        return dao.writeCompanyBoard(companyBoard);
    }
	
	public boolean checkIfActivePostExists(String userId) {
	    return dao.checkIfActivePostExists(userId) > 0; // 삭제되지 않은 게시글 여부 확인
	}
	
	public CompanyBoardDTO getCompanyBoardDetail(int cpBoardNo) {
	    return dao.getCompanyBoardDetail(cpBoardNo);
	}
	
	// 게시글 및 이미지 수정
    public void updateCompanyBoard(CompanyBoardDTO companyBoard, MultipartFile cpBoardReperImgFile) throws IOException {
        if (cpBoardReperImgFile != null && !cpBoardReperImgFile.isEmpty()) {
            // 새로운 파일 업로드 처리
            AttachDTO attach = fileUploadUtils.getAttachByMultipart(cpBoardReperImgFile, "companyBoard");

            // 업로드된 파일명 설정
            companyBoard.setCpBoardReperImg(attach.getAtchFileName());

            // 첨부 파일 저장
            attachService.insertAttach(attach);
        }

        // 게시글 업데이트 처리
        dao.updateCompanyBoard(companyBoard);
    }
    
    public void writeCompanyProject(CompanyProjectDTO companyProjectDTO, MultipartFile thumbnailFile) throws IOException {
        if (thumbnailFile != null && !thumbnailFile.isEmpty()) {
            // 파일 업로드 처리
            AttachDTO attach = fileUploadUtils.getAttachByMultipart(thumbnailFile, "companyProject");
            companyProjectDTO.setPtThumbnail(attach.getAtchFileName()); // 썸네일 파일명 설정

            // 첨부 파일 DB 저장
            attachService.insertAttach(attach);
        }

        // 프로젝트 정보 DB 저장
        dao.writeCompanyProject(companyProjectDTO);
    }
    
    public List<CompanyProjectDTO> getCompanyProjectsByUserId(String userId) {
        return dao.getCompanyProjectsByUserId(userId);
    }
    
    public CompanyProjectDTO getCompanyProjectDetail(int ptNo) {
    	CompanyProjectDTO projectDetail = dao.getCompanyProjectDetail(ptNo);
        if (projectDetail == null) {
            System.out.println("No project found for ptNo: " + ptNo);
        } else {
            System.out.println("Retrieved project detail: " + projectDetail);
        }
        return projectDetail;
    }

    public void updateCompanyProject(CompanyProjectDTO companyProjectDTO) {
        dao.updateCompanyProject(companyProjectDTO);
    }
    
    public CompanyBoardDTO getCompanyBoardByUserId(String userId) {
    	if (userId == null) {
            throw new IllegalArgumentException("유효하지 않은 사용자 ID입니다: null");
        }
    	CompanyBoardDTO companyBoard = dao.getCompanyBoardByUserId(userId);
    	if (companyBoard == null) {
            throw new IllegalArgumentException("해당 사용자 ID에 대한 게시판 정보가 없습니다: " + userId);
        }
    	return companyBoard;
    }
    
    public void updateCompanyProject(CompanyProjectDTO companyProjectDTO, MultipartFile thumbnailFile) throws IOException {
        if (thumbnailFile != null && !thumbnailFile.isEmpty()) {
            // 썸네일 이미지 파일 업로드
            AttachDTO attach = fileUploadUtils.getAttachByMultipart(thumbnailFile, "companyProject");
            companyProjectDTO.setPtThumbnail(attach.getAtchFileName());

            // 첨부 파일 DB 저장
            attachService.insertAttach(attach);
        }

        // 프로젝트 업데이트 처리
        dao.updateCompanyProject(companyProjectDTO);
    }
	
    public void deleteCompanyBoard(int cpBoardNo) {
        dao.deleteCompanyBoard(cpBoardNo);
    }
    
    public void deleteCompanyProject(int ptNo) {
        dao.deleteCompanyProject(ptNo);
    }
    
}

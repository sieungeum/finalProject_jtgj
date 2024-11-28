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
	
	public boolean checkIfPosted(String userId) {
	    return dao.checkIfPosted(userId) > 0; // DAO 호출 결과가 0보다 크면 이미 게시글 작성
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
        return dao.getCompanyProjectDetail(ptNo);
    }

    public void updateCompanyProject(CompanyProjectDTO companyProjectDTO) {
        dao.updateCompanyProject(companyProjectDTO);
    }
    
    public CompanyBoardDTO getCompanyBoardByUserId(String userId) {
        return dao.getCompanyBoardByUserId(userId);
    }
	
}

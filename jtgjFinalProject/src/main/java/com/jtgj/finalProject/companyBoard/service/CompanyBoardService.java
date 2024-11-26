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
	
}

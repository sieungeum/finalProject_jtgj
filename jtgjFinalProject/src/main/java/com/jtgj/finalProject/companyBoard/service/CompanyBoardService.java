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
            // ���� ���ε� ó��
            AttachDTO attach = fileUploadUtils.getAttachByMultipart(cpBoardReperImgFile, "companyBoard");

            // `addExtensionToFile` ȣ�� ����
            // ���ε�� ���� ��θ� �Խñۿ� ����
            companyBoard.setCpBoardReperImg(attach.getAtchFileName());

            // ÷������ DB ����
            attachService.insertAttach(attach);
        }

        // �Խñ� DB ����
        return dao.writeCompanyBoard(companyBoard);
    }
	
	public boolean checkIfPosted(String userId) {
	    return dao.checkIfPosted(userId) > 0; // DAO ȣ�� ����� 0���� ũ�� �̹� �Խñ� �ۼ�
	}
	
	public CompanyBoardDTO getCompanyBoardDetail(int cpBoardNo) {
	    return dao.getCompanyBoardDetail(cpBoardNo);
	}
	
	// �Խñ� �� �̹��� ����
    public void updateCompanyBoard(CompanyBoardDTO companyBoard, MultipartFile cpBoardReperImgFile) throws IOException {
        if (cpBoardReperImgFile != null && !cpBoardReperImgFile.isEmpty()) {
            // ���ο� ���� ���ε� ó��
            AttachDTO attach = fileUploadUtils.getAttachByMultipart(cpBoardReperImgFile, "companyBoard");

            // ���ε�� ���ϸ� ����
            companyBoard.setCpBoardReperImg(attach.getAtchFileName());

            // ÷�� ���� ����
            attachService.insertAttach(attach);
        }

        // �Խñ� ������Ʈ ó��
        dao.updateCompanyBoard(companyBoard);
    }
    
    public void writeCompanyProject(CompanyProjectDTO companyProjectDTO, MultipartFile thumbnailFile) throws IOException {
        if (thumbnailFile != null && !thumbnailFile.isEmpty()) {
            // ���� ���ε� ó��
            AttachDTO attach = fileUploadUtils.getAttachByMultipart(thumbnailFile, "companyProject");
            companyProjectDTO.setPtThumbnail(attach.getAtchFileName()); // ����� ���ϸ� ����

            // ÷�� ���� DB ����
            attachService.insertAttach(attach);
        }

        // ������Ʈ ���� DB ����
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

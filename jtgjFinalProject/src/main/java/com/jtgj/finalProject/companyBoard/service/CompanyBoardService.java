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
	
	public boolean checkIfActivePostExists(String userId) {
	    return dao.checkIfActivePostExists(userId) > 0; // �������� ���� �Խñ� ���� Ȯ��
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
            throw new IllegalArgumentException("��ȿ���� ���� ����� ID�Դϴ�: null");
        }
    	CompanyBoardDTO companyBoard = dao.getCompanyBoardByUserId(userId);
    	if (companyBoard == null) {
            throw new IllegalArgumentException("�ش� ����� ID�� ���� �Խ��� ������ �����ϴ�: " + userId);
        }
    	return companyBoard;
    }
    
    public void updateCompanyProject(CompanyProjectDTO companyProjectDTO, MultipartFile thumbnailFile) throws IOException {
        if (thumbnailFile != null && !thumbnailFile.isEmpty()) {
            // ����� �̹��� ���� ���ε�
            AttachDTO attach = fileUploadUtils.getAttachByMultipart(thumbnailFile, "companyProject");
            companyProjectDTO.setPtThumbnail(attach.getAtchFileName());

            // ÷�� ���� DB ����
            attachService.insertAttach(attach);
        }

        // ������Ʈ ������Ʈ ó��
        dao.updateCompanyProject(companyProjectDTO);
    }
	
    public void deleteCompanyBoard(int cpBoardNo) {
        dao.deleteCompanyBoard(cpBoardNo);
    }
    
    public void deleteCompanyProject(int ptNo) {
        dao.deleteCompanyProject(ptNo);
    }
    
}

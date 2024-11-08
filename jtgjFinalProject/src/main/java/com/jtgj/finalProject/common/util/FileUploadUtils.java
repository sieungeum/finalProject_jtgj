package com.jtgj.finalProject.common.util;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.jtgj.finalProject.attach.dto.AttachDTO;

@Component
public class FileUploadUtils {
	
	@Value("#{util['file.upload.path']}")
	private String uploadPath;
	
	// MultipartFile �� �迭�� ��ܼ� ���� ���
	public List<AttachDTO> getAttachListByMultiparts(MultipartFile[] boFileArray) throws IOException{
		List<AttachDTO> attachList = new ArrayList<>();
		
		for(MultipartFile boFile : boFileArray) {
			if(!boFile.isEmpty()) {
				// �迭�� ��� �� MultipartFile �� ���� ���� ����
				AttachDTO attach = getAttachByMultipart(boFile);
				attachList.add(attach);
			}
		}
		
		return attachList;
	}

	// ÷�ε� ������ ���� PC ���ÿ� �����ϱ� ���� FileUploadUtils ��ü ���� �� �޼ҵ� �ۼ�
	public AttachDTO getAttachByMultipart(MultipartFile boFile) throws IOException {
		// uploadPath �� ����� ���ϸ� ���� (����ũ ���̵�)
		String fileName = UUID.randomUUID().toString();
		
		// uploadPath �� ���� ���� (���� �ѹ��� ����)
		File uploadFolder = new File(uploadPath);
		uploadFolder.mkdir();
		
		// ���� ��ο� ���ϸ� �̾���̱�(=������ Ǯ���)
		String filePath = uploadPath + File.separatorChar + fileName;
		
		// �ش� ��ο� ������ ���� ����(���� PC�� ���õ�ũ)
		boFile.transferTo(new File(filePath));
		
		// ���� DB�� ���� ÷������ ��ü(AttachDTO) ���� �� ����(mybatis�� �Ѱ��� ��ü)
		AttachDTO attach = new AttachDTO();
		attach.setAtchFileName(fileName);
		attach.setAtchOriginalName(boFile.getOriginalFilename());
		attach.setAtchFileSize(boFile.getSize());
		attach.setAtchFancySize(transferFancySize(boFile.getSize()));
		attach.setAtchContentType(boFile.getContentType());
		attach.setAtchPath(filePath);
		
		return attach;
	}

	// ÷�ε� ������ ���� PC ���ÿ� �����ϱ� ���� FileUploadUtils ��ü ���� �� �޼ҵ� �ۼ�
	// byte ���� ũ�⿡ ���� ������ KB, MB, GB ���·� �ٲ��ִ� �޼ҵ�
	// ����ڿ��� ÷�ε� ������ ũ�⸦ ȭ�鿡 ������ �� ���
	private String transferFancySize(long size) {
		DecimalFormat df = new DecimalFormat("#,###.0");
		
		// ������ ũ�Ⱑ 1024(1KB) �̸��̶�� �׳� B�� �ٿ��� ǥ��
		// ���� 1024 �̻� 1024 * 1024 (1MB) �̸��̶�� B�� 1024�� ���� ���� KB�� ǥ��
		if(size < 1024) return size + "B";
		if(size < 1024 * 1024) return df.format(size/1024.0) + "KB";
		if(size < 1024 * 1024 * 1024) return df.format(size / (1024.0*1024.0)) + "MB";
		if(size < 1024 * 1024 * 1024 * 1024) return df.format(size / (1024.0*1024.0*1024.0)) + "GB";
		return "ū ����";
	}
}

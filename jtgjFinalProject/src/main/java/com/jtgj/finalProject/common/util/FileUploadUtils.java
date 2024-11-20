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
	
	// MultipartFile 이 배열에 담겨서 오는 경우
	public List<AttachDTO> getAttachListByMultiparts(MultipartFile[] boFileArray, String atchType) throws IOException{
		List<AttachDTO> attachList = new ArrayList<>();
		
		for(MultipartFile boFile : boFileArray) {
			if(!boFile.isEmpty()) {
				// 배열에 담긴 각 MultipartFile 에 대해 파일 저장
				AttachDTO attach = getAttachByMultipart(boFile, atchType);
				attachList.add(attach);
			}
		}
		
		return attachList;
	}

//	// 첨부된 파일을 서버 PC 로컬에 저장하기 위한 FileUploadUtils 객체 생성 및 메소드 작성
//	public AttachDTO getAttachByMultipart(MultipartFile boFile, String atchType) throws IOException {
//		// uploadPath 에 저장될 파일명 생성 (유니크 아이디)
//		String fileName = UUID.randomUUID().toString();
//		
//		// uploadPath 에 폴더 생성 (최초 한번만 실행)
//		File uploadFolder = new File(uploadPath);
//		uploadFolder.mkdir();
//		
//		// 파일 경로에 파일명 이어붙이기(=파일의 풀경로)
//		String filePath = uploadPath + File.separatorChar + fileName;
//		
//		// 해당 경로에 실제로 파일 저장(서버 PC의 로컬디스크)
//		boFile.transferTo(new File(filePath));
//		
//		// 이후 DB에 담을 첨부파일 객체(AttachDTO) 생성 후 리턴(mybatis에 넘겨줄 객체)
//		AttachDTO attach = new AttachDTO();
//		attach.setAtchFileName(fileName);
//		attach.setAtchOriginalName(boFile.getOriginalFilename());
//		attach.setAtchFileSize(boFile.getSize());
//		attach.setAtchFancySize(transferFancySize(boFile.getSize()));
//		attach.setAtchContentType(boFile.getContentType());
//		attach.setAtchPath(filePath);
//		
//		return attach;
//	}
	
	public AttachDTO getAttachByMultipart(MultipartFile boFile, String atchType) throws IOException {
	    // 유니크한 파일명 생성
	    String fileName = UUID.randomUUID().toString();
	    
	    // 게시판 타입별 폴더 경로 설정
	    String typeFolderPath = uploadPath + File.separatorChar + atchType;
	    File typeFolder = new File(typeFolderPath);
	    
	    // 게시판 타입별 폴더가 없으면 생성
	    if (!typeFolder.exists()) {
	        typeFolder.mkdirs(); // 폴더 생성
	    }
	    
	    // 파일 저장 경로 설정 (게시판 타입 폴더 내부)
	    String filePath = typeFolderPath + File.separatorChar + fileName;
	    
	    // 파일 저장 (서버 PC 로컬 디스크에 저장)
	    boFile.transferTo(new File(filePath));
	    
	    // 이후 DB에 담을 첨부파일 객체(AttachDTO) 생성 후 리턴
	    AttachDTO attach = new AttachDTO();
	    attach.setAtchFileName(fileName); // 저장된 파일명
	    attach.setAtchOriginalName(boFile.getOriginalFilename()); // 사용자가 업로드한 파일명
	    attach.setAtchFileSize(boFile.getSize()); // 파일 크기
	    attach.setAtchFancySize(transferFancySize(boFile.getSize())); // 사람이 읽기 쉬운 파일 크기
	    attach.setAtchContentType(boFile.getContentType()); // MIME 타입
	    attach.setAtchPath(filePath); // 파일 경로
	    attach.setAtchType(atchType); // 게시판 타입 설정
	    
	    return attach;
	}

	// 첨부된 파일을 서버 PC 로컬에 저장하기 위한 FileUploadUtils 객체 생성 및 메소드 작성
	// byte 단위 크기에 대해 적절히 KB, MB, GB 형태로 바꿔주는 메소드
	// 사용자에게 첨부된 파일의 크기를 화면에 보여줄 때 사용
	private String transferFancySize(long size) {
		DecimalFormat df = new DecimalFormat("#,###.0");
		
		// 파일의 크기가 1024(1KB) 미만이라면 그냥 B를 붙여서 표기
		// 만약 1024 이상 1024 * 1024 (1MB) 미만이라면 B를 1024로 나눈 값을 KB로 표기
		if(size < 1024) return size + "B";
		if(size < 1024 * 1024) return df.format(size/1024.0) + "KB";
		if(size < 1024 * 1024 * 1024) return df.format(size / (1024.0*1024.0)) + "MB";
		if(size < 1024 * 1024 * 1024 * 1024) return df.format(size / (1024.0*1024.0*1024.0)) + "GB";
		return "큰 파일";
	}
}

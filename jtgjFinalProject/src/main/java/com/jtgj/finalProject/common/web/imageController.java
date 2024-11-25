package com.jtgj.finalProject.common.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jtgj.finalProject.common.util.FileUploadUtils;

@Controller
public class imageController {
	@Autowired
	FileUploadUtils fileUploadUtils;

	@Value("#{util['file.upload.path']}")
	private String uploadPath;
	
	// 파일 경로에 대한 이미지 파일을 stream 으로 가져와서 리턴함
	@RequestMapping("/displayImage")
	public ResponseEntity<byte[]> displayImage(String imgName){
		InputStream inputStream = null;
		ResponseEntity<byte[]> entity = null;
	
//		String imgPath = uploadPath + File.separatorChar + imgName;
		String imgPath = uploadPath + File.separator + "images" + File.separator + imgName;
		
		MediaType mediaType = MediaType.IMAGE_JPEG;
		
		// ResponseEntity 의 헤더(header) 세팅을 위한 HttpHeaders 객체 생성
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		
		// InputStream 으로 불러올 파일 매칭
		try {
			inputStream = new FileInputStream(imgPath);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(inputStream), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if(inputStream != null) {try {inputStream.close();} catch(IOException e) {} }
		}
		
		return entity;
	}
	
	// 파일 경로에 대한 이미지 파일을 stream 으로 가져와서 리턴함
	@RequestMapping("/displayProfImg")
	public ResponseEntity<byte[]> displayProfImg(String imgName, @RequestParam("atchtype")String atchtype){
		InputStream inputStream = null;
		ResponseEntity<byte[]> entity = null;

		String imgPath = uploadPath + File.separator + atchtype + File.separator + imgName;
		
		MediaType mediaType = MediaType.IMAGE_JPEG;
		
		// ResponseEntity 의 헤더(header) 세팅을 위한 HttpHeaders 객체 생성
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		
		// InputStream 으로 불러올 파일 매칭
		try {
			inputStream = new FileInputStream(imgPath);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(inputStream), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if(inputStream != null) {try {inputStream.close();} catch(IOException e) {} }
		}
		
		return entity;
	}
}

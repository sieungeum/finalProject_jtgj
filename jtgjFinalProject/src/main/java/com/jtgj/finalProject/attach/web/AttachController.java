package com.jtgj.finalProject.attach.web;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttachController {
	
	@Value("#{util['file.upload.path']}")
	private String uploadPath;

	
	@RequestMapping("/filedownload")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    // 로컬에 저장된 파일 이름과 첨부 당시 원본 파일 이름을 받아옴
	    String fileName = request.getParameter("fileName");
	    String fileOriName = request.getParameter("fileOriName");

	    // 로컬에 저장된 파일을 File 객체로 매칭시킴
	    File downloadFile = new File(uploadPath + File.separatorChar + fileName);

	    // 해당 파일의 데이터를 읽어서 바이트 배열로 리턴
	    byte[] fileByte = FileUtils.readFileToByteArray(downloadFile);

	    // 응답 데이터 설정
	    response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);
	    
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(fileOriName, "UTF-8") + "\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");

	    // 파일을 응답으로 다운로드하도록 함
	    response.getOutputStream().write(fileByte);
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}

}

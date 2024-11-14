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
	    // ���ÿ� ����� ���� �̸��� ÷�� ��� ���� ���� �̸��� �޾ƿ�
	    String fileName = request.getParameter("fileName");
	    String fileOriName = request.getParameter("fileOriName");

	    // ���ÿ� ����� ������ File ��ü�� ��Ī��Ŵ
	    File downloadFile = new File(uploadPath + File.separatorChar + fileName);

	    // �ش� ������ �����͸� �о ����Ʈ �迭�� ����
	    byte[] fileByte = FileUtils.readFileToByteArray(downloadFile);

	    // ���� ������ ����
	    response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);
	    
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(fileOriName, "UTF-8") + "\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");

	    // ������ �������� �ٿ�ε��ϵ��� ��
	    response.getOutputStream().write(fileByte);
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}

}

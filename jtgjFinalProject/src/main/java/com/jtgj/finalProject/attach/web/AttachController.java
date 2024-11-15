package com.jtgj.finalProject.attach.web;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jtgj.finalProject.attach.dto.AttachDTO;
import com.jtgj.finalProject.common.util.FileUploadUtils;

@Controller
public class AttachController {
	
	@Autowired
	FileUploadUtils fileUploadUtils;
	
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
	
	// �̹��� ���ε�
		@ResponseBody
		@PostMapping(value="/uploadImg")
		public String uploadImg(HttpSession session, MultipartFile file) {
			Map<String, Object> result = new HashMap<>();
			
			String uuid = "";
			
			
			try {
				AttachDTO uploadImg = fileUploadUtils.getAttachByMultipart(file);
				System.out.println(uploadImg);
				// ����� �̹��� ���ϸ��� ����
				uuid = uploadImg.getAtchFileName();
			}  catch (IOException e) {
				e.printStackTrace();
				System.out.println("�̹��� ���� ����");
			}
			
			return uuid;
		}

}

package com.jtgj.finalProject.attach.web;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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
	    String atchType = request.getParameter("atchType");

	    // ���ÿ� ����� ������ File ��ü�� ��Ī��Ŵ
	    String filePath = uploadPath + File.separator + atchType + File.separator + fileName;
	    File downloadFile = new File(filePath);
	    
	    if (!downloadFile.exists()) {
	        System.out.println("File not found: " + filePath);
	        response.setStatus(HttpServletResponse.SC_NOT_FOUND); // ������ ������ 404 ��ȯ
	        return;
	    }

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
	
	// ���̹� ������ �̹��� ���ε�
	@ResponseBody
	@PostMapping(value = "/uploadImg")
	public Map<String, Object> uploadImg(MultipartFile file) {
	    Map<String, Object> result = new HashMap<>();
	    
	    // ���ε�� ������ ���� ��� ó��
	    if (file == null || file.isEmpty()) {
	        result.put("status", "error");
	        result.put("message", "No file uploaded");
	        return result;
	    }

	    try {
	        // ������ ���� ��θ� ����
	        String uploadPath = "C:/upload/images"; // ���� ��δ� �������� ������ ���� ����
	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdirs(); // ������ ������ ����
	        }

	        // ���� ���ϸ� ���� (UUID ���)
	        String originalFileName = file.getOriginalFilename();
	        String fileName = UUID.randomUUID().toString() + "_" + originalFileName;

	        // ���� ����
	        File saveFile = new File(uploadPath, fileName);
	        file.transferTo(saveFile);

	        // ��� ��ȯ
	        result.put("status", "success");
	        result.put("fileName", fileName);
	        result.put("originalFileName", originalFileName); // ���� ���� �̸�
	        result.put("filePath", "/images/" + fileName); // ���� URL ���
	    } catch (IOException e) {
	        e.printStackTrace();
	        result.put("status", "error");
	        result.put("message", "File upload failed: " + e.getMessage());
	    }

	    return result;
	}

}

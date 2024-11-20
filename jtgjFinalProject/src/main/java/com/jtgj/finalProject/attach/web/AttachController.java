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
	    // 로컬에 저장된 파일 이름과 첨부 당시 원본 파일 이름을 받아옴
	    String fileName = request.getParameter("fileName");
	    String fileOriName = request.getParameter("fileOriName");
	    String atchType = request.getParameter("atchType");

	    // 로컬에 저장된 파일을 File 객체로 매칭시킴
	    String filePath = uploadPath + File.separator + atchType + File.separator + fileName;
	    File downloadFile = new File(filePath);
	    
	    if (!downloadFile.exists()) {
	        System.out.println("File not found: " + filePath);
	        response.setStatus(HttpServletResponse.SC_NOT_FOUND); // 파일이 없으면 404 반환
	        return;
	    }

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
	
	// 네이버 에디터 이미지 업로드
	@ResponseBody
	@PostMapping(value = "/uploadImg")
	public Map<String, Object> uploadImg(MultipartFile file) {
	    Map<String, Object> result = new HashMap<>();
	    
	    // 업로드된 파일이 없는 경우 처리
	    if (file == null || file.isEmpty()) {
	        result.put("status", "error");
	        result.put("message", "No file uploaded");
	        return result;
	    }

	    try {
	        // 저장할 파일 경로를 지정
	        String uploadPath = "C:/upload/images"; // 실제 경로는 설정에서 가져올 수도 있음
	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdirs(); // 폴더가 없으면 생성
	        }

	        // 고유 파일명 생성 (UUID 사용)
	        String originalFileName = file.getOriginalFilename();
	        String fileName = UUID.randomUUID().toString() + "_" + originalFileName;

	        // 파일 저장
	        File saveFile = new File(uploadPath, fileName);
	        file.transferTo(saveFile);

	        // 결과 반환
	        result.put("status", "success");
	        result.put("fileName", fileName);
	        result.put("originalFileName", originalFileName); // 원래 파일 이름
	        result.put("filePath", "/images/" + fileName); // 실제 URL 경로
	    } catch (IOException e) {
	        e.printStackTrace();
	        result.put("status", "error");
	        result.put("message", "File upload failed: " + e.getMessage());
	    }

	    return result;
	}

}

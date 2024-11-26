package com.jtgj.finalProject.companyBoard.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jtgj.finalProject.attach.dto.AttachDTO;
import com.jtgj.finalProject.attach.service.AttachService;
import com.jtgj.finalProject.common.util.FileUploadUtils;
import com.jtgj.finalProject.companyBoard.dto.CompanyBoardDTO;
import com.jtgj.finalProject.companyBoard.service.CompanyBoardService;
import com.jtgj.finalProject.user.dto.CompanyDTO;
import com.jtgj.finalProject.user.dto.UserDTO;
import com.jtgj.finalProject.user.service.UserService;

@Controller
public class CompanyBoardController {
	
	@Autowired
	CompanyBoardService companyBoardService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	AttachService attachService;
	
	@Autowired
	FileUploadUtils fileUploadUtils;
	
	@RequestMapping("/companyBoardView")
	public String companyBoardView(Model model) {
		
		List<CompanyBoardDTO> companyBoardList = companyBoardService.getCompanyBoardList();
		
		System.out.println("companyBoardList : " + companyBoardList);
		model.addAttribute("companyBoardList", companyBoardList);
		
		return "companyBoard/companyBoardView";
		
	}
	
	@RequestMapping("/companyBoardWriteView")
	public String companyBoardWriteView(HttpSession session, Model model) {
		
		UserDTO login = (UserDTO) session.getAttribute("login");
		
		if(session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		
		// userId를 사용해 UserDTO와 CompanyDTO 가져오기
	    String userId = login.getUserId();
	    UserDTO userDTO = userService.getUserById(userId);
	    CompanyDTO companyDTO = userService.getCompanyByUserId(userId);
	    
	    // 모델에 담기 
	    model.addAttribute("user", userDTO);
	    model.addAttribute("company", companyDTO);
		
		return "companyBoard/companyBoardWriteView";
		
	}
	
	@PostMapping("/companyBoardWriteDo")
	public String companyBoardWriteDo(
	        CompanyBoardDTO companyBoard,
	        HttpSession session,
	        @RequestParam("cpBoardReperImgFile") MultipartFile cpBoardReperImgFile) {
	    
	    UserDTO login = (UserDTO) session.getAttribute("login");
	    if (login == null) {
	        return "redirect:/loginView"; // 로그인 세션 체크
	    }

	    // 로그인 사용자 정보 설정
	    companyBoard.setUserId(login.getUserId());
	    companyBoard.setUserName(login.getUserName());

	    try {
	        // 서비스 호출을 통해 파일 업로드 및 게시글 저장 처리
	        companyBoardService.writeCompanyBoard(companyBoard, cpBoardReperImgFile);
	    } catch (IOException e) {
	        e.printStackTrace();
	        return "error"; // 예외 발생 시 에러 페이지 이동
	    }

	    return "redirect:/companyBoardView"; // 저장 후 게시판 리스트로 리다이렉트
	}
	
}

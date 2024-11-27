package com.jtgj.finalProject.companyBoard.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jtgj.finalProject.attach.dto.AttachDTO;
import com.jtgj.finalProject.attach.service.AttachService;
import com.jtgj.finalProject.common.util.FileUploadUtils;
import com.jtgj.finalProject.companyBoard.dto.CompanyBoardDTO;
import com.jtgj.finalProject.companyBoard.dto.CompanyProjectDTO;
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
	public String companyBoardView(Model model, HttpSession session) {
		
		UserDTO login = (UserDTO) session.getAttribute("login");
		boolean hasPosted = false;
		
		if (login != null && "C".equals(login.getUserAccount())) {
	        // 글 작성 여부 확인
	        hasPosted = companyBoardService.checkIfPosted(login.getUserId());
	    }
		
		List<CompanyBoardDTO> companyBoardList = companyBoardService.getCompanyBoardList();
		
		System.out.println("companyBoardList : " + companyBoardList);
		model.addAttribute("companyBoardList", companyBoardList);
		model.addAttribute("hasPosted", hasPosted);
		
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
	
	@RequestMapping("/companyBoardDetailView")
	public String companyBoardDetailView(@RequestParam("cpBoardNo") int cpBoardNo, Model model) {
	    CompanyBoardDTO companyBoard = companyBoardService.getCompanyBoardDetail(cpBoardNo);
	    model.addAttribute("companyBoard", companyBoard);
	    System.out.println(companyBoard);
	    return "companyBoard/companyBoardDetailView";
	}
	
	// 수정 페이지로 이동
    @RequestMapping("/companyBoardEditView")
    public String companyBoardEditView(@RequestParam("cpBoardNo") int cpBoardNo, Model model) {
        // 기존 게시글 데이터 불러오기
        CompanyBoardDTO companyBoard = companyBoardService.getCompanyBoardDetail(cpBoardNo);
        model.addAttribute("companyBoard", companyBoard);

        return "companyBoard/companyBoardEditView"; // 수정 페이지 JSP
    }
    
 // 수정 요청 처리
    @PostMapping("/companyBoardEditDo")
    public String companyBoardEditDo(
            CompanyBoardDTO companyBoard,
            HttpSession session,
            @RequestParam(value = "cpBoardReperImgFile", required = false) MultipartFile cpBoardReperImgFile) {

        UserDTO login = (UserDTO) session.getAttribute("login");
        if (login == null) {
            return "redirect:/loginView";
        }

        // 로그인 사용자 정보 설정
        companyBoard.setUserId(login.getUserId());
        companyBoard.setUserName(login.getUserName());

        try {
            // 서비스 호출을 통해 게시글 및 이미지 수정 처리
            companyBoardService.updateCompanyBoard(companyBoard, cpBoardReperImgFile);
        } catch (IOException e) {
            e.printStackTrace();
            return "error"; // 예외 발생 시 에러 페이지 이동
        }

        return "redirect:/companyBoardDetailView?cpBoardNo=" + companyBoard.getCpBoardNo(); // 수정 완료 후 상세 보기로 이동
    }
    
    // 프로젝트 등록 페이지
    @RequestMapping("companyProjectWriteView")
    public String companyProjectWriteView() {
    	return "companyBoard/companyProjectWriteView";
    }
    
    @PostMapping("/companyProjectWriteDo")
    public String companyProjectWriteDo(
            CompanyProjectDTO companyProjectDTO, 
            @RequestParam("thumbnailFile") MultipartFile thumbnailFile, 
            HttpSession session, 
            RedirectAttributes redirectAttributes) {

        UserDTO login = (UserDTO) session.getAttribute("login");
        if (login == null) {
            return "redirect:/loginView";
        }

        // 로그인 사용자 정보 설정
        companyProjectDTO.setUserId(login.getUserId());

        try {
            // 프로젝트 등록 서비스 호출
            companyBoardService.writeCompanyProject(companyProjectDTO, thumbnailFile);
            redirectAttributes.addFlashAttribute("message", "프로젝트가 성공적으로 등록되었습니다.");
        } catch (IOException e) {
            redirectAttributes.addFlashAttribute("error", "프로젝트 등록 중 오류가 발생했습니다: " + e.getMessage());
        }

        return "redirect:/companyBoardView";
    }
    
    
	
}

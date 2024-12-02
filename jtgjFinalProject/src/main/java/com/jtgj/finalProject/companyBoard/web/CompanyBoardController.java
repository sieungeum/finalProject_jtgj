package com.jtgj.finalProject.companyBoard.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	        hasPosted = companyBoardService.checkIfActivePostExists(login.getUserId());
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
	        @RequestParam("cpBoardReperImgFile") MultipartFile cpBoardReperImgFile,
	        @RequestParam(value = "cpBoardYoutubeLink", required = false) String youtubeLink,
	        RedirectAttributes redirectAttributes) {
	    
	    UserDTO login = (UserDTO) session.getAttribute("login");
	    if (login == null) {
	        return "redirect:/loginView"; // 로그인 세션 체크
	    }

	    // 로그인 사용자 정보 설정
	    companyBoard.setUserId(login.getUserId());
	    companyBoard.setUserName(login.getUserName());
	    
	    // **대표 이미지 검증**
	    if (cpBoardReperImgFile == null || cpBoardReperImgFile.isEmpty()) {
	        redirectAttributes.addFlashAttribute("errorMessage", "대표 이미지를 첨부 해주십시오.");
	        return "redirect:/companyBoardWriteView"; // 입력 페이지로 다시 이동
	    }

	    try {
	    	
	    	if (youtubeLink != null && !youtubeLink.isEmpty()) {
	            String videoId = extractYoutubeVideoId(youtubeLink);
	            if (videoId != null) {
	                String iframeCode = String.format(
	                        "<iframe width=\"750\" height=\"420\" src=\"https://www.youtube.com/embed/%s\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>",
	                        videoId
	                );
	                companyBoard.setCpBoardYoutubeLink(iframeCode);
	            }
	        }else {
                redirectAttributes.addFlashAttribute("errorMessage", "올바른 유튜브 링크를 입력해주세요.");
                return "redirect:/companyBoardWriteView";
            }
	    	
	        // 서비스 호출을 통해 파일 업로드 및 게시글 저장 처리
	        companyBoardService.writeCompanyBoard(companyBoard, cpBoardReperImgFile);
	    } catch (IOException e) {
	        e.printStackTrace();
	        redirectAttributes.addFlashAttribute("errorMessage", "게시글 저장 중 오류가 발생했습니다.");
	        return "error"; // 예외 발생 시 에러 페이지 이동
	    }

	    return "redirect:/companyBoardView"; // 저장 후 게시판 리스트로 리다이렉트
	}
	
	// 유튜브 링크에서 Video ID 추출
	private String extractYoutubeVideoId(String youtubeLink) {
	    String regex = "(?:https?:\\/\\/)?(?:www\\.)?(?:youtube\\.com\\/watch\\?v=|youtu\\.be\\/)([a-zA-Z0-9_-]+)";
	    Pattern pattern = Pattern.compile(regex);
	    Matcher matcher = pattern.matcher(youtubeLink);
	    return matcher.find() ? matcher.group(1) : null;
	}
	
	@RequestMapping("/companyBoardDetailView")
	public String companyBoardDetailView(@RequestParam("cpBoardNo") int cpBoardNo, Model model) {
	    CompanyBoardDTO companyBoard = companyBoardService.getCompanyBoardDetail(cpBoardNo);
	    model.addAttribute("companyBoard", companyBoard);
	    System.out.println(companyBoard);
	    
	    // companyProject 정보 가져오기
	    List<CompanyProjectDTO> companyProjects = companyBoardService.getCompanyProjectsByUserId(companyBoard.getUserId());
	    model.addAttribute("companyProjects", companyProjects);
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
            @RequestParam(value = "cpBoardReperImgFile", required = false) MultipartFile cpBoardReperImgFile,
            @RequestParam(value = "cpBoardYoutubeLink", required = false) String youtubeLink) {

        UserDTO login = (UserDTO) session.getAttribute("login");
        if (login == null) {
            return "redirect:/loginView";
        }

        // 로그인 사용자 정보 설정
        companyBoard.setUserId(login.getUserId());
        companyBoard.setUserName(login.getUserName());

        try {
            // 유튜브 링크 처리
            if (youtubeLink != null && !youtubeLink.isEmpty()) {
                String videoId = extractYoutubeVideoId(youtubeLink);
                if (videoId != null) {
                    String iframeCode = String.format(
                        "<iframe width=\"750\" height=\"420\" src=\"https://www.youtube.com/embed/%s\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>",
                        videoId
                    );
                    companyBoard.setCpBoardYoutubeLink(iframeCode);
                } else {
                    companyBoard.setCpBoardYoutubeLink(null); // 비정상적인 링크 처리
                }
            } else {
                // 유튜브 링크가 비었을 경우 기존 값을 유지하도록 설정
                CompanyBoardDTO existingBoard = companyBoardService.getCompanyBoardDetail(companyBoard.getCpBoardNo());
                companyBoard.setCpBoardYoutubeLink(existingBoard.getCpBoardYoutubeLink());
            }

            // 대표 이미지 처리
            if (cpBoardReperImgFile != null && !cpBoardReperImgFile.isEmpty()) {
                // 새 이미지가 업로드되었을 경우
                AttachDTO attach = fileUploadUtils.getAttachByMultipart(cpBoardReperImgFile, "companyBoard");
                companyBoard.setCpBoardReperImg(attach.getAtchFileName());
                attachService.insertAttach(attach); // 파일 정보를 DB에 저장
            } else {
                // 이미지가 선택되지 않은 경우 기존 이미지를 유지
                CompanyBoardDTO existingBoard = companyBoardService.getCompanyBoardDetail(companyBoard.getCpBoardNo());
                companyBoard.setCpBoardReperImg(existingBoard.getCpBoardReperImg());
            }

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
    
    @RequestMapping("/companyProjectDetailView")
    public String companyProjectDetailView(@RequestParam("ptNo") int ptNo, Model model) {

        // 프로젝트 상세 데이터 가져오기
        CompanyProjectDTO companyProject = companyBoardService.getCompanyProjectDetail(ptNo);
        if (companyProject == null) {
            throw new IllegalArgumentException("유효하지 않은 프로젝트 번호입니다: " + ptNo);
        }

        // 사용자 및 회사 정보 가져오기
        CompanyBoardDTO companyBoard = companyBoardService.getCompanyBoardByUserId(companyProject.getUserId());
        if (companyBoard == null) {
            throw new IllegalArgumentException("해당 프로젝트와 연결된 기업 게시판 정보가 없습니다.");
        }

        // 모델에 데이터 추가
        model.addAttribute("companyProject", companyProject);
        model.addAttribute("companyBoard", companyBoard);

        return "companyBoard/companyProjectDetailView";
    }

    @RequestMapping("/companyProjectEditView")
    public String companyProjectEditView(@RequestParam("ptNo") int ptNo, Model model) {
        // 특정 프로젝트 가져오기
    	System.out.println("ptNo: " + ptNo);
        CompanyProjectDTO companyProject = companyBoardService.getCompanyProjectDetail(ptNo);
        System.out.println("companyProject: " + companyProject);
        model.addAttribute("companyProject", companyProject);

        return "companyBoard/companyProjectEditView";
    }
    
    @PostMapping("/companyProjectEditDo")
    public String companyProjectEditDo(
        CompanyProjectDTO companyProjectDTO,
        @RequestParam("thumbnailFile") MultipartFile thumbnailFile,
        RedirectAttributes redirectAttributes) {
    	System.out.println("ptNo: " + companyProjectDTO.getPtNo());
        try {
            // 프로젝트 수정 처리
            companyBoardService.updateCompanyProject(companyProjectDTO, thumbnailFile);
            redirectAttributes.addFlashAttribute("message", "프로젝트가 성공적으로 수정되었습니다.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "프로젝트 수정 중 오류가 발생했습니다: " + e.getMessage());
        }
        return "redirect:/companyProjectDetailView?ptNo=" + companyProjectDTO.getPtNo();
    }
    
    @RequestMapping("/companyBoardDelete")
    public String deleteCompanyBoard(@RequestParam("cpBoardNo") int cpBoardNo, RedirectAttributes redirectAttributes) {
        try {
            companyBoardService.deleteCompanyBoard(cpBoardNo);
            redirectAttributes.addFlashAttribute("message", "게시글이 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "게시글 삭제 중 오류가 발생했습니다.");
        }
        return "redirect:/companyBoardView";
    }
    
    @RequestMapping("/companyProjectDelete")
    public String deleteCompanyProject(@RequestParam("ptNo") int ptNo, RedirectAttributes redirectAttributes) {
        try {
            companyBoardService.deleteCompanyProject(ptNo);
            redirectAttributes.addFlashAttribute("message", "프로젝트가 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "프로젝트 삭제 중 오류가 발생했습니다.");
        }
        return "redirect:/companyBoardView";
    }
	
}

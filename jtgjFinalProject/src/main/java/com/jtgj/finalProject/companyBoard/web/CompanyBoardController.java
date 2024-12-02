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
	        // �� �ۼ� ���� Ȯ��
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
		
		// userId�� ����� UserDTO�� CompanyDTO ��������
	    String userId = login.getUserId();
	    UserDTO userDTO = userService.getUserById(userId);
	    CompanyDTO companyDTO = userService.getCompanyByUserId(userId);
	    
	    // �𵨿� ��� 
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
	        return "redirect:/loginView"; // �α��� ���� üũ
	    }

	    // �α��� ����� ���� ����
	    companyBoard.setUserId(login.getUserId());
	    companyBoard.setUserName(login.getUserName());
	    
	    // **��ǥ �̹��� ����**
	    if (cpBoardReperImgFile == null || cpBoardReperImgFile.isEmpty()) {
	        redirectAttributes.addFlashAttribute("errorMessage", "��ǥ �̹����� ÷�� ���ֽʽÿ�.");
	        return "redirect:/companyBoardWriteView"; // �Է� �������� �ٽ� �̵�
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
                redirectAttributes.addFlashAttribute("errorMessage", "�ùٸ� ��Ʃ�� ��ũ�� �Է����ּ���.");
                return "redirect:/companyBoardWriteView";
            }
	    	
	        // ���� ȣ���� ���� ���� ���ε� �� �Խñ� ���� ó��
	        companyBoardService.writeCompanyBoard(companyBoard, cpBoardReperImgFile);
	    } catch (IOException e) {
	        e.printStackTrace();
	        redirectAttributes.addFlashAttribute("errorMessage", "�Խñ� ���� �� ������ �߻��߽��ϴ�.");
	        return "error"; // ���� �߻� �� ���� ������ �̵�
	    }

	    return "redirect:/companyBoardView"; // ���� �� �Խ��� ����Ʈ�� �����̷�Ʈ
	}
	
	// ��Ʃ�� ��ũ���� Video ID ����
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
	    
	    // companyProject ���� ��������
	    List<CompanyProjectDTO> companyProjects = companyBoardService.getCompanyProjectsByUserId(companyBoard.getUserId());
	    model.addAttribute("companyProjects", companyProjects);
	    return "companyBoard/companyBoardDetailView";
	}
	
	// ���� �������� �̵�
    @RequestMapping("/companyBoardEditView")
    public String companyBoardEditView(@RequestParam("cpBoardNo") int cpBoardNo, Model model) {
        // ���� �Խñ� ������ �ҷ�����
        CompanyBoardDTO companyBoard = companyBoardService.getCompanyBoardDetail(cpBoardNo);
        model.addAttribute("companyBoard", companyBoard);

        return "companyBoard/companyBoardEditView"; // ���� ������ JSP
    }
    
 // ���� ��û ó��
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

        // �α��� ����� ���� ����
        companyBoard.setUserId(login.getUserId());
        companyBoard.setUserName(login.getUserName());

        try {
            // ��Ʃ�� ��ũ ó��
            if (youtubeLink != null && !youtubeLink.isEmpty()) {
                String videoId = extractYoutubeVideoId(youtubeLink);
                if (videoId != null) {
                    String iframeCode = String.format(
                        "<iframe width=\"750\" height=\"420\" src=\"https://www.youtube.com/embed/%s\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>",
                        videoId
                    );
                    companyBoard.setCpBoardYoutubeLink(iframeCode);
                } else {
                    companyBoard.setCpBoardYoutubeLink(null); // ���������� ��ũ ó��
                }
            } else {
                // ��Ʃ�� ��ũ�� ����� ��� ���� ���� �����ϵ��� ����
                CompanyBoardDTO existingBoard = companyBoardService.getCompanyBoardDetail(companyBoard.getCpBoardNo());
                companyBoard.setCpBoardYoutubeLink(existingBoard.getCpBoardYoutubeLink());
            }

            // ��ǥ �̹��� ó��
            if (cpBoardReperImgFile != null && !cpBoardReperImgFile.isEmpty()) {
                // �� �̹����� ���ε�Ǿ��� ���
                AttachDTO attach = fileUploadUtils.getAttachByMultipart(cpBoardReperImgFile, "companyBoard");
                companyBoard.setCpBoardReperImg(attach.getAtchFileName());
                attachService.insertAttach(attach); // ���� ������ DB�� ����
            } else {
                // �̹����� ���õ��� ���� ��� ���� �̹����� ����
                CompanyBoardDTO existingBoard = companyBoardService.getCompanyBoardDetail(companyBoard.getCpBoardNo());
                companyBoard.setCpBoardReperImg(existingBoard.getCpBoardReperImg());
            }

            // ���� ȣ���� ���� �Խñ� �� �̹��� ���� ó��
            companyBoardService.updateCompanyBoard(companyBoard, cpBoardReperImgFile);
        } catch (IOException e) {
            e.printStackTrace();
            return "error"; // ���� �߻� �� ���� ������ �̵�
        }

        return "redirect:/companyBoardDetailView?cpBoardNo=" + companyBoard.getCpBoardNo(); // ���� �Ϸ� �� �� ����� �̵�
    }
    
    // ������Ʈ ��� ������
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

        // �α��� ����� ���� ����
        companyProjectDTO.setUserId(login.getUserId());

        try {
            // ������Ʈ ��� ���� ȣ��
            companyBoardService.writeCompanyProject(companyProjectDTO, thumbnailFile);
            redirectAttributes.addFlashAttribute("message", "������Ʈ�� ���������� ��ϵǾ����ϴ�.");
        } catch (IOException e) {
            redirectAttributes.addFlashAttribute("error", "������Ʈ ��� �� ������ �߻��߽��ϴ�: " + e.getMessage());
        }

        return "redirect:/companyBoardView";
    }
    
    @RequestMapping("/companyProjectDetailView")
    public String companyProjectDetailView(@RequestParam("ptNo") int ptNo, Model model) {

        // ������Ʈ �� ������ ��������
        CompanyProjectDTO companyProject = companyBoardService.getCompanyProjectDetail(ptNo);
        if (companyProject == null) {
            throw new IllegalArgumentException("��ȿ���� ���� ������Ʈ ��ȣ�Դϴ�: " + ptNo);
        }

        // ����� �� ȸ�� ���� ��������
        CompanyBoardDTO companyBoard = companyBoardService.getCompanyBoardByUserId(companyProject.getUserId());
        if (companyBoard == null) {
            throw new IllegalArgumentException("�ش� ������Ʈ�� ����� ��� �Խ��� ������ �����ϴ�.");
        }

        // �𵨿� ������ �߰�
        model.addAttribute("companyProject", companyProject);
        model.addAttribute("companyBoard", companyBoard);

        return "companyBoard/companyProjectDetailView";
    }

    @RequestMapping("/companyProjectEditView")
    public String companyProjectEditView(@RequestParam("ptNo") int ptNo, Model model) {
        // Ư�� ������Ʈ ��������
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
            // ������Ʈ ���� ó��
            companyBoardService.updateCompanyProject(companyProjectDTO, thumbnailFile);
            redirectAttributes.addFlashAttribute("message", "������Ʈ�� ���������� �����Ǿ����ϴ�.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "������Ʈ ���� �� ������ �߻��߽��ϴ�: " + e.getMessage());
        }
        return "redirect:/companyProjectDetailView?ptNo=" + companyProjectDTO.getPtNo();
    }
    
    @RequestMapping("/companyBoardDelete")
    public String deleteCompanyBoard(@RequestParam("cpBoardNo") int cpBoardNo, RedirectAttributes redirectAttributes) {
        try {
            companyBoardService.deleteCompanyBoard(cpBoardNo);
            redirectAttributes.addFlashAttribute("message", "�Խñ��� ���������� �����Ǿ����ϴ�.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "�Խñ� ���� �� ������ �߻��߽��ϴ�.");
        }
        return "redirect:/companyBoardView";
    }
    
    @RequestMapping("/companyProjectDelete")
    public String deleteCompanyProject(@RequestParam("ptNo") int ptNo, RedirectAttributes redirectAttributes) {
        try {
            companyBoardService.deleteCompanyProject(ptNo);
            redirectAttributes.addFlashAttribute("message", "������Ʈ�� ���������� �����Ǿ����ϴ�.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "������Ʈ ���� �� ������ �߻��߽��ϴ�.");
        }
        return "redirect:/companyBoardView";
    }
	
}

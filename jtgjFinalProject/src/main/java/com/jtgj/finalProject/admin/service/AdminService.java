package com.jtgj.finalProject.admin.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgj.finalProject.admin.dao.IAdminDAO;
import com.jtgj.finalProject.attach.dto.AttachDTO;
import com.jtgj.finalProject.companyBoard.dto.CompanyBoardDTO;
import com.jtgj.finalProject.companyBoard.dto.CompanyProjectDTO;
import com.jtgj.finalProject.estimate.dao.IEstimateDAO;
import com.jtgj.finalProject.estimate.dto.EstimateDTO;
import com.jtgj.finalProject.faq.dao.IFaqDAO;
import com.jtgj.finalProject.faq.dto.FaqDTO;
import com.jtgj.finalProject.faq.dto.NoticeDTO;
import com.jtgj.finalProject.user.dto.CompanyDTO;
import com.jtgj.finalProject.user.dto.UserDTO;

@Service
public class AdminService {
	
	@Autowired
	IAdminDAO dao;

	@Autowired
	IEstimateDAO estimateDAO;
	

	
	public List<UserDTO> getUserList(){
		List<UserDTO> result = dao.getUserList();
		return result;
	}
	
	public List<EstimateDTO> getEstimateList(){
		List<EstimateDTO> result = estimateDAO.basic_mater();
		
		return result;
	}
	
	
	public int userDo(UserDTO user) {
		int result = dao.userDo(user);
		return result;
	}
	
	public int userProDo(UserDTO user) {
		int result = dao.userProDo(user);
		return result;
	}
	
	public int userLDo(UserDTO user) {
		int result = dao.userLDo(user);
		return result;
	}
	
	public int userDelDo(UserDTO user) {
		int result = dao.userDelDo(user);
		return result;
	}
	
	public int faqAstDo(FaqDTO faqAst) {
		int result = dao.faqAstDo(faqAst);
		return result;
	}
	
	public int faqAstDelDo(FaqDTO faqAst) {
		int result = dao.faqAstDelDo(faqAst);
		return result;
	}
	
	
	public EstimateDTO getMater(int materNo) {
		EstimateDTO result = dao.getMater(materNo);
		return result;
	}
	
//	public int editMater(EstimateDTO mater) {
//		int result = dao.editMater(mater);
//		return result;
//	}
	
	public int editMater(EstimateDTO mater, String beforeCategory) {
		int result = dao.editMater(mater, beforeCategory);
		return result;
	}
	
	public int writeMater(EstimateDTO mater) {
		return dao.writeMater(mater);
	}
	
	public List<EstimateDTO> all_mater() {
		List<EstimateDTO> result = dao.all_mater();
		
		return result;
	}
	
	public int getMaterNo() {
		int result = dao.getMaterNo();
		return result;
	}

	public int insertAttachMater(AttachDTO attachMater) {
		int result = dao.insertAttachMater(attachMater);
		return result;
	}
	
	public List<AttachDTO> getAttachMater(int materNo) {
		List<AttachDTO> result = dao.getAttachMaterList(materNo);
		return result;
	}
	
	public List<NoticeDTO> getNotiList(){
		List<NoticeDTO> result = dao.getNotiList();
		return result;
	}
	
	public int getNotiNo() {
		int result = dao.getNotiNo();
		return result;
	}

	public int deleteMater(int materNo) {
		int result = dao.deleteMater(materNo);
		return result;
	}
	
	public List<CompanyBoardDTO> getCBList() {
		List<CompanyBoardDTO> result = dao.getCBList();
		return result;
	}
	
	public CompanyBoardDTO getCompanyBoardDetail(int cpBoardNo) {
	    return dao.getCompanyBoardDetail(cpBoardNo);
	}
	
	public List<CompanyProjectDTO> getCompanyProjectsByUserId(String userId) {
        return dao.getCompanyProjectsByUserId(userId);
    }
	
	public CompanyProjectDTO getCompanyProjectDetail(int ptNo) {
    	CompanyProjectDTO projectDetail = dao.getCompanyProjectDetail(ptNo);
        
        return projectDetail;
    }
	
	public List<CompanyProjectDTO> getCompanyProjectsByBoardNo(int cpBoardNo) {
        return dao.getCompanyProjectsByBoardNo(cpBoardNo);
    }
	
	
	// 총 탄소배출량 데이터 가져오기
	public Map<String, Object> getChartData() {
        List<CompanyDTO> companyList = dao.getCompanyList();  // 기업 목록 가져오기

        List<Integer> values = new ArrayList<>();

        // 각 기업의 이름과 총 탄소배출량을 리스트에 저장
        for (CompanyDTO company : companyList) {
            values.add(company.getCpCarbonEmissions());  // 탄소배출량
        }

        Map<String, Object> chartData = new HashMap<>();
        chartData.put("values", values);  // 차트의 데이터

        return chartData;
    }
}

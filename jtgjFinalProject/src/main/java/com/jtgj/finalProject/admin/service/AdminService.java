package com.jtgj.finalProject.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgj.finalProject.admin.dao.IAdminDAO;
import com.jtgj.finalProject.attach.dto.AttachDTO;
import com.jtgj.finalProject.estimate.dao.IEstimateDAO;
import com.jtgj.finalProject.estimate.dto.EstimateDTO;
import com.jtgj.finalProject.faq.dao.IFaqDAO;
import com.jtgj.finalProject.faq.dto.FaqDTO;
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
	
	public int editMater(EstimateDTO mater) {
		int result = dao.editMater(mater);
		return result;
	}
	
	public int writeMater(EstimateDTO mater) {
		int result = dao.writeMater(mater);
		return result;
	}
	
	public int delMater(int materNo) {
		int result = dao.delMater(materNo);
		return result;
	}
	
	public int getMaterNo() {
		int result = dao.getMaterNo();
		return result;
	}

	public int insertAttach(AttachDTO materAttach) {
		int result = dao.insertAttach(materAttach);
		return result;
	}
	
	public List<AttachDTO> getMaterAttachList(int materNo){
		List<AttachDTO> result = dao.getMaterAttachList(materNo);
		return result;
	}
	
}

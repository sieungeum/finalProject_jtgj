package com.jtgj.finalProject.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.jtgj.finalProject.attach.dto.AttachDTO;
import com.jtgj.finalProject.common.vo.PageSearchVO;
import com.jtgj.finalProject.estimate.dto.EstimateDTO;
import com.jtgj.finalProject.faq.dto.CommentDTO;
import com.jtgj.finalProject.faq.dto.FaqDTO;
import com.jtgj.finalProject.user.dto.UserDTO;

@Mapper
public interface IAdminDAO {
	List<UserDTO> getUserList();
	int userDo(UserDTO user);
	int userProDo(UserDTO user);
	int userLDo(UserDTO user);
	int userDelDo(UserDTO user);
	List<FaqDTO> getFaqList();
	int faqAstDo(FaqDTO faqAst);
	int faqAstDelDo(FaqDTO faqAst);
	int getFaqCount();
	List<FaqDTO> getUserId();
	int getUserId(UserDTO userId);
	
	List<EstimateDTO> basic_mater();
	EstimateDTO getMater(int materNo);
	int editMater(EstimateDTO mater);
	int writeMater(EstimateDTO mater);
	int getMaterNo();
	
	int insertAttachMater(AttachDTO attachMater);
	List<AttachDTO> getAttachMaterList(int materNo);

	
}

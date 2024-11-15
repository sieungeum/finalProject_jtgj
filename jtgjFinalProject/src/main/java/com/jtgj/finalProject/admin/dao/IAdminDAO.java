package com.jtgj.finalProject.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	List<FaqDTO> getFaqCount();
	List<FaqDTO> getUserId();
	int getUserId(UserDTO userId);
	
	@Select("SELECT * FROM materials WHERE materNo = #{materNo}")
    EstimateDTO getMaterByNo(int materNo);
	
	@Update("UPDATE materials SET materName = #{materName}, materGasKg = #{materGasKg}, materPrice = #{materPrice}, materDurability = #{materDurability}, materInfo = #{materInfo}, materClassify = #{materClassify} WHERE materNo = #{materNo}")
	void updateMater(EstimateDTO estimateDTO);

}

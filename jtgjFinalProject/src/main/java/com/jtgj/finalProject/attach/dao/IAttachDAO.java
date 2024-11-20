package com.jtgj.finalProject.attach.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.jtgj.finalProject.attach.dto.AttachDTO;

@Mapper
public interface IAttachDAO {
	int insertAttach(AttachDTO attach);
	List<AttachDTO> getAttachList(Map<String, Object> params);
}

package com.jtgj.finalProject.chat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgj.finalProject.chat.dto.ChatLogDTO;


@Mapper
public interface IChatLogDAO {
	
	// �ش� ä�ù��� ä�ó��� ��������
	public List<ChatLogDTO> getChatList(int roomNo);
	
	// ä�ó��� DB�� ����
	public int insertChat(ChatLogDTO chatLog);

}
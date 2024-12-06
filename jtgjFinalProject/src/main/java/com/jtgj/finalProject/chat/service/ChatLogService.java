package com.jtgj.finalProject.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgj.finalProject.chat.dao.IChatLogDAO;
import com.jtgj.finalProject.chat.dto.ChatLogDTO;

@Service
public class ChatLogService {

	@Autowired
	IChatLogDAO dao;
	
	public List<ChatLogDTO> getChatList(int roomNo){
		List<ChatLogDTO> result = dao.getChatList(roomNo);
		return result;
	}
	
	public int insertChat(ChatLogDTO chatLog) {
		int result = dao.insertChat(chatLog);
		return result;
	}
	
}

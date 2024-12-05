package com.jtgj.finalProject.chat.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jtgj.finalProject.chat.dto.RoomDTO;
import com.jtgj.finalProject.chat.service.RoomService;
import com.jtgj.finalProject.user.dto.UserDTO;

@Controller
public class RoomController {
	
	@Autowired
	RoomService roomService;

	// 채팅방 목록 화면
	@RequestMapping("/chatListView")
	public String chatListView(Model model) {
		
		List<RoomDTO> roomList = roomService.getRoomList();
		model.addAttribute("roomList", roomList);
		
		return "chat/chatListView";
	}
	
	// 채팅방 생성 화면
	@RequestMapping("/roomCreateView")
	public String roomCreateView(Model model, HttpSession session) {
		
		UserDTO login = (UserDTO) session.getAttribute("login");
		
		if(login == null) {
			return "member/loginView";
		}
		
		return "chat/roomCreateView";
	}
	
	// 채팅방 생성
	@RequestMapping("/roomCreateDo")
	public String roomCreateDo(RoomDTO room, HttpSession session) {
		
		System.out.println(room);
		
		UserDTO login = (UserDTO)session.getAttribute("login");
		
		if(login == null) {
			return "redirect:/loginView";
		}
		
		room.setUserId(login.getUserId());
		room.setUserName(login.getUserName());
		
		roomService.createRoom(room);
		
		return "redirect:/chatListView";
	}
	
	
}
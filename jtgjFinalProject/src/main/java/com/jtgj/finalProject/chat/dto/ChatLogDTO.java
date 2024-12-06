package com.jtgj.finalProject.chat.dto;

public class ChatLogDTO {
	
	private int chatNo;			/* 채팅로그 식별번호 PK */
	private String userId;		/* 작성자 아이디 */
	private String userName;		/* 작성자 닉네임 */
	private int roomNo;			/* 채팅방의 번호 */
	private String chatMsg;		/* 채팅 메시지 내용 */
	private String sendDate;	/* 메시지 날짜 */
	
	public ChatLogDTO() {}

	public ChatLogDTO(int chatNo, String userId, String userName, int roomNo, String chatMsg, String sendDate) {
		super();
		this.chatNo = chatNo;
		this.userId = userId;
		this.userName = userName;
		this.roomNo = roomNo;
		this.chatMsg = chatMsg;
		this.sendDate = sendDate;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getChatMsg() {
		return chatMsg;
	}

	public void setChatMsg(String chatMsg) {
		this.chatMsg = chatMsg;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	@Override
	public String toString() {
		return "ChatLogDTO [chatNo=" + chatNo + ", userId=" + userId + ", userName=" + userName + ", roomNo=" + roomNo
				+ ", chatMsg=" + chatMsg + ", sendDate=" + sendDate + "]";
	}
	
}

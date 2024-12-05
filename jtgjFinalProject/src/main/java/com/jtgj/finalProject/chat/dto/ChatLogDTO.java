package com.jtgj.finalProject.chat.dto;

public class ChatLogDTO {
	
	private int chatNo;			/* ä�÷α� �ĺ���ȣ PK */
	private String userId;		/* �ۼ��� ���̵� */
	private String userName;		/* �ۼ��� �г��� */
	private int roomNo;			/* ä�ù��� ��ȣ */
	private String chatMsg;		/* ä�� �޽��� ���� */
	private String sendDate;	/* �޽��� ��¥ */
	
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

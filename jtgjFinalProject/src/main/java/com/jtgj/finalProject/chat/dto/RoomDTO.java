package com.jtgj.finalProject.chat.dto;

public class RoomDTO {
    private int roomNo;			/* �� ��ȣ */
    private String roomName;	/* �� ���� */
    private String userId;		/* ���� ���̵� */
    private String userName;		/* ���� �г��� */
    private String regDate;		/* ����� */
    private String delYn;		/* �� �������� */
    
	public RoomDTO() { }

	public RoomDTO(int roomNo, String roomName, String userId, String userName, String regDate, String delYn) {
		super();
		this.roomNo = roomNo;
		this.roomName = roomName;
		this.userId = userId;
		this.userName = userName;
		this.regDate = regDate;
		this.delYn = delYn;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
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

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	@Override
	public String toString() {
		return "RoomDTO [roomNo=" + roomNo + ", roomName=" + roomName + ", userId=" + userId + ", userName=" + userName
				+ ", regDate=" + regDate + ", delYn=" + delYn + "]";
	}

	

}
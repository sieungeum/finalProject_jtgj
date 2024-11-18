package com.jtgj.finalProject.faq.dto;

public class NoticeDTO {
	
	private String userId;
	private String userName;
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	private String noticeDelYn;
	
	public NoticeDTO() {
		super();
	}

	public NoticeDTO(String userId, String userName, int noticeNo, String noticeTitle, String noticeContent,
			String noticeDate, String noticeDelYn) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeDelYn = noticeDelYn;
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

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getNoticeDelYn() {
		return noticeDelYn;
	}

	public void setNoticeDelYn(String noticeDelYn) {
		this.noticeDelYn = noticeDelYn;
	}

	@Override
	public String toString() {
		return "NoticeDTO [userId=" + userId + ", userName=" + userName + ", noticeNo=" + noticeNo + ", noticeTitle="
				+ noticeTitle + ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate + ", noticeDelYn="
				+ noticeDelYn + "]";
	}

}

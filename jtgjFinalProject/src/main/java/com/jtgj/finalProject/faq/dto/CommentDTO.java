package com.jtgj.finalProject.faq.dto;

public class CommentDTO {
	private String comNo;
	private int faqNo;
	private String userId;
	private String userName;
	private String comContent;
	private String comDate;
	private String comDelYn;
	
	public CommentDTO() {
		super();
	}

	public CommentDTO(String comNo, int faqNo, String userId, String userName, String comContent, String comDate,
			String comDelYn) {
		super();
		this.comNo = comNo;
		this.faqNo = faqNo;
		this.userId = userId;
		this.userName = userName;
		this.comContent = comContent;
		this.comDate = comDate;
		this.comDelYn = comDelYn;
	}

	public String getComNo() {
		return comNo;
	}

	public void setComNo(String comNo) {
		this.comNo = comNo;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
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

	public String getComContent() {
		return comContent;
	}

	public void setComContent(String comContent) {
		this.comContent = comContent;
	}

	public String getComDate() {
		return comDate;
	}

	public void setComDate(String comDate) {
		this.comDate = comDate;
	}

	public String getComDelYn() {
		return comDelYn;
	}

	public void setComDelYn(String comDelYn) {
		this.comDelYn = comDelYn;
	}

	@Override
	public String toString() {
		return "CommentDTO [comNo=" + comNo + ", faqNo=" + faqNo + ", userId=" + userId + ", userName=" + userName
				+ ", comContent=" + comContent + ", comDate=" + comDate + ", comDelYn=" + comDelYn + "]";
	}
	
}

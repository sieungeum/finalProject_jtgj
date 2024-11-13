package com.jtgj.finalProject.faq.dto;

public class FaqDTO {
	
	private String userId;
	private String userName;
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private String faqDate;
	private String faqDelYn;
	private String faqSicYn;
	private int faqCount;
	
	public FaqDTO() {
		super();
	}

	public FaqDTO(String userId, String userName, int faqNo, String faqTitle, String faqContent, String faqDate,
			String faqDelYn, String faqSicYn, int faqCount) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqDate = faqDate;
		this.faqDelYn = faqDelYn;
		this.faqSicYn = faqSicYn;
		this.faqCount = faqCount;
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

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public String getFaqDate() {
		return faqDate;
	}

	public void setFaqDate(String faqDate) {
		this.faqDate = faqDate;
	}

	public String getFaqDelYn() {
		return faqDelYn;
	}

	public void setFaqDelYn(String faqDelYn) {
		this.faqDelYn = faqDelYn;
	}

	public String getFaqSicYn() {
		return faqSicYn;
	}

	public void setFaqSicYn(String faqSicYn) {
		this.faqSicYn = faqSicYn;
	}

	public int getFaqCount() {
		return faqCount;
	}

	public void setFaqCount(int faqCount) {
		this.faqCount = faqCount;
	}

	@Override
	public String toString() {
		return "FaqDTO [userId=" + userId + ", userName=" + userName + ", faqNo=" + faqNo + ", faqTitle=" + faqTitle
				+ ", faqContent=" + faqContent + ", faqDate=" + faqDate + ", faqDelYn=" + faqDelYn + ", faqSicYn="
				+ faqSicYn + ", faqCount=" + faqCount + "]";
	}
	
}

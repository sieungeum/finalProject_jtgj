package com.jtgj.finalProject.faq.dto;

public class FaqDTO {
	
	private String userId;
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private String faqDate;
	private String faqDelYn;
	private String faqSicYn;
	
	public FaqDTO() {
		super();
	}

	public FaqDTO(String userId, int faqNo, String faqTitle, String faqContent, String faqDate, String faqDelYn,
			String faqSicYn) {
		super();
		this.userId = userId;
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqDate = faqDate;
		this.faqDelYn = faqDelYn;
		this.faqSicYn = faqSicYn;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	@Override
	public String toString() {
		return "FaqDTO [userId=" + userId + ", faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent
				+ ", faqDate=" + faqDate + ", faqDelYn=" + faqDelYn + ", faqSicYn=" + faqSicYn + "]";
	}
	
}

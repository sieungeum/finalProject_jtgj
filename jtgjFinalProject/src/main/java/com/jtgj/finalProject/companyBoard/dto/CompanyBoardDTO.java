package com.jtgj.finalProject.companyBoard.dto;

public class CompanyBoardDTO {
	
	private int cpBoardNo; 			// ���ȫ���Խ��� ��ȣ
	private String cpBoardTitle;	// �Խ��� ����
	private String userId;			// ��� ���̵�
//	private String userEmail;		// ��� �̸���
	private String cpCeoName;		// ����� ����
	private String cpAddress;		// ��� �ּ�
	private String cp_open_date;	// ��� â����
	private String cpBoardContent;	// �Խ��� ����
	private String cpBoardArea;		// ��� ���� ����
	private String cpBoardDate;		// ȫ���� �����
	private String cpBoardDelYn;	// ��������
	
	public CompanyBoardDTO() {
		super();
	}

	public CompanyBoardDTO(int cpBoardNo, String cpBoardTitle, String userId, String userEmail, String cpCeoName,
			String cpAddress, String cp_open_date, String cpBoardContent, String cpBoardArea, String cpBoardDate,
			String cpBoardDelYn) {
		super();
		this.cpBoardNo = cpBoardNo;
		this.cpBoardTitle = cpBoardTitle;
		this.userId = userId;
		this.cpCeoName = cpCeoName;
		this.cpAddress = cpAddress;
		this.cp_open_date = cp_open_date;
		this.cpBoardContent = cpBoardContent;
		this.cpBoardArea = cpBoardArea;
		this.cpBoardDate = cpBoardDate;
		this.cpBoardDelYn = cpBoardDelYn;
	}

	public int getCpBoardNo() {
		return cpBoardNo;
	}

	public void setCpBoardNo(int cpBoardNo) {
		this.cpBoardNo = cpBoardNo;
	}

	public String getCpBoardTitle() {
		return cpBoardTitle;
	}

	public void setCpBoardTitle(String cpBoardTitle) {
		this.cpBoardTitle = cpBoardTitle;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCpCeoName() {
		return cpCeoName;
	}

	public void setCpCeoName(String cpCeoName) {
		this.cpCeoName = cpCeoName;
	}

	public String getCpAddress() {
		return cpAddress;
	}

	public void setCpAddress(String cpAddress) {
		this.cpAddress = cpAddress;
	}

	public String getCp_open_date() {
		return cp_open_date;
	}

	public void setCp_open_date(String cp_open_date) {
		this.cp_open_date = cp_open_date;
	}

	public String getCpBoardContent() {
		return cpBoardContent;
	}

	public void setCpBoardContent(String cpBoardContent) {
		this.cpBoardContent = cpBoardContent;
	}

	public String getCpBoardArea() {
		return cpBoardArea;
	}

	public void setCpBoardArea(String cpBoardArea) {
		this.cpBoardArea = cpBoardArea;
	}

	public String getCpBoardDate() {
		return cpBoardDate;
	}

	public void setCpBoardDate(String cpBoardDate) {
		this.cpBoardDate = cpBoardDate;
	}

	public String getCpBoardDelYn() {
		return cpBoardDelYn;
	}

	public void setCpBoardDelYn(String cpBoardDelYn) {
		this.cpBoardDelYn = cpBoardDelYn;
	}

	@Override
	public String toString() {
		return "CompanyBoardDTO [cpBoardNo=" + cpBoardNo + ", cpBoardTitle=" + cpBoardTitle + ", userId=" + userId
				+ ", cpCeoName=" + cpCeoName + ", cpAddress=" + cpAddress
				+ ", cp_open_date=" + cp_open_date + ", cpBoardContent=" + cpBoardContent + ", cpBoardArea="
				+ cpBoardArea + ", cpBoardDate=" + cpBoardDate + ", cpBoardDelYn=" + cpBoardDelYn + "]";
	}
	
}

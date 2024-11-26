package com.jtgj.finalProject.companyBoard.dto;

public class CompanyBoardDTO {
	
	private int cpBoardNo; 			// ���ȫ���Խ��� ��ȣ
	private String cpBoardIntro;	// �Ұ���
	private String userId;			// ��� ���̵�
	private String userName;		// �����
	private String cpBoardContent;	// �Խ��� ����
	private String cpBoardArea;		// ��� ���� ����
	private String cpBoardDate;		// ȫ���� �����
	private String cpBoardReperImg;	// �� ��ǥ �̹���
//    private String cpBoardProfImg;	// ������ �̹���
	private String cpBoardDelYn;	// ��������
	
	public CompanyBoardDTO() {
		super();
	}

	public CompanyBoardDTO(int cpBoardNo, String cpBoardIntro, String userId, String userName, String cpBoardContent,
			String cpBoardArea, String cpBoardDate, String cpBoardReperImg, String cpBoardDelYn) {
		super();
		this.cpBoardNo = cpBoardNo;
		this.cpBoardIntro = cpBoardIntro;
		this.userId = userId;
		this.userName = userName;
		this.cpBoardContent = cpBoardContent;
		this.cpBoardArea = cpBoardArea;
		this.cpBoardDate = cpBoardDate;
		this.cpBoardReperImg = cpBoardReperImg;
		this.cpBoardDelYn = cpBoardDelYn;
	}

	public int getCpBoardNo() {
		return cpBoardNo;
	}

	public void setCpBoardNo(int cpBoardNo) {
		this.cpBoardNo = cpBoardNo;
	}

	public String getCpBoardIntro() {
		return cpBoardIntro;
	}

	public void setCpBoardIntro(String cpBoardIntro) {
		this.cpBoardIntro = cpBoardIntro;
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

	public String getCpBoardReperImg() {
		return cpBoardReperImg;
	}

	public void setCpBoardReperImg(String cpBoardReperImg) {
		this.cpBoardReperImg = cpBoardReperImg;
	}

	public String getCpBoardDelYn() {
		return cpBoardDelYn;
	}

	public void setCpBoardDelYn(String cpBoardDelYn) {
		this.cpBoardDelYn = cpBoardDelYn;
	}

	@Override
	public String toString() {
		return "CompanyBoardDTO [cpBoardNo=" + cpBoardNo + ", cpBoardIntro=" + cpBoardIntro + ", userId=" + userId
				+ ", userName=" + userName + ", cpBoardContent=" + cpBoardContent + ", cpBoardArea=" + cpBoardArea
				+ ", cpBoardDate=" + cpBoardDate + ", cpBoardReperImg=" + cpBoardReperImg + ", cpBoardDelYn="
				+ cpBoardDelYn + "]";
	}
	
}

package com.jtgj.finalProject.companyBoard.dto;

public class CompanyBoardDTO {
	
	private int cpBoardNo; 			// 기업홍보게시판 번호
	private String cpBoardTitle;	// 게시판 제목
	private String userId;			// 기업 아이디
//	private String userEmail;		// 기업 이메일
	private String cpCeoName;		// 사장님 성함
	private String cpAddress;		// 기업 주소
	private String cp_open_date;	// 기업 창설일
	private String cpBoardContent;	// 게시판 내용
	private String cpBoardArea;		// 기업 업무 영역
	private String cpBoardDate;		// 홍보글 등록일
	private String cpBoardDelYn;	// 삭제여부
	
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

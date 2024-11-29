package com.jtgj.finalProject.companyBoard.dto;

public class CompanyBoardDTO {
	
	private int cpBoardNo; 			// 기업홍보게시판 번호
	private String cpBoardIntro;	// 소개글
	private String userId;			// 기업 아이디
	private String userName;		// 기업명
	private String cpBoardContent;	// 게시판 내용
	private String cpBoardArea;		// 기업 업무 영역
	private String cpBoardDate;		// 홍보글 등록일
	private String cpBoardReperImg;	// 글 대표 이미지
//    private String cpBoardProfImg;	// 프로필 이미지
	private String cpBoardDelYn;	// 삭제여부
	// 추가 필드 (users 테이블에서 가져옴, company_board에는 저장하지 않음)
	private String userProfImg; // 사용자 프로필 이미지
	private String cpCeoName;     // 기업 대표 이름
	private String cpOpenDate;    // 기업 설립일
	private String userPhone;     // 연락처
	private String userEmail;     // 이메일
	private String cpAddress;     // 주소
	private String cpBoardYoutubeLink;
	
	public CompanyBoardDTO() {
		super();
	}

	public CompanyBoardDTO(int cpBoardNo, String cpBoardIntro, String userId, String userName, String cpBoardContent,
			String cpBoardArea, String cpBoardDate, String cpBoardReperImg, String cpBoardDelYn, String userProfImg,
			String cpCeoName, String cpOpenDate, String userPhone, String userEmail, String cpAddress,
			String cpBoardYoutubeLink) {
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
		this.userProfImg = userProfImg;
		this.cpCeoName = cpCeoName;
		this.cpOpenDate = cpOpenDate;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.cpAddress = cpAddress;
		this.cpBoardYoutubeLink = cpBoardYoutubeLink;
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

	public String getUserProfImg() {
		return userProfImg;
	}

	public void setUserProfImg(String userProfImg) {
		this.userProfImg = userProfImg;
	}

	public String getCpCeoName() {
		return cpCeoName;
	}

	public void setCpCeoName(String cpCeoName) {
		this.cpCeoName = cpCeoName;
	}

	public String getCpOpenDate() {
		return cpOpenDate;
	}

	public void setCpOpenDate(String cpOpenDate) {
		this.cpOpenDate = cpOpenDate;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getCpAddress() {
		return cpAddress;
	}

	public void setCpAddress(String cpAddress) {
		this.cpAddress = cpAddress;
	}

	public String getCpBoardYoutubeLink() {
		return cpBoardYoutubeLink;
	}

	public void setCpBoardYoutubeLink(String cpBoardYoutubeLink) {
		this.cpBoardYoutubeLink = cpBoardYoutubeLink;
	}

	@Override
	public String toString() {
		return "CompanyBoardDTO [cpBoardNo=" + cpBoardNo + ", cpBoardIntro=" + cpBoardIntro + ", userId=" + userId
				+ ", userName=" + userName + ", cpBoardContent=" + cpBoardContent + ", cpBoardArea=" + cpBoardArea
				+ ", cpBoardDate=" + cpBoardDate + ", cpBoardReperImg=" + cpBoardReperImg + ", cpBoardDelYn="
				+ cpBoardDelYn + ", userProfImg=" + userProfImg + ", cpCeoName=" + cpCeoName + ", cpOpenDate="
				+ cpOpenDate + ", userPhone=" + userPhone + ", userEmail=" + userEmail + ", cpAddress=" + cpAddress
				+ ", cpBoardYoutubeLink=" + cpBoardYoutubeLink + "]";
	}
	
}

package com.jtgj.finalProject.user.dto;

public class CompanyDTO {
	private String userId;
	private String cpRegiFile;
	private String cpRegiNum;
	private String cpCeoName;
	private String cpAddress;
	private String cpOpenDate;
	
	public CompanyDTO() {
		super();
	}

	public CompanyDTO(String userId, String cpRegiFile, String cpRegiNum, String cpCeoName, String cpAddress,
			String cpOpenDate) {
		super();
		this.userId = userId;
		this.cpRegiFile = cpRegiFile;
		this.cpRegiNum = cpRegiNum;
		this.cpCeoName = cpCeoName;
		this.cpAddress = cpAddress;
		this.cpOpenDate = cpOpenDate;
	}

	@Override
	public String toString() {
		return "CompanyDTO [userId=" + userId + ", cpRegiFile=" + cpRegiFile + ", cpRegiNum=" + cpRegiNum
				+ ", cpCeoName=" + cpCeoName + ", cpAddress=" + cpAddress + ", cpOpenDate=" + cpOpenDate + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCpRegiFile() {
		return cpRegiFile;
	}

	public void setCpRegiFile(String cpRegiFile) {
		this.cpRegiFile = cpRegiFile;
	}

	public String getCpRegiNum() {
		return cpRegiNum;
	}

	public void setCpRegiNum(String cpRegiNum) {
		this.cpRegiNum = cpRegiNum;
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

	public String getCpOpenDate() {
		return cpOpenDate;
	}

	public void setCpOpenDate(String cpOpenDate) {
		this.cpOpenDate = cpOpenDate;
	}

}
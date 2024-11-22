package com.jtgj.finalProject.user.dto;

public class CompanyDTO {
	private String userId;
	private String cpRegiNum;
	private String cpCeoName;
	private String cpAddress;
	private String cpOpenDate;
	private int cpCarbonEmissions; // 탄소배출량
	private String cpCertification; // 홍보 가능 회사 인증
	
	public CompanyDTO() {
		super();
	}

	public CompanyDTO(String userId, String cpRegiNum, String cpCeoName, String cpAddress, String cpOpenDate,
			int cpCarbonEmissions, String cpCertification) {
		super();
		this.userId = userId;
		this.cpRegiNum = cpRegiNum;
		this.cpCeoName = cpCeoName;
		this.cpAddress = cpAddress;
		this.cpOpenDate = cpOpenDate;
		this.cpCarbonEmissions = cpCarbonEmissions;
		this.cpCertification = cpCertification;
	}

	@Override
	public String toString() {
		return "CompanyDTO [userId=" + userId + ", cpRegiNum=" + cpRegiNum + ", cpCeoName=" + cpCeoName + ", cpAddress="
				+ cpAddress + ", cpOpenDate=" + cpOpenDate + ", cpCarbonEmissions=" + cpCarbonEmissions
				+ ", cpCertification=" + cpCertification + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public int getCpCarbonEmissions() {
		return cpCarbonEmissions;
	}

	public void setCpCarbonEmissions(int cpCarbonEmissions) {
		this.cpCarbonEmissions = cpCarbonEmissions;
	}

	public String getCpCertification() {
		return cpCertification;
	}

	public void setCpCertification(String cpCertification) {
		this.cpCertification = cpCertification;
	}
	
}

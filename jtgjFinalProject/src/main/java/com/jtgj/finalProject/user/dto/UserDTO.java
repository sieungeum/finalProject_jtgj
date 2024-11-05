package com.jtgj.finalProject.user.dto;

public class UserDTO {
	private String userId;
	private String userPw;
	private String userEmail;
	private String userDate;
	private String userAccount;
	private String userRank;
	
	
	public UserDTO() {
	}


	public UserDTO(String userId, String userPw, String userEmail, String userDate, String userAccount,
			String userRank) {
		this.userId = userId;
		this.userPw = userPw;
		this.userEmail = userEmail;
		this.userDate = userDate;
		this.userAccount = userAccount;
		this.userRank = userRank;
	}


	@Override
	public String toString() {
		return "UserDTO [userId=" + userId + ", userPw=" + userPw + ", userEmail=" + userEmail + ", userDate="
				+ userDate + ", userAccount=" + userAccount + ", userRank=" + userRank + "]";
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPw() {
		return userPw;
	}


	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getUserDate() {
		return userDate;
	}


	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}


	public String getUserAccount() {
		return userAccount;
	}


	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}


	public String getUserRank() {
		return userRank;
	}


	public void setUserRank(String userRank) {
		this.userRank = userRank;
	}
	
	
}

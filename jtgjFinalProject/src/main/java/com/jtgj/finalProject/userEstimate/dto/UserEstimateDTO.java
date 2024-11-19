package com.jtgj.finalProject.userEstimate.dto;

public class UserEstimateDTO {
	private String userId;
	private int estiNo;
	private int estiCost;
	private int estiCarbon;
	
	public UserEstimateDTO() {
		super();
	}
	
	public UserEstimateDTO(String userId, int estiNo, int estiCost, int estiCarbon) {
		super();
		this.userId = userId;
		this.estiNo = estiNo;
		this.estiCost = estiCost;
		this.estiCarbon = estiCarbon;
	}
	
	@Override
	public String toString() {
		return "UserEstimateDTO [userId=" + userId + ", estiNo=" + estiNo + ", estiCost=" + estiCost + ", estiCarbon="
				+ estiCarbon + "]";
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getEstiNo() {
		return estiNo;
	}
	public void setEstiNo(int estiNo) {
		this.estiNo = estiNo;
	}
	public int getEstiCost() {
		return estiCost;
	}
	public void setEstiCost(int estiCost) {
		this.estiCost = estiCost;
	}
	public int getEstiCarbon() {
		return estiCarbon;
	}
	public void setEstiCarbon(int estiCarbon) {
		this.estiCarbon = estiCarbon;
	}
	
}

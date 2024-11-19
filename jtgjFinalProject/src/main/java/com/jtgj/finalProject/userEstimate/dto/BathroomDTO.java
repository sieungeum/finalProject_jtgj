package com.jtgj.finalProject.userEstimate.dto;

public class BathroomDTO {
	private int bathroomNo;
	private String bathroomCategory;
	private String bathroomName;
	private int bathroomKg;
	private int bathroomCost;
	private String materClassify;
	public BathroomDTO() {
		super();
	}
	public BathroomDTO(int bathroomNo, String bathroomCategory, String bathroomName, int bathroomKg, int bathroomCost,
			String materClassify) {
		super();
		this.bathroomNo = bathroomNo;
		this.bathroomCategory = bathroomCategory;
		this.bathroomName = bathroomName;
		this.bathroomKg = bathroomKg;
		this.bathroomCost = bathroomCost;
		this.materClassify = materClassify;
	}
	@Override
	public String toString() {
		return "BathroomDTO [bathroomNo=" + bathroomNo + ", bathroomCategory=" + bathroomCategory + ", bathroomName="
				+ bathroomName + ", bathroomKg=" + bathroomKg + ", bathroomCost=" + bathroomCost + ", materClassify="
				+ materClassify + "]";
	}
	public int getBathroomNo() {
		return bathroomNo;
	}
	public void setBathroomNo(int bathroomNo) {
		this.bathroomNo = bathroomNo;
	}
	public String getBathroomCategory() {
		return bathroomCategory;
	}
	public void setBathroomCategory(String bathroomCategory) {
		this.bathroomCategory = bathroomCategory;
	}
	public String getBathroomName() {
		return bathroomName;
	}
	public void setBathroomName(String bathroomName) {
		this.bathroomName = bathroomName;
	}
	public int getBathroomKg() {
		return bathroomKg;
	}
	public void setBathroomKg(int bathroomKg) {
		this.bathroomKg = bathroomKg;
	}
	public int getBathroomCost() {
		return bathroomCost;
	}
	public void setBathroomCost(int bathroomCost) {
		this.bathroomCost = bathroomCost;
	}
	public String getMaterClassify() {
		return materClassify;
	}
	public void setMaterClassify(String materClassify) {
		this.materClassify = materClassify;
	}
	
	
}

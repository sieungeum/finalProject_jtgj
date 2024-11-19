package com.jtgj.finalProject.userEstimate.dto;

public class BathroomDTO {
	private int estiNo;
	private String bathroomCategory;
	private String bathroomName;
	private int bathroomKg;
	private float bathroomCarbon;
	private int bathroomCost;
	private String materClassify;
	public BathroomDTO() {
		super();
	}
	public BathroomDTO(int estiNo, String bathroomCategory, String bathroomName, int bathroomKg, float bathroomCarbon,
			int bathroomCost, String materClassify) {
		super();
		this.estiNo = estiNo;
		this.bathroomCategory = bathroomCategory;
		this.bathroomName = bathroomName;
		this.bathroomKg = bathroomKg;
		this.bathroomCarbon = bathroomCarbon;
		this.bathroomCost = bathroomCost;
		this.materClassify = materClassify;
	}
	@Override
	public String toString() {
		return "BathroomDTO [estiNo=" + estiNo + ", bathroomCategory=" + bathroomCategory + ", bathroomName="
				+ bathroomName + ", bathroomKg=" + bathroomKg + ", bathroomCarbon=" + bathroomCarbon + ", bathroomCost="
				+ bathroomCost + ", materClassify=" + materClassify + "]";
	}
	public int getEstiNo() {
		return estiNo;
	}
	public void setEstiNo(int estiNo) {
		this.estiNo = estiNo;
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
	public float getBathroomCarbon() {
		return bathroomCarbon;
	}
	public void setBathroomCarbon(float bathroomCarbon) {
		this.bathroomCarbon = bathroomCarbon;
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

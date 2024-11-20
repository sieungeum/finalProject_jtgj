package com.jtgj.finalProject.userEstimate.dto;

public class RoofingDTO {
	private int estiNo;
	private String roofingCategory;
	private String roofingName;
	private int roofingKg;
	private double roofingCarbon;
	private int roofingCost;
	private String materClassify;
	public RoofingDTO() {
		super();
	}
	public RoofingDTO(int estiNo, String roofingCategory, String roofingName, int roofingKg, double roofingCarbon,
			int roofingCost, String materClassify) {
		super();
		this.estiNo = estiNo;
		this.roofingCategory = roofingCategory;
		this.roofingName = roofingName;
		this.roofingKg = roofingKg;
		this.roofingCarbon = roofingCarbon;
		this.roofingCost = roofingCost;
		this.materClassify = materClassify;
	}
	@Override
	public String toString() {
		return "RoofingDTO [estiNo=" + estiNo + ", roofingCategory=" + roofingCategory + ", roofingName=" + roofingName
				+ ", roofingKg=" + roofingKg + ", roofingCarbon=" + roofingCarbon + ", roofingCost=" + roofingCost
				+ ", materClassify=" + materClassify + "]";
	}
	public int getEstiNo() {
		return estiNo;
	}
	public void setEstiNo(int estiNo) {
		this.estiNo = estiNo;
	}
	public String getRoofingCategory() {
		return roofingCategory;
	}
	public void setRoofingCategory(String roofingCategory) {
		this.roofingCategory = roofingCategory;
	}
	public String getRoofingName() {
		return roofingName;
	}
	public void setRoofingName(String roofingName) {
		this.roofingName = roofingName;
	}
	public int getRoofingKg() {
		return roofingKg;
	}
	public void setRoofingKg(int roofingKg) {
		this.roofingKg = roofingKg;
	}
	public double getRoofingCarbon() {
		return roofingCarbon;
	}
	public void setRoofingCarbon(double roofingCarbon) {
		this.roofingCarbon = roofingCarbon;
	}
	public int getRoofingCost() {
		return roofingCost;
	}
	public void setRoofingCost(int roofingCost) {
		this.roofingCost = roofingCost;
	}
	public String getMaterClassify() {
		return materClassify;
	}
	public void setMaterClassify(String materClassify) {
		this.materClassify = materClassify;
	}
	
	
}

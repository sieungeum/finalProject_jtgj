package com.jtgj.finalProject.userEstimate.dto;

public class RoofingDTO {
	private int roofingNo;
	private String roofingCategory;
	private String roofingName;
	private int roofingKg;
	private int roofingCost;
	private String materClassify;
	public RoofingDTO() {
		super();
	}
	public RoofingDTO(int roofingNo, String roofingCategory, String roofingName, int roofingKg, int roofingCost,
			String materClassify) {
		super();
		this.roofingNo = roofingNo;
		this.roofingCategory = roofingCategory;
		this.roofingName = roofingName;
		this.roofingKg = roofingKg;
		this.roofingCost = roofingCost;
		this.materClassify = materClassify;
	}
	@Override
	public String toString() {
		return "RoofingDTO [roofingNo=" + roofingNo + ", roofingCategory=" + roofingCategory + ", roofingName="
				+ roofingName + ", roofingKg=" + roofingKg + ", roofingCost=" + roofingCost + ", materClassify="
				+ materClassify + "]";
	}
	public int getRoofingNo() {
		return roofingNo;
	}
	public void setRoofingNo(int roofingNo) {
		this.roofingNo = roofingNo;
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

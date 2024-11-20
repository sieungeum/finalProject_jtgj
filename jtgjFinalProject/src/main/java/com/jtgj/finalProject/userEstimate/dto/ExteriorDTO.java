package com.jtgj.finalProject.userEstimate.dto;

public class ExteriorDTO {
	private int estiNo;
	private String exteriorCategory;
	private String exteriorName;
	private int exteriorKg;
	private float exteriorCarbon;
	private int exteriorCost;
	private String materClassify;
	public ExteriorDTO() {
		super();
	}
	public ExteriorDTO(int estiNo, String exteriorCategory, String exteriorName, int exteriorKg, float exteriorCarbon,
			int exteriorCost, String materClassify) {
		super();
		this.estiNo = estiNo;
		this.exteriorCategory = exteriorCategory;
		this.exteriorName = exteriorName;
		this.exteriorKg = exteriorKg;
		this.exteriorCarbon = exteriorCarbon;
		this.exteriorCost = exteriorCost;
		this.materClassify = materClassify;
	}
	@Override
	public String toString() {
		return "ExteriorDTO [estiNo=" + estiNo + ", exteriorCategory=" + exteriorCategory + ", exteriorName="
				+ exteriorName + ", exteriorKg=" + exteriorKg + ", exteriorCarbon=" + exteriorCarbon + ", exteriorCost="
				+ exteriorCost + ", materClassify=" + materClassify + "]";
	}
	public int getEstiNo() {
		return estiNo;
	}
	public void setEstiNo(int estiNo) {
		this.estiNo = estiNo;
	}
	public String getExteriorCategory() {
		return exteriorCategory;
	}
	public void setExteriorCategory(String exteriorCategory) {
		this.exteriorCategory = exteriorCategory;
	}
	public String getExteriorName() {
		return exteriorName;
	}
	public void setExteriorName(String exteriorName) {
		this.exteriorName = exteriorName;
	}
	public int getExteriorKg() {
		return exteriorKg;
	}
	public void setExteriorKg(int exteriorKg) {
		this.exteriorKg = exteriorKg;
	}
	public float getExteriorCarbon() {
		return exteriorCarbon;
	}
	public void setExteriorCarbon(float exteriorCarbon) {
		this.exteriorCarbon = exteriorCarbon;
	}
	public int getExteriorCost() {
		return exteriorCost;
	}
	public void setExteriorCost(int exteriorCost) {
		this.exteriorCost = exteriorCost;
	}
	public String getMaterClassify() {
		return materClassify;
	}
	public void setMaterClassify(String materClassify) {
		this.materClassify = materClassify;
	}
	
	
}

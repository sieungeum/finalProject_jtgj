package com.jtgj.finalProject.userEstimate.dto;

public class ExteriorDTO {
	private int esteriorNo;
	private String exteriorCategory;
	private String exteriorName;
	private int exteriorKg;
	private int exteriorCost;
	private String materClassify;
	public ExteriorDTO() {
		super();
	}
	public ExteriorDTO(int esteriorNo, String exteriorCategory, String exteriorName, int exteriorKg, int exteriorCost,
			String materClassify) {
		super();
		this.esteriorNo = esteriorNo;
		this.exteriorCategory = exteriorCategory;
		this.exteriorName = exteriorName;
		this.exteriorKg = exteriorKg;
		this.exteriorCost = exteriorCost;
		this.materClassify = materClassify;
	}
	@Override
	public String toString() {
		return "ExteriorDTO [esteriorNo=" + esteriorNo + ", exteriorCategory=" + exteriorCategory + ", exteriorName="
				+ exteriorName + ", exteriorKg=" + exteriorKg + ", exteriorCost=" + exteriorCost + ", materClassify="
				+ materClassify + "]";
	}
	public int getEsteriorNo() {
		return esteriorNo;
	}
	public void setEsteriorNo(int esteriorNo) {
		this.esteriorNo = esteriorNo;
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

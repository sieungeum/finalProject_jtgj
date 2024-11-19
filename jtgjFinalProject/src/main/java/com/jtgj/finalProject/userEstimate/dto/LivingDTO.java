package com.jtgj.finalProject.userEstimate.dto;

public class LivingDTO {
	private int livingNo;
	private String livingCategory;
	private String livingName;
	private int livingKg;
	private int livingCost;
	private String materClassify;
	public LivingDTO() {
		super();
	}
	public LivingDTO(int livingNo, String livingCategory, String livingName, int livingKg, int livingCost,
			String materClassify) {
		super();
		this.livingNo = livingNo;
		this.livingCategory = livingCategory;
		this.livingName = livingName;
		this.livingKg = livingKg;
		this.livingCost = livingCost;
		this.materClassify = materClassify;
	}
	@Override
	public String toString() {
		return "LivingDTO [livingNo=" + livingNo + ", livingCategory=" + livingCategory + ", livingName=" + livingName
				+ ", livingKg=" + livingKg + ", livingCost=" + livingCost + ", materClassify=" + materClassify + "]";
	}
	public int getLivingNo() {
		return livingNo;
	}
	public void setLivingNo(int livingNo) {
		this.livingNo = livingNo;
	}
	public String getLivingCategory() {
		return livingCategory;
	}
	public void setLivingCategory(String livingCategory) {
		this.livingCategory = livingCategory;
	}
	public String getLivingName() {
		return livingName;
	}
	public void setLivingName(String livingName) {
		this.livingName = livingName;
	}
	public int getLivingKg() {
		return livingKg;
	}
	public void setLivingKg(int livingKg) {
		this.livingKg = livingKg;
	}
	public int getLivingCost() {
		return livingCost;
	}
	public void setLivingCost(int livingCost) {
		this.livingCost = livingCost;
	}
	public String getMaterClassify() {
		return materClassify;
	}
	public void setMaterClassify(String materClassify) {
		this.materClassify = materClassify;
	}
	
	
	
}

package com.jtgj.finalProject.userEstimate.dto;

public class LivingDTO {
	private int estiNo;
	private String livingCategory;
	private String livingName;
	private int livingKg;
	private double livingCarbon;
	private int livingCost;
	private String materClassify;
	public LivingDTO() {
		super();
	}
	public LivingDTO(int estiNo, String livingCategory, String livingName, int livingKg, double livingCarbon,
			int livingCost, String materClassify) {
		super();
		this.estiNo = estiNo;
		this.livingCategory = livingCategory;
		this.livingName = livingName;
		this.livingKg = livingKg;
		this.livingCarbon = livingCarbon;
		this.livingCost = livingCost;
		this.materClassify = materClassify;
	}
	@Override
	public String toString() {
		return "LivingDTO [estiNo=" + estiNo + ", livingCategory=" + livingCategory + ", livingName=" + livingName
				+ ", livingKg=" + livingKg + ", livingCarbon=" + livingCarbon + ", livingCost=" + livingCost
				+ ", materClassify=" + materClassify + "]";
	}
	public int getEstiNo() {
		return estiNo;
	}
	public void setEstiNo(int estiNo) {
		this.estiNo = estiNo;
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
	public double getLivingCarbon() {
		return livingCarbon;
	}
	public void setLivingCarbon(double livingCarbon) {
		this.livingCarbon = livingCarbon;
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

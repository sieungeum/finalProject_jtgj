package com.jtgj.finalProject.estimate.dto;

public class EstimateDTO {
	private int materNo;
	private String materCategory;
	private String materName;
	private double materGasKg;
	private String materImg;
	private int materPrice;
	private String materDurability;
	private String materInfo;
	private String materClassify;
	private String kgPerPyeong;
	public EstimateDTO() {
		super();
	}
	public EstimateDTO(int materNo, String materCategory, String materName, double materGasKg, String materImg,
			int materPrice, String materDurability, String materInfo, String materClassify, String kgPerPyeong) {
		super();
		this.materNo = materNo;
		this.materCategory = materCategory;
		this.materName = materName;
		this.materGasKg = materGasKg;
		this.materImg = materImg;
		this.materPrice = materPrice;
		this.materDurability = materDurability;
		this.materInfo = materInfo;
		this.materClassify = materClassify;
		this.kgPerPyeong = kgPerPyeong;
	}
	@Override
	public String toString() {
		return "EstimateDTO [materNo=" + materNo + ", materCategory=" + materCategory + ", materName=" + materName
				+ ", materGasKg=" + materGasKg + ", materImg=" + materImg + ", materPrice=" + materPrice
				+ ", materDurability=" + materDurability + ", materInfo=" + materInfo + ", materClassify="
				+ materClassify + ", kgPerPyeong=" + kgPerPyeong + "]";
	}
	public int getMaterNo() {
		return materNo;
	}
	public void setMaterNo(int materNo) {
		this.materNo = materNo;
	}
	public String getMaterCategory() {
		return materCategory;
	}
	public void setMaterCategory(String materCategory) {
		this.materCategory = materCategory;
	}
	public String getMaterName() {
		return materName;
	}
	public void setMaterName(String materName) {
		this.materName = materName;
	}
	public double getMaterGasKg() {
		return materGasKg;
	}
	public void setMaterGasKg(double materGasKg) {
		this.materGasKg = materGasKg;
	}
	public String getMaterImg() {
		return materImg;
	}
	public void setMaterImg(String materImg) {
		this.materImg = materImg;
	}
	public int getMaterPrice() {
		return materPrice;
	}
	public void setMaterPrice(int materPrice) {
		this.materPrice = materPrice;
	}
	public String getMaterDurability() {
		return materDurability;
	}
	public void setMaterDurability(String materDurability) {
		this.materDurability = materDurability;
	}
	public String getMaterInfo() {
		return materInfo;
	}
	public void setMaterInfo(String materInfo) {
		this.materInfo = materInfo;
	}
	public String getMaterClassify() {
		return materClassify;
	}
	public void setMaterClassify(String materClassify) {
		this.materClassify = materClassify;
	}
	public String getKgPerPyeong() {
		return kgPerPyeong;
	}
	public void setKgPerPyeong(String kgPerPyeong) {
		this.kgPerPyeong = kgPerPyeong;
	}
	
	
	
}

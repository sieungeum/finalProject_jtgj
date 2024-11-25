package com.jtgj.finalProject.userEstimate.dto;

public class UserEstimateDTO {
	private String userId;
	private int estiNo;
	private int materNo;
	private String materCategory;
	private String materName;
	private String materGasKg;
	private String materImg;
	private String materPrice;
	private String materDurability;
	private String materInfo;
	private String materClassify;
	private String kgPerPyeong;
	public UserEstimateDTO() {
		super();
	}
	public UserEstimateDTO(String userId, int estiNo, int materNo, String materCategory, String materName,
			String materGasKg, String materImg, String materPrice, String materDurability, String materInfo,
			String materClassify, String kgPerPyeong) {
		super();
		this.userId = userId;
		this.estiNo = estiNo;
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
		return "UserEstimateDTO [userId=" + userId + ", estiNo=" + estiNo + ", materNo=" + materNo + ", materCategory="
				+ materCategory + ", materName=" + materName + ", materGasKg=" + materGasKg + ", materImg=" + materImg
				+ ", materPrice=" + materPrice + ", materDurability=" + materDurability + ", materInfo=" + materInfo
				+ ", materClassify=" + materClassify + ", kgPerPyeong=" + kgPerPyeong + "]";
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
	public String getMaterGasKg() {
		return materGasKg;
	}
	public void setMaterGasKg(String materGasKg) {
		this.materGasKg = materGasKg;
	}
	public String getMaterImg() {
		return materImg;
	}
	public void setMaterImg(String materImg) {
		this.materImg = materImg;
	}
	public String getMaterPrice() {
		return materPrice;
	}
	public void setMaterPrice(String materPrice) {
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

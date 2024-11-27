package com.jtgj.finalProject.userEstimate.dto;

public class UserEstimateDTO {
	private String userId;
	private int estiNo;
	private int materNo;
	private String materCategory;
	private String materName;
	private double materGasKg;
	private String materImg;
	private int materPrice;
	private String materDurability;
	private String materInfo;
	private String materClassify;
	private int kgPerPyeong;
	private String estiDate;
	private String estiTitle;
	public UserEstimateDTO() {
		super();
	}
	public UserEstimateDTO(String userId, int estiNo, int materNo, String materCategory, String materName,
			double materGasKg, String materImg, int materPrice, String materDurability, String materInfo,
			String materClassify, int kgPerPyeong, String estiDate, String estiTitle) {
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
		this.estiDate = estiDate;
		this.estiTitle = estiTitle;
	}
	@Override
	public String toString() {
		return "UserEstimateDTO [userId=" + userId + ", estiNo=" + estiNo + ", materNo=" + materNo + ", materCategory="
				+ materCategory + ", materName=" + materName + ", materGasKg=" + materGasKg + ", materImg=" + materImg
				+ ", materPrice=" + materPrice + ", materDurability=" + materDurability + ", materInfo=" + materInfo
				+ ", materClassify=" + materClassify + ", kgPerPyeong=" + kgPerPyeong + ", estiDate=" + estiDate
				+ ", estiTitle=" + estiTitle + "]";
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
	public int getKgPerPyeong() {
		return kgPerPyeong;
	}
	public void setKgPerPyeong(int kgPerPyeong) {
		this.kgPerPyeong = kgPerPyeong;
	}
	public String getEstiDate() {
		return estiDate;
	}
	public void setEstiDate(String estiDate) {
		this.estiDate = estiDate;
	}
	public String getEstiTitle() {
		return estiTitle;
	}
	public void setEstiTitle(String estiTitle) {
		this.estiTitle = estiTitle;
	}
	
	
	
}

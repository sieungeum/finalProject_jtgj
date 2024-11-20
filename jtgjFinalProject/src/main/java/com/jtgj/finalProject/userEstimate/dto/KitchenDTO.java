package com.jtgj.finalProject.userEstimate.dto;

public class KitchenDTO {
	private int estiNo;
	private String kitchenCategory;
	private String kitchenName;
	private int kitchenKg;
	private double kitchenCarbon;
	private int kitchenCost;
	private String materClassify;
	public KitchenDTO() {
		super();
	}
	public KitchenDTO(int estiNo, String kitchenCategory, String kitchenName, int kitchenKg, double kitchenCarbon,
			int kitchenCost, String materClassify) {
		super();
		this.estiNo = estiNo;
		this.kitchenCategory = kitchenCategory;
		this.kitchenName = kitchenName;
		this.kitchenKg = kitchenKg;
		this.kitchenCarbon = kitchenCarbon;
		this.kitchenCost = kitchenCost;
		this.materClassify = materClassify;
	}
	@Override
	public String toString() {
		return "KitchenDTO [estiNo=" + estiNo + ", kitchenCategory=" + kitchenCategory + ", kitchenName=" + kitchenName
				+ ", kitchenKg=" + kitchenKg + ", kitchenCarbon=" + kitchenCarbon + ", kitchenCost=" + kitchenCost
				+ ", materClassify=" + materClassify + "]";
	}
	public int getEstiNo() {
		return estiNo;
	}
	public void setEstiNo(int estiNo) {
		this.estiNo = estiNo;
	}
	public String getKitchenCategory() {
		return kitchenCategory;
	}
	public void setKitchenCategory(String kitchenCategory) {
		this.kitchenCategory = kitchenCategory;
	}
	public String getKitchenName() {
		return kitchenName;
	}
	public void setKitchenName(String kitchenName) {
		this.kitchenName = kitchenName;
	}
	public int getKitchenKg() {
		return kitchenKg;
	}
	public void setKitchenKg(int kitchenKg) {
		this.kitchenKg = kitchenKg;
	}
	public double getKitchenCarbon() {
		return kitchenCarbon;
	}
	public void setKitchenCarbon(double kitchenCarbon) {
		this.kitchenCarbon = kitchenCarbon;
	}
	public int getKitchenCost() {
		return kitchenCost;
	}
	public void setKitchenCost(int kitchenCost) {
		this.kitchenCost = kitchenCost;
	}
	public String getMaterClassify() {
		return materClassify;
	}
	public void setMaterClassify(String materClassify) {
		this.materClassify = materClassify;
	}
	
	
}

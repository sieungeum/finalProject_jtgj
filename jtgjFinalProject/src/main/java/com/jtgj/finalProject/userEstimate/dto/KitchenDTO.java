package com.jtgj.finalProject.userEstimate.dto;

public class KitchenDTO {
	private int kitchenNo;
	private String kitchenCategory;
	private String kitchenName;
	private int kitchenKg;
	private int kitchenCost;
	private String materClassify;
	public KitchenDTO() {
		super();
	}
	public KitchenDTO(int kitchenNo, String kitchenCategory, String kitchenName, int kitchenKg, int kitchenCost,
			String materClassify) {
		super();
		this.kitchenNo = kitchenNo;
		this.kitchenCategory = kitchenCategory;
		this.kitchenName = kitchenName;
		this.kitchenKg = kitchenKg;
		this.kitchenCost = kitchenCost;
		this.materClassify = materClassify;
	}
	@Override
	public String toString() {
		return "KitchenDTO [kitchenNo=" + kitchenNo + ", kitchenCategory=" + kitchenCategory + ", kitchenName="
				+ kitchenName + ", kitchenKg=" + kitchenKg + ", kitchenCost=" + kitchenCost + ", materClassify="
				+ materClassify + "]";
	}
	public int getKitchenNo() {
		return kitchenNo;
	}
	public void setKitchenNo(int kitchenNo) {
		this.kitchenNo = kitchenNo;
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

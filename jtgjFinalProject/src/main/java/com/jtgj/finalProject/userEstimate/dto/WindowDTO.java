package com.jtgj.finalProject.userEstimate.dto;

public class WindowDTO {
	private int estiNo;
	private String windowCategory;
	private String windowName;
	private int windowKg;
	private double windowCarbon;
	private int windowCost;
	private String materClassify;
	public WindowDTO() {
		super();
	}
	public WindowDTO(int estiNo, String windowCategory, String windowName, int windowKg, double windowCarbon,
			int windowCost, String materClassify) {
		super();
		this.estiNo = estiNo;
		this.windowCategory = windowCategory;
		this.windowName = windowName;
		this.windowKg = windowKg;
		this.windowCarbon = windowCarbon;
		this.windowCost = windowCost;
		this.materClassify = materClassify;
	}
	@Override
	public String toString() {
		return "WindowDTO [estiNo=" + estiNo + ", windowCategory=" + windowCategory + ", windowName=" + windowName
				+ ", windowKg=" + windowKg + ", windowCarbon=" + windowCarbon + ", windowCost=" + windowCost
				+ ", materClassify=" + materClassify + "]";
	}
	public int getEstiNo() {
		return estiNo;
	}
	public void setEstiNo(int estiNo) {
		this.estiNo = estiNo;
	}
	public String getWindowCategory() {
		return windowCategory;
	}
	public void setWindowCategory(String windowCategory) {
		this.windowCategory = windowCategory;
	}
	public String getWindowName() {
		return windowName;
	}
	public void setWindowName(String windowName) {
		this.windowName = windowName;
	}
	public int getWindowKg() {
		return windowKg;
	}
	public void setWindowKg(int windowKg) {
		this.windowKg = windowKg;
	}
	public double getWindowCarbon() {
		return windowCarbon;
	}
	public void setWindowCarbon(double windowCarbon) {
		this.windowCarbon = windowCarbon;
	}
	public int getWindowCost() {
		return windowCost;
	}
	public void setWindowCost(int windowCost) {
		this.windowCost = windowCost;
	}
	public String getMaterClassify() {
		return materClassify;
	}
	public void setMaterClassify(String materClassify) {
		this.materClassify = materClassify;
	}
	
	
}

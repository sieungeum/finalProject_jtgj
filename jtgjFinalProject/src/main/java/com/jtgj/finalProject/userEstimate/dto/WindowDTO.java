package com.jtgj.finalProject.userEstimate.dto;

public class WindowDTO {
	private int windowNo;
	private String windowCategory;
	private String windowName;
	private int windowKg;
	private int windowCost;
	private String materClassify;
	public WindowDTO() {
		super();
	}
	public WindowDTO(int windowNo, String windowCategory, String windowName, int windowKg, int windowCost,
			String materClassify) {
		super();
		this.windowNo = windowNo;
		this.windowCategory = windowCategory;
		this.windowName = windowName;
		this.windowKg = windowKg;
		this.windowCost = windowCost;
		this.materClassify = materClassify;
	}
	@Override
	public String toString() {
		return "WindowDTO [windowNo=" + windowNo + ", windowCategory=" + windowCategory + ", windowName=" + windowName
				+ ", windowKg=" + windowKg + ", windowCost=" + windowCost + ", materClassify=" + materClassify + "]";
	}
	public int getWindowNo() {
		return windowNo;
	}
	public void setWindowNo(int windowNo) {
		this.windowNo = windowNo;
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

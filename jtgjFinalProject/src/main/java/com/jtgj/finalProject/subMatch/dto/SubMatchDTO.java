package com.jtgj.finalProject.subMatch.dto;

public class SubMatchDTO {
	private String subName;
	private int materNo;
	
	public SubMatchDTO() {
	}

	public SubMatchDTO(String subName, int materNo) {
		this.subName = subName;
		this.materNo = materNo;
	}

	@Override
	public String toString() {
		return "SubMatchDTO [subName=" + subName + ", materNo=" + materNo + "]";
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public int getMaterNo() {
		return materNo;
	}

	public void setMaterNo(int materNo) {
		this.materNo = materNo;
	}
	
	
	
}

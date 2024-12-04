package com.jtgj.finalProject.project.dto;

public class ProjectDTO {
	private String userId;
	private String ptThumbnail;
	private String ptContent;
	private String ptTitle;
	private int ptNo;
	private String ptDesign;
	private String ptConstruction;
	private int ptLandArea;
	private int ptBuildingArea;	
	private int ptTotalFloorArea;
	private String ptFloorNum;	 	
	private String ptHouseholdNum;
	private String ptCompletionYear;
	private int cpBoardNo;
	
	private String userName;
	
	public ProjectDTO() {
		super();
	}

	public ProjectDTO(String userId, String ptThumbnail, String ptContent, String ptTitle, int ptNo, String ptDesign,
			String ptConstruction, int ptLandArea, int ptBuildingArea, int ptTotalFloorArea, String ptFloorNum,
			String ptHouseholdNum, String ptCompletionYear, int cpBoardNo, String userName) {
		super();
		this.userId = userId;
		this.ptThumbnail = ptThumbnail;
		this.ptContent = ptContent;
		this.ptTitle = ptTitle;
		this.ptNo = ptNo;
		this.ptDesign = ptDesign;
		this.ptConstruction = ptConstruction;
		this.ptLandArea = ptLandArea;
		this.ptBuildingArea = ptBuildingArea;
		this.ptTotalFloorArea = ptTotalFloorArea;
		this.ptFloorNum = ptFloorNum;
		this.ptHouseholdNum = ptHouseholdNum;
		this.ptCompletionYear = ptCompletionYear;
		this.cpBoardNo = cpBoardNo;
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "ProjectDTO [userId=" + userId + ", ptThumbnail=" + ptThumbnail + ", ptContent=" + ptContent
				+ ", ptTitle=" + ptTitle + ", ptNo=" + ptNo + ", ptDesign=" + ptDesign + ", ptConstruction="
				+ ptConstruction + ", ptLandArea=" + ptLandArea + ", ptBuildingArea=" + ptBuildingArea
				+ ", ptTotalFloorArea=" + ptTotalFloorArea + ", ptFloorNum=" + ptFloorNum + ", ptHouseholdNum="
				+ ptHouseholdNum + ", ptCompletionYear=" + ptCompletionYear + ", cpBoardNo=" + cpBoardNo + ", userName="
				+ userName + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPtThumbnail() {
		return ptThumbnail;
	}

	public void setPtThumbnail(String ptThumbnail) {
		this.ptThumbnail = ptThumbnail;
	}

	public String getPtContent() {
		return ptContent;
	}

	public void setPtContent(String ptContent) {
		this.ptContent = ptContent;
	}

	public String getPtTitle() {
		return ptTitle;
	}

	public void setPtTitle(String ptTitle) {
		this.ptTitle = ptTitle;
	}

	public int getPtNo() {
		return ptNo;
	}

	public void setPtNo(int ptNo) {
		this.ptNo = ptNo;
	}

	public String getPtDesign() {
		return ptDesign;
	}

	public void setPtDesign(String ptDesign) {
		this.ptDesign = ptDesign;
	}

	public String getPtConstruction() {
		return ptConstruction;
	}

	public void setPtConstruction(String ptConstruction) {
		this.ptConstruction = ptConstruction;
	}

	public int getPtLandArea() {
		return ptLandArea;
	}

	public void setPtLandArea(int ptLandArea) {
		this.ptLandArea = ptLandArea;
	}

	public int getPtBuildingArea() {
		return ptBuildingArea;
	}

	public void setPtBuildingArea(int ptBuildingArea) {
		this.ptBuildingArea = ptBuildingArea;
	}

	public int getPtTotalFloorArea() {
		return ptTotalFloorArea;
	}

	public void setPtTotalFloorArea(int ptTotalFloorArea) {
		this.ptTotalFloorArea = ptTotalFloorArea;
	}

	public String getPtFloorNum() {
		return ptFloorNum;
	}

	public void setPtFloorNum(String ptFloorNum) {
		this.ptFloorNum = ptFloorNum;
	}

	public String getPtHouseholdNum() {
		return ptHouseholdNum;
	}

	public void setPtHouseholdNum(String ptHouseholdNum) {
		this.ptHouseholdNum = ptHouseholdNum;
	}

	public String getPtCompletionYear() {
		return ptCompletionYear;
	}

	public void setPtCompletionYear(String ptCompletionYear) {
		this.ptCompletionYear = ptCompletionYear;
	}

	public int getCpBoardNo() {
		return cpBoardNo;
	}

	public void setCpBoardNo(int cpBoardNo) {
		this.cpBoardNo = cpBoardNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	
}

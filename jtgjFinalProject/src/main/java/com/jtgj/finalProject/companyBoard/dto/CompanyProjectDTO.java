package com.jtgj.finalProject.companyBoard.dto;

public class CompanyProjectDTO {
	
	private String userId;               // ���� ID
    private int ptNo;                    // ������Ʈ ��ȣ
    private String ptThumbnail;          // ������
    private String ptContent;            // ����
    private String ptTitle;              // ������Ʈ��
    private String ptDesign;             // ���� �Ⱓ
    private String ptConstruction;       // �Ǽ� �Ⱓ
    private double ptLandArea;           // ��������
    private double ptBuildingArea;       // ���� ����
    private double ptTotalFloorArea;     // ������
    private String ptFloorNum;           // ����
    private String ptHouseholdNum;       // ������
    private String ptCompletionYear;     // �ذ��⵵
    private String ptLocation;           // ������Ʈ �ּ�
    private int cpBoardNo; // �߰��� �ʵ�
    
	public CompanyProjectDTO() {
		super();
	}

	public CompanyProjectDTO(String userId, int ptNo, String ptThumbnail, String ptContent, String ptTitle,
			String ptDesign, String ptConstruction, double ptLandArea, double ptBuildingArea, double ptTotalFloorArea,
			String ptFloorNum, String ptHouseholdNum, String ptCompletionYear, String ptLocation, int cpBoardNo) {
		super();
		this.userId = userId;
		this.ptNo = ptNo;
		this.ptThumbnail = ptThumbnail;
		this.ptContent = ptContent;
		this.ptTitle = ptTitle;
		this.ptDesign = ptDesign;
		this.ptConstruction = ptConstruction;
		this.ptLandArea = ptLandArea;
		this.ptBuildingArea = ptBuildingArea;
		this.ptTotalFloorArea = ptTotalFloorArea;
		this.ptFloorNum = ptFloorNum;
		this.ptHouseholdNum = ptHouseholdNum;
		this.ptCompletionYear = ptCompletionYear;
		this.ptLocation = ptLocation;
		this.cpBoardNo = cpBoardNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getPtNo() {
		return ptNo;
	}

	public void setPtNo(int ptNo) {
		this.ptNo = ptNo;
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

	public double getPtLandArea() {
		return ptLandArea;
	}

	public void setPtLandArea(double ptLandArea) {
		this.ptLandArea = ptLandArea;
	}

	public double getPtBuildingArea() {
		return ptBuildingArea;
	}

	public void setPtBuildingArea(double ptBuildingArea) {
		this.ptBuildingArea = ptBuildingArea;
	}

	public double getPtTotalFloorArea() {
		return ptTotalFloorArea;
	}

	public void setPtTotalFloorArea(double ptTotalFloorArea) {
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

	public String getPtLocation() {
		return ptLocation;
	}

	public void setPtLocation(String ptLocation) {
		this.ptLocation = ptLocation;
	}

	public int getCpBoardNo() {
		return cpBoardNo;
	}

	public void setCpBoardNo(int cpBoardNo) {
		this.cpBoardNo = cpBoardNo;
	}

	@Override
	public String toString() {
		return "CompanyProjectDTO [userId=" + userId + ", ptNo=" + ptNo + ", ptThumbnail=" + ptThumbnail
				+ ", ptContent=" + ptContent + ", ptTitle=" + ptTitle + ", ptDesign=" + ptDesign + ", ptConstruction="
				+ ptConstruction + ", ptLandArea=" + ptLandArea + ", ptBuildingArea=" + ptBuildingArea
				+ ", ptTotalFloorArea=" + ptTotalFloorArea + ", ptFloorNum=" + ptFloorNum + ", ptHouseholdNum="
				+ ptHouseholdNum + ", ptCompletionYear=" + ptCompletionYear + ", ptLocation=" + ptLocation
				+ ", cpBoardNo=" + cpBoardNo + "]";
	}
    
}

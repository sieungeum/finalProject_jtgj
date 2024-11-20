package com.jtgj.finalProject.attach.dto;

public class AttachDTO {
	private int atchNo;	// 첨부파일 번호(PK)
	private int atchParentNo; // 부모글의 번호(FK)
	private String atchFileName; // 실제 저장된 파일명
	private String atchOriginalName; // 사용자가 올릴 당시 파일명
	private long atchFileSize; // 파일 사이즈
	private String atchFancySize; // 사이즈를 KB, MB, GB로 변환
	private String atchContentType; // 컨텐츠 타입(확장자)
	private String atchPath; // 저장 경로
	private String atchType; // 저장 장소의 타입(종류)
	
	public AttachDTO() {
		super();
	}

	public AttachDTO(int atchNo, int atchParentNo, String atchFileName, String atchOriginalName, long atchFileSize,
			String atchFancySize, String atchContentType, String atchPath, String atchType) {
		super();
		this.atchNo = atchNo;
		this.atchParentNo = atchParentNo;
		this.atchFileName = atchFileName;
		this.atchOriginalName = atchOriginalName;
		this.atchFileSize = atchFileSize;
		this.atchFancySize = atchFancySize;
		this.atchContentType = atchContentType;
		this.atchPath = atchPath;
		this.atchType = atchType;
	}

	public int getAtchNo() {
		return atchNo;
	}

	public void setAtchNo(int atchNo) {
		this.atchNo = atchNo;
	}

	public int getAtchParentNo() {
		return atchParentNo;
	}

	public void setAtchParentNo(int atchParentNo) {
		this.atchParentNo = atchParentNo;
	}

	public String getAtchFileName() {
		return atchFileName;
	}

	public void setAtchFileName(String atchFileName) {
		this.atchFileName = atchFileName;
	}

	public String getAtchOriginalName() {
		return atchOriginalName;
	}

	public void setAtchOriginalName(String atchOriginalName) {
		this.atchOriginalName = atchOriginalName;
	}

	public long getAtchFileSize() {
		return atchFileSize;
	}

	public void setAtchFileSize(long atchFileSize) {
		this.atchFileSize = atchFileSize;
	}

	public String getAtchFancySize() {
		return atchFancySize;
	}

	public void setAtchFancySize(String atchFancySize) {
		this.atchFancySize = atchFancySize;
	}

	public String getAtchContentType() {
		return atchContentType;
	}

	public void setAtchContentType(String atchContentType) {
		this.atchContentType = atchContentType;
	}

	public String getAtchPath() {
		return atchPath;
	}

	public void setAtchPath(String atchPath) {
		this.atchPath = atchPath;
	}

	public String getAtchType() {
		return atchType;
	}

	public void setAtchType(String atchType) {
		this.atchType = atchType;
	}

	@Override
	public String toString() {
		return "AttachDTO [atchNo=" + atchNo + ", atchParentNo=" + atchParentNo + ", atchFileName=" + atchFileName
				+ ", atchOriginalName=" + atchOriginalName + ", atchFileSize=" + atchFileSize + ", atchFancySize="
				+ atchFancySize + ", atchContentType=" + atchContentType + ", atchPath=" + atchPath + ", atchType="
				+ atchType + "]";
	}
	
}

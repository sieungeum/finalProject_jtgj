package com.jtgj.finalProject.userEstimate.dto;

public class RoomDTO {
	private int estiNo;
	private String roomCategory;
	private String roomName;
	private int roomKg;
	private double roomCarbon;
	private int roomCost;
	private String materClassify;
	public RoomDTO() {
		super();
	}
	public RoomDTO(int estiNo, String roomCategory, String roomName, int roomKg, double roomCarbon, int roomCost,
			String materClassify) {
		super();
		this.estiNo = estiNo;
		this.roomCategory = roomCategory;
		this.roomName = roomName;
		this.roomKg = roomKg;
		this.roomCarbon = roomCarbon;
		this.roomCost = roomCost;
		this.materClassify = materClassify;
	}
	@Override
	public String toString() {
		return "RoomDTO [estiNo=" + estiNo + ", roomCategory=" + roomCategory + ", roomName=" + roomName + ", roomKg="
				+ roomKg + ", roomCarbon=" + roomCarbon + ", roomCost=" + roomCost + ", materClassify=" + materClassify
				+ "]";
	}
	public int getEstiNo() {
		return estiNo;
	}
	public void setEstiNo(int estiNo) {
		this.estiNo = estiNo;
	}
	public String getRoomCategory() {
		return roomCategory;
	}
	public void setRoomCategory(String roomCategory) {
		this.roomCategory = roomCategory;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getRoomKg() {
		return roomKg;
	}
	public void setRoomKg(int roomKg) {
		this.roomKg = roomKg;
	}
	public double getRoomCarbon() {
		return roomCarbon;
	}
	public void setRoomCarbon(double roomCarbon) {
		this.roomCarbon = roomCarbon;
	}
	public int getRoomCost() {
		return roomCost;
	}
	public void setRoomCost(int roomCost) {
		this.roomCost = roomCost;
	}
	public String getMaterClassify() {
		return materClassify;
	}
	public void setMaterClassify(String materClassify) {
		this.materClassify = materClassify;
	}
	
	
}

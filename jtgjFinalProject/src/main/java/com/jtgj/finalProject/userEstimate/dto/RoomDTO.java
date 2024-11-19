package com.jtgj.finalProject.userEstimate.dto;

public class RoomDTO {
	private int roomNo;
	private String roomCategory;
	private String roomName;
	private int roomKg;
	private int roomCost;
	private String materClassify;
	public RoomDTO() {
		super();
	}
	public RoomDTO(int roomNo, String roomCategory, String roomName, int roomKg, int roomCost, String materClassify) {
		super();
		this.roomNo = roomNo;
		this.roomCategory = roomCategory;
		this.roomName = roomName;
		this.roomKg = roomKg;
		this.roomCost = roomCost;
		this.materClassify = materClassify;
	}
	@Override
	public String toString() {
		return "RoomDTO [roomNo=" + roomNo + ", roomCategory=" + roomCategory + ", roomName=" + roomName + ", roomKg="
				+ roomKg + ", roomCost=" + roomCost + ", materClassify=" + materClassify + "]";
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
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

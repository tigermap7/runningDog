package com.kh.runningdog.chatting.model.vo;

import java.io.Serializable;

public class Chatroom implements Serializable{
	public static final long serialVersionUID = 31L;
	
	private int roomNo;
	private int memberNo;
	
	public Chatroom() {}

	public Chatroom(int roomNo, int memberNo) {
		super();
		this.roomNo = roomNo;
		this.memberNo = memberNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Chatroom [roomNo=" + roomNo + ", memberNo=" + memberNo + "]";
	}
	
	
}

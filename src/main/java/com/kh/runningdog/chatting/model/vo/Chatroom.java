package com.kh.runningdog.chatting.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Chatroom implements Serializable{
	public static final long serialVersionUID = 31L;
	
	private int roomNo;
	private int memberNo;
	private Date lastDate;
	
	public Chatroom() {}

	public Chatroom(int roomNo, int memberNo, Date lastDate) {
		super();
		this.roomNo = roomNo;
		this.memberNo = memberNo;
		this.lastDate = lastDate;
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
	
	public Date getLastDate() {
		return lastDate;
	}

	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}

	@Override
	public String toString() {
		return "Chatroom [roomNo=" + roomNo + ", memberNo=" + memberNo + ", lastDate=" + lastDate + "]";
	}
	
	
}

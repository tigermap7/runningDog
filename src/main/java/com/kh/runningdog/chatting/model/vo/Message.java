package com.kh.runningdog.chatting.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Message implements Serializable{
	private static final long serialVersionUID = 32L;
	
	private int messageNo;
	private int roomNo;
	private int sender;
	private int receiver;
	private Date sendTime;
	private String content;
	
	public Message() {}
	
	public Message(int messageNo, int roomNo, int sender, int receiver, Date sendTime, String content) {
		super();
		this.messageNo = messageNo;
		this.roomNo = roomNo;
		this.sender = sender;
		this.receiver = receiver;
		this.sendTime = sendTime;
		this.content = content;
	}

	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getSender() {
		return sender;
	}

	public void setSender(int sender) {
		this.sender = sender;
	}

	public int getReceiver() {
		return receiver;
	}

	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", roomNo=" + roomNo + ", sender=" + sender + ", receiver="
				+ receiver + ", sendTime=" + sendTime + ", content=" + content + "]";
	}
	
	
	
}

package com.kh.runningdog.member.model.vo;

import java.sql.Date;

public class LeaveMember implements java.io.Serializable {
	private static final long serialVersionUID = 1112L;

	private int leaveUniqueNum;
	private String leaveUserId;
	private String leaveUserPwd;
	private String leaveNickname;
	private String leavePhone;
	private String originProfile;
	private String renameProfile;
	private java.sql.Date leaveJoinDate;
	private java.sql.Date leaveDate;
	private String leaveLoginType;

	public LeaveMember() {}

	public LeaveMember(int leaveUniqueNum, String leaveUserId, String leaveUserPwd, String leaveNickname,
			String leavePhone, String originProfile, String renameProfile, Date leaveJoinDate, Date leaveDate,
			String leaveLoginType) {
		super();
		this.leaveUniqueNum = leaveUniqueNum;
		this.leaveUserId = leaveUserId;
		this.leaveUserPwd = leaveUserPwd;
		this.leaveNickname = leaveNickname;
		this.leavePhone = leavePhone;
		this.originProfile = originProfile;
		this.renameProfile = renameProfile;
		this.leaveJoinDate = leaveJoinDate;
		this.leaveDate = leaveDate;
		this.leaveLoginType = leaveLoginType;
	}

	public int getLeaveUniqueNum() {
		return leaveUniqueNum;
	}

	public void setLeaveUniqueNum(int leaveUniqueNum) {
		this.leaveUniqueNum = leaveUniqueNum;
	}

	public String getLeaveUserId() {
		return leaveUserId;
	}

	public void setLeaveUserId(String leaveUserId) {
		this.leaveUserId = leaveUserId;
	}

	public String getLeaveUserPwd() {
		return leaveUserPwd;
	}

	public void setLeaveUserPwd(String leaveUserPwd) {
		this.leaveUserPwd = leaveUserPwd;
	}

	public String getLeaveNickname() {
		return leaveNickname;
	}

	public void setLeaveNickname(String leaveNickname) {
		this.leaveNickname = leaveNickname;
	}

	public String getLeavePhone() {
		return leavePhone;
	}

	public void setLeavePhone(String leavePhone) {
		this.leavePhone = leavePhone;
	}

	public String getOriginProfile() {
		return originProfile;
	}

	public void setOriginProfile(String originProfile) {
		this.originProfile = originProfile;
	}

	public String getRenameProfile() {
		return renameProfile;
	}

	public void setRenameProfile(String renameProfile) {
		this.renameProfile = renameProfile;
	}

	public java.sql.Date getLeaveJoinDate() {
		return leaveJoinDate;
	}

	public void setLeaveJoinDate(java.sql.Date leaveJoinDate) {
		this.leaveJoinDate = leaveJoinDate;
	}

	public java.sql.Date getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(java.sql.Date leaveDate) {
		this.leaveDate = leaveDate;
	}

	public String getLeaveLoginType() {
		return leaveLoginType;
	}

	public void setLeaveLoginType(String leaveLoginType) {
		this.leaveLoginType = leaveLoginType;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "LeaveMember [leaveUniqueNum=" + leaveUniqueNum + ", leaveUserId=" + leaveUserId + ", leaveUserPwd="
				+ leaveUserPwd + ", leaveNickname=" + leaveNickname + ", leavePhone=" + leavePhone + ", originProfile="
				+ originProfile + ", renameProfile=" + renameProfile + ", leaveJoinDate=" + leaveJoinDate
				+ ", leaveDate=" + leaveDate + ", leaveLoginType=" + leaveLoginType + "]";
	}

}

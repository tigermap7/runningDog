package com.kh.runningdog.member.model.vo;

public class LeaveMember implements java.io.Serializable {
	private static final long serialVersionUID = 1112L;

	private int listMemberNo;
	private int lUniqueNum;
	private String lUserId;
	private String lUserPwd;
	private String lNickname;
	private String lPhone;
	private String lJoinDate;
	private String lLeaveDate;
	private String lLoginType;

	public LeaveMember() {}

	public LeaveMember(int listMemberNo, int lUniqueNum, String lUserId, String lUserPwd, String lNickname,
			String lPhone, String lJoinDate, String lLeaveDate, String lLoginType) {
		super();
		this.listMemberNo = listMemberNo;
		this.lUniqueNum = lUniqueNum;
		this.lUserId = lUserId;
		this.lUserPwd = lUserPwd;
		this.lNickname = lNickname;
		this.lPhone = lPhone;
		this.lJoinDate = lJoinDate;
		this.lLeaveDate = lLeaveDate;
		this.lLoginType = lLoginType;
	}

	public int getListMemberNo() {
		return listMemberNo;
	}

	public void setListMemberNo(int listMemberNo) {
		this.listMemberNo = listMemberNo;
	}

	public int getlUniqueNum() {
		return lUniqueNum;
	}

	public void setlUniqueNum(int lUniqueNum) {
		this.lUniqueNum = lUniqueNum;
	}

	public String getlUserId() {
		return lUserId;
	}

	public void setlUserId(String lUserId) {
		this.lUserId = lUserId;
	}

	public String getlUserPwd() {
		return lUserPwd;
	}

	public void setlUserPwd(String lUserPwd) {
		this.lUserPwd = lUserPwd;
	}

	public String getlNickname() {
		return lNickname;
	}

	public void setlNickname(String lNickname) {
		this.lNickname = lNickname;
	}

	public String getlPhone() {
		return lPhone;
	}

	public void setlPhone(String lPhone) {
		this.lPhone = lPhone;
	}

	public String getlJoinDate() {
		return lJoinDate;
	}

	public void setlJoinDate(String lJoinDate) {
		this.lJoinDate = lJoinDate;
	}

	public String getlLeaveDate() {
		return lLeaveDate;
	}

	public void setlLeaveDate(String lLeaveDate) {
		this.lLeaveDate = lLeaveDate;
	}

	public String getlLoginType() {
		return lLoginType;
	}

	public void setlLoginType(String lLoginType) {
		this.lLoginType = lLoginType;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "LeaveMember [listMemberNo=" + listMemberNo + ", lUniqueNum=" + lUniqueNum + ", lUserId=" + lUserId
				+ ", lUserPwd=" + lUserPwd + ", lNickname=" + lNickname + ", lPhone=" + lPhone + ", lJoinDate="
				+ lJoinDate + ", lLeaveDate=" + lLeaveDate + ", lLoginType=" + lLoginType + "]";
	}

}

package com.kh.runningdog.member.model.vo;

import java.sql.Date;
import org.springframework.stereotype.Service;

@Service
public class Member implements java.io.Serializable {
	private static final long serialVersionUID = 1111L;
	
	private int uniqueNum;
	private String userId;
	private String userPwd;
	private String nickname;
	private String phone;
	private String profileImg;
	private java.sql.Date joinDate;
	private java.sql.Date lastAccessDate;
	private String loginType;
	private String loginLimit;
	
	public Member() {}

	public Member(int uniqueNum, String userId, String userPwd, String nickname, String phone, String profileImg,
			Date joinDate, Date lastAccessDate, String loginType, String loginLimit) {
		super();
		this.uniqueNum = uniqueNum;
		this.userId = userId;
		this.userPwd = userPwd;
		this.nickname = nickname;
		this.phone = phone;
		this.profileImg = profileImg;
		this.joinDate = joinDate;
		this.lastAccessDate = lastAccessDate;
		this.loginType = loginType;
		this.loginLimit = loginLimit;
	}

	public int getUniqueNum() {
		return uniqueNum;
	}

	public void setUniqueNum(int uniqueNum) {
		this.uniqueNum = uniqueNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public java.sql.Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(java.sql.Date joinDate) {
		this.joinDate = joinDate;
	}

	public java.sql.Date getLastAccessDate() {
		return lastAccessDate;
	}

	public void setLastAccessDate(java.sql.Date lastAccessDate) {
		this.lastAccessDate = lastAccessDate;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	public String getLoginLimit() {
		return loginLimit;
	}

	public void setLoginLimit(String loginLimit) {
		this.loginLimit = loginLimit;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Member [uniqueNum=" + uniqueNum + ", userId=" + userId + ", userPwd=" + userPwd + ", nickname="
				+ nickname + ", phone=" + phone + ", profileImg=" + profileImg + ", joinDate=" + joinDate
				+ ", lastAccessDate=" + lastAccessDate + ", loginType=" + loginType + ", loginLimit=" + loginLimit
				+ "]";
	}
	
}

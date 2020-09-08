package com.kh.runningdog.sponsor.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Sponsor implements Serializable {
	private static final long serialVersionUID = 2222L;
	
	private int sNum;
	private String sId;
	private String sTitle;
	private String sSummary;
	private String sContent;
	private Date sDate;
	private int sAmount;
	private int sCurrent;
	private String sOriginal;
	private String sRename;
	
	public Sponsor() {}

	public Sponsor(int sNum, String sId, String sTitle, String sSummary, String sContent, Date sDate, int sAmount,
			int sCurrent, String sOriginal, String sRename) {
		super();
		this.sNum = sNum;
		this.sId = sId;
		this.sTitle = sTitle;
		this.sSummary = sSummary;
		this.sContent = sContent;
		this.sDate = sDate;
		this.sAmount = sAmount;
		this.sCurrent = sCurrent;
		this.sOriginal = sOriginal;
		this.sRename = sRename;
	}

	public int getsNum() {
		return sNum;
	}

	public void setsNum(int sNum) {
		this.sNum = sNum;
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public String getsTitle() {
		return sTitle;
	}

	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}

	public String getsSummary() {
		return sSummary;
	}

	public void setsSummary(String sSummary) {
		this.sSummary = sSummary;
	}

	public String getsContent() {
		return sContent;
	}

	public void setsContent(String sContent) {
		this.sContent = sContent;
	}

	public java.sql.Date getsDate() {
		return sDate;
	}

	public void setsDate(java.sql.Date sDate) {
		this.sDate = sDate;
	}

	public int getsAmount() {
		return sAmount;
	}

	public void setsAmount(int sAmount) {
		this.sAmount = sAmount;
	}

	public int getsCurrent() {
		return sCurrent;
	}

	public void setsCurrent(int sCurrent) {
		this.sCurrent = sCurrent;
	}

	public String getsOriginal() {
		return sOriginal;
	}

	public void setsOriginal(String sOriginal) {
		this.sOriginal = sOriginal;
	}

	public String getsRename() {
		return sRename;
	}

	public void setsRename(String sRename) {
		this.sRename = sRename;
	}

	@Override
	public String toString() {
		return "Sponsor [sNum=" + sNum + ", sId=" + sId + ", sTitle=" + sTitle + ", sSummary=" + sSummary
				+ ", sContent=" + sContent + ", sDate=" + sDate + ", sAmount=" + sAmount + ", sCurrent=" + sCurrent
				+ ", sOriginal=" + sOriginal + ", sRename=" + sRename + "]";
	}
	
	
}

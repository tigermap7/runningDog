package com.kh.runningdog.dreply.model.vo;

import java.sql.Date;

public class Dreply implements java.io.Serializable{
	private static final long serialVersionUID = 6161L;
	
	private int dreNum;
	private int dNum;
	private String dreWriter;
	private String dreContent;
	private java.sql.Date dreDate;
	private java.sql.Date dreMdate;
	private int dreParents;
	private int dreLevel;
	private int uniqueNum;
	
	public Dreply (){}

	public Dreply(int dreNum, int dNum, String dreWriter, String dreContent, Date dreDate, Date dreMdate,
			int dreParents, int dreLevel, int uniqueNum) {
		super();
		this.dreNum = dreNum;
		this.dNum = dNum;
		this.dreWriter = dreWriter;
		this.dreContent = dreContent;
		this.dreDate = dreDate;
		this.dreMdate = dreMdate;
		this.dreParents = dreParents;
		this.dreLevel = dreLevel;
		this.uniqueNum = uniqueNum;
	}

	public int getDreNum() {
		return dreNum;
	}

	public void setDreNum(int dreNum) {
		this.dreNum = dreNum;
	}

	public int getdNum() {
		return dNum;
	}

	public void setdNum(int dNum) {
		this.dNum = dNum;
	}

	public String getDreWriter() {
		return dreWriter;
	}

	public void setDreWriter(String dreWriter) {
		this.dreWriter = dreWriter;
	}

	public String getDreContent() {
		return dreContent;
	}

	public void setDreContent(String dreContent) {
		this.dreContent = dreContent;
	}

	public java.sql.Date getDreDate() {
		return dreDate;
	}

	public void setDreDate(java.sql.Date dreDate) {
		this.dreDate = dreDate;
	}

	public java.sql.Date getDreMdate() {
		return dreMdate;
	}

	public void setDreMdate(java.sql.Date dreMdate) {
		this.dreMdate = dreMdate;
	}

	public int getDreParents() {
		return dreParents;
	}

	public void setDreParents(int dreParents) {
		this.dreParents = dreParents;
	}

	public int getDreLevel() {
		return dreLevel;
	}

	public void setDreLevel(int dreLevel) {
		this.dreLevel = dreLevel;
	}

	public int getUniqueNum() {
		return uniqueNum;
	}

	public void setUniqueNum(int uniqueNum) {
		this.uniqueNum = uniqueNum;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Dreply [dreNum=" + dreNum + ", dNum=" + dNum + ", dreWriter=" + dreWriter + ", dreContent=" + dreContent
				+ ", dreDate=" + dreDate + ", dreMdate=" + dreMdate + ", dreParents=" + dreParents + ", dreLevel="
				+ dreLevel + ", uniqueNum=" + uniqueNum + "]";
	}
	
	
}

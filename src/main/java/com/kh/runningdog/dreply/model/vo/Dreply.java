package com.kh.runningdog.dreply.model.vo;


public class Dreply implements java.io.Serializable{
	private static final long serialVersionUID = 6161L;
	
	private int dreNum;
	private int dNum;
	private String dreWriter;
	private String dreContent;
	private String dreDate;
	private String dreMdate;
	private int dreParents;
	private int dreGroup;
	private int uniqueNum;
	private String dreDelete;
	
	
	public Dreply (){}


	public Dreply(int dreNum, int dNum, String dreWriter, String dreContent, String dreDate, String dreMdate,
			int dreParents, int dreGroup, int uniqueNum, String dreDelete) {
		super();
		this.dreNum = dreNum;
		this.dNum = dNum;
		this.dreWriter = dreWriter;
		this.dreContent = dreContent;
		this.dreDate = dreDate;
		this.dreMdate = dreMdate;
		this.dreParents = dreParents;
		this.dreGroup = dreGroup;
		this.uniqueNum = uniqueNum;
		this.dreDelete = dreDelete;
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


	public String getDreDate() {
		return dreDate;
	}


	public void setDreDate(String dreDate) {
		this.dreDate = dreDate;
	}


	public String getDreMdate() {
		return dreMdate;
	}


	public void setDreMdate(String dreMdate) {
		this.dreMdate = dreMdate;
	}


	public int getDreParents() {
		return dreParents;
	}

	public void setDreParents(int dreParents) {
		this.dreParents = dreParents;
	}


	public int getDreGroup() {
		return dreGroup;
	}


	public void setDreGroup(int dreGroup) {
		this.dreGroup = dreGroup;
	}


	public int getUniqueNum() {
		return uniqueNum;
	}

	public void setUniqueNum(int uniqueNum) {
		this.uniqueNum = uniqueNum;
	}


	public String getDreDelete() {
		return dreDelete;
	}


	public void setDreDelete(String dreDelete) {
		this.dreDelete = dreDelete;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "Dreply [dreNum=" + dreNum + ", dNum=" + dNum + ", dreWriter=" + dreWriter + ", dreContent=" + dreContent
				+ ", dreDate=" + dreDate + ", dreMdate=" + dreMdate + ", dreParents=" + dreParents + ", dreGroup="
				+ dreGroup + ", uniqueNum=" + uniqueNum + ", dreDelete=" + dreDelete + "]";
	}


	
	
	
}

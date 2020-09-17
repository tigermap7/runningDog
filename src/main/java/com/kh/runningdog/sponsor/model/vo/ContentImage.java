package com.kh.runningdog.sponsor.model.vo;

public class ContentImage implements java.io.Serializable{
	private static final long serialVersionUID = 2225L;
	
	private String fileName;
	private int sNum;
	
	public ContentImage() {}

	public ContentImage(String fileName, int sNum) {
		super();
		this.fileName = fileName;
		this.sNum = sNum;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getsNum() {
		return sNum;
	}

	public void setsNum(int sNum) {
		this.sNum = sNum;
	}

	@Override
	public String toString() {
		return "ContentImage [fileName=" + fileName + ", sNum=" + sNum + "]";
	}
	
}

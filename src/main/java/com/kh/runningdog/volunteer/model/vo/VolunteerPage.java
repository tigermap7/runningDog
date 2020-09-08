package com.kh.runningdog.volunteer.model.vo;

public class VolunteerPage implements java.io.Serializable{
	private static final long SerialVersionUID = 8881L;
	
	private int startRow;
	private int endRow;
	
	public VolunteerPage() {}

	public VolunteerPage(int startRow, int endRow) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	@Override
	public String toString() {
		return "VolunteerPage [startRow=" + startRow + ", endRow=" + endRow + "]";
	}

	
	

}

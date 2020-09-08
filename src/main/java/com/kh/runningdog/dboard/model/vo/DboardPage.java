package com.kh.runningdog.dboard.model.vo;

public class DboardPage {
private static final long serialVersionUID = 6666L;
	
	private int startRow;
	private int endRow;
	
	public DboardPage() {}

	public DboardPage(int startRow, int endRow) {
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
		return "BoardPage [startRow=" + startRow + ", endRow=" + endRow + "]";
	}
}

package com.kh.runningdog.visitCount.model.vo;

import org.springframework.stereotype.Service;

@Service
public class VisitCount {
	private static final long serialVersionUID = 1999L;
	
	private int visitId;
    private int visitIp;
    private int visitTime;
    private int visitRefer;
    private int visitAgent;
    
    public VisitCount() {}

	public VisitCount(int visitId, int visitIp, int visitTime, int visitRefer, int visitAgent) {
		super();
		this.visitId = visitId;
		this.visitIp = visitIp;
		this.visitTime = visitTime;
		this.visitRefer = visitRefer;
		this.visitAgent = visitAgent;
	}

	public int getVisitId() {
		return visitId;
	}

	public void setVisitId(int visitId) {
		this.visitId = visitId;
	}

	public int getVisitIp() {
		return visitIp;
	}

	public void setVisitIp(int visitIp) {
		this.visitIp = visitIp;
	}

	public int getVisitTime() {
		return visitTime;
	}

	public void setVisitTime(int visitTime) {
		this.visitTime = visitTime;
	}

	public int getVisitRefer() {
		return visitRefer;
	}

	public void setVisitRefer(int visitRefer) {
		this.visitRefer = visitRefer;
	}

	public int getVisitAgent() {
		return visitAgent;
	}

	public void setVisitAgent(int visitAgent) {
		this.visitAgent = visitAgent;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "VisitCount [visitId=" + visitId + ", visitIp=" + visitIp + ", visitTime=" + visitTime + ", visitRefer="
				+ visitRefer + ", visitAgent=" + visitAgent + "]";
	}
}

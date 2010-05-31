package com.beyond.reports.vo;

import java.io.Serializable;

public class OverallPerformanceVO implements Serializable {
 
	private static final long serialVersionUID = 5340007873265914337L;
	
	private long userId;
	private long openCount;
	private long sentCount;
	private long unOpenCount;
	
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public long getOpenCount() {
		return openCount;
	}
	public void setOpenCount(long openCount) {
		this.openCount = openCount;
	}
	public long getSentCount() {
		return sentCount;
	}
	public void setSentCount(long sentCount) {
		this.sentCount = sentCount;
	}
	public long getUnOpenCount() {
		this.unOpenCount=this.sentCount-this.openCount;
		return unOpenCount;
	}
	public void setUnOpenCount(long unOpenCount) {
		this.unOpenCount = unOpenCount;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OverallPerformanceVO [openCount=");
		builder.append(openCount);
		builder.append(", sentCount=");
		builder.append(sentCount);
		builder.append(", unOpenCount=");
		builder.append(unOpenCount);
		builder.append(", userId=");
		builder.append(userId);
		builder.append("]");
		return builder.toString();
	}
	
	
}

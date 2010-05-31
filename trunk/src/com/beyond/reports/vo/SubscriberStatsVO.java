package com.beyond.reports.vo;

import java.io.Serializable;

public class SubscriberStatsVO implements Serializable {
 
	private static final long serialVersionUID = 8434194004832354283L;
	
	private long userId;
	private long totalSubscribers;
	
	private long subscribersToday;
	private long subscribersWeek;
	private long subscribersMonth;
	private long subscribersYear;
	
	private long unSubscribersToday;
	private long unSubscribersWeek;
	private long unSubscribersMonth;
	private long unSubscribersYear;
	
	public long getTotalSubscribers() {
		return totalSubscribers;
	}
	public void setTotalSubscribers(long totalSubscribers) {
		this.totalSubscribers = totalSubscribers;
	}
	public long getSubscribersToday() {
		return subscribersToday;
	}
	public void setSubscribersToday(long subscribersToday) {
		this.subscribersToday = subscribersToday;
	}
	public long getSubscribersWeek() {
		return subscribersWeek;
	}
	public void setSubscribersWeek(long subscribersWeek) {
		this.subscribersWeek = subscribersWeek;
	}
	public long getSubscribersMonth() {
		return subscribersMonth;
	}
	public void setSubscribersMonth(long subscribersMonth) {
		this.subscribersMonth = subscribersMonth;
	}
	public long getSubscribersYear() {
		return subscribersYear;
	}
	public void setSubscribersYear(long subscribersYear) {
		this.subscribersYear = subscribersYear;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	 
	public long getUnSubscribersToday() {
		return unSubscribersToday;
	}
	public void setUnSubscribersToday(long unSubscribersToday) {
		this.unSubscribersToday = unSubscribersToday;
	}
	public long getUnSubscribersWeek() {
		return unSubscribersWeek;
	}
	public void setUnSubscribersWeek(long unSubscribersWeek) {
		this.unSubscribersWeek = unSubscribersWeek;
	}
	public long getUnSubscribersMonth() {
		return unSubscribersMonth;
	}
	public void setUnSubscribersMonth(long unSubscribersMonth) {
		this.unSubscribersMonth = unSubscribersMonth;
	}
	public long getUnSubscribersYear() {
		return unSubscribersYear;
	}
	public void setUnSubscribersYear(long unSubscribersYear) {
		this.unSubscribersYear = unSubscribersYear;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SubscriberStatsVO [subscribersMonth=");
		builder.append(subscribersMonth);
		builder.append(", subscribersToday=");
		builder.append(subscribersToday);
		builder.append(", subscribersWeek=");
		builder.append(subscribersWeek);
		builder.append(", subscribersYear=");
		builder.append(subscribersYear);
		builder.append(", totalSubscribers=");
		builder.append(totalSubscribers);
		builder.append(", unSubscribersMonth=");
		builder.append(unSubscribersMonth);
		builder.append(", unSubscribersToday=");
		builder.append(unSubscribersToday);
		builder.append(", unSubscribersWeek=");
		builder.append(unSubscribersWeek);
		builder.append(", unSubscribersYear=");
		builder.append(unSubscribersYear);
		builder.append(", userId=");
		builder.append(userId);
		builder.append("]");
		return builder.toString();
	}
	
	
}

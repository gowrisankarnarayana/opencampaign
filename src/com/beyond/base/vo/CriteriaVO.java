package com.beyond.base.vo;

public class CriteriaVO {

	private long userId;
	
	private int fetchFrom; 
	private int fetchCount;
	
	private String objectName;
	private String criteria;

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}
 

	public String getCriteria() {
		return criteria;
	}

	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}

	public int getFetchFrom() {
		return fetchFrom;
	}

	public void setFetchFrom(int fetchFrom) {
		this.fetchFrom = fetchFrom;
	}

	public int getFetchCount() {
		return fetchCount;
	}

	public void setFetchCount(int fetchCount) {
		this.fetchCount = fetchCount;
	}

	public String getObjectName() {
		return objectName;
	}

	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}
	
	
}

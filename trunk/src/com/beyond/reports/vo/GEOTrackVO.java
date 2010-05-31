package com.beyond.reports.vo;

import java.io.Serializable;

public class GEOTrackVO implements Serializable {
 
	private static final long serialVersionUID = -3398434089370190240L;

	private long userId;
	private long customerCount;
	private String countryCode;
	private String cityCode;
	
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public long getCustomerCount() {
		return customerCount;
	}
	public void setCustomerCount(long customerCount) {
		this.customerCount = customerCount;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getCityCode() {
		return cityCode;
	}
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	
	
	
	
}

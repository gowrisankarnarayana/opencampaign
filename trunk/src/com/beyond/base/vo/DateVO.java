package com.beyond.base.vo;

import java.io.Serializable;
 
public class DateVO implements Serializable{

	private static final long serialVersionUID = 8359097978191561603L;

	private int numDay;
	private int numMonth;
	private int numYear;
	private int numHours;
	private int numMinutes;
	 
	public String toDateTimeString(String delim){
		StringBuilder sbf=new StringBuilder();
		sbf.append(numYear).append(delim).append(numMonth).append(delim).append(numDay);
		sbf.append(" ").append(numHours).append(":").append(numMinutes).append(":00");
		return sbf.toString();
	} 
	
	public int getNumDay() {
		return numDay;
	}
	public void setNumDay(int numDay) {
		this.numDay = numDay;
	}
	public int getNumMonth() {
		return numMonth;
	}
	public void setNumMonth(int numMonth) {
		this.numMonth = numMonth;
	}
	public int getNumYear() {
		return numYear;
	}
	public void setNumYear(int numYear) {
		this.numYear = numYear;
	}
	public int getNumHours() {
		return numHours;
	}
	public void setNumHours(int numHours) {
		this.numHours = numHours;
	}
	public int getNumMinutes() {
		return numMinutes;
	}
	public void setNumMinutes(int numMinutes) {
		this.numMinutes = numMinutes;
	}
 
}

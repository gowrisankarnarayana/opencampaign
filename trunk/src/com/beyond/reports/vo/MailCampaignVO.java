package com.beyond.reports.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class MailCampaignVO implements Serializable {
 
	private static final long serialVersionUID = -8556734575215452895L;

	private long userId;
	private long mailerId; 
	private Timestamp deliveryTime;
	private String mailSubject;
	private long  contactCount;
	private int deliveryStatusId;
	private String errorMessage;
	
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public long getMailerId() {
		return mailerId;
	}
	public void setMailerId(long mailerId) {
		this.mailerId = mailerId;
	}
	public Timestamp getDeliveryTime() {
		return deliveryTime;
	}
	public void setDeliveryTime(Timestamp deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
	public String getMailSubject() {
		return mailSubject;
	}
	public void setMailSubject(String mailSubject) {
		this.mailSubject = mailSubject;
	}
	public long getContactCount() {
		return contactCount;
	}
	public void setContactCount(long contactCount) {
		this.contactCount = contactCount;
	}
	public int getDeliveryStatusId() {
		return deliveryStatusId;
	}
	public void setDeliveryStatusId(int deliveryStatusId) {
		this.deliveryStatusId = deliveryStatusId;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MailCampaignVO [contactCount=");
		builder.append(contactCount);
		builder.append(", deliveryStatusId=");
		builder.append(deliveryStatusId);
		builder.append(", deliveryTime=");
		builder.append(deliveryTime);
		builder.append(", mailSubject=");
		builder.append(mailSubject);
		builder.append(", mailerId=");
		builder.append(mailerId);
		builder.append(", userId=");
		builder.append(userId);
		builder.append("]");
		return builder.toString();
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	
	
	
}

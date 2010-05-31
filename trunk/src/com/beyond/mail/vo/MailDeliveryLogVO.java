package com.beyond.mail.vo;

import java.io.Serializable;
import java.sql.Timestamp;

import com.beyond.base.vo.BaseVO;

public class MailDeliveryLogVO extends BaseVO implements Serializable {
 
	private static final long serialVersionUID = 1L;
	private long deliveryLogId;
	private String deliveryDate;
	private Timestamp deliveryTime;
	private int deliveryStatusId;
	private String deliveryStatus;
	private long mailerId;
	
	/*To display sent mails*/
	private String templateName;
	private long templateId;
	private String mailSubject;
	private long  contactCount;
	
	private String errorMessage;
	
	public String getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	
 
	public long getDeliveryLogId() {
		return deliveryLogId;
	}
	public void setDeliveryLogId(long deliveryLogId) {
		this.deliveryLogId = deliveryLogId;
	}
	public Timestamp getDeliveryTime() {
		return deliveryTime;
	}
	public void setDeliveryTime(Timestamp deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
	public long getMailerId() {
		return mailerId;
	}
	public void setMailerId(long mailerId) {
		this.mailerId = mailerId;
	}
	public int getDeliveryStatusId() {
		return deliveryStatusId;
	}
	public void setDeliveryStatusId(int deliveryStatusId) {
		this.deliveryStatusId = deliveryStatusId;
	}
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	public String getTemplateName() {
		return templateName;
	}
	public void setTemplateName(String templateName) {
		this.templateName = templateName;
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
	public long getTemplateId() {
		return templateId;
	}
	public void setTemplateId(long templateId) {
		this.templateId = templateId;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	 
	
}

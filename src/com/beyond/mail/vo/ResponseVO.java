package com.beyond.mail.vo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.beyond.template.vo.ElementVO;

public class ResponseVO implements Serializable{
 
	private static final long serialVersionUID = -255200109168403589L;
	
	private long 	responseId;
	private long 	contactId;
	private long 	userId;
	private long 	templateId;
	private long 	mailerId;
	private String 	email;
	private String  ipAddress;
	private Timestamp dateReceived;
	private String userAgent;
	private long listId;
	
	private List<ElementVO> responseData=new ArrayList<ElementVO>(0);
    
	private String firstName;
	private String lastName;
	private String templateName;
	
	public long getResponseId() {
		return responseId;
	}
	public void setResponseId(long responseId) {
		this.responseId = responseId;
	}
	public long getContactId() {
		return contactId;
	}
	public void setContactId(long contactId) {
		this.contactId = contactId;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public long getTemplateId() {
		return templateId;
	}
	public void setTemplateId(long templateId) {
		this.templateId = templateId;
	}
	public long getMailerId() {
		return mailerId;
	}
	public void setMailerId(long mailerId) {
		this.mailerId = mailerId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	 
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getTemplateName() {
		return templateName;
	}
	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}
	public Timestamp getDateReceived() {
		return dateReceived;
	}
	public void setDateReceived(Timestamp dateReceived) {
		this.dateReceived = dateReceived;
	}
	public List<ElementVO> getResponseData() {
		return responseData;
	}
	public void setResponseData(List<ElementVO> responseData) {
		this.responseData = responseData;
	}
	
	public String getResponseXML(){
		StringBuilder sb=new StringBuilder();
		sb.append("<Response>");
		for(ElementVO e:responseData){
			if(!e.isIgnored()){
				sb.append("<").append(e.getElementName()).append(">");
				sb.append("<![CDATA[").append(e.getElementValue()).append("]]>");
				sb.append("</").append(e.getElementName()).append(">");
			}
		}
		sb.append("</Response>");
		return sb.toString();
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public String getUserAgent() {
		return userAgent;
	}
	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ResponseVO [contactId=");
		builder.append(contactId);
		builder.append(", dateReceived=");
		builder.append(dateReceived);
		builder.append(", email=");
		builder.append(email);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", ipAddress=");
		builder.append(ipAddress);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", mailerId=");
		builder.append(mailerId);
		builder.append(", responseData=");
		builder.append(responseData);
		builder.append(", responseId=");
		builder.append(responseId);
		builder.append(", templateId=");
		builder.append(templateId);
		builder.append(", templateName=");
		builder.append(templateName);
		builder.append(", userAgent=");
		builder.append(userAgent);
		builder.append(", userId=");
		builder.append(userId);
		builder.append("]");
		return builder.toString();
	}
	public long getListId() {
		return listId;
	}
	public void setListId(long listId) {
		this.listId = listId;
	}
	
	
	
}

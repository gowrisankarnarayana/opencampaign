package com.beyond.customer.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.beyond.base.vo.BaseVO;

public class CustomerVO extends BaseVO {
 
	private static final long serialVersionUID = -3156100679373674418L;
	
	private long userId;
	private long customerId;
	private String email="";
	private String title="";
	private String firstName="";
	private String lastName="";
	private String contactDetails="";
	private String mobile="";
	private String landPhone=""; 
	
	private String mailMessage;
	private String mailSubject;
	private boolean viewed;
	
	/* Subscription Management Fields
	 * 1)Two way opt-in and
	 * 2)Opt-in
	 * 3)Auto Subscribe features
	 * With ability to save IP address from where subscription is requested and confirmed.
	 * */
	
	private long subscriptionStatus;
	private long mailStatus;
	private Date requestedDate;
	private Date confirmedDate;
	private String requestedIP;
	private String confirmedIP;
	
	private long groupId; 
	
	public long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(long customerId) {
		this.customerId = customerId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getContactDetails() {
		return contactDetails;
	}
	public void setContactDetails(String contactDetails) {
		this.contactDetails = contactDetails;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getLandPhone() {
		return landPhone;
	}
	public void setLandPhone(String landPhone) {
		this.landPhone = landPhone;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	 
	public String toJSONString() {
		StringBuilder builder = new StringBuilder();
		builder.append("{contactDetails:");
		builder.append(contactDetails);
		builder.append(", customerId:");
		builder.append(customerId);
		builder.append(", email:");
		builder.append(email);
		builder.append(", firstName:");
		builder.append(firstName);
		builder.append(", landPhone:");
		builder.append(landPhone);
		builder.append(", lastName:");
		builder.append(lastName);
		builder.append(", mobile:");
		builder.append(mobile);
		builder.append(", title:");
		builder.append(title);
		builder.append(", userId:");
		builder.append(userId);
		builder.append("}");
		return builder.toString();
	}
	 
	public String toXMLString() {
		StringBuilder builder = new StringBuilder();
		builder.append("<CustomerVO> <contactDetails>");
		builder.append(contactDetails);
		builder.append("</contactDetails><customerId>");
		builder.append(customerId);
		builder.append("</customerId><email>");
		builder.append(email);
		builder.append("</email><firstName>");
		builder.append(firstName);
		builder.append("</firstName><landPhone>");
		builder.append(landPhone);
		builder.append("</landPhone><lastName>");
		builder.append(lastName);
		builder.append("</lastName><mobile>");
		builder.append(mobile);
		builder.append("</mobile><title>");
		builder.append(title);
		builder.append("</title><userId>");
		builder.append(userId);
		builder.append("</userId></CustomerVO> \n");
		return builder.toString();
	}
	 
	public List<String> getFeldList(){
		List<String> fieldList= new ArrayList<String>(0);
		fieldList.add("Field:FirstName]");
		fieldList.add("Field:LastName]");
		fieldList.add("Field:ContactDetails]");
		fieldList.add("Field:Mobile]");
		fieldList.add("Field:Email]");
		fieldList.add("Field:LandPhone]");
		return fieldList;
	}
	
	public String getMailMessage() {
		return mailMessage;
	}
	public void setMailMessage(String mailMessage) {
		this.mailMessage = mailMessage;
	}
	public String getMailSubject() {
		return mailSubject;
	}
	public void setMailSubject(String mailSubject) {
		this.mailSubject = mailSubject;
	}
 
	public boolean hasGroup(long groupId) {
		return this.groupId==groupId; 
	}
	
	public boolean hasTerm(String term){
		boolean flag=false;
		try{
			flag= email.contains(term) || (firstName!=null && firstName.contains(term)) || (lastName!=null && lastName.contains(term));
		}catch(Exception e){
			e.printStackTrace();	
		}
		return	flag;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (customerId ^ (customerId >>> 32));
		result = prime * result + (int) (userId ^ (userId >>> 32));
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CustomerVO other = (CustomerVO) obj;
		if (customerId != other.customerId)
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}
	public boolean isViewed() {
		return viewed;
	}
	public void setViewed(boolean viewed) {
		this.viewed = viewed;
	}
 
 
	public String getRequestedIP() {
		return requestedIP;
	}
	public void setRequestedIP(String requestedIP) {
		this.requestedIP = requestedIP;
	}
	public String getConfirmedIP() {
		return confirmedIP;
	}
	public void setConfirmedIP(String confirmedIP) {
		this.confirmedIP = confirmedIP;
	}
	public long getGroupId() {
		return groupId;
	}
	public void setGroupId(long groupId) {
		this.groupId = groupId;
	}
	public Date getRequestedDate() {
		return requestedDate;
	}
	public void setRequestedDate(Date requestedDate) {
		this.requestedDate = requestedDate;
	}
	public Date getConfirmedDate() {
		return confirmedDate;
	}
	public void setConfirmedDate(Date confirmedDate) {
		this.confirmedDate = confirmedDate;
	}
	public long getSubscriptionStatus() {
		return subscriptionStatus;
	}
	public void setSubscriptionStatus(long subscriptionStatus) {
		this.subscriptionStatus = subscriptionStatus;
	}
	public long getMailStatus() {
		return mailStatus;
	}
	public void setMailStatus(long mailStatus) {
		this.mailStatus = mailStatus;
	}
	
}

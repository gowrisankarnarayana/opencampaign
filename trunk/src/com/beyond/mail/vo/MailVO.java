package com.beyond.mail.vo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.activation.DataSource;

import org.apache.commons.lang.StringUtils;

import com.beyond.base.vo.BaseMailVO;
import com.beyond.base.vo.DateVO;
import com.beyond.customer.vo.CustomerVO;
 
public class MailVO extends BaseMailVO implements Serializable {
	
 	private static final long serialVersionUID = 5651678687418185132L;
 	
 	/*Mail To, Subject and Message Information */
 	
 	private String strToAddress; //EmailIds delimited by comma
 	private String strSubject;
 	private String strMessage;
	private String strFromAddress;//God knows why I am using this. Must be a List<MailProfileVO> getSendingProfiles();
    private String[] groupIds;
	 
    private boolean sendToGroup=true; 
	private long profileId;
	
	/*Mail Attachments*/
	private List<DataSource> lstAttachments=new ArrayList<DataSource>(0);
	
	/*Mail Content Rendering Properties*/
	private boolean showWebLink=true;
	private boolean showSubscription=true;
	private boolean showFooter=true;
	
	/*Mail Delivery Information*/
	private boolean sendImmediate=true;
	private MailScheduleVO mailScheduleVO=new MailScheduleVO();
 	
	/*Remove below STUFF asap*/
 	private DateVO scheduleDate=new DateVO();
	private Timestamp dateSent;
		
	/*Mail Content Information*/
	private boolean mailTemplate;
	private long templateId;
	private String templateName;
	
	/*Mail Unique Identifiers*/
	private long mailerId;
	private long statusId;
	private long userId;
	
	/*This Information is used while mail delivery*/
	private Set<CustomerVO> contacts =new HashSet<CustomerVO>(0);
	private List<MailDeliveryLogVO> deliveryLog=new ArrayList<MailDeliveryLogVO>(0);
	
	/*Mail Statistical Info*/
	private long contactCount;
	private long responseCount;
		
	public long getMailerId() {
		return mailerId;
	}

	public void setMailerId(long mailerId) {
		this.mailerId = mailerId;
	} 
	
	public List<DataSource> getLstAttachments() {
		return lstAttachments;
	}

	public void setLstAttachments(List<DataSource> lstAttachments) {
		this.lstAttachments = lstAttachments;
	}

 
	public String getStrSubject() {
		return strSubject;
	}

	public void setStrSubject(String strSubject) {
		this.strSubject = strSubject;
	}

	public String getStrMessage() {
		return strMessage;
	}

	public void setStrMessage(String strMessage) {
		this.strMessage = strMessage;
	}

	public String getStrFromAddress() {
		return strFromAddress;
	}

	public void setStrFromAddress(String strFromAddress) {
		this.strFromAddress = strFromAddress;
	}
 

	public String getStrToAddress() {
		return strToAddress;
	}

	public void setStrToAddress(String strToAddress) {
		this.strToAddress = strToAddress;
	}
 
	public DateVO getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(DateVO scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	public boolean isSendImmediate() {
		return sendImmediate;
	}

	public void setSendImmediate(boolean sendImmediate) {
		this.sendImmediate = sendImmediate;
	}

	public boolean isMailTemplate() {
		return mailTemplate;
	}

	public void setMailTemplate(boolean mailTemplate) {
		this.mailTemplate = mailTemplate;
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

	public long getStatusId() {
		return statusId;
	}

	public void setStatusId(long statusId) {
		this.statusId = statusId;
	}
 
	public boolean isShowWebLink() {
		return showWebLink;
	}

	public void setShowWebLink(boolean showWebLink) {
		this.showWebLink = showWebLink;
	}

	public boolean isShowSubscription() {
		return showSubscription;
	}

	public void setShowSubscription(boolean showSubscription) {
		this.showSubscription = showSubscription;
	}

	public boolean isShowFooter() {
		return showFooter;
	}

	public void setShowFooter(boolean showFooter) {
		this.showFooter = showFooter;
	}

	public String getTemplateName() {
		return templateName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}

	public Timestamp getDateSent() {
		return dateSent;
	}

	public void setDateSent(Timestamp dateSent) {
		this.dateSent = dateSent;
	}

	public long getContactCount() {
		return contactCount;
	}

	public void setContactCount(long contactCount) {
		this.contactCount = contactCount;
	}

	public long getResponseCount() {
		return responseCount;
	}

	public void setResponseCount(long responseCount) {
		this.responseCount = responseCount;
	}

	public MailScheduleVO getMailScheduleVO() {
		return mailScheduleVO;
	}

	public void setMailScheduleVO(MailScheduleVO mailScheduleVO) {
		this.mailScheduleVO = mailScheduleVO;
	} 

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + (int) (mailerId ^ (mailerId >>> 32));
		result = prime * result + (int) (userId ^ (userId >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		MailVO other = (MailVO) obj;
		if (mailerId != other.mailerId)
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}
 

	public long getProfileId() {
		return profileId;
	}

	public void setProfileId(long profileId) {
		this.profileId = profileId;
	}

	public List<MailDeliveryLogVO> getDeliveryLog() {
		return deliveryLog;
	}

	public void setDeliveryLog(List<MailDeliveryLogVO> deliveryLog) {
		this.deliveryLog = deliveryLog;
	}

	 
	public String[] getGroupIds() {
		return groupIds;
	}

	public void setGroupIds(String[] groupIds) {
		this.groupIds = groupIds;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MailVO [contactCount=");
		builder.append(contactCount);
		builder.append(", contacts=");
		builder.append(contacts);
		builder.append(", dateSent=");
		builder.append(dateSent);
		builder.append(", deliveryLog=");
		builder.append(deliveryLog);
		builder.append(", groupIds=");
		builder.append(StringUtils.join(groupIds,","));
		builder.append(", lstAttachments=");
		builder.append(lstAttachments);
		builder.append(", mailScheduleVO=");
		builder.append(mailScheduleVO);
		builder.append(", mailTemplate=");
		builder.append(mailTemplate);
		builder.append(", mailerId=");
		builder.append(mailerId);
		builder.append(", profileId=");
		builder.append(profileId);
		builder.append(", responseCount=");
		builder.append(responseCount);
		builder.append(", scheduleDate=");
		builder.append(scheduleDate);
		builder.append(", sendImmediate=");
		builder.append(sendImmediate);
		builder.append(", showFooter=");
		builder.append(showFooter);
		builder.append(", showSubscription=");
		builder.append(showSubscription);
		builder.append(", showWebLink=");
		builder.append(showWebLink);
		builder.append(", statusId=");
		builder.append(statusId);
		builder.append(", strFromAddress=");
		builder.append(strFromAddress);
		builder.append(", strMessage=");
		builder.append(strMessage);
		builder.append(", strSubject=");
		builder.append(strSubject);
		builder.append(", strToAddress=");
		builder.append(strToAddress);
		builder.append(", templateId=");
		builder.append(templateId);
		builder.append(", templateName=");
		builder.append(templateName);
		builder.append(", userId=");
		builder.append(userId);
		builder.append("]");
		return builder.toString();
	}

	public Set<CustomerVO> getContacts() {
		return contacts;
	}

	public void setContacts(Set<CustomerVO> contacts) {
		this.contacts = contacts;
	}

	public boolean isSendToGroup() {
		return sendToGroup;
	}

	public void setSendToGroup(boolean sendToGroup) {
		this.sendToGroup = sendToGroup;
	}

	 
	 
	
	 
}

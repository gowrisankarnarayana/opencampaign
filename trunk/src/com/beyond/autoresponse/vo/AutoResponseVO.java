package com.beyond.autoresponse.vo;

import com.beyond.base.vo.BaseVO;

public class AutoResponseVO extends BaseVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private long autoResponseId;
	private long userId;
	private String autoResponseName;
	private String autoResponseHTML; 
	private String autoResponseSubject;
	
	private String autoResponseType;
	private long autoResponseTypeId;
	private long templateId;
	private long profileId;
	
	public long getAutoResponseId() {
		return autoResponseId;
	}
	public void setAutoResponseId(long autoResponseId) {
		this.autoResponseId = autoResponseId;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public String getAutoResponseName() {
		return autoResponseName;
	}
	public void setAutoResponseName(String autoResponseName) {
		this.autoResponseName = autoResponseName;
	}
	public String getAutoResponseHTML() {
		return autoResponseHTML;
	}
	public void setAutoResponseHTML(String autoResponseHTML) {
		this.autoResponseHTML = autoResponseHTML;
	}
	public String getAutoResponseType() {
		return autoResponseType;
	}
	public void setAutoResponseType(String autoResponseType) {
		this.autoResponseType = autoResponseType;
	}
	public long getAutoResponseTypeId() {
		return autoResponseTypeId;
	}
	public void setAutoResponseTypeId(long autoResponseTypeId) {
		this.autoResponseTypeId = autoResponseTypeId;
	}
	public long getTemplateId() {
		return templateId;
	}
	public void setTemplateId(long templateId) {
		this.templateId = templateId;
	}
	public String getAutoResponseSubject() {
		return autoResponseSubject;
	}
	public void setAutoResponseSubject(String autoResponseSubject) {
		this.autoResponseSubject = autoResponseSubject;
	}
	public long getProfileId() {
		return profileId;
	}
	public void setProfileId(long profileId) {
		this.profileId = profileId;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AutoResponseVO [autoResponseHTML=");
		builder.append(autoResponseHTML);
		builder.append(", autoResponseId=");
		builder.append(autoResponseId);
		builder.append(", autoResponseName=");
		builder.append(autoResponseName);
		builder.append(", autoResponseSubject=");
		builder.append(autoResponseSubject);
		builder.append(", autoResponseType=");
		builder.append(autoResponseType);
		builder.append(", autoResponseTypeId=");
		builder.append(autoResponseTypeId);
		builder.append(", profileId=");
		builder.append(profileId);
		builder.append(", templateId=");
		builder.append(templateId);
		builder.append(", userId=");
		builder.append(userId);
		builder.append("]");
		return builder.toString();
	} 
	
}

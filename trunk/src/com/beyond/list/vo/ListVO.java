package com.beyond.list.vo;

import java.io.Serializable;

import com.beyond.base.vo.BaseVO;

public class ListVO extends BaseVO implements Serializable {

 	private static final long serialVersionUID = 5448686578996057590L;
 	
 	private long groupId;
 	private String groupName;
 	private String groupDesc;
 	
 	private String ownersName;
 	private String ownersEmail;
 	private String replyToEmail;
 	private boolean notifyOwner;
 	
 	private long userId;
 	private long customerCount=0;
 	
 	private boolean defaultGroup;
 	
	public long getGroupId() {
		return groupId;
	}
	
	public void setGroupId(long groupId) {
		this.groupId = groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getGroupDesc() {
		return groupDesc;
	}

	public void setGroupDesc(String groupDesc) {
		this.groupDesc = groupDesc;
	}

	public long getCustomerCount() {
		return customerCount;
	}

	public void setCustomerCount(long customerCount) {
		this.customerCount = customerCount;
	}

	public boolean isDefaultGroup() {
		return defaultGroup;
	}

	public void setDefaultGroup(boolean defaultGroup) {
		this.defaultGroup = defaultGroup;
	}

	public String getOwnersName() {
		return ownersName;
	}

	public void setOwnersName(String ownersName) {
		this.ownersName = ownersName;
	}

	public String getOwnersEmail() {
		return ownersEmail;
	}

	public void setOwnersEmail(String ownersEmail) {
		this.ownersEmail = ownersEmail;
	}

	public String getReplyToEmail() {
		return replyToEmail;
	}

	public void setReplyToEmail(String replyToEmail) {
		this.replyToEmail = replyToEmail;
	}

	public boolean isNotifyOwner() {
		return notifyOwner;
	}

	public void setNotifyOwner(boolean notifyOwner) {
		this.notifyOwner = notifyOwner;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ListVO [customerCount=");
		builder.append(customerCount);
		builder.append(", defaultGroup=");
		builder.append(defaultGroup);
		builder.append(", groupDesc=");
		builder.append(groupDesc);
		builder.append(", groupId=");
		builder.append(groupId);
		builder.append(", groupName=");
		builder.append(groupName);
		builder.append(", notifyOwner=");
		builder.append(notifyOwner);
		builder.append(", ownersEmail=");
		builder.append(ownersEmail);
		builder.append(", ownersName=");
		builder.append(ownersName);
		builder.append(", replyToEmail=");
		builder.append(replyToEmail);
		builder.append(", userId=");
		builder.append(userId);
		builder.append("]");
		return builder.toString();
	}

	 
 	
}

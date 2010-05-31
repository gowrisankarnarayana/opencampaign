package com.beyond.customer.vo;

import org.apache.struts.upload.FormFile;

import com.beyond.base.vo.BaseVO;

public class CustomerFileUploadVO extends BaseVO {
 
	private static final long serialVersionUID = -6910993037769887328L;
	
	private FormFile theFile;
	private String fileName="NO NAME";
	private String fileDesc="NO DESC";
	private String forwardToAction;
	
	private int subscriptionStatus;
    private boolean override;
    private long groupId;
    
	
	public FormFile getTheFile() {
		return theFile;
	}
	public void setTheFile(FormFile theFile) {
		this.theFile = theFile;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileDesc() {
		return fileDesc;
	}
	public void setFileDesc(String fileDesc) {
		this.fileDesc = fileDesc;
	}
	public String getForwardToAction() {
		return forwardToAction;
	}
	public void setForwardToAction(String forwardToAction) {
		this.forwardToAction = forwardToAction;
	}
	public int getSubscriptionStatus() {
		return subscriptionStatus;
	}
	public void setSubscriptionStatus(int subscriptionStatus) {
		this.subscriptionStatus = subscriptionStatus;
	}
	public boolean isOverride() {
		return override;
	}
	public void setOverride(boolean override) {
		this.override = override;
	}
	public long getGroupId() {
		return groupId;
	}
	public void setGroupId(long groupId) {
		this.groupId = groupId;
	}
}

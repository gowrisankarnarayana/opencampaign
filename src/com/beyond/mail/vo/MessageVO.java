package com.beyond.mail.vo;

public class MessageVO {
	
	//From whom are we sending.  
	private MailPropertiesVO propVO;
	
	//To whom are we sending
	private String mailTo;
	
	//What are we sending
	private String mailSubject;
	private String mailContent;
	
	public MailPropertiesVO getPropVO() {
		return propVO;
	}
	public void setPropVO(MailPropertiesVO propVO) {
		this.propVO = propVO;
	}
	public String getMailTo() {
		return mailTo;
	}
	public void setMailTo(String mailTo) {
		this.mailTo = mailTo;
	}
	public String getMailSubject() {
		return mailSubject;
	}
	public void setMailSubject(String mailSubject) {
		this.mailSubject = mailSubject;
	}
	public String getMailContent() {
		return mailContent;
	}
	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}
	
	
			
}

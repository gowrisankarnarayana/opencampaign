package com.beyond.user.vo;

import java.io.Serializable;

import com.beyond.base.vo.BaseVO;

public class EmailProfileVO extends BaseVO implements Serializable {
 
private static final long serialVersionUID = 1L;
 
	private long profileId;
	private long userId;
	private long mailConfigId;
	private String profileName;
	private String fromAddress;
	private String smtpFromName;
	private String replyToEmail;
	private String smtpHost;
	private String smtpPort;
	private String smtpUser;
	private String smtpPassword;
	private String smtpTlsEnabled;
	private String smtpAuth;
	private String transportProtocol; 
	
	public String getProfileName() {
		return profileName;
	}
	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}
	public String getFromAddress() {
		return fromAddress;
	}
	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}
	public String getSmtpFromName() {
		return smtpFromName;
	}
	public void setSmtpFromName(String smtpFromName) {
		this.smtpFromName = smtpFromName;
	}
	public String getReplyToEmail() {
		return replyToEmail;
	}
	public void setReplyToEmail(String replyToEmail) {
		this.replyToEmail = replyToEmail;
	}
	public String getSmtpHost() {
		return smtpHost;
	}
	public void setSmtpHost(String smtpHost) {
		this.smtpHost = smtpHost;
	}
	public String getSmtpPort() {
		return smtpPort;
	}
	public void setSmtpPort(String smtpPort) {
		this.smtpPort = smtpPort;
	}
	public String getSmtpUser() {
		return smtpUser;
	}
	public void setSmtpUser(String smtpUser) {
		this.smtpUser = smtpUser;
	}
	public String getSmtpPassword() {
		return smtpPassword;
	}
	public void setSmtpPassword(String smtpPassword) {
		this.smtpPassword = smtpPassword;
	}
	public String getSmtpTlsEnabled() {
		return smtpTlsEnabled;
	}
	public void setSmtpTlsEnabled(String smtpTlsEnabled) {
		this.smtpTlsEnabled = smtpTlsEnabled;
	}
	public String getSmtpAuth() {
		return smtpAuth;
	}
	public void setSmtpAuth(String smtpAuth) {
		this.smtpAuth = smtpAuth;
	}
	public String getTransportProtocol() {
		return transportProtocol;
	}
	public void setTransportProtocol(String transportProtocol) {
		this.transportProtocol = transportProtocol;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public long getMailConfigId() {
		return mailConfigId;
	}
	public void setMailConfigId(long mailConfigId) {
		this.mailConfigId = mailConfigId;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("EmailProfileVO [fromAddress=");
		builder.append(fromAddress);
		builder.append(", mailConfigId=");
		builder.append(mailConfigId);
		builder.append(", profileName=");
		builder.append(profileName);
		builder.append(", replyToEmail=");
		builder.append(replyToEmail);
		builder.append(", smtpAuth=");
		builder.append(smtpAuth);
		builder.append(", smtpFromName=");
		builder.append(smtpFromName);
		builder.append(", smtpHost=");
		builder.append(smtpHost);
		builder.append(", smtpPassword=");
		builder.append(smtpPassword);
		builder.append(", smtpPort=");
		builder.append(smtpPort);
		builder.append(", smtpTlsEnabled=");
		builder.append(smtpTlsEnabled);
		builder.append(", smtpUser=");
		builder.append(smtpUser);
		builder.append(", transportProtocol=");
		builder.append(transportProtocol);
		builder.append(", userId=");
		builder.append(userId);
		builder.append("]");
		return builder.toString();
	}
	public long getProfileId() {
		return profileId;
	}
	public void setProfileId(long profileId) {
		this.profileId = profileId;
	}
	
	
}

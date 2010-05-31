package com.beyond.mail.vo;

import java.io.Serializable;

import com.beyond.base.vo.BaseVO;

public class MailPropertiesVO extends BaseVO implements Serializable { 
		
		private static final long serialVersionUID = 6588171701097078703L;
		
		private Long configurationId; 
		
//		private String smtpHost			=ApplicationConstants.SMTP_MAIL_HOST;
//		private String smtpPort			=ApplicationConstants.SMTP_PORT;
//		private String smtpUser			=ApplicationConstants.SMTP_USER;
//		private String smtpPassword		=ApplicationConstants.SMTP_PASSWORD;
//		private String smtpTlsEnabled	=ApplicationConstants.SMTP_TLS_ENABLED;
//		private String smtpAuth			=ApplicationConstants.SMTP_AUTH;
//		private String transportProtocol=ApplicationConstants.TRANSPORT_PROTOCOL;
//		private String fromAddress		=ApplicationConstants.SMTP_FROM_USER;
//		private String smtpFromName 	=ApplicationConstants.SMTP_FROM_NAME;
//		private String replyTo			=ApplicationConstants.SMTP_REPLY_TO;
		 
		private String smtpHost;
		private String smtpPort;
		private String smtpUser			;
		private String smtpPassword		;
		private String smtpTlsEnabled="true";
		private String smtpAuth			;
		private String transportProtocol="smtp";
		private String fromAddress		;
		private String smtpFromName 	;
		private String replyTo			;
		
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
		 
		public Long getConfigurationId() {
			return configurationId;
		}
		public void setConfigurationId(Long configurationId) {
			this.configurationId = configurationId;
		}
		@Override
		public String toString() {
			return "MailPropertiesVO [configurationId=" + configurationId
					+ ", smtpAuth=" + smtpAuth + ", smtpHost=" + smtpHost
					+ ", smtpPassword=" + smtpPassword + ", smtpPort=" + smtpPort
					+ ", smtpTlsEnabled=" + smtpTlsEnabled + ", smtpUser="
					+ smtpUser + ", transportProtocol=" + transportProtocol + "]";
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
		public String getReplyTo() {
			return replyTo;
		}
		public void setReplyTo(String replyTo) {
			this.replyTo = replyTo;
		} 
		
	}
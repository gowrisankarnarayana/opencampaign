package com.beyond.base.vo;

import java.util.Properties;

import com.beyond.constants.ApplicationConstants;
import com.beyond.mail.vo.MailPropertiesVO;
import com.beyond.util.Logger;

 
public abstract class BaseMailVO extends BaseVO { 
	
	private static final long serialVersionUID = 1L;
	
	private Properties properties=new Properties(); 
	 
	public void setMailProfile(MailPropertiesVO propertiesVO){
		setMailProps(propertiesVO);
	}
	
	public void setProperties(Properties properties) {
		this.properties = properties;
	}

	public Properties getProperties() {
		return properties;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BaseMailVO [properties=");
		builder.append(properties);
		builder.append("]");
		return builder.toString();
	}
	
	private void setMailProps(MailPropertiesVO propertiesVO){ 
		try{
			properties.put(ApplicationConstants.PROP_SMTP_HOST,		propertiesVO.getSmtpHost()); 
			properties.put(ApplicationConstants.PROP_SMTP_PORT,		propertiesVO.getSmtpPort());
			properties.put(ApplicationConstants.PROP_SMTP_TRANS,	propertiesVO.getTransportProtocol()); 
			properties.put(ApplicationConstants.PROP_SMTP_USER,		propertiesVO.getSmtpUser());
			properties.put(ApplicationConstants.PROP_SMTP_FROM_NAME,propertiesVO.getSmtpFromName());
			properties.put(ApplicationConstants.PROP_SMTP_PASSWORD,	propertiesVO.getSmtpPassword());
			properties.put(ApplicationConstants.PROP_SMTP_TLS,		propertiesVO.getSmtpTlsEnabled());
			properties.put(ApplicationConstants.PROP_SMTP_AUTH,		propertiesVO.getSmtpAuth());  
			properties.put("mail.smtp.socketFactory.port", propertiesVO.getSmtpPort());
			properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			properties.put("mail.smtp.socketFactory.fallback", "false");
			properties.put("mail.smtp.quitwait", "false");
		}catch(Exception e){
			Logger.error("ERROR BaseMailVO.setMailProps :" + e.getMessage());
			e.printStackTrace();			
		}
	}
}

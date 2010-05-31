package com.beyond.constants;


public interface ApplicationConstants {
 	String ACTION_TRACKER = "actionVO";
	String TEMPLATE_VO = "template";
	
	String SESSION_USER_OBJECT="user";
	String SESSION_CUSTOMER_GROUPS = "customerGroupList";
	String SESSION_TEMPLATE_HOLDER = "templateHolder";
	String SESSION_USER_MAILS = "userMails";
	String SESSION_DELIVERY_LOG="mailDeliveryLog";
	String AUTO_RESPONSE_OBJECT = "autoResponse";
	
	String ROUTE="route";
	String DATE_FORMAT="MM/dd/yyyy";
	String TEMPLATE_HOLDER = "templateHolder";
	String TEMPLATE_ID = "templateId";
	String TEMPLATE_TYPE = "templateType";
	String BEYOND_JNDI = "jdbc/BEYONDDB";
	String COMP_ENVI = "java:comp/env";
	
	/* Default email account to send mails  */
	
	String TRANSPORT_PROTOCOL = "smtp";
	String SMTP_MAIL_HOST = "smtp.gmail.com";
	String SMTP_PORT = "465";
	String SMTP_USER = "beyondmails@googlemail.com";
	String SMTP_PASSWORD = "letmein$123";
	String SMTP_TLS_ENABLED = "true";
	String SMTP_AUTH = "true";
	String SMTP_FROM_USER = "beyondmails@googlemail.com";
	String SMTP_FROM_NAME = "BeyondContact Sales";
	String SMTP_REPLY_TO = "beyondmails@googlemail.com";
	
	/* Jdbc Connection */
	String JDBC_URL = "jdbc:mysql://192.168.1.65:3838/beyond_db";
	String JDBC_PASSWORD = "letmein$123";
	String JDBC_USER_NAME = "beyond_dbadmin";
	String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	
	long MAIL_DISPATCHER_SLEEP_TIME = 600000L;
	
	String YUI_PATH = "/yui/build/";
	
	String RECAPTCHA_PRIVATE_KEY = "6LdAiwwAAAAAAB4zb5Z0hkFnHMDNrR1Emsw-Dvah";
	String RECAPTCHA_PUBLIC_KEY="6LdAiwwAAAAAADjO2ZyJ1ZkQrHcQrfDylInUuh5D";
	String RECAPTCHA_CHALLANGE_FIELD = "recaptcha_challenge_field";
	String RECAPTCHA_RESPONSE_FIELD = "recaptcha_response_field";
	
	String CACHE_NOT_INITIALIZED = "Cache Is Not Initialized";
	String CACHE_INITIALIZED = "Cache Initialized";
	String CACHE_INITIALIZATION_IN_PROGRESS = "Cache Initialization In Progress";
	String CACHE_INITIALIZATION_ERROR= "cache Initialization Error";
	String CACHE_REFRESHED = "Cache Refreshed";
	String CACHE_REFRESH_ERROR = "Cache Refresh Error";
	String CACHE_REFRESH_IN_PROGRESS = "Cache Refresh In Progress";

	String PROP_SMTP_USER = "mail.smtp.user"; 
	String PROP_SMTP_FROM_NAME = "mail.smtp.fromname"; 
	String PROP_SMTP_PASSWORD = "mail.smtp.password"; 
	String PROP_SMTP_HOST = "mail.smtp.host"; 
	String PROP_SMTP_PORT = "mail.smtp.port"; 
	String PROP_SMTP_TRANS = "mail.transport.protocol"; 
	String PROP_SMTP_TLS = "mail.smtp.starttls.enable"; 
	String PROP_SMTP_AUTH = "mail.smtp.auth";  
	String PROP_SMTP_REPLY = "mail.smtp.reply";

	long SUBSCRIPTION_PENDING =8;
	long SUBSCRIPTION_CONFIRMED=7;

	String SESSION_EMAIL_PROFILE = "profiles";
	long SESSION_TIMEOUT_MINUTES = (1000*60)*15;
	
	long DEFAULT_PAGE_SIZE=15;
	
}

package com.beyond.constants;

public interface MailConstants {

	/*MAIL STATUS*/
	int DELIVERY_SCHEDULED = 1;
	int DELIVERY_INPROGRESS=2;
	int DELIVERY_SUCCEDED =3;
	int DELIVERY_FAILED =4;
	int READ_RECEIPT=5;
	int RESPONSE_RECEIVED =6;
	
	/*DELIVERY PATTERN*/
	int SEND_IMMEDIATE = 300;
	int SCHEDULE_LATER= 400;
	int SEND_DAILY= 500;
	int SEND_WEEKLY=600;
	int SEND_MONTHLY=700;
	int SEND_ONCE=800;
	
	String JOB_PREFIX 		= "MAIL_JOB_";
	String GROUP_PREFIX 	= "MAIL_GROUP_";
	String TRIGGER_PREFIX 	= "MAIL_TRIGGER_";
	
	int SCHEDULE_DELAY_MINUTES = 1;
	
	
	
	
	
	
	
}

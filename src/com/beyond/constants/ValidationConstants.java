package com.beyond.constants;

public interface ValidationConstants {
	public String FIRST_NAME_MANDATORY="First Name Is Mandatory";
	public String LAST_NAME_MANDATORY="Last Name Is Mandatory";
	public String EMAIL_MANDATORY="Email Is Mandatory";
	public String TEMPLATE_NAME_MANDATORY="Template Name Is Mandatory";
	public String TEMPLATE_CONTENT_MANDATORY="Template Content Is Mandatory";
	
	public String TO_ADDRESS_REQUIRED = "Please select atleast one email address";
	public String DELIVERY_DATE_REQUIRED = "Please enter a valid date of delivery";
	public String START_DATE_REQUIRED ="Please enter a valid From-Date";
	public String END_DATE_REQUIRED ="Please enter a valid To-Date";
	public String WEEK_DAY_REQUIRED ="Please select a valid week day you wish to deliver";
	public String MONTH_DAY_REQUIRED ="Please select a valid Date Of Month you wish to deliver";
	public String DELIVERY_PATTERN_REQUIRED ="Please select a valid delivery pattern";
	public String EMPTY_STRING = ""; 
	public String REGEX_EMAIL =  "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{2,4}$";
	public String EMAIL_PROFILE_REQUIRED = "Please select a sending profile (How do you want to send this mail)";
	public String EMAIL_SUBJECT_MANDATORY = "Please enter a valid subject line";
	public String EMAIL_MESSAGE_MANDATORY = "Please enter valid mail content";
	public String TO_LIST_REQUIRED = "Please select atleast one list/group name";
	
		
}

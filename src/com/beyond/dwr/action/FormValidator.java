package com.beyond.dwr.action;

import javax.servlet.ServletContext;

import com.beyond.constants.MessageConstants;

 

public class FormValidator extends DwrBase {

 
	public String isAlphaNum(ServletContext cx, String strValue) throws Exception { 
	 	
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}
		
		return "Received " +  strValue;
				
	}
	
}

package com.beyond.util;

import com.beyond.customer.vo.CustomerVO;

public class TemplateUtil {

	public static String decodeMessage(CustomerVO cvo, String msg){
		String tmp=msg;
		try{
			if(msg!=null && !msg.isEmpty()){
				msg=msg.replaceAll("Field:FirstName", cvo.getFirstName());
				msg=msg.replaceAll("Field:LastName", cvo.getLastName());
				msg=msg.replaceAll("Field:ContactDetails", cvo.getLastName());
				msg=msg.replaceAll("Field:Email", cvo.getEmail());
				msg=msg.replaceAll("Field:LandPhone", cvo.getLandPhone());
			}
			return msg; 
		}catch(Exception e){
			Logger.error(e.toString());
			e.printStackTrace();
		} 
		return tmp; 
	}
	
	
}

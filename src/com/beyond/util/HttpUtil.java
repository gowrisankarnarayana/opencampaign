package com.beyond.util;

import java.util.Enumeration;

import javax.servlet.http.HttpSession;

public class HttpUtil {

	@SuppressWarnings("unchecked")
	public static boolean hasAttribute(HttpSession sess,
			String attributeName) throws Exception {
		
		Enumeration<String> enm=sess.getAttributeNames();
		
		while(enm.hasMoreElements()){
			String attName= (String)enm.nextElement();
			if(attName.equalsIgnoreCase(attributeName)){
				return true;
			}
		}
		
		return false;
	}

	public static void removeAttribute(HttpSession sess, String templateHolder) {
		try{ 
			sess.removeAttribute(templateHolder);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}

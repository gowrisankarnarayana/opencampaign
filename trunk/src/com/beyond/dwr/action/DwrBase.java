package com.beyond.dwr.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContextFactory;

import com.beyond.constants.ApplicationConstants;
import com.beyond.user.vo.UserVO;
import com.beyond.util.HttpUtil;
import com.beyond.util.Logger;

public class DwrBase {

	public UserVO user=null;
	public HttpSession sess=null;
	
	public boolean isValidUser() throws Exception{
		Logger.info("Begin DwrBase Validating User ");

		HttpServletRequest req=WebContextFactory.get().getHttpServletRequest();
		sess=req.getSession();
		
		
		if(HttpUtil.hasAttribute(sess, ApplicationConstants.SESSION_USER_OBJECT)){
			Logger.info("Session seems to have a valid user");
			user=(UserVO)sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
			return true;
		} 
			req.setAttribute("remoteMessage", "Invalid User Session. Please Login");
			Logger.info("Session does not have a valid user");
			return false;
	}
}

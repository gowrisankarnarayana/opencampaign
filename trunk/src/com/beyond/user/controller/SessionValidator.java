package com.beyond.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.RequestProcessor;

import com.beyond.util.Logger;

public class SessionValidator extends RequestProcessor {

	protected boolean processPreprocess (
			HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		
		Logger.info("Entering into SessionValidator.processPreProcess");
		
		//If user is trying to access login page don't check
		Logger.info("Request URL Object: " + request.getRequestURL());
		Logger.info("Servlet Path: " + request.getServletPath() );
		
		if(request.getServletPath().contains("/userAuthentication.do")){
			if(request.getParameter("mx")!=null && request.getParameter("mx").equalsIgnoreCase("login") ){
				Logger.info("SessionValidator.processPreProcess: User Registration");
				return true;
			}			
			return false;
		}   
		
		if(request.getServletPath().contains("/userController.do")){
			if(request.getParameter("mx")!=null &&  request.getParameter("mx").equalsIgnoreCase("register")){
				Logger.info("SessionValidator.processPreProcess: User Registration");
				return true;
			}			
			return false;
		}  
		
		if(request.getServletPath().contains("/fckeditor")){
		 		Logger.info("SessionValidator.processPreProcess: FCKEDITOR");
				return true; 
		}   
		
		if(request.getServletPath().contains("/subscriptions.do")){
			if(request.getParameter("mx")!=null &&  request.getParameter("mx").equalsIgnoreCase("subscribe")){
				Logger.info("SessionValidator.processPreProcess: User subscribed");
				return true;
			}
		}   
	 
		if( session != null && session.getAttribute("user") != null){
			Logger.info("SessionValidator.processPreProcess: Session contains User Information");
			return true;
		}else{
			try{ 
				Logger.info("SessionValidator.processPreProcess: Session Is Expired");
				request.setAttribute("loginMessage", "<font color='red'>Session Expired</font>: Please login");
				request.getRequestDispatcher("/index.jsp").forward(request,response);
			}catch(Exception ex){
				Logger.error(ex.toString());
			}  
		}
		return false;
	}
}
package com.beyond.mail;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.misc.BASE64Decoder;

import com.beyond.mail.dao.MailDAO;
import com.beyond.mail.dao.impl.MailDAOImpl;
import com.beyond.mail.vo.ResponseVO;
import com.beyond.util.DateUtil;
import com.beyond.util.Logger;

public class MailTracker extends HttpServlet {
 
	private static final long serialVersionUID = 1L;
	
	private static BASE64Decoder dec =new BASE64Decoder();
	
	public MailTracker() {}
	
	public  void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
	
	public  void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		
		Logger.info("MailTracker.doPost: Entering ");
		
		try{
	
			/* 1. Read the parameters from the request
			 * */
			ResponseVO responseVO= readParameters(request);
		  
			MailDAO mdao=new MailDAOImpl(null);
			mdao.doCreateMailTrackerLog(responseVO); 
			mdao=null;
			
		}catch(Exception e){ 
			e.printStackTrace();
			Logger.error("MailTracker.ERROR: Failed to track static response " + e.toString());
		}
		
	Logger.info("MailTracker.doPost: Leaving");
	}
	
	private ResponseVO readParameters(HttpServletRequest request) throws Exception{
		
 		Logger.info("Begin MailTracker.readParameters()");
		
		/* 1. Find the templateid and userid from the request
		 * 2. Fetch required elements for that template from the DB or any Hell
		 * 3. Read only the elements required and construct bludy XML
		 * 4. Maintain order of elements. Otherwise you might be sued. 
		 * */	
		
			   /* A note about the parameter naming conventions.
			    * these fields are inserted by the ContentGenerator while preparing message
			    * all fields are mandatory. 
			    * 
				* tx=Template id
				* ux=User id
				* cx=Contact id
				* ex=Email id (Encrypted)
				* mx=Mailer Id
				* lx=List id
				* */
 			    
				ResponseVO vo=new ResponseVO();
				
				try{
					
					Logger.info("Step 1/3 Obtaining Hidden Parameters From The Http Request");
					
					Logger.info("Reading User Id");
					vo.setUserId(Long.valueOf(request.getParameter("ux")));
					
					Logger.info("Reading Template Id");
					vo.setTemplateId(Long.valueOf(request.getParameter("tx")));
					
					Logger.info("Reading Mailer Id");
					vo.setMailerId(Long.valueOf(request.getParameter("mx")));
					
					Logger.info("Reading Contact Id");
					vo.setContactId(Long.valueOf(request.getParameter("cx")));
					
					Logger.info("Reading Email");
					vo.setEmail(new String(dec.decodeBuffer((String)request.getParameter("ex"))));
					
					Logger.info("Reading List Id");
					vo.setListId(Long.valueOf(request.getParameter("lx")));
						
				    vo.setDateReceived(DateUtil.getCurrentTime());
				   	
				   	Logger.info("Finding IP Address");
				  	vo.setIpAddress(request.getRemoteAddr());
				  	
				  	Logger.info("Finding User Agent");
				  	vo.setUserAgent(request.getHeader("User-Agent"));
				  	
				  	Logger.info("Decoded ResponseVO : " + vo.toString());
				  	
				  	Logger.info("Sucessfully finished constructing response data "); 
				  		
					}catch(Exception e){
						e.printStackTrace();
						throw e;
					}
				
		return vo;
	}
}

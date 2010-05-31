package com.beyond.template.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.misc.BASE64Decoder;

import com.beyond.customer.dao.CustomerDAO;
import com.beyond.customer.dao.impl.CustomerDAOImpl;
import com.beyond.customer.vo.CustomerVO;
import com.beyond.mail.helper.ContentGenerator;
import com.beyond.mail.vo.MailVO;
import com.beyond.mail.vo.ResponseVO;
import com.beyond.template.dao.TemplateDAO;
import com.beyond.template.dao.impl.TemplateDAOImpl;
import com.beyond.template.vo.TemplateVO;
import com.beyond.util.DateUtil;
import com.beyond.util.Logger;

public class TemplateViewer extends HttpServlet { 
 
	private static final long serialVersionUID = 1L;

	private static BASE64Decoder dec =new BASE64Decoder();
 
	
	public  void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
	
	public  void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		
		Logger.info("TemplateViewer.doPost: Entering ");
		
		try{
	
			/* 1. Read the parameters from the request
			 * */
			ResponseVO vo= readParameters(request);
		   
			/* 2. Construct mailer object using read parameters
			 * */
			Logger.info("1. Creating Mailer");
			MailVO mvo=new MailVO();
				mvo.setMailerId(vo.getMailerId());
				mvo.setTemplateId(vo.getTemplateId());
				mvo.setUserId(vo.getUserId());
				mvo.setIdCreatedBy(vo.getUserId());
			
			/* 3. Find contact details
			 * */	
			Logger.info("2. Finding Contact Details");
			CustomerDAO cdao=new CustomerDAOImpl(null); 
				Set<CustomerVO> clist= new HashSet<CustomerVO>(1);
				clist.add(cdao.getCustomerByEmail(vo.getEmail(),vo.getUserId()));
				mvo.setContacts(clist);
			cdao.closeConnection();
			cdao=null;
			
			/* 4. Read template content
			 * */	
			Logger.info("3. Finding template content");
			TemplateDAO tdao=new TemplateDAOImpl(null);
				TemplateVO tvo= tdao.getTemplateByUserAndId(vo.getUserId(),vo.getTemplateId());
				Logger.info(tvo.getContent());
				mvo.setStrMessage(tvo.getContent());
			tdao.closeConnection();
			tdao=null; 
			
			/* 5. Prepare message
			 * */	
			mvo.setShowWebLink(false);
			ContentGenerator cg=new ContentGenerator();
			mvo=cg.processMail(mvo);
			cg=null;
			
			Logger.info("4. Printing message");
			/* 6. Print message
			 * */	
				for(CustomerVO c:mvo.getContacts()){
					Logger.info(c.getMailMessage());
					response.setContentType("text/html"); 
					response.getWriter().print(c.getMailMessage());
				}
			
		}catch(Exception e){ 
			e.printStackTrace();
			Logger.error("TemplateViewer.doPost ERROR: Failed to track static response " + e.toString());
		}
		
	Logger.info("MailTracker.doPost: Leaving");
	}
	
	private ResponseVO readParameters(HttpServletRequest request) throws Exception{
		
 		Logger.info("Begin TemplateViewer.readParameters()");
		
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
				* 
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

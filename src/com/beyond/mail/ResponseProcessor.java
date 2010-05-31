package com.beyond.mail;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.misc.BASE64Decoder;

import com.beyond.constants.HtmlConstants;
import com.beyond.mail.dao.MailDAO;
import com.beyond.mail.dao.impl.MailDAOImpl;
import com.beyond.mail.vo.ResponseVO;
import com.beyond.template.dao.TemplateDAO;
import com.beyond.template.dao.impl.TemplateDAOImpl;
import com.beyond.template.vo.ElementVO;
import com.beyond.util.DateUtil;
import com.beyond.util.Logger;

public class ResponseProcessor extends HttpServlet {

 	private static final long serialVersionUID = 1L;
 	private static BASE64Decoder dec =new BASE64Decoder();
 	
 	public  void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		doPost(request,response);
	}
	
	public  void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
			 
		Logger.info("ResponseProcessorAction.processResponse  : Entering ");
				
			try{
		
				/* 1. Read the parameters from the request
				 * */
				ResponseVO responseVO= readParameters(request);
				
				/* 2. Though you didn't mean it.. Say Thanks to the responder. Duhhh :D
				 * */
				response.getWriter().print(HtmlConstants.THANKS_FOR_RESPONSE);
				
				/* 3. Save the response data to the database
				 * */
					MailDAO mdao=new MailDAOImpl(null);
					mdao.doCreateMailResponse(responseVO); 
					mdao=null;
				
			}catch(Exception e){
				response.getWriter().print(HtmlConstants.RESPONSE_RECEIPT_ERROR);
				Logger.error(e.toString());
			}
			
		Logger.info("ResponseProcessorAction.processResponse  : Leaving");
			
	} 

 	private ResponseVO readParameters(HttpServletRequest request) throws Exception{
		
 		Logger.info("Begin ResponseProcessor.readParameters()");
		
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
					
					vo.setUserId(Long.valueOf(request.getParameter("ux")));
					vo.setTemplateId(Long.valueOf(request.getParameter("tx")));
					vo.setMailerId(Long.valueOf(request.getParameter("mx")));
					vo.setContactId(Long.valueOf(request.getParameter("cx")));
					vo.setEmail(String.valueOf(dec.decodeBuffer(request.getParameter("ex"))));
				 
					Logger.info("Decoded ResponseVO : " + vo.toString());
					
					Logger.info("Step 2/3 Obtaining Elements For TemplateId : " + vo.getTemplateId());
				
					TemplateDAO tdao=new TemplateDAOImpl(null);
				
					List<ElementVO> elements= tdao.getElementsByTemplateId(vo.getTemplateId());
					
				 	tdao.closeConnection();
					tdao=null;
				
					Logger.info("Step 3/3 Reading Elements From HttpRequest and Constructing ResponseData");
				 
					String tmpVal;
					
					for(ElementVO evo:elements){
						
						/* Mind you : If only element is requested to be read,
						 * bother about reading it. Otherwise why bother?
						 * */
							if(!evo.isIgnored()){
					  			try{
					  				tmpVal=request.getParameter(evo.getElementName());
					  				evo.setElementValue(tmpVal);
					  			}catch(Exception e){
					  				e.printStackTrace();
					  				Logger.error("ResponseProcessor : Unable to read this element from parameters "+ evo.toString());
					  			}
					   		}
				  	} 
					
				  	
				  	vo.setResponseData(elements);
				  	vo.setDateReceived(DateUtil.getCurrentTime());
				  		
				  	Logger.info("Sucessfully finished constructing response data ");
				  	Logger.info(vo.getResponseXML());
				  		
					}catch(Exception e){
						e.printStackTrace();
						Logger.error(e.toString());
						throw e;
					}
				
		return vo;
	}
}

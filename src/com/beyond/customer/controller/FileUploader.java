package com.beyond.customer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import com.beyond.base.vo.ActionVO;
import com.beyond.constants.ApplicationConstants;
import com.beyond.customer.vo.CustomerFileUploadVO;
import com.beyond.customer.vo.CustomerVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.BeyondError;
import com.beyond.util.ExcelReader;
import com.beyond.util.Logger;
 

public class FileUploader extends Action {

 
	public ActionForward execute(
			
		    ActionMapping mapping,
		    ActionForm form,
		    HttpServletRequest request,
		    HttpServletResponse response) throws Exception{
		
			 /****** Track Current and Next Actions ************ 
		     * Below lines must present in all action methods.  
		     * 1) Track Current Menu Item and Sub Menu Item
		     * 2) Next action class or forward  
		     * 3) Current User Object from session 
		     ***************************************************/
			ActionVO action=null;
			action=new ActionVO(request.getParameter(ApplicationConstants.ROUTE));
		    
		     HttpSession sess=request.getSession(false);
		     UserVO userVO= (UserVO)sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
		
		     
		     CustomerFileUploadVO myForm = (CustomerFileUploadVO)form;
		     FormFile myFile = myForm.getTheFile();
	        
		     Logger.info("Forwarding To :" + action.getNxt());
			 Logger.info("ContentType: " + myFile.getContentType());
			 Logger.info("File Name: " + myFile.getFileName());
			 Logger.info("File Size: " + myFile.getFileSize() + " File Byte Length " + myFile.getFileData().length);
		    
		    try{
		    	
		    	BeyondError errors=new BeyondError();
		    	String msg= processFile(myForm,userVO,errors);
		    	Logger.info(errors.toString());
		    	
		    	if(errors.hasErrors()){
		    		msg= msg + errors.toString(); 
		    		action.setActionFailed(true);
		    	} 
		    	action.setShowMessage(true);
		    	action.setActionMessage(msg); 
		    	
				/****** Track Current and Next Actions ************/
			 	request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
				/***************************************************/
				
		    }catch(Exception e){
		         
		    	Logger.error("File Upload Action Class " + e.toString());
		    	
		    	  /***** Inform the user about error ***************   
		    	  * 1) Log error for debugging
		    	  * 2) Set error flag in action message, so view displays it in Style
		    	  **************************************************/
		    	  action.setActionFailed(true);
			      request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);	
			    	
		    } 
		    	 
		        return  mapping.findForward(action.getNxt());
		  }
	
			private String processFile(CustomerFileUploadVO myFile,UserVO userVO, BeyondError errors) throws Exception{
				
				return uploadCustomers(myFile,userVO, errors);
				
				
			}
			
			private String uploadCustomers(CustomerFileUploadVO myFile,UserVO userVO, BeyondError errors)throws Exception{
				ExcelReader ep=new ExcelReader();
				String msg="Upload Failed";
				List<CustomerVO> customers= ep.getCustomersFromExcel(myFile,errors);
				
				if(customers.size()>0){
					CustomerController ac=new CustomerController();
					msg=ac.createCustomers(customers, userVO);
				} 
				Logger.info("Leaving uploadCustomers()" + msg);
				return msg;
			}
			
			
	}
 

package com.beyond.dwr.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.beyond.constants.ApplicationConstants;
import com.beyond.constants.MessageConstants;
import com.beyond.customer.bo.CustomerBO;
import com.beyond.customer.vo.CustomerVO;
import com.beyond.template.vo.TemplateHolderVO;
import com.beyond.template.vo.TemplateVO;
import com.beyond.util.Logger;

public class CustomerAction  extends DwrBase{

 	public Set<CustomerVO>  getCustomers(String searchTerm, String searchKey) throws Exception{
		Logger.info("Begin DWR CustomerAction getCustomers");
		 
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}
		
		Set<CustomerVO> customers=null;
		
				CustomerBO bo=new CustomerBO(user);
				customers= bo.getCustomers(searchTerm, searchKey);
				
				
		Logger.info("End DWR CustomerAction getCustomers");
		
		return customers;
	}
 	public CustomerVO getContactByEmail(String email) throws Exception{
 		Logger.info("Begin DWR CustomerAction getContactByEmail");
		 
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}
		CustomerVO vo=null;
		CustomerBO bo=new CustomerBO(user);
		vo= bo.getCustomerByEmail(email);
		
		return vo;
 	}
 	public List<CustomerVO> getCustomerList(String searchTerm, String searchKey) throws Exception{
 		Logger.info("Begin DWR CustomerAction getCustomerList");
		 
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}
		
		List<CustomerVO> customers=new ArrayList<CustomerVO>(0);
		
		customers= new CustomerBO(user).getCustomersByUser();
		
		Logger.info("Returning from CustomerAction.getCustomersList");
		
		return customers;
 	}
 	
 	public String deleteContact(String email) throws Exception{
 		
 		Logger.info("Begin DWR CustomerAction getTemplateContent");
		  
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}
		
		String msg= new CustomerBO(user).deleteContact(email);
		
		return msg;
 	}
 	
 	public String updateContact(CustomerVO cvo) throws Exception{
 		
 		Logger.info("Begin DWR CustomerAction updateContact");
		  
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}
		
		Logger.info(cvo.toString());
		
		String msg= new CustomerBO(user).updateContact(cvo);
		
		return msg;
 	}
 	
   public String bulkDelete(String[] emails) throws Exception{
 		Logger.info("Begin DWR CustomerAction getTemplateContent");
		  
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}
		
		String msg=MessageConstants.DELETED + emails.length + " Contacts " + MessageConstants.SUCCESSFULLY;
		
		CustomerBO bo=new CustomerBO(user);
		
		for(String e:emails){
			bo.deleteContact(e);
		}
 		
		return msg;
 	}
 	
 	
	public String getTemplateContent(long templateId) throws Exception{
		
		Logger.info("Begin DWR CustomerAction getTemplateContent");
		  
		if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
		}
		
		String templateHtml=null;
		 		
				TemplateHolderVO holder=(TemplateHolderVO) sess.getAttribute(ApplicationConstants.SESSION_TEMPLATE_HOLDER);
			     
			     for(TemplateVO vo:holder.getDynamicTemplates()){
			    	 if(vo.getTemplateId()==templateId){
			    		 templateHtml=vo.getContent();
			    		 break;
			    	 }
			     }
			     
			     if(templateHtml==null){
				     for(TemplateVO vo:holder.getStaticTemplates()){
				    	 if(vo.getTemplateId()==templateId){
				    		 templateHtml=vo.getContent();
				    		 break;
				    	 }
				     }
			     }
			     
		return templateHtml;
		}
}

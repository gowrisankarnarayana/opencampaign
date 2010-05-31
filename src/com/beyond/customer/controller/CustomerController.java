package com.beyond.customer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.beyond.base.vo.ActionVO;
import com.beyond.base.vo.FileVO;
import com.beyond.constants.ApplicationConstants;
import com.beyond.constants.MessageConstants;
import com.beyond.customer.bo.CustomerBO;
import com.beyond.customer.vo.CustomerVO;
import com.beyond.list.bo.ListBO;
import com.beyond.list.vo.ListVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.BeyondError;
import com.beyond.util.ExcelWriter;
import com.beyond.util.HttpUtil;
import com.beyond.util.Logger;
import com.beyond.util.PDFWriter;

public class CustomerController extends DispatchAction {

	/** Simple forward method */
	public ActionForward customers(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin CustomerController.customers()");
		
		 /****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
         ActionVO action=null;
         action=new ActionVO(request.getParameter(ApplicationConstants.ROUTE));
	     
	     ActionForward actionForward = mapping.findForward(action.getNxt());
		
		 /****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		 /***************************************************/
		 
		 Logger.info("End CustomerController.customers()");		
		
		 return actionForward;

	} 
	
	public ActionForward newCustomer(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin CustomerController.customers()");
		
		 /****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
		 ActionVO action=null;
         action=new ActionVO(request.getParameter(ApplicationConstants.ROUTE));
	     HttpSession sess=request.getSession();
	     ActionForward actionForward = mapping.findForward(action.getNxt());
	     UserVO user=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
	     
	     ListBO bo=new ListBO(user);
	     
	     List<ListVO> groups=bo.getCustomerGroups();
	     	     
	     sess.setAttribute(ApplicationConstants.SESSION_CUSTOMER_GROUPS, groups);
	     /****** Track Current and Next Actions ************/
	 	 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		 /***************************************************/
		
		Logger.info("End CustomerController.customers()");		
		
		return actionForward;

	} 
	public ActionForward save(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin CustomerController.save()");
		
		/****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
		 ActionVO action=null;
         action=new ActionVO(request.getParameter(ApplicationConstants.ROUTE));
		 
	     		 HttpSession sess= request.getSession();
	     		 UserVO user=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
	    	     
				 CustomerVO customerVO=(CustomerVO) form; 
				 CustomerBO custBO= new CustomerBO(user);
				 custBO.createCustomer(customerVO);
				 user.setCustomers(true);
				 
				 sess.setAttribute(ApplicationConstants.SESSION_USER_OBJECT,user);
		
		/****** Track Current and Next Actions ************/
		action.setActionMessage("Sucessfully saved customer"); 
		action.setShowMessage(true);
		request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		/***************************************************/
		
		ActionForward actionForward = mapping.findForward(action.getNxt());
		
		Logger.info("End CustomerController.save()");		
		
		return actionForward;

	} 
	
	
	public ActionForward showCustomers(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin CustomerController.showCustomers()");
		
		 /****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
		 ActionVO action=null;
         action=new ActionVO(request.getParameter(ApplicationConstants.ROUTE));
	     Logger.info(action.getNxt());
	     
	     	HttpSession sess= request.getSession();
	     	UserVO user=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
		     
	     	//CustomerBO custBO= new CustomerBO(user);
	     	//List<CustomerVO> customers=custBO.getCustomersByUser();	
		
	     	//request.setAttribute("customersList",customers);
	     	 
	     	/* If CustomerGroupList is already present in session then don't bother going to the database... 
	     	 * Just ignore and proceed, If not found then go to database and fetch groups
	     	 * */
	     
	     	//if(!HttpUtil.hasAttribute(sess,ApplicationConstants.SESSION_CUSTOMER_GROUPS)){
	     		List<ListVO> groups =null;
	     		ListBO bo=new ListBO(user);
	     		groups=bo.getCustomerGroups();
	     		sess.setAttribute(ApplicationConstants.SESSION_CUSTOMER_GROUPS, groups);
	     	//}
	     	
     	/****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		/***************************************************/
		
		ActionForward actionForward = mapping.findForward(action.getNxt());
		
		Logger.info("End CustomerController.showCustomers()");		
		
		return actionForward;

	} 
	public ActionForward lists(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin CustomerController.lists()");
		
		 /****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
		 ActionVO action=null;
         action=new ActionVO(request.getParameter(ApplicationConstants.ROUTE));
	     Logger.info(action.getNxt());
	     
	     	HttpSession sess= request.getSession();
	     	UserVO user=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
		     
	        /* If CustomerGroupList is already present in session then don't bother going to the database... 
	     	 * Just ignore and proceed, If not found then go to database and fetch groups
	     	 * */
	     
	     	//if(!HttpUtil.hasAttribute(sess,ApplicationConstants.SESSION_CUSTOMER_GROUPS)){
	     		List<ListVO> groups =null;
	     		ListBO bo=new ListBO(user);
	     		groups=bo.getCustomerGroups();
	     		sess.setAttribute(ApplicationConstants.SESSION_CUSTOMER_GROUPS, groups);
	     	//}
	     	
     	/****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		/***************************************************/
		
		ActionForward actionForward = mapping.findForward(action.getNxt());
		
		Logger.info("End CustomerController.lists()");		
		
		return actionForward;

	} 
	public ActionForward downloadExcel(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin CustomerController.downloadExcel()");
		
		HttpSession sess= request.getSession();
	    UserVO user=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
		
	    CustomerBO custBO= new CustomerBO(user);
	    List<CustomerVO> customers=custBO.getCustomersByUser();	
		
	    FileVO fVO = ExcelWriter.getContactsExcel(customers);
	    
	    String dispoHeader = "Attachment;Filename=\"" + fVO.getFileName() + "\"";
	    
		response.setContentType(fVO.getFileContentType());
		response.setHeader("Content-Disposition", dispoHeader);
		response.getOutputStream().write(fVO.getByteArray());
		
		Logger.info("End CustomerController.downloadExcel()");		
		
		return null;

	} 
	
	public ActionForward downloadPDF(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin CustomerController.downloadPDF()");
		
		HttpSession sess= request.getSession();
	    UserVO user=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
		
	    CustomerBO custBO= new CustomerBO(user);
	    List<CustomerVO> customers=custBO.getCustomersByUser();	
		
	    FileVO fVO = PDFWriter.getContactsPDF(customers);
	    
	    String dispoHeader = "Attachment;Filename=\"" + fVO.getFileName() + "\"";
	    
		response.setContentType(fVO.getFileContentType());
		response.setHeader("Content-Disposition", dispoHeader);
		response.getOutputStream().write(fVO.getByteArray());
		
		Logger.info("End CustomerController.downloadPDF()");		
		
		return null;

	} 
	
	public ActionForward bulkUpload(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin CustomerController.bulkFileUpload()");
		
		/****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
         ActionVO action=null;
         action=new ActionVO(request.getParameter(ApplicationConstants.ROUTE));
	     Logger.info(action.getNxt());
	      
	     ActionForward actionForward = mapping.findForward(action.getNxt());
	     
	     HttpSession sess= request.getSession();
	     UserVO user=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
	     
	     /* If CustomerGroupList is already present in session then don't bother going to the database... 
	     	 * Just ignore and proceed, If not found then go to database and fetch groups
	     	 * */
	     
	     	if(!HttpUtil.hasAttribute(sess,ApplicationConstants.SESSION_CUSTOMER_GROUPS)){
	     		List<ListVO> groups =null;
	     		ListBO bo=new ListBO(user);
	     		groups=bo.getCustomerGroups();
	     		sess.setAttribute(ApplicationConstants.SESSION_CUSTOMER_GROUPS, groups);
	     		bo=null;
	     	}
	     
	     /****** Track Current and Next Actions ************/
 		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		/***************************************************/
	 
 		Logger.info("End CustomerController.bulkFileUpload()");		
		
		 return actionForward;

	} 
	
	
	public String createCustomers(List<CustomerVO> customers,UserVO userVO) throws Exception {
		BeyondError messages=new BeyondError();
		
		CustomerBO customerBO=new CustomerBO(userVO);
			
			for(CustomerVO customerVO:customers){
				try{
					customerBO.createCustomer(customerVO);
					userVO.setCustomers(true);
				}catch(Exception e){
					messages.add(MessageConstants.CONTACT_CREATION_FAILED + customerVO.getEmail());					
				}
			}
			
			if(!messages.hasErrors()){
				messages.add(MessageConstants.CONTACT_CREATION_SUCCEDED);
			}
		
		customerBO=null;
		return messages.toString();
		
	}
	
}

package com.beyond.customer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import sun.misc.BASE64Decoder;

import com.beyond.autoresponse.bo.AutoResponseBO;
import com.beyond.autoresponse.vo.AutoResponseVO;
import com.beyond.base.vo.ActionVO;
import com.beyond.constants.ApplicationConstants;
import com.beyond.customer.bo.CustomerBO;
import com.beyond.customer.vo.CustomerVO;
import com.beyond.list.bo.ListBO;
import com.beyond.list.vo.ListVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.Logger;

public class SubscriptionController extends DispatchAction { 
	
	public ActionForward newForm(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin SubscriptionController.customers()");
		
		 /****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
		 ActionVO action=null;
         action=new ActionVO(request.getParameter(ApplicationConstants.ROUTE));
         ActionForward actionForward = mapping.findForward(action.getNxt());
         HttpSession sess=request.getSession(); 
	     UserVO user=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
	     
	     ListBO bo=new ListBO(user);
	     
	     List<ListVO> groups=bo.getCustomerGroups();
	     	     
	     sess.setAttribute(ApplicationConstants.SESSION_CUSTOMER_GROUPS, groups);
	     //HttpSession sess=request.getSession();
	     //UserVO user=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT); 
	     
	     /****** Track Current and Next Actions ************/
	 	 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		 /***************************************************/
		
		Logger.info("End SubscriptionController.customers()");		
		
		return actionForward;

	} 
	
	public ActionForward subscribe(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin SubscriptionController.subscribe()");
		
		try{
		
			CustomerVO vo=(CustomerVO) form;
			vo.setRequestedIP(request.getRemoteAddr());
			Logger.info("Contact Details : "+vo.toString());
			
			BASE64Decoder dec =new BASE64Decoder();
			
	  		String uId=new String(dec.decodeBuffer((String)request.getParameter("ux")));
			long userId=Long.valueOf(uId);
			
			long listId= Long.valueOf(request.getParameter("lx"));
			
			Logger.info("Decrypted User Id :" + uId);
			Logger.info("Mailing List Id : " + listId);
			String requestedIP= request.getRemoteAddr();
						
			
			UserVO userVO=new UserVO(userId);
		 	CustomerBO cbo=new CustomerBO(userVO);
		 	
			vo.setUserId(userId);
			vo.setGroupId(listId);
			vo.setRequestedIP(requestedIP);
			vo.setSubscriptionStatus(ApplicationConstants.SUBSCRIPTION_PENDING);
			
			cbo.createCustomer(vo);
			
		 	Logger.info("Fetching auto response");
			AutoResponseBO bo=new AutoResponseBO(userVO);
			AutoResponseVO avo= bo.getAutoResponseByTypeId(1);
			
			response.setContentType("text/html"); 
			response.getWriter().print(avo.getAutoResponseHTML());
	    
		Logger.info("End SubscriptionController.subscribe()");
		
		}catch(Exception e){
			e.printStackTrace();
			Logger.error(e.getMessage());
		}
		
		return null; 

	} 
}

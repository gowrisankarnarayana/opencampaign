/**
 * 
 */
package com.beyond.list.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.beyond.base.vo.ActionVO;
import com.beyond.constants.ApplicationConstants;
import com.beyond.list.bo.ListBO;
import com.beyond.list.vo.ListVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.Logger;

/**
 * @author gowri
 *
 */
public class ListController extends DispatchAction {

	public ActionForward listHome(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		Logger.info("Begin ListController.listHome()");
		
		ActionVO action=null;
        action=new ActionVO(request.getParameter(ApplicationConstants.ROUTE));
	    Logger.info(action.getNxt());
	    
		ActionForward actionForward = mapping.findForward(action.getNxt()); 
	  	
     	/****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		/***************************************************/
		 
		Logger.info("End ListController.listHome()");			
		return actionForward; 
	}
	
	public ActionForward view(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		Logger.info("Begin ListController.view()");
		
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
		
		Logger.info("End ListController.view()");			
		return actionForward; 
	}
	
	public ActionForward newList(ActionMapping mapping,
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
	
	
}

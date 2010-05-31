package com.beyond.user.settings.controller;

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
import com.beyond.user.bo.UserBO;
import com.beyond.user.vo.EmailProfileVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.Logger;

public class AppSettingsController extends DispatchAction {

	public AppSettingsController() {
		// TODO Auto-generated constructor stub
	}
	
	public ActionForward settings(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin UserController.newUser()");
			
		 /****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
         ActionVO action=null;
         action=new ActionVO(request.getParameter("route"));
	     
	     ActionForward actionForward = mapping.findForward(action.getNxt());
		
		 /****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		 /***************************************************/
		 
		 Logger.info("End UserController.newUser()");		
		
		 return actionForward;

		 //userGroupList
	}

	public ActionForward updateAccount(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin UserController.updateAccount()");
			
		 /****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
         ActionVO action=null;
         action=new ActionVO(request.getParameter("route"));
         UserVO user=(UserVO) form;
         Logger.info(user.toString());
         UserBO bo=new UserBO(user);
         user=bo.updateUser(user); 
         form=user;
         
	     ActionForward actionForward = mapping.findForward(action.getNxt());
		
		 /****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		 /***************************************************/
		 
		 Logger.info("End UserController.updateAccount()");		
		
		 return actionForward;

		 //userGroupList
	}
	public ActionForward accountSettings(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin UserController.accountSettings()");
			
		 /****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
         ActionVO action=null;
         action=new ActionVO(request.getParameter("route"));
	     
	     ActionForward actionForward = mapping.findForward(action.getNxt());
	     
	     HttpSession sess= request.getSession();
	     UserVO user=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
	     form=user;
	     request.setAttribute("user",form);
	     
		 /****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		 /***************************************************/
		  
		 Logger.info("End UserController.accountSettings()");		
		
		 return actionForward;

		 //userGroupList
	}
	
	public ActionForward emailSettings(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin UserController.emailSettings()");
			
		 /****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
         ActionVO action=null;
         action=new ActionVO(request.getParameter("route"));
	     
	     ActionForward actionForward = mapping.findForward(action.getNxt());
	     HttpSession sess= request.getSession();
	     UserVO user=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
	     UserBO bo=new UserBO(user);
	     
	     List<EmailProfileVO> profiles= bo.getMailProfiles();
	     sess.setAttribute(ApplicationConstants.SESSION_EMAIL_PROFILE,profiles);
	     
		 /****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		 /***************************************************/
		 
		 Logger.info("End UserController.emailSettings()");		
		
		 return actionForward;

		 //userGroupList
	}
	public ActionForward generalSettings(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin UserController.generalSettings()");
			
		 /****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
         ActionVO action=null;
         action=new ActionVO(request.getParameter("route"));
         
	     ActionForward actionForward = mapping.findForward(action.getNxt());
		
		 /****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		 /***************************************************/
		 
		 Logger.info("End UserController.generalSettings()");		
		
		 return actionForward;

		 //userGroupList
	}
}

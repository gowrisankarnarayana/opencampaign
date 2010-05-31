/**
 * 
 */
package com.beyond.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.beyond.base.vo.ActionVO;
import com.beyond.constants.ApplicationConstants;
import com.beyond.constants.RouteConstants;
import com.beyond.user.bo.UserBO;
import com.beyond.user.vo.LoginVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.Logger;
import com.beyond.util.SecurityUtil;


/**
 * @author gowri
 *
 */
public class UserController extends DispatchAction {

	/**
	 * 
	 */
	public UserController() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * This Method will invoke while login...
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return actionForward
	 * @throws Exception
	 */
	public ActionForward register(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin UserController.registerUser()");
		
		UserBO userBO=new UserBO();
		UserVO user=(UserVO)form;
		ActionForward actionForward = null;
		 
		if(SecurityUtil.isCaptchaValid(request)){
			boolean regSuccess=userBO.register(user);
			if(regSuccess){
				request.setAttribute("regMessage","<font color='green'>Congrats. Please check your mail.</font>");
			}else{
				request.setAttribute("regMessage","<font color='red'>Could not register !</font>");
			}
		}else{
			request.setAttribute("regMessage","<font color='red'>Invalid Recaptha Response!</font>");
		}
		
		actionForward= mapping.findForward(RouteConstants.APPLICATION_HOME); 	
		Logger.info("End LoginAction.registerUser()");			
		return actionForward;

	} 
	/**
	 * This Method will invoke while login...
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return actionForward
	 * @throws Exception
	 */
	public ActionForward login(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin UserController.login()");
		ActionForward actionForward = null;
		UserBO userBO=new UserBO();
		UserVO user=null;
		LoginVO login=(LoginVO)form;
		HttpSession sess=request.getSession();
		Logger.info("UserController calling userBO.validateLogin");
		
		user=userBO.validateLogin(login.getEmail(),login.getPassword());
		
		if(user.isValidUser()){
				ActionVO action=new ActionVO("home/user/statistics");
				sess.setAttribute(ApplicationConstants.SESSION_USER_OBJECT,user);
				request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
				actionForward= mapping.findForward(RouteConstants.USER_HOME);
		}else{
				request.setAttribute("loginMessage","<font color='red'>Invalid login</font>");
				actionForward= mapping.findForward(RouteConstants.APPLICATION_HOME);
		}
		 	
		Logger.info("End LoginAction.registerUser()");			
		return actionForward;

	} 
	/**
	 * This Method will invoke while login...
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return actionForward
	 * @throws Exception
	 */
	public ActionForward home(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin UserController.home()");
		
		 /****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
         ActionVO action=null;
         action=new ActionVO("home/user/statistics");
	     
         ActionForward actionForward = mapping.findForward(RouteConstants.USER_HOME); 
		
		 /****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		 /***************************************************/ 
		
		Logger.info("End UserController.home()");			
		return actionForward; 
	}
	
	public ActionForward logout(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin UserController.logout()");
			
		ActionForward actionForward = null;
		
		request.getSession().invalidate();
		
		actionForward= mapping.findForward(RouteConstants.APPLICATION_HOME);
		 	
		Logger.info("End LoginAction.registerUser()");			
		return actionForward;
	}

	public ActionForward accounts(ActionMapping mapping,
	
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin UserController.accounts()");
			
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
		 
		 Logger.info("End UserController.accounts()");		
		
		 return actionForward;


	}
	
	public ActionForward showUsers(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin UserController.showUsers()");
			
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
		 
		 Logger.info("End UserController.showUsers()");		
		
		 return actionForward;
 
	}
	public ActionForward newUser(ActionMapping mapping,
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
	
	public ActionForward save(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin UserController.save()");
			
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
		 
		 Logger.info("End UserController.save()");		
		
		 return actionForward;

		 //userGroupList
	}
	
	
}

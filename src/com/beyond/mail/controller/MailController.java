package com.beyond.mail.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.beyond.base.vo.ActionVO;
import com.beyond.constants.ApplicationConstants;
import com.beyond.constants.MessageConstants;
import com.beyond.constants.RouteConstants;
import com.beyond.list.bo.ListBO;
import com.beyond.list.vo.ListVO;
import com.beyond.mail.bo.MailBO;
import com.beyond.mail.vo.MailDeliveryLogVO;
import com.beyond.mail.vo.MailVO;
import com.beyond.template.bo.TemplateBO;
import com.beyond.template.vo.TemplateHolderVO;
import com.beyond.user.bo.UserBO;
import com.beyond.user.vo.EmailProfileVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.HttpUtil;
import com.beyond.util.Logger;

public class MailController extends DispatchAction {

 
	public ActionForward mailHome(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin TemplateController.templatesHome()");
		
		 /****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
         ActionVO action=null;
         action=new ActionVO(request.getParameter(RouteConstants.ROUTE));
	     
	     ActionForward actionForward = mapping.findForward(action.getNxt());
		
		 /****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		 /***************************************************/
		 
		 Logger.info("End TemplateController.templatesHome()");		
		
		 return actionForward;

	} 
	
 
	public ActionForward newMail(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin TemplateController.newMail()");
		
		 /****** BEGIN Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
		
         ActionVO action=null;
         action=new ActionVO(request.getParameter(RouteConstants.ROUTE));	     
	     ActionForward actionForward = mapping.findForward(action.getNxt());
	     request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
	     
	     /****** END Track Current and Next Actions ************/
	     
	     HttpSession sess=request.getSession();
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
	     	     
     	 /* If TemplatesList is already present in session then don't bother going to the database... 
	      * Just ignore and proceed, If not found then go to database and fetch templates
	      * */
	     
	     	 if(!HttpUtil.hasAttribute(sess,ApplicationConstants.SESSION_TEMPLATE_HOLDER)){
	     		TemplateHolderVO templateHolder =null;
	     		TemplateBO tbo=new TemplateBO(user);
	     		templateHolder=tbo.getUserTemplates();
	     		sess.setAttribute(ApplicationConstants.SESSION_TEMPLATE_HOLDER, templateHolder);
	     	 } 	
	     	
	     	
	     	//if(!HttpUtil.hasAttribute(sess,ApplicationConstants.SESSION_EMAIL_PROFILE)){
		     	UserBO ubo=new UserBO(user);
		     	List<EmailProfileVO> profiles=ubo.getMailProfiles();
		     	sess.setAttribute(ApplicationConstants.SESSION_EMAIL_PROFILE, profiles);
	     	//}
	     	
	  	 Logger.info("End TemplateController.newMail()");		
		
		 return actionForward;

	} 
	
	
 
	public ActionForward viewSentMail(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin MailController.viewSentMail()");
		
		 /****** BEGIN Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
		
         ActionVO action=null;
         action=new ActionVO(request.getParameter(RouteConstants.ROUTE));	     
	     ActionForward actionForward = mapping.findForward(action.getNxt());
	     request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
	     
	     /****** END Track Current and Next Actions ************/
	     
	     HttpSession sess=request.getSession();
	     UserVO user=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
	     
	     		try{
	     			
	     			List<MailDeliveryLogVO> sentMails =null;
		     		MailBO bo=new MailBO(user); 
		     		sentMails=bo.getDeliveryLogByUserId();
		     		sess.setAttribute(ApplicationConstants.SESSION_DELIVERY_LOG, sentMails); 
		     		
				  }catch(Exception e){
				  	  /***** Inform the user about error ***************   
				  	  * 1) Log error for debugging
				  	  * 2) Set error flag in action message, so view displays it in Style
				  	  **************************************************/
					  Logger.error(e.toString());
				  	  action.setActionFailed(true);
				  	  action.setActionMessage(MessageConstants.MAIL_VIEW_ERROR);
					  request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
				  }
				
	     Logger.info("End MailController.viewSentMail()");		
		
		 return actionForward;

	} 
	
	public ActionForward showResponses(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin MailController.showResponses()");
		
		 /****** BEGIN Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
		
         ActionVO action=null;
         action=new ActionVO(request.getParameter(RouteConstants.ROUTE));	     
	     ActionForward actionForward = mapping.findForward(action.getNxt());
	     request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
	     
	     /****** END Track Current and Next Actions ************/
	     
//	     HttpSession sess=request.getSession();
//	     UserVO user=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
//	     
	     		try{
	     			 //Do somethign here
	     			
				  }catch(Exception e){
				  	  /***** Inform the user about error ***************   
				  	  * 1) Log error for debugging
				  	  * 2) Set error flag in action message, so view displays it in Style
				  	  **************************************************/
					  Logger.error(e.toString());
				  	  action.setActionFailed(true);
				  	  action.setActionMessage(MessageConstants.MAIL_VIEW_ERROR);
					  request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
				  }
				
	     Logger.info("End MailController.showResponses()");		
		
		 return actionForward;

	} 
	public ActionForward viewScheduler(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin MailController.viewScheduler()");
		
		 /****** BEGIN Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
		
         ActionVO action=null;
         action=new ActionVO(request.getParameter(RouteConstants.ROUTE));	     
	     ActionForward actionForward = mapping.findForward(action.getNxt());
	     request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
	     
	     /****** END Track Current and Next Actions ************/
	     
	     HttpSession sess=request.getSession();
	     UserVO user=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
	     
	     		try{
	     			
	     			//if(!HttpUtil.hasAttribute(sess,ApplicationConstants.SESSION_USER_MAILS)){
		     			List<MailVO> sentMails =null;
			     		MailBO bo=new MailBO(user); 
			     		sentMails=bo.getMailsByUserId();
			     		sess.setAttribute(ApplicationConstants.SESSION_USER_MAILS, sentMails); 
	     			//}
	     			
				  }catch(Exception e){
				  	  /***** Inform the user about error ***************   
				  	  * 1) Log error for debugging
				  	  * 2) Set error flag in action message, so view displays it in Style
				  	  **************************************************/
					  Logger.error(e.toString());
				  	  action.setActionFailed(true);
				  	  action.setActionMessage(MessageConstants.MAIL_VIEW_ERROR);
					  request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
				  }
				
	     Logger.info("End MailController.viewScheduler()");		
		
		 return actionForward;

	} 
 
	public ActionForward viewSentMailJson(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin MailController.viewSentMailJson()");
		
		 HttpSession sess=request.getSession();
	     UserVO user=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
	     
	     		try{
	     			
	     			List<MailVO> sentMails =null;
		     		MailBO bo=new MailBO(user); 
		     		sentMails=bo.getMailsByUserId();
		     		JSONArray jsonArr = JSONArray.fromObject(sentMails);
		     		response.getWriter().print(jsonArr);
		     		
				}catch(Exception e){  
				  Logger.error(e.toString());  
				  throw e;
			   }
				
	     Logger.info("End MailController.viewSentMailJson()");		
		
		 return null;

	} 
	
	public ActionForward sendMail(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin TemplateController.sendMail()");
		
		 /****** BEGIN Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
		
         ActionVO action=null;
         action=new ActionVO(request.getParameter(RouteConstants.ROUTE));	   
         action.setShowMessage(true);
	     ActionForward actionForward = mapping.findForward(action.getNxt());
	      
	     /****** END Track Current and Next Actions ************/
	     
	     HttpSession sess=request.getSession();
	     UserVO user=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
	     
	     MailVO mailVO=(MailVO) form;
	     
	     try{
	    	 
	    	 MailBO bo=new MailBO(user); 
	    	 Logger.info(mailVO.toString());
	    	 action.setActionMessage(bo.scheduleMail(mailVO));
	    	 action.setActionFailed(mailVO.getErrors().hasErrors()); 
	    	 
	     }catch(Exception e){
	    	  /***** Inform the user about error ***************   
	    	  * 1) Log error for debugging
	    	  * 2) Set error flag in action message, so view displays it in Style
	    	  **************************************************/
	    	 	Logger.error(e.toString());  
	    	 	action.setActionFailed(true);
	    	 	action.setShowMessage(true);  
	     }
	     
	     form = mailVO;
    	 request.setAttribute("mailVO", form);
    	 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);	  
    	 
	     Logger.info("End TemplateController.sendMail()");	
	     
		 return actionForward;

	} 
}

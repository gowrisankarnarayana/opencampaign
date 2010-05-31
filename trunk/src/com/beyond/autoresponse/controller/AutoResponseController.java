/**
 * 
 */
package com.beyond.autoresponse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.beyond.autoresponse.bo.AutoResponseBO;
import com.beyond.autoresponse.vo.AutoResponseVO;
import com.beyond.base.vo.ActionVO;
import com.beyond.constants.ApplicationConstants;
import com.beyond.constants.RouteConstants;
import com.beyond.user.bo.UserBO;
import com.beyond.user.vo.EmailProfileVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.HttpUtil;
import com.beyond.util.Logger;

/**
 * @author gowrisankar.narayana
 *
 */
public class AutoResponseController extends DispatchAction {

	/**
	 * 
	 */
	public AutoResponseController() {
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
	public ActionForward home(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin AutoResponseController.home()");

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
		 
		 Logger.info("End AutoResponseController.home()");		
		
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
	public ActionForward view(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin AutoResponseController.subscription()");

		 /****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
         ActionVO action=null;
         action=new ActionVO(request.getParameter(RouteConstants.ROUTE));
         ActionForward actionForward = mapping.findForward(action.getNxt());
         
         try{
        	 
         long responseTypeId= Long.valueOf(request.getParameter("rid"));
         HttpSession sess=request.getSession();
         
         UserVO userVO=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
         
         AutoResponseBO bo= new AutoResponseBO(userVO);
         
         AutoResponseVO vo= bo.getAutoResponseByTypeId(responseTypeId); 
         
         request.setAttribute(ApplicationConstants.AUTO_RESPONSE_OBJECT,vo);
         
         if(!HttpUtil.hasAttribute(sess, ApplicationConstants.SESSION_EMAIL_PROFILE)){
        	 UserBO ubo=new UserBO(userVO);
        	 List<EmailProfileVO> profiles= ubo.getMailProfiles();
        	 request.getSession().setAttribute(ApplicationConstants.SESSION_EMAIL_PROFILE,profiles);
         }
         
         }catch(Exception e){
        	 Logger.error(e.toString());
        	 throw e;
         }
	     
		 
		 /****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		 /***************************************************/
		 
		 Logger.info("End AutoResponseController.subscription()");		
		
		 return actionForward;
	}
	 
}

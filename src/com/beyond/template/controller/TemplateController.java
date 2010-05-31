package com.beyond.template.controller;

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
import com.beyond.constants.HtmlConstants;
import com.beyond.constants.MessageConstants;
import com.beyond.constants.RouteConstants;
import com.beyond.template.bo.TemplateBO;
import com.beyond.template.vo.ElementVO;
import com.beyond.template.vo.TemplateHolderVO;
import com.beyond.template.vo.TemplateVO;
import com.beyond.user.vo.UserVO;
import com.beyond.util.HtmlParser;
import com.beyond.util.HttpUtil;
import com.beyond.util.Logger;

public class TemplateController extends DispatchAction {

	/** Simple forward method */
	public ActionForward templatesHome(ActionMapping mapping,
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
         action=new ActionVO(request.getParameter(ApplicationConstants.ROUTE));
	     
	     ActionForward actionForward = mapping.findForward(action.getNxt());
		
		 /****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		 /***************************************************/
		 
		 Logger.info("End TemplateController.templatesHome()");		
		
		 return actionForward;

	} 
	
	/** Simple forward method */
	public ActionForward newTemplate(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin TemplateController.newTemplate()");
		
		 /****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
         ActionVO action=null;
         action=new ActionVO(request.getParameter(ApplicationConstants.ROUTE));
	     
	     ActionForward actionForward = mapping.findForward(action.getNxt());
		
	     TemplateVO templateVO=new TemplateVO();
	     form=templateVO;
	     request.setAttribute(ApplicationConstants.TEMPLATE_VO, templateVO);
	     
		 /****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		 /***************************************************/
		 
		 Logger.info("End TemplateController.newTemplate()");		
		
		 return actionForward;

	} 
	
	/** Simple forward method */
	public ActionForward prepareElements(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin TemplateController.prepareElements()");
		
		 /****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
         ActionVO action=null;
         action=new ActionVO(request.getParameter(ApplicationConstants.ROUTE));
	     
         TemplateVO templateVO= (TemplateVO) form;
         HtmlParser parser= new HtmlParser();
                   
         List<ElementVO> elements= parser.getFormElements(templateVO.getContent());
         templateVO.setElements(elements);
         
         form= templateVO;
         request.setAttribute(ApplicationConstants.TEMPLATE_VO, templateVO);
         
         ActionForward actionForward = mapping.findForward(action.getNxt());
		
		 /****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		 /***************************************************/
		 
		 Logger.info("End TemplateController.prepareElements()");		
		
		 return actionForward;

	} 
	
	/** Simple forward method */
	public ActionForward saveTemplate(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin TemplateController.saveTemplate()");
		
		 /****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
         ActionVO action=null;
         action=new ActionVO(request.getParameter(ApplicationConstants.ROUTE));
	     
         ActionForward actionForward = mapping.findForward(action.getNxt());
	    
         HttpSession sess= request.getSession();
	     UserVO userVO=(UserVO) sess.getAttribute(ApplicationConstants.SESSION_USER_OBJECT);
		 TemplateBO templateBO= new TemplateBO(userVO);
		 
			try{	
		 
			TemplateVO templateVO=(TemplateVO) form;
		    
			Logger.info("Total Elements :" + templateVO.getElements().size());
			displayElements(templateVO.getElements());
			
			Logger.info(templateVO.toString());
			
			templateBO.createTemplate(templateVO);
			
			action.setShowMessage(true);	
			action.setActionMessage(MessageConstants.TEMPLATE_CREATION_SUCCEDED);
			
			HttpUtil.removeAttribute(sess,ApplicationConstants.TEMPLATE_HOLDER);
			
			Logger.info("TemplateAction.create() : Leaving");		
			
			}catch(Exception e){
				Logger.error(e.toString());
		    	
		    	  /***** Inform the user about error ***************   
		    	  * 1) Log error for debugging
		    	  * 2) Set error flag in action message, so view displays it in Style
		    	  **************************************************/
		    	  action.setActionFailed(true);
			      request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);	
			}
		 
		 request.getSession().setAttribute(ApplicationConstants.SESSION_USER_OBJECT, userVO);
		 
	     /****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		 /***************************************************/
		 
		 Logger.info("End TemplateController.saveTemplate()");		
		
		 return actionForward;
	} 
	
	public ActionForward showTemplates(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin TemplateController.showTemplates()");
		
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
		 
	     	if(!HttpUtil.hasAttribute(sess, ApplicationConstants.TEMPLATE_HOLDER)){
	     		TemplateBO templateBO= new TemplateBO(user);
	     		TemplateHolderVO holder=templateBO.getUserTemplates();	
	     		sess.setAttribute(ApplicationConstants.TEMPLATE_HOLDER,holder);
	     	}
	     	
     	/****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		/***************************************************/
		
		ActionForward actionForward = mapping.findForward(action.getNxt());
		
		Logger.info("End TemplateController.showTemplates()");		
		
		return actionForward;

	} 
	
	public ActionForward showTemplateContent(ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			 
		Logger.info("Begin TemplateController.showTemplateContent)");
		
		 /****** Track Current and Next Actions ************ 
	     * Below lines must present in all action methods.  
	     * 1) Track Current Menu Item and Sub Menu Item
	     * 2) Next action class or forward  
	     * 3) Current User Object from session 
	     ***************************************************/
		 ActionVO action=new ActionVO(RouteConstants.LIST_TEMPLATES);
		 Long templateId=null;
		 Integer typeId=null;
		 String templateHtml=null;
		 
			 try{
				
				 templateId=Long.valueOf(request.getParameter(ApplicationConstants.TEMPLATE_ID)); 
				 typeId=Integer.valueOf(request.getParameter(ApplicationConstants.TEMPLATE_TYPE));
				 
				 HttpSession sess= request.getSession();
			     TemplateHolderVO holder=(TemplateHolderVO) sess.getAttribute(ApplicationConstants.TEMPLATE_HOLDER);
			     
			     for(TemplateVO vo:holder.getTemplates(typeId)){
			    	 if(vo.getTemplateId()==templateId){
			    		 templateHtml=vo.getContent();
			    	 }
			     }
			     
			 }catch(Exception e){
				 action.setActionFailed(true);
				 action.setActionMessage(MessageConstants.TEMPLATE_PARAMS_ERROR);
			 }
	    
	 	/****** Track Current and Next Actions ************/
		 request.setAttribute(ApplicationConstants.ACTION_TRACKER,action);
		/***************************************************/
		 
		 response.setContentType(HtmlConstants.CONTENT_TEXT_HTML);
		 response.getWriter().print(templateHtml);
				
		 Logger.info("End TemplateController.showTemplateContent()");		
		
		 return null;

	} 
	
	
	
	 private void displayElements(List<ElementVO> elements) throws Exception{
		 for(ElementVO e:elements){
			 Logger.info(e.toString());
		 }
	 }
	
	
}

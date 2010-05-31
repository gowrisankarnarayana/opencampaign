/**
 * 
 */
package com.beyond.dwr.action;

import com.beyond.constants.ApplicationConstants;
import com.beyond.constants.MessageConstants;
import com.beyond.template.bo.TemplateBO;
import com.beyond.template.vo.TemplateHolderVO;
import com.beyond.template.vo.TemplateVO;
import com.beyond.util.Logger;

/**
 * @author gowri
 *
 */
public class TemplateAction extends DwrBase {

	/**
	 * 
	 */
	public TemplateAction() {
		// TODO Auto-generated constructor stub
	}

	public String getTemplateByIdAndType(long templateId,long templateType) throws Exception{
		Logger.info("Begin DWR TemplateAction.getTemplateByIdAndType");
		 
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
	
  public String deleteTemplateById(long templateId) throws Exception{
	  
	  Logger.info("Begin DWR TemplateAction.deleteTemplateById");
		 
	  if(!isValidUser()){
		 	throw new Exception(MessageConstants.INVALID_USER);	
	  }
	  TemplateBO bo=new TemplateBO(user);
	  String msg="Template deletion failed";
	  msg=bo.deleteTemplate(templateId);
	  return msg;
	  
  }
}

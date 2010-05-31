package com.beyond.tags.ui;
 
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

import com.beyond.constants.HtmlConstants;
 

public class HtmlHeader extends BodyTagSupport {

	private String blockHeading;
	private static String ctxPath=null;
	private static final long serialVersionUID = 1L;

	public int doStartTag() throws JspException{
	 		return BodyTagSupport.EVAL_BODY_BUFFERED;
	}

	public int doEndTag() throws JspException{
		if(ctxPath==null){
			HttpServletRequest req= (HttpServletRequest)pageContext.getRequest();
			ctxPath=req.getContextPath();
		}
		BodyContent bc=getBodyContent();
		String content= bc.getString();
			
		try{ 
			StringBuilder sbf=new StringBuilder();
 
			sbf.append(HtmlConstants.HEAD_BEGIN);
			sbf.append(HtmlConstants.META_DECLARATIONS);
			sbf.append(content);
			sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append(ctxPath).append("/scripts/template/script.js'>").append(HtmlConstants.SCRIPT_END);
			sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append(ctxPath).append("/scripts/validation/global.js'>").append(HtmlConstants.SCRIPT_END);
			//sbf.append(HtmlConstants.LINK_REL_BEGIN).append(ApplicationConstants.CONTEXT_PATH).append(ApplicationConstants.YUI_PATH).append("tabview/assets/skins/sam/tabview.css' />");
			//sbf.append(HtmlConstants.LINK_REL_BEGIN).append(ApplicationConstants.CONTEXT_PATH).append(ApplicationConstants.YUI_PATH).append("container/assets/skins/sam/container.css' /> ");
			//sbf.append(HtmlConstants.LINK_REL_BEGIN).append(ApplicationConstants.CONTEXT_PATH).append(ApplicationConstants.YUI_PATH).append("button/assets/skins/sam/button.css' /> ");
			//sbf.append(HtmlConstants.LINK_REL_BEGIN).append(ApplicationConstants.CONTEXT_PATH).append(ApplicationConstants.YUI_PATH).append("fonts/fonts-min.css' /> ");
			//sbf.append(HtmlConstants.LINK_REL_BEGIN).append(ApplicationConstants.CONTEXT_PATH).append(ApplicationConstants.YUI_PATH).append("datatable/assets/skins/sam/datatable.css' /> ");
			//sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append(ApplicationConstants.CONTEXT_PATH).append(ApplicationConstants.YUI_PATH).append("yahoo-dom-event/yahoo-dom-event.js'>").append(HtmlConstants.SCRIPT_END);
			//sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append(ApplicationConstants.CONTEXT_PATH).append(ApplicationConstants.YUI_PATH).append("element/element-min.js'>").append(HtmlConstants.SCRIPT_END);
			//sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append(ApplicationConstants.CONTEXT_PATH).append(ApplicationConstants.YUI_PATH).append("container/container-min.js'>").append(HtmlConstants.SCRIPT_END);
			//sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append(ApplicationConstants.CONTEXT_PATH).append(ApplicationConstants.YUI_PATH).append("button/button-min.js'>").append(HtmlConstants.SCRIPT_END);
			//sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append(ApplicationConstants.CONTEXT_PATH).append(ApplicationConstants.YUI_PATH).append("datasource/datasource-min.js'></script> ");
			//sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append(ApplicationConstants.CONTEXT_PATH).append(ApplicationConstants.YUI_PATH).append("datatable/datatable-min.js'>").append(HtmlConstants.SCRIPT_END); 
			//sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append(ApplicationConstants.CONTEXT_PATH).append(ApplicationConstants.YUI_PATH).append("dragdrop/dragdrop-min.js'>").append(HtmlConstants.SCRIPT_END);
			//sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append(ApplicationConstants.CONTEXT_PATH).append(ApplicationConstants.YUI_PATH).append("tabview/tabview-min.js'>").append(HtmlConstants.SCRIPT_END);
			sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append(ctxPath).append("/dwr/engine.js'>").append(HtmlConstants.SCRIPT_END);
			sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append(ctxPath).append("/dwr/util.js'>").append(HtmlConstants.SCRIPT_END);
			sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append(ctxPath).append("/dwr/interface/jValidator.js'>").append(HtmlConstants.SCRIPT_END);
			sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append(ctxPath).append("/scripts/template/beyondui.js'>").append(HtmlConstants.SCRIPT_END);
			
			//sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append(ctxPath).append("/scripts/template/jquery.js'>").append(HtmlConstants.SCRIPT_END);
			//sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append(ctxPath).append("/scripts/template/redmond/js/jquery-1.4.2.min.js'></script> ");
			sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append("http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js'></script>");
			
			sbf.append(HtmlConstants.SCRIPT_TYPE_BEGIN).append(ctxPath).append("/scripts/template/redmond/js/jquery-ui-1.8.custom.min.js'></script> ");
			sbf.append(HtmlConstants.LINK_REL_BEGIN).append(ctxPath).append("/scripts/template/redmond/css/jquery-ui-1.8.custom.css'  />");
			
			sbf.append(HtmlConstants.LINK_REL_BEGIN).append(ctxPath).append("/style/template/beyondui.css' type='text/css' media='screen' />");
			sbf.append(HtmlConstants.LINK_REL_BEGIN).append(ctxPath).append("/style/template/style.css' type='text/css' media='screen' />");
			sbf.append("<!--[if IE 6]><link rel='stylesheet' href='/").append(ctxPath).append("/style/template/style.ie6.css' type='text/css' media='screen' /><![endif]-->");
			sbf.append("<!--[if IE 7]><link rel='stylesheet' href='/").append(ctxPath).append("/style/template/style.ie7.css' type='text/css' media='screen' /><![endif]-->");
			sbf.append(HtmlConstants.HEAD_END);
			
			bc.getEnclosingWriter().write(sbf.toString()); 

			//Logger.info(sbf.toString());
		}catch(IOException e){
			throw new JspException(e);
		}
		return TagSupport.EVAL_PAGE;
	}
 
	public String getBlockHeading() {
		return blockHeading;
	}


	public void setBlockHeading(String blockHeading) {
		this.blockHeading = blockHeading;
	}
	 

 
}
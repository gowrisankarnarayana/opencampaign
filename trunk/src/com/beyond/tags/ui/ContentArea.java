package com.beyond.tags.ui;

 
import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

import com.beyond.constants.HtmlConstants;
 

public class ContentArea extends  BodyTagSupport {

 
	private static final long serialVersionUID = 1L;

	public int doStartTag() throws JspException{
	 
		return BodyTagSupport.EVAL_BODY_BUFFERED;
	}
  

	public int doEndTag() throws JspException{
	  
		BodyContent bc=  getBodyContent();
		String content= bc.getString();
		
		try{ 
			StringBuilder sbf=new StringBuilder();
 
			sbf.append(HtmlConstants.CONTENT_LAYOUT_BEGIN);
			sbf.append("<div id='div_beyond_message'></div>");
			sbf.append("<div id='div_remote_error'></div>");
			sbf.append(content);
			sbf.append(HtmlConstants.DIV_CLOSE);		 
			
			bc.getEnclosingWriter().write(sbf.toString()); 

			//Logger.info(sbf.toString());
		}catch(IOException e){
			throw new JspException(e);
		}
		return TagSupport.EVAL_PAGE;
	}
 
 

 
}
package com.beyond.tags.ui;

 
import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

import com.beyond.constants.HtmlConstants;
 

public class Content extends  BodyTagSupport {

 
	private static final long serialVersionUID = 1L;

	private String cssStyle="";
	
	public int doStartTag() throws JspException{
	 
		return BodyTagSupport.EVAL_BODY_BUFFERED;
	}
  

	public int doEndTag() throws JspException{
	  
		BodyContent bc=  getBodyContent();
		String content= bc.getString();
		
		try{ 
			StringBuilder sbf=new StringBuilder();
 
			sbf.append("<div ");
			if(notEmpty(getCssStyle())){
			sbf.append(" style=\"").append(getCssStyle()).append("\" ");
			}
			sbf.append(" class=\"art-content\" >");
			sbf.append(content);
			sbf.append(HtmlConstants.DIV_CLOSE);		 
			
			bc.getEnclosingWriter().write(sbf.toString()); 

			//Logger.info(sbf.toString());
		}catch(IOException e){
			throw new JspException(e);
		}
		return TagSupport.EVAL_PAGE;
	}


	public String getCssStyle() {
		return cssStyle;
	}


	public void setCssStyle(String cssStyle) {
		this.cssStyle = cssStyle;
	}
 
	private boolean notEmpty(String s) {
		 return (s != null && s.length() > 0);
	}

 
}
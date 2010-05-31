package com.beyond.tags.ui;
 
import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

import com.beyond.constants.HtmlConstants;
 

public class Button extends  BodyTagSupport {

	private String label;
	private String link;

	private static final long serialVersionUID = 1L;

	public int doStartTag() throws JspException{
	 
		return BodyTagSupport.EVAL_BODY_BUFFERED;
	}
  

	public int doEndTag() throws JspException{
	  
		BodyContent bc=  getBodyContent();
				
		try{ 
			StringBuilder sbf=new StringBuilder();
 
			sbf.append(HtmlConstants.BUTTON_BEGIN);
			sbf.append(getLink());
			sbf.append(HtmlConstants.CLOSE_TAG_QUOTE);
			sbf.append(getLabel());
			sbf.append(HtmlConstants.BUTTON_END);
		
			bc.getEnclosingWriter().write(sbf.toString()); 

			//Logger.info(sbf.toString());
		}catch(IOException e){
			throw new JspException(e);
		}
		return TagSupport.EVAL_PAGE;
	}
  
	 
	public String getLabel() {
		return label;
	}


	public void setLabel(String label) {
		this.label = label;
	}


	public String getLink() {
		return link;
	}


	public void setLink(String link) {
		this.link = link;
	}

 
}
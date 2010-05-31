package com.beyond.tags.ui;

 
import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

import com.beyond.constants.HtmlConstants;
 

public class Html extends BodyTagSupport {

	private String blockHeading;
 
	private static final long serialVersionUID = 1L;

	public int doStartTag() throws JspException{
	 		return BodyTagSupport.EVAL_BODY_BUFFERED;
	}


	public int doEndTag() throws JspException{
	
		BodyContent bc=getBodyContent();
		String content= bc.getString();
		
		try{ 
			StringBuilder sbf=new StringBuilder();
 
			sbf.append(HtmlConstants.DOC_TYPE_DEC);
			sbf.append(HtmlConstants.HTML_BEGIN);
			sbf.append(content);
			sbf.append(HtmlConstants.HTML_END);
			
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
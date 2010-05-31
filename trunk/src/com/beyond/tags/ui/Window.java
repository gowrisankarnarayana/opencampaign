package com.beyond.tags.ui;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

import com.beyond.constants.HtmlConstants;

public class Window extends BodyTagSupport {

	private static String ctxPath=null;
	private String title;
	private String width;
	private String height;
	private String id;
	private String display;
	
	private static final long serialVersionUID = 1L;

	public int doStartTag() throws JspException{
	 		return BodyTagSupport.EVAL_BODY_BUFFERED;
	}

	public int doEndTag() throws JspException{
	
		BodyContent bc=getBodyContent();
		String content= bc.getString();
		if(ctxPath==null){
			HttpServletRequest req= (HttpServletRequest)pageContext.getRequest();
			ctxPath=req.getContextPath();
		}
		try{ 
			StringBuilder sbf=new StringBuilder();
 
			sbf.append("<div id='").append(getId());
			sbf.append("' style='display:").append(getDisplay()).append(";padding:0px;border:3px solid rgb(213,234,246);'>");
			sbf.append(HtmlConstants.JWINDOW_HEADER);
			sbf.append(getTitle());
	 		
			sbf.append("<a title='Close' href='javascript:jCloseWindow(\"").append(getId()).append("\")'>");
			sbf.append("<img alt='Close X' style='float:right' src='").append(ctxPath).append("/images/closeBtn.jpg'/></a>");
			sbf.append(HtmlConstants.DIV_CLOSE);
			sbf.append(HtmlConstants.JWINDOW_BODY_BEGIN);
			sbf.append(content);
			sbf.append(HtmlConstants.JWINDOW_END);
			 
			bc.getEnclosingWriter().write(sbf.toString()); 

			//Logger.info(sbf.toString());
		}catch(Exception e){
			throw new JspException(e);
		}
		return TagSupport.EVAL_PAGE;
	}
 
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDisplay() {
		return display==null?"block":display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}
	 

 
}
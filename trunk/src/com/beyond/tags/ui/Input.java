package com.beyond.tags.ui;

import java.io.IOException;

import javax.servlet.jsp.tagext.*; 
import javax.servlet.jsp.*; 

public class Input extends  BodyTagSupport {
 
	private static final long serialVersionUID = 1L;
	
	private int type;
	private String label;
	private boolean required;
			
	public int getType() {
		return type;
	}


	public void setType(int type) {
		this.type = type;
	} 


	public String getLabel() {
		return label;
	}


	public void setLabel(String label) {
		this.label = label;
	}


	public boolean isRequired() {
		return required;
	}


	public void setRequired(boolean required) {
		this.required = required;
	}


	public int doStartTag() throws JspException{
	 
		return BodyTagSupport.EVAL_BODY_BUFFERED;
	}
  

	public int doEndTag() throws JspException{
	  
		BodyContent bc=  getBodyContent();
	 
		
		try{ 
			StringBuilder sbf=new StringBuilder();
 
			sbf.append(getHtml());
			
			bc.getEnclosingWriter().write(sbf.toString()); 

			//Logger.info(sbf.toString());
		}catch(IOException e){
			throw new JspException(e);
		}
		return TagSupport.EVAL_PAGE;
	}
    
	private String getHtml(){
		//1= Text Box
		//2= Email
		//3= Text Area
		
		StringBuilder sbf=new StringBuilder();
		
		switch(getType()){
		case 1: 
			sbf.append("<TD>").append(getLabel()).append("</TD><TD>").append("<input type=\"text\" ");
				if(isRequired()){
					sbf.append(" onblur=\"javascript:mandText(this);\" ");		
				}else{
					sbf.append(" onblur=\"javascript:isText(this);\" ");
				}
			sbf.append("size=\"30\" maxLength=\"35\"/></TD>"); 
			break;
		case 2: 
			sbf.append("<TD>").append(getLabel()).append("</TD><TD>").append("<input type=\"text\" ");
				if(isRequired()){
					sbf.append(" onblur=\"javascript:mandMail(this);\" ");		
				}else{
					sbf.append(" onblur=\"javascript:isMail(this);\" ");
				}
			sbf.append("size=\"30\" maxLength=\"35\"/></TD>"); 
			break;	
		case 3: 
			sbf.append("<TD>").append(getLabel()).append("</TD><TD>").append("<textarea ");
				if(isRequired()){
					sbf.append(" onblur=\"javascript:mandText(this);\" ");		
				}else{
					sbf.append(" onblur=\"javascript:isAddress(this);\" ");
				}
			sbf.append(" rows=\"10\" cols=\"10\"></textarea></TD>"); 
			break;	
		}
				
		return sbf.toString();
	}
 
	
}
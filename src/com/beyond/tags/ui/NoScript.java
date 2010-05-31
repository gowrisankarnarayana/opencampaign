package com.beyond.tags.ui;

import javax.servlet.jsp.tagext.*; 
import javax.servlet.jsp.*; 

import com.beyond.constants.HtmlConstants;

public class NoScript extends SimpleTagSupport { 
   
   public void doTag() throws JspException { 
        
       PageContext pageContext = (PageContext) getJspContext(); 
       JspWriter out = pageContext.getOut(); 
       StringBuilder sbf=new StringBuilder();
       
       try { 
    	   sbf.append(HtmlConstants.NO_SCRIPT);      
           out.println(sbf.toString());            
       } catch (Exception e) { 
           
       } 
        
   } 
}
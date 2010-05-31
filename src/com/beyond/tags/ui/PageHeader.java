package com.beyond.tags.ui;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.beyond.constants.ApplicationConstants;
import com.beyond.constants.HtmlConstants;
import com.beyond.user.vo.UserVO;

public class PageHeader extends SimpleTagSupport { 
   
   public void doTag() throws JspException { 
	   
       PageContext pageContext = (PageContext) getJspContext(); 
       JspWriter out = pageContext.getOut(); 
       StringBuilder sbf=new StringBuilder(); 
       Object o=pageContext.getAttribute(ApplicationConstants.SESSION_USER_OBJECT, PageContext.SESSION_SCOPE);
       
       try { 
       	   sbf.append(HtmlConstants.ART_HEADER_BEGIN);
           sbf.append(HtmlConstants.BEYOND_HEADER_BEGIN);
          
               UserVO user=(UserVO)o; 
               sbf.append("<table cellspacing='0' cellpadding='0' width='98%'><tr>");
               sbf.append("<td valign='middle' width='300px'>");
               sbf.append("<div class='jLogo' style='width:300px;padding-top:5px;'></div>");
               sbf.append("</td>"); 
               if(o!=null){ 
 	           sbf.append("<td>"); 
	               sbf.append("<div class='jLoginBG'>");
		               sbf.append("<div class='jUserInfo'>");
		               sbf.append("<div class='jUser'>");
		                sbf.append("<table cellspacing='0' cellpadding='0'><tr><td><div class='jl'>User - ").append(user.getUserName()).append("</div></td>");
		               	sbf.append("<td><div class='jr'><a id='logout' alt='Logout' title='Logout' href='").append("users.do?mx=logout'>Logout</a></div></td></tr></table>");
		               sbf.append("</div>");
		               sbf.append("<div class='jRoleInfo'>").append("</div>");
		               sbf.append("<div class='jCompanyInfo'> Logged In from IP ").append(pageContext.getRequest().getRemoteAddr()).append("</div>");
		               sbf.append("</div>");
	               sbf.append("</div>");
               sbf.append("</td>");
               } 
               sbf.append("<td><div style='display:none' id='jGlobalMessage' title='Message'><div id='jMessageContent'><div></div></td>");
               sbf.append("</tr>");
               sbf.append("</table>");
               sbf.append("<script>setTimeout('popSessTimeOut()',").append(ApplicationConstants.SESSION_TIMEOUT_MINUTES).append(");"); 
               sbf.append("</script>");
           
           sbf.append(HtmlConstants.JWINDOW_END);           
           out.println(sbf.toString());            
       } catch (Exception e) { 
           
       } 
        
   } 
}
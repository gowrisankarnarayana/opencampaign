<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html" %>
<%@taglib prefix="logic" uri="http://joompal.com/beyondcontact/struts-logic" %>
<%@taglib prefix="bean"  uri="http://joompal.com/beyondcontact/struts-bean" %>
<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${not empty sessionScope.user}">
	<c:redirect url="/users.do?mx=home"></c:redirect> 
</c:if>  
<c:url var="lnkPwdReminder" value="/remindPassword.do"/>
<j:Html>
<j:HtmlHeader>
<title>Welcome to Beyond Contact - Dynamic EMail Marketing Experience</title>
<script type="text/javascript" src="http://api.recaptcha.net/js/recaptcha_ajax.js"></script>
<style>
#recaptcha_response_field{
border:1px solid rgb(230,230,230) !important;
}
#recaptcha_table{
border:0px !important;
}
#recaptcha_image{ 
border:0px !important;
} 
</style>
</j:HtmlHeader>
<j:HtmlBody>
<j:NoScript/>
<j:Page>      
	<j:PageHeader />
            <j:MenuBar>
                	      	
             </j:MenuBar>             
             <j:ContentArea>
                	<j:SideBar> 
                         <j:Block blockHeading="Registered Users - Please Login">
                         
                         	<html:form action="userAuthentication.do" onsubmit="return validateLogin();">
                         	<html:hidden property="mx" value="login"/>
	                         <table>
	                         <tr><td>Email Address</td><td><html:text tabindex="1" styleId="uEmail" property="email" size="30"/></td></tr>
	                         <tr><td>Password</td><td><html:password styleId="uPwd" property="password" size="30"/></td></tr>
	                         <c:if test="${not empty requestScope.loginMessage}">
	                         <tr><td align="right" colspan="2">${loginMessage}</td></tr>
	                         </c:if>
	                         <tr><td align="right" colspan="2"><j:Button label="Login" link="javascript:submitLogin();" >Go</j:Button> </td></tr>
	                         <tr><td align="right" colspan="2"><a href="${lnkPwdReminder}">Please mail my password !</a></td></tr>
	                         </table>
                         	</html:form> 
                         </j:Block>  
                          <j:Block blockHeading="Why should you join us?">
                            <ul>
                            <li>
                            Design Email Templates - WYSIWYG Editor
                            </li>
                            <li>
                            Design Dynamic Forms
                            </li>
                            <li>
                            Automated Subscription Management
                            </li>
                            <li>
                            Geographical Tracking and Reporting
                            </li>
                            <li>
                            Guaranteed Security and Safety
                            </li>
                            </ul>                      
                         </j:Block>  
                    </j:SideBar> 
                    <j:Content>
						<j:Block blockHeading="Join us. Its Easy and Fast">
                         		<jsp:include page="register.jsp"></jsp:include>
                         </j:Block>
					</j:Content>
           </j:ContentArea>
    </j:Page>
<script language='javascript'>
function submitLogin(){
	if(validateLogin()){
		document.forms['login'].submit();
	}	
}
function validateLogin(){
 	 if(!isEmail($('#uEmail').val())) {
		inlineMsg('uEmail','Please enter your email.');
		return false; 
	 	}
	 if(isEmpty($('#uPwd').val())) {
			inlineMsg('uPwd','Please enter your password');
			return false; 
		  	}
	 return true;
}
 
</script> 

 
</j:HtmlBody>
</j:Html>

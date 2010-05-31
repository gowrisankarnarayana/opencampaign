<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html" %>
<%@taglib prefix="j" 	 uri="http://joompal.com/beyondcontact/ui-tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html:form styleId="regisForm" action="/userController.do" onsubmit="return validateForm();">
<html:hidden property="mx" value="register"></html:hidden>
<table>
<tr><td colspan='2'>
</td></tr>
<tr><td>
	<table>
	<tr>
	<td>First Name</td><td><html:text styleId="firstName" property="firstName" size="30" maxlength="30"></html:text></td>
	</tr>
	<tr>
	<td>Last Name</td><td><html:text styleId="lastName" property="lastName" size="30" maxlength="30"></html:text></td>
	</tr> 
	<tr>
	<td>EMail</td><td><html:text styleId="email"  property="email" size="30" maxlength="30"></html:text></td>
	</tr>
	<tr>
	<td>Company Name</td><td><html:text styleId="companyName"  property="accountVO.companyName" size="30" maxlength="30"></html:text></td>
	</tr>
	<tr>
	<td>Company Number</td><td><html:text styleId="companyNumber"  property="accountVO.companyNumber" size="30" maxlength="30"></html:text></td>
	</tr>
	<tr>
	<td colspan='2'> 
	 <div id="recaptcha_div"></div>
	</td>
	</tr>
	<c:if test="${not empty requestScope.regMessage}">
	<tr><td align="right" colspan="2">${regMessage}</td></tr>
	</c:if>
	<tr><td colspan="2" align="center">	
	<j:Button label="I agree to terms. Register now" link="javascript:submitRegistration();">I agree to terms. Register me now!</j:Button>
	</td>
	</tr>
	</table> 
</td><td> 
</td>
</tr></table>
</html:form> 
<script language='javascript'>
function submitRegistration(){
	if(validateForm()){
	document.forms['user'].submit();
	}	
}
function validateForm(objFrm){
 	 if(!isValidText($('#firstName').val())) {
		inlineMsg('firstName','Please enter a valid firstName.');
		return false; 
	  	}
	 if(!isValidText($('#lastName').val())) {
		inlineMsg('lastName','Please enter a valid lastName.');
		return false; 
	 	}
	 if(!isEmail($('#email').val())) {
		inlineMsg('email','Please enter a valid email.');
		return false; 
	 	}
	 if(!isValidText($('#companyName').val())) {
		inlineMsg('companyName','Please enter a valid company name.');
		return false; 
		}
	 if(!isNumber($('#companyNumber').val())) {
		inlineMsg('companyNumber','Please enter a valid company number.');
		return false; 
		}
	 if(isEmpty($('#recaptcha_response_field').val())){
		inlineMsg('recaptcha_response_field','We dont like spam. Please enter the text appearing in the captcha image');
		return false;
	 }
	 return true;
}
</script> 
<script>
var RecaptchaOptions = {theme : 'clean',tabindex : 2,callback: Recaptcha.focus_response_field};
Recaptcha.create("6LdAiwwAAAAAADjO2ZyJ1ZkQrHcQrfDylInUuh5D","recaptcha_div", RecaptchaOptions);
</script>
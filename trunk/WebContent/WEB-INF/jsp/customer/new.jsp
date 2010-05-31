<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html"%>
<%@taglib prefix="logic" uri="http://joompal.com/beyondcontact/struts-logic"%>
<%@taglib prefix="bean"  uri="http://joompal.com/beyondcontact/struts-bean"%>
<%@taglib prefix="c"	 uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="j" 	 uri="http://joompal.com/beyondcontact/ui-tags"%>
<%@page import="com.beyond.constants.*" %>
<j:Html>
	<j:HtmlHeader>
		<title>Beyond Contact - Create New Contact</title>
		<script type='text/javascript' src='${pageContext.request.contextPath}/dwr/interface/jCustomers.js'></script>
	</j:HtmlHeader>
	<j:HtmlBody>
		<j:NoScript />
		<j:Page>
			<j:PageHeader />
			<j:MenuBar>
				<jsp:include page="/WEB-INF/jsp/auth/MainMenu.jsp"></jsp:include>
			</j:MenuBar>
			<j:ContentArea>
				<j:SideBar>
					<jsp:include page="/WEB-INF/jsp/auth/SubMenu.jsp"></jsp:include>
				</j:SideBar>
				<j:Content>
					<j:Block blockHeading="New Subscriber">
						<html:form action="/customerController.do"  onsubmit="return validateContact();">
							<html:hidden property="mx" 	  value="save"></html:hidden>
							<html:hidden property="route" value="customers/createCustomer/newCustomer"></html:hidden>
							<div class="jTip"><strong>Note :&nbsp;</strong>You are not supposed to add subscriber directly unless you have due permission from the subscriber.<br/> By Law, you must be able to produce evidence when required.</div>
			  	 			<table cellspacing="0" cellpadding="4px" style="margin-top:4px;border: 1px solid rgb(240, 240, 240)" width="100%">
							 	<tr>
									<c:if test="${not empty actionVO.actionMessage and actionVO.showMessage eq true}">
										<td align="right" colspan="6">${ actionVO.actionMessage}
										</td>
									</c:if>
								</tr> 
							 	<tr id='tblHR'>
									<th colspan="6">Enter Subscriber Details</th>
								</tr>
								<tr class="tblRow-Nc">
									<td width="200px">Title</td>
									<td><html:text size="3" styleId="cTitle" property="title" /></td>
								</tr>
								<tr class="tblRow-Nc">
									<td>First Name<span style="color:red">*</span></td>
									<td><html:text size="30" styleId="cFirstName" property="firstName" /></td>
								</tr>
								<tr class="tblRow-Nc">
									<td>Last Name</td>
									<td><html:text size="30" property="lastName" /></td>
								</tr>
								<tr class="tblRow-Nc">
									<td>Email<span style="color:red">*</span></td> 
									<td><html:text styleId="cEmail" size="35" property="email" /></td>
								</tr>
								<tr class="tblRow-Nc">
									<td>Mobile</td>
									<td><html:text size="25" property="mobile" /></td>
								</tr>
								<tr class="tblRow-Nc">
									<td>Land Phone</td>
									<td><html:text size="25" property="landPhone" /></td>
								</tr>
								<tr class="tblRow-Nc">
									<td>Subscription Status<span style="color:red">*</span></td>
									<td>
									<html:select property="subscriptionStatus" style="width: 250px;">
									<option selected value="<%=ApplicationConstants.SUBSCRIPTION_PENDING%>">Unconfirmed</option>
									<option value="<%=ApplicationConstants.SUBSCRIPTION_CONFIRMED%>">Confirmed</option>
									</html:select>
									</td>
								</tr>
								<tr class="tblRow-Nc">
									<td>Default Group/List<span style="color:red">*</span></td>
									<td id="td_cust_groups">
									<c:choose>
									<c:when test="${not empty sessionScope.customerGroupList}">
									<html:select style="width: 250px;" property="groupId">
										<c:forEach items="${sessionScope.customerGroupList}" var="customerGroupVO">
											<c:choose>
												<c:when test="${customerGroupVO.defaultGroup eq true}">
												<option selected value="${customerGroupVO.groupId}">${customerGroupVO.groupName}</option>
												</c:when>
											 	<c:otherwise>
											 	<option value="${customerGroupVO.groupId}">${customerGroupVO.groupName}</option>
											 	</c:otherwise>
											</c:choose>
										</c:forEach>
									</html:select>
									</c:when> 
									</c:choose>  
									</td>
								</tr> 
								<tr>
									<td></td><td valign='middle'>
									<j:Button label="I have proper evidence, save subscriber" link="javascript:submitContactForm();">Save Subscriber</j:Button>
									</td>
								</tr> 
							</table>							
						</html:form>
					</j:Block>
				</j:Content>
			</j:ContentArea> 
		</j:Page>  
		<script language="javascript"> 
			function submitContactForm(){
				if(validateContact()){
					document.forms['customer'].submit();
				}
			}
			function validateContact(){ 
				 if(!isValidText($('#cFirstName').val())) {
					inlineMsg('cFirstName','Please enter valid first name.');
					return false; 
				 } 
			 	
		 	 	 if(!isEmail($('#cEmail').val())) {
					inlineMsg('cEmail','Please enter valid email.');
					return false; 
				 	}
				 return true;
			} 
		</script> 
		 
	</j:HtmlBody>
</j:Html>
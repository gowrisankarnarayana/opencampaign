<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html"%>
<%@taglib prefix="logic" uri="http://joompal.com/beyondcontact/struts-logic"%>
<%@taglib prefix="bean"  uri="http://joompal.com/beyondcontact/struts-bean"%>
<%@taglib prefix="c"	 uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="j" 	 uri="http://joompal.com/beyondcontact/ui-tags"%>
<%@page import="com.beyond.constants.*" %>
<j:Html>
	<j:HtmlHeader>
		<title>Beyond Contact - Create New User</title>
		  <script type='text/javascript' src='${pageContext.request.contextPath}/dwr/interface/jUsers.js'></script>
		  <script type='text/javascript' src='${pageContext.request.contextPath}/dwr/engine.js'></script>
  		  <script type='text/javascript' src='${pageContext.request.contextPath}/dwr/util.js'></script>
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
				<j:Block blockHeading="Account Settings">
				<html:form action="/settings.html">
					<c:url value="/images/icons/lock.png" var="urlLock"/>
					<html:hidden property="mx" 	  value="updateAccount"></html:hidden>
					<html:hidden property="route" value="accounts/accountSettings/accountHome"></html:hidden>
					<html:hidden property="id"/>
					<div id="tabs">			
							<div id="tab1"> 
								  <table style="padding: 2px;border: 1px solid rgb(240, 240, 240)"  cellspacing="0" cellpadding="4px" width="100%">
										<tr id="tblHR"> 
											<th colspan="2">Personal details</th>
										</tr>
										<tr>
											<td>Title</td>
											<td><html:text size="3" property="title" styleId="title"/></td>
										</tr>
										<tr>
											<td>First Name</td>
											<td><html:text size="35" property="firstName" styleId="firstName" /></td>
										</tr>
										<tr>
											<td>Last Name</td>
											<td><html:text size="35" property="lastName" styleId="lastName"  /></td>
										</tr>
										<tr>
											<td>Email</td>
											<td><html:text size="35"  title="This field is locked. Please talk to support to change value."  styleClass="locked"  property="email"  readonly="true" styleId="email" /><img title="This field is locked. Please talk to support to change value." src="${urlLock}"/></td>
										</tr>
										<tr>
											<td>Mobile</td>
											<td><html:text size="35" property="mobile" styleId="mobile"/></td>
										</tr> 
										<tr>
											<td>Land Phone</td>
											<td><html:text size="35" property="landPhone" styleId="landPhone"/></td>
										</tr>
										<tr id="tblHR">
											<th colspan="2">Company Details</th>
										</tr> 
										<tr>
											<td>Company Name</td>
											<td><html:text title="This field is locked. Please talk to support to change value." size="35" styleClass="locked" property="accountVO.companyName" readonly="true" styleId="companyName"/><img title="This field is locked. Please talk to support to change value." src="${urlLock}"/></td>
										</tr>
										<tr> 
											<td>Registration Number</td>
											<td valign="middle"><html:text title="This field is locked. Please talk to support to change value." size="35"  styleClass="locked" property="accountVO.companyNumber" readonly="true" styleId="companyNumber" /><img title="This field is locked. Please talk to support to change value." src="${urlLock}"/></td>
										</tr>
										<tr>
											<td>Contact Address</td>
											<td><html:textarea rows="5" cols="40" property="accountVO.companyAddress"  styleId="companyAddress" /></td>
										</tr>
										<tr>
											<td>Phone Number</td>
											<td><html:text size="35" property="accountVO.companyPhone" styleId="lastName"  /></td>
										</tr> 
								</table>
							</div>	 
					  </div> 
						<table width="100%">
						<tr>
							<c:if test="${not empty actionVO.actionMessage}">
								<td align="right" colspan="6">${ actionVO.actionMessage}
								</td>
							</c:if>
						</tr>
						<tr style="padding: 2px; height: 30px; background-color: rgb(240, 240, 240)">
							<td colspan="6" align="right">
							<j:Button
								label="Save User"
								link="javascript:jValidateSave();">Save</j:Button>
							</td>
						</tr>
						</table>
					</html:form>
				</j:Block>
			</j:Content>
		</j:ContentArea>
	</j:Page>
	
	<script language="javascript">
    var jBlok=false;	
	function jValidateSave(){
		if(jBlok==false){
			jBlok=true;
		 	document.forms['user'].submit();
		}else{
			alert('Please wait');
		}		
	}
	
	function displayMessage(data){
		remoteMessage(data.actionMessage);
		jBlok=false;
	}
	
	</script>
</j:HtmlBody>
</j:Html>
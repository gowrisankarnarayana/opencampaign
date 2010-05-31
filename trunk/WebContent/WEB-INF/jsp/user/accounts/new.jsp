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
				<j:Block blockHeading="New User">
				<html:form action="/users.html">
					<html:hidden property="mx" 	  value="save"></html:hidden>
					<html:hidden property="route" value="users/createUser/new"></html:hidden>
					<div id="tabs">			
							<div id="tab1"> 
								  <table style="padding: 2px; background-color:  rgb(250, 250, 250)"  cellspacing="0" cellpadding="4px" width="100%">
										<tr id="tblHR">
											<th colspan="2">Enter personal details</th>
										</tr>
										<tr>
											<td>Title</td>
											<td><html:text size="3" property="title" styleId="title"/></td>
										</tr>
										<tr>
											<td>First Name</td>
											<td><html:text size="30" property="firstName" styleId="firstName" /></td>
										</tr>
										<tr>
											<td>Last Name</td>
											<td><html:text size="30" property="lastName" styleId="lastName"  /></td>
										</tr>
										<tr>
											<td>Email</td>
											<td><html:text size="35" property="email"  styleId="email" /></td>
										</tr>
										<tr>
											<td>Mobile</td>
											<td><html:text size="25" property="mobile" styleId="mobile"/></td>
										</tr>
										<tr>
											<td>Land Phone</td>
											<td><html:text size="25" property="landPhone" styleId="landPhone"/></td>
										</tr>
								</table>
							</div>	
							<div id="tab2">
							<table  style="padding: 2px; background-color: rgb(250, 250, 250)" cellspacing="0" cellpadding="4px"  width="100%">
							<tr id="tblHR">
								<th colspan="3">Privileges</th>
							</tr>
							<c:forEach items="${sessionScope.user.listGroupVO}" var="userGroupVO" >
				         	    <tr id="tblRow">
				         	    <td width="20">
				         	    	<input title="Click to select/unselect this group" type="radio" name="groupIds" value="${userGroupVO.groupId}" />
				         	    </td>
				         	    <td id="tdGrp">
				         	    	 ${userGroupVO.groupName}
				         	    </td>
				         	    <td >
					         	    <table cellspacing="0" cellpadding="2px" width="100%">
					         	    	<c:forEach items="${userGroupVO.roleVOList}" var="userRoleVO"> 
						         	    	<tr>
							         	    <td>
							         	     ${userRoleVO.roleName}
							         	    </td>
							         	   	<!-- 
							         	   	<td>
							         	    	<table cellspacing="0" cellpadding="2px" width="100%">
								         	    	<c:forEach items="${userRoleVO.taskVOList}" var="userTaskVO"> 
								         	    		<tr id="tblRow">
									         	    	<td id="tdGrp">
									         	    	<a href="javascript:viewContacts('${userTaskVO.taskId}','group','divCsr');">${userTaskVO.taskDesc}</a>
									         	   		</td>
									         	   		</tr>
								         	   		</c:forEach>
							         	   		</table>
							         	    </td>
							         	     -->
							         	    </tr>
					         	    	</c:forEach>
					         	    </table>
				         	    </td>
				         	    </tr>												
					   		</c:forEach>
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
		 	var newUser=new Object();
			newUser.title=dwr.util.getValue("title");
			newUser.firstName=dwr.util.getValue("firstName");
			newUser.lastName=dwr.util.getValue("lastName");
			newUser.email=dwr.util.getValue("email");
			newUser.mobile=dwr.util.getValue("mobile");
			newUser.landPhone=dwr.util.getValue("landPhone");
			newUser.userGroupId=dwr.util.getValue("groupIds");
			jUsers.createUser(newUser,
								{callback:displayMessage,errorHandler:remoteErrorHandler}
			 				  );
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
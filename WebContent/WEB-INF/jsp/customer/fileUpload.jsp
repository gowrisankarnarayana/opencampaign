<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html" %>
<%@taglib prefix="logic" uri="http://joompal.com/beyondcontact/struts-logic" %>
<%@taglib prefix="bean"  uri="http://joompal.com/beyondcontact/struts-bean" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<%@page import="com.beyond.constants.*" %>
<j:Html>
<j:HtmlHeader> 
<title>Beyond Contact - Free Email Marketing - Bulk Upload </title>
<style>
 .jqBtn:hover{
	color:white;
 }
</style>
</j:HtmlHeader>
<j:HtmlBody>
<j:NoScript/>
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
						 <j:Block blockHeading="Bulk Upload Contacts">
						 <html:form action="/customerFileUpload.html" enctype="multipart/form-data">
						 <html:hidden property="route" value="customers/uploadCustomers/bulkUpload"></html:hidden>
						 <table width="100%"><tr><td width="100%" align="right" >
						 	<table align="right" width="100%" cellpadding="5px" cellspacing="0px" >
							<tr>   
								<td valign="middle" align="left"  style="width:242px;height:35px;">
								<c:url var="fUrl" value="/docs/Contacts_Upload_Template.xls"/>  
									<div class="ui-widget" style="width:240px"> 
									<div class="ui-state-highlight ui-corner-all" style="padding: 0 .7em;"> 
										<table><tr><td class='jExcel' ><a style="color:black;" href="${fUrl}"><strong>Download excel template</strong></a></td></tr></table> 
									</div> 
									</div>   
								</td> 
								<td valign="middle" align="right"  style="width:200px;">
					               <c:url value="/images/icons/32x32/database_save.png" var="urlEmailAdd"/>
								   <div class="jqBtn"><table cellspacing="2" cellpadding="0"><tr><td>
									 <img style="float:left" src="${urlEmailAdd}"/></td><td>Upload &amp; Save</td></tr></table>
									</div>
                                 </td>
							</tr>  
							</table>
						</td></tr><tr><td>
							<table style="background-color:white;border:1px solid rgb(240,240,240)" cellpadding="2px" cellspacing="2px" width="100%">
					 		<tr id="tblHR"><td  align="left" colspan="2" >&nbsp;Upload contacts from Excel</td>
							</tr> 
							<c:if test="${not empty requestScope.actionVO.actionMessage and requestScope.actionVO.showMessage eq true}">
						    <tr class="tblRow-Nc">
				    			<td align="left" colspan="2">  
									 ${actionVO.actionMessage}  
					 	   		</td>
							</tr>
							</c:if>
							<tr class="tblRow-Nc">   
								<td  width="250">Please select excel file</td>
							 	<td><html:file property="theFile" /> </td>
							</tr> 
							<tr class="tblRow-Nc">
								<td>Default subscription status</td>
								<td>
									<html:select style="width: 220px;" property="subscriptionStatus">
										<option selected value="<%=ApplicationConstants.SUBSCRIPTION_PENDING%>">Subscription Unconfirmed</option>
										<option value="<%=ApplicationConstants.SUBSCRIPTION_CONFIRMED%>">Subscription Confirmed</option>
									</html:select>
								</td>
							</tr> 
							<tr class="tblRow-Nc">  
							<td  valign="top"> Default list/group for the contacts </td>
							<td>
								<c:choose>
								<c:when test="${not empty sessionScope.customerGroupList}">
								<html:select style="width: 220px;" property="groupId">
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
							<tr class="tblRow-Nc">
							 <td>Replace/Overwrite existing contact</td>
							 <td>
								<html:checkbox property="override"></html:checkbox>	
							</td>
							</tr>  
							</table>
							
							</td></tr>
							</table>
							</html:form>
						 </j:Block>						

                    </j:Content>
           </j:ContentArea>
    </j:Page>
    <script>
    $(function(){
	    $(".jqBtn").button();   
	    $(".jqBtn").click(jValidateSave);  
    });  
    function jValidateSave(){
    	document.forms['customerFile'].submit();
    }
    </script>
</j:HtmlBody>

</j:Html>							
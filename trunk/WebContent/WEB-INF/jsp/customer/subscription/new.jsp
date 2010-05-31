<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html" %>
<%@taglib prefix="logic" uri="http://joompal.com/beyondcontact/struts-logic" %>
<%@taglib prefix="bean"  uri="http://joompal.com/beyondcontact/struts-bean" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page import="com.beyond.constants.*" %>
<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<j:Html>
<j:HtmlHeader>
<title>Beyond Contact - Free Email Marketing Templates Home </title>
<style>
.btn{ 
width:150px;
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
                    <j:Block blockHeading="New Subscription Form"> 
                     <c:url value="/images/icons/32x32/html_go.png" var="urlEmailAdd"/>
					 <c:url value="/images/icons/cross.png" var="urlCross"/>
					 <c:url value="/images/icons/light.png" var="urlLight"/>
					 
                   	<table width="100%"> 
                      	 <tr>
                      	 <td valign="middle" width="70%" align="left">
	                      	 <div class="jTip">
	                      	 When you add a subscriber to your list or a subscriber joins your mailing list, by default, you collect their email address. You can also collect other information such as their name, phone number etc.,
	                      	 </div>
                      	 </td>
                      	 <td valign="middle" align="right" > 
							 <div class="jqBtn">
							 <table cellspacing="2" cellpadding="0">
							 <tr><td>
							 <img style="float:left" src="${urlEmailAdd}"/></td><td>Get Form Code
							 </td></tr>
							 </table>
							 </div> 
						 </td></tr> 
                    <tr><td colspan="2">
	                    <table width="100%" cellpadding="2">
	                    <tr><td width="150px;"  valign="top">
		                    <div id="customFields"> 
							<input class="btn" type="button"  onclick="addRow(1)"  value="First Name"/><br/>
							<input class="btn" type="button"  onclick="addRow(2)"  value="Last Name"/><br/> 
							<input class="btn" type="button"  onclick="addRow(3)"  value="Mobile Number"/><br/>
							<input class="btn" type="button"  onclick="addRow(4)"  value="Land Phone"/><br/>
							<input class="btn" type="button"  onclick="addRow(5)"  value="Contact Details"/>
							</div>
	                    </td><td valign="top">	  
								  <div id="divSForm" style="padding-left:10px;"> 
								  <table width="100%" cellspacing="0" cellpadding="4" id="tblSForm" style="border:2px solid rgb(245,245,245)"> 
								  <tbody> 
								  <tr id="tblHR">
								  <td colspan="2">Enter Form Heading <input size="50" type="text" id="subFrmName" value=""/> </td>
								  <td>
								  <c:choose>
									<c:when test="${not empty sessionScope.customerGroupList}">
									<select style="width: 250px;" id="groupId">
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
									</select>
									</c:when> 
									</c:choose> 
								  </td>
								  </tr>
								  <tr id='tblRow'><td width='100px'>Email Id <span class="m">*</span></td><td><input type="text" name="email" size="40" maxlength="50"></input></td><td></td></tr>
								  </tbody>
								  <tfoot>
								  <tr><td colspan="2" align="right"><input type='button' value="Sign Up"/></td><td></td></tr>
								  </tfoot>
								  </table> 
								  </div> 
						</td></tr>
						</table>  
                    </td></tr></table>  
                    <div id="divHtmlViewer"><textarea id='txtHtmlCode' readonly style='width:98%;height:98%'></textarea></div>
					<script> 
						var FORM_FIELDS=new Array();
						
						$(function(){ 
							//$("#customFields").dialog({modal: false,width:200,height:500,autoOpen: false,title: 'Custom Fields'});
							
							$(".btn").button(); 
							$(".jqBtn").button(); 
							$(".jqBtn").click(getHtmlCode);
							$("#divHtmlViewer").dialog({ 
								width:600, 
								height:350,
							 	modal: true,
								autoOpen: false,
								title: 'HTML Code'
							});   
							$(".delete").live('click', function(event) { 
									var removeItem=$(this).parent().attr('id'); 
								 	FORM_FIELDS = jQuery.grep(FORM_FIELDS, function(value) {
									    return value != removeItem;
									});
									$(this).parent().parent().remove();
								});
							 
						}); 
						 
						function addRow(intId){
							var sd="";
							switch(intId){
								case 1: sd="<tr id='tblRow'><td>First Name</td><td><input type='text' name='firstName' size='40' maxlength='50'></input></td><td id='F1'><img class='delete' src='${urlCross}'></img></td></tr>";break;
								case 2: sd="<tr id='tblRow'><td>Last Name</td><td><input type='text'  name='lastName'  size='40' maxlength='50'></input></td><td id='F2'><img  class='delete' src='${urlCross}'></img></td></tr>";break;
								case 3: sd="<tr id='tblRow'><td>Mobile Number</td><td><input type='text'  name='mobileNumber'  size='40' maxlength='50'></input></td><td id='F3'><img  class='delete' src='${urlCross}'></img></td></tr>";break;								
								case 4: sd="<tr id='tblRow'><td>Land Phone</td><td><input type='text'  name='landPhone'  size='40' maxlength='50'></input></td><td id='F4'><img  class='delete' src='${urlCross}'></img></td></tr>";break;
								case 5: sd="<tr id='tblRow'><td>Contact Details</td><td><textarea name='contactDetails' cols='30' rows='4'></textarea></td><td id='F5'><img  class='delete' src='${urlCross}'></img></td></tr>";break;
							}
							var fId='F'+intId;
							if(FORM_FIELDS.indexOf(fId)>=0){
								jMessage("Form field already added");
							}else{
								FORM_FIELDS.push(fId);
								$('#tblSForm > tbody:last').append(sd);
							}
						}
						function getHtmlCode(){
							 
							var strHead="<form method='post' action='http://www.opencampaign.co.uk/app/subscriptions.do'>";
							strHead=strHead+"<input type='hidden' name='mx'   value='subscribe'></input>";
							strHead=strHead+"<input type='hidden' name='ux'   value='${user.encryptedId}'></input>";
							strHead=strHead+"<input type='hidden' name='lx'   value="+$('#groupId').val()+"></input>";
							strHead=strHead+"<input type='hidden' name='apix' value='${user.encryptedAPICode}'></input>";
							strHead=strHead+"	<table style='border:1px solid rgb(240,240,240);' cellspacing='0' cellpadding='4'>";
							strHead=strHead+"	<thead>";
							strHead=strHead+"		<tr style='background-color:rgb(240,240,240);'>";
							strHead=strHead+"		<th colspan='2' style='font-weight:bold;text-align:left'>"+$('#subFrmName').val()+"</th>";
							strHead=strHead+"		</tr>";
							strHead=strHead+"	</thead>";
							strHead=strHead+"	<tbody>";
							strHead=strHead+"		<tr>";
							strHead=strHead+"		<td>Email <span style='font-weight:bold;color:red;'>*</span></td>";
							strHead=strHead+"		<td><input type='text' name='email' size='30'></input>";
							strHead=strHead+"		</tr>";

							var strFoot="	</tbody>";
							strFoot=strFoot+"	<tfoot>";
							strFoot=strFoot+"		<tr>";
							strFoot=strFoot+"		<td colspan='2' style='font-weight:bold;text-align:right'>";
							strFoot=strFoot+"		<input type='submit' value='subscribe'/>";
							strFoot=strFoot+"		</td>";
							strFoot=strFoot+"		</tr>";
							strFoot=strFoot+"	</tfoot> ";
							strFoot=strFoot+"	<table>";
							strFoot=strFoot+"</form>";
							
							for(var i=0;i<FORM_FIELDS.length;i++){
								 switch(FORM_FIELDS[i]){
									 case 'F1':strHead+="<tr><td>First Name</td><td><input type='text' name='firstName' size='30'></input></tr>";break;
									 case 'F2':strHead+="<tr><td>Last Name</td><td><input type='text' name='lastName' size='30'></input></tr>";break;
									 case 'F3':strHead+="<tr><td>Mobile</td><td><input type='text' name='mobile' size='30'></input></tr>";break;
									 case 'F4':strHead+="<tr><td>Land Phone</td><td><input type='text' name='landPhone' size='30'></input></tr>";break;
									 case 'F5':strHead+="<tr><td>Contact Details</td><td><textarea name='contactDetails' cols='30' rows='4'></textarea></td></tr>";
								 }
							} 
							
							$('#txtHtmlCode').val(strHead+strFoot);
							$("#divHtmlViewer").dialog("open");
						}
					</script>
					
                    </j:Block>
                    </j:Content>
           </j:ContentArea>
    </j:Page>
</j:HtmlBody>
</j:Html>
<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html"%>
<%@taglib prefix="logic" uri="http://joompal.com/beyondcontact/struts-logic"%>
<%@taglib prefix="bean"  uri="http://joompal.com/beyondcontact/struts-bean"%>
<%@taglib prefix="c"	 uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="j" 	 uri="http://joompal.com/beyondcontact/ui-tags"%>
<j:Html>
<j:HtmlHeader> 
<title>Beyond Contact - Free Email Marketing - User Home </title>
<script type='text/javascript' src='${pageContext.request.contextPath}/dwr/interface/jLists.js'></script>
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
					<j:Block blockHeading="New Mailing List">
						<html:form action="/lists.do"  onsubmit="return validateList();">
							<html:hidden property="mx" 	  value="save"></html:hidden>
							<html:hidden property="route" value="lists/createList/new"></html:hidden> 
							<table><tr><td>
							<table cellspacing="1" cellpadding="4px" style="margin-top:4px;border: 1px solid rgb(240, 240, 240)">
						  	 	<tr id='tblHR'>
									<th colspan="6">Mailing List Information</th>
								</tr>
								<tr class="tblRow-Nc">
									<td width="250px">List Name<span style="color:red">*</span></td>
									<td><html:text size="35" styleId="groupName" property="groupName" /></td>
								</tr>
								<tr class="tblRow-Nc">
									<td>List Description</td>
									<td><html:text size="35" styleId="groupDesc" property="groupDesc" /></td>
								</tr>
								<tr class="tblRow-Nc">
									<td>List Owner Name</td>
									<td><html:text size="35" styleId="ownersName" property="ownersName" /></td>
								</tr>
								<tr class="tblRow-Nc">
									<td>List Owners Email</td> 
									<td><html:text styleId="ownersEmail" size="35" property="ownersEmail" /></td>
								</tr>
								<tr class="tblRow-Nc">
									<td>List Reply To Email</td> 
									<td><html:text styleId="replyToEmail" size="35" property="replyToEmail" /></td>
								</tr> 
								<tr class="tblRow-Nc">
									<td>Notify List Owner</td>
									<td>
									<html:checkbox property="notifyOwner" styleId="notifyOwner"></html:checkbox>
									</td>
								</tr>		
								<tr> 
									<td></td>
									<td align="left"><j:Button label="Save Mailing List" link="javascript:submitListForm();">Save List</j:Button>
									</td>
								</tr>						  
								</table>	 	
							</td><td valign="middle"> 
								<div class="jTip">
								<ol>
								<li>By default, The List owner will be notified when a user subscribers to this list or un-subscribers from the list.</li>
								<li>When automated mails are sent to subscribers of this list, the default reply-to email will be the one you tell us here.</li>
								</ol>								
								<strong>Note:&nbsp;</strong>If owner information is not supplied then, mail will be sent from noreply@opencampaign.com
								</div>
							</td></tr>
							</table>				
						</html:form>
					</j:Block>
				</j:Content>
           	 </j:ContentArea>
    </j:Page>
    <script language="javascript"> 
    
		$(function() { 
		 	$("#btnSave").button().click(function(){submitListForm();}); 
		}); 
		
		function submitListForm(){
			if(validateList()){
				var vo=new Object();
				vo.groupName=$('#groupName').val();
				vo.groupDesc=$('#groupDesc').val();
				vo.ownersName=$('#ownersName').val();
				vo.ownersEmail=$('#ownersEmail').val();
				vo.replyToEmail=$('#replyToEmail').val();  
				vo.notifyOwner=$('#notifyOwner').attr('checked');
				
				jLists.createList(vo,
						{callback:viewResponse,errorHandler:remoteErrorHandler}
					);  
			}
		}
		function validateList(){ 
			 if(!isValidText($('#groupName').val())) {
				inlineMsg('groupName','Please enter valid list name.');
				return false; 
			 }  
			 if($('#notifyOwner').attr('checked')){
				 	if(!isValidText($('#ownersName').val())) {
						inlineMsg('ownersName','Please enter list owners name.');
						return false; 
					 }
				 	if(!isEmail($('#ownersEmail').val())) {
						inlineMsg('ownersEmail','Please enter valid owners email.');
						return false; 
					 }
				 	if(!isEmail($('#replyToEmail').val())) {
						inlineMsg('replyToEmail','Please enter valid reply to email.');
						return false; 
					 }
				}  
			 return true;
		}
		 
		function viewResponse(data){
			jMessage(data);
		}
		</script> 
</j:HtmlBody>
</j:Html>

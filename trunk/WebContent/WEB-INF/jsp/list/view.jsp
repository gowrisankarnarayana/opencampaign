<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html"%>
<%@taglib prefix="logic" uri="http://joompal.com/beyondcontact/struts-logic"%>
<%@taglib prefix="bean"  uri="http://joompal.com/beyondcontact/struts-bean"%>
<%@taglib prefix="c"	 uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="j" 	 uri="http://joompal.com/beyondcontact/ui-tags"%>
<%@page import="com.beyond.constants.*" %>
<j:Html>
	<j:HtmlHeader>
		<title>Beyond Contact - Create New Contact</title>
		<script type='text/javascript' src='${pageContext.request.contextPath}/dwr/interface/jLists.js'></script>
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
					<j:Block blockHeading="List Management"> 
					 	<table cellspacing="0" cellpadding="4px" style="font-family:Tahoma;font-size:8pt;border: 1px solid rgb(240, 240, 240)" width="100%">
							<tr id='tblHR'>
								<th></th><th>List Name</th><th>Created On</th><th align='center'>Subscribers</th><th align='center'>Default</th><th></th><th></th>
							</tr> 
						 	<c:choose>
								<c:when test="${not empty sessionScope.customerGroupList}">
								<c:url value="/images/icons/16x16/tick.png"  var="defUrl"/>     
								<c:url value="/images/icons/16x16/cross.png" var="dumbUrl"/>
									<c:forEach items="${sessionScope.customerGroupList}" var="customerGroupVO" varStatus="status">
									
										<input type="hidden"  id="idGDesc_${customerGroupVO.groupId}"   value="${customerGroupVO.groupDesc}" />
										<input type="hidden"  id="idGOwner_${customerGroupVO.groupId}"  value="${customerGroupVO.ownersName}" />
										<input type="hidden"  id="idGEmail_${customerGroupVO.groupId}"  value="${customerGroupVO.ownersEmail}" />
										<input type="hidden"  id="idGREmail_${customerGroupVO.groupId}" value="${customerGroupVO.replyToEmail}" />
										<input type="hidden"  id="idGNotify_${customerGroupVO.groupId}" value="${customerGroupVO.notifyOwner}" />
										
										<tr class="tblRow" id="tblRow_${customerGroupVO.groupId}">  
											<td align='center' width='20' style="background-color:rgb(248, 248, 248)">${status.count}</td>
											<td width='200'><span id="idGName_${customerGroupVO.groupId}">${customerGroupVO.groupName}</span></td> 
											<td width='150'>
										 		<fmt:parseDate  type="date" var="parsedDate" pattern="yyyy-MM-dd" value="${customerGroupVO.createdOn}"/>
										 		<fmt:formatDate type="date" value="${parsedDate}" />
										 	</td>
											<td width='30' align='center'>${customerGroupVO.customerCount}</td>
											<td width='20' align='center' style="background-color:rgb(250, 250, 250)">
											<c:choose>
											<c:when test="${customerGroupVO.defaultGroup eq true}">
												<input onclick="setDefaultGroup(${customerGroupVO.groupId})" title="Subscribed users will fall into this list by default." type="radio" name="rdDefault" id="rdDef_${customerGroupVO.groupId}" value="${customerGroupVO.defaultGroup}" checked >
											</c:when>
											<c:otherwise> 
												<input type="radio" onclick="setDefaultGroup(${customerGroupVO.groupId})" name="rdDefault" id="rdDef_${customerGroupVO.groupId}" value="${customerGroupVO.defaultGroup}">
											</c:otherwise>
											</c:choose>
										 	</td>  
											<td width='20'  title="View or edit this list" align='center'><div onclick="editList(${customerGroupVO.groupId})" class="jEdit"></div></td>
											<td width='20'  align='center' onclick="javascript:deleteList(${customerGroupVO.groupId},'${customerGroupVO.groupName}',${customerGroupVO.customerCount})" title="Delete list (${customerGroupVO.groupName}). This action will delete this List as well as all subscribers of this list"><div class="jDelete"></div></td>
										</tr>
									</c:forEach>
								</c:when> 
							 </c:choose>  
							 
							<c:if test="${not empty actionVO.actionMessage and actionVO.showMessage eq true}">
							<tr>
								<td align="right" colspan="6">${ actionVO.actionMessage}
								</td>
							</tr> 
							</c:if>
							
				 	</table>
					</j:Block>
				</j:Content>
			</j:ContentArea> 
		</j:Page>  
		<div id="divGroupDetails">
			<input type="hidden" id="groupId"/>
			<table> 
			<tr>
				<td width="175px">List Name <span style="color:red">*</span></td>
				<td ><input type="text" size="35" id="groupName" name="groupName" /></td>
			</tr>
			<tr>
				<td>List Description</td>
				<td><input type="text" size="35" id="groupDesc" name="groupDesc" /></td>
			</tr>
			<tr>
				<td>List Owner Name</td>
				<td><input type="text" size="30" id="ownersName" name="ownersName" /></td>
			</tr>
			<tr>
				<td>List Owners Email</td> 
				<td><input type="text" id="ownersEmail" size="35" name="ownersEmail" /></td>
			</tr>
			<tr>
				<td>List Reply To Email</td> 
				<td><input type="text" id="replyToEmail" size="35" name="replyToEmail" /></td>
			</tr> 
			<tr>
				<td>Notify List Owner</td>
				<td>
				<input type="checkbox" name="notifyOwner" id="notifyOwner" onclick="showTip('idChkOwner',this)"></input>
				</td>
			</tr>
			<tr>
			<td colspan='2'>
				<div class="jTip" id="idChkOwner" style="display:none">List owners details are required only when you choose to notify owner</div> 
			</td>
			</tr>	
			<tr><td colspan='2' align="right">
				<input type="button" value="Update" id="btnUpdate"/> 
			</td></tr>	 			  
			</table>	
		</div>		
		<script language="javascript">  
		$(function(){
			$('#divGroupDetails').dialog({ 
				width: 425,
				height:275,
				modal: true,
				autoOpen: false,
				title: 'Edit Mailing List'
			}); 
			$('#btnUpdate').button().click(jValidateSave);
		});
		
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
		
		function jValidateSave(){
			 if(validateList()){
			 var vo=new Object();
			 	vo.groupId=$('#groupId').val();
			 	vo.groupName=$('#groupName').val();
			 	vo.groupDesc=$('#groupDesc').val();
			 	vo.ownersName=$('#ownersName').val();
			 	vo.ownersEmail=$('#ownersEmail').val();
			 	vo.replyToEmail=$('#replyToEmail').val();
				vo.notifyOwner=$('#notifyOwner').attr('checked');
				
				jLists.updateList(vo,
						{callback:jMessage,errorHandler:remoteErrorHandler}
					);

				var intId=vo.groupId;

		 		$('#idGName_'+intId).html(vo.groupName);
				$('#idGDesc_'+intId).val(vo.groupDesc);
				$('#idGOwner_'+intId).val(vo.ownersName);
				$('#idGEmail_'+intId).val(vo.ownersEmail);
				$('#idGREmail_'+intId).val(vo.replyToEmail);  
				$('#idGNotify_'+intId).val(vo.notifyOwner);  
				
				$('#divGroupDetails').dialog('close');
			 }
		}
		
		var tmpId; 
		var tmpCnt;
		function deleteList(intId,strName,intCnt){ 
			
			tmpId=intId;
			tmpCnt=intCnt;
			
			var rd="#rdDef_"+intId;
			 
			if($(rd).attr('checked')==false){
				jConfirmCB("Are you sure you want to delete list <strong>" + strName +"</strong>",deleteConfirm);
			}else{
				jMessage("You can not delete a default list. Please set another list as default");
			}	
			
		}
		function deleteConfirm(){
			//alert('Deleting' + tmpId + " Count " + tmpCnt);	
			jLists.deleteGroup(tmpId,
					{callback:jMessage,errorHandler:remoteErrorHandler}
				); 
			var rowId='#tblRow_'+tmpId;
			$(rowId).remove();			
		}
		function setDefaultGroup(intId){
			jLists.setDefaultGroup(intId,
					{callback:jMessage,errorHandler:remoteErrorHandler}
				); 
		}  
		function editList(intId){ 
			$('#groupId').val(intId); 
			$('#groupName').val($('#idGName_'+intId).html());
			$('#groupDesc').val($('#idGDesc_'+intId).val());
			$('#ownersName').val($('#idGOwner_'+intId).val());
			$('#ownersEmail').val($('#idGEmail_'+intId).val());
			$('#replyToEmail').val($('#idGREmail_'+intId).val());  
			
			var bool=$('#idGNotify_'+intId).val();
			if(bool=='true'){
				$('#notifyOwner').attr('checked', 'checked');
				$('#idChkOwner').show();	
			}else{
				$('#notifyOwner').removeAttr("checked"); 
			}
			
			$('#divGroupDetails').dialog('open'); 
		}
		function showTip(objId,objChk){
			if(objChk.checked==true){
				$('#'+objId).show();	
			}else{
				$('#'+objId).hide();
			}
			
		}
		</script> 
		 
	</j:HtmlBody>
</j:Html>
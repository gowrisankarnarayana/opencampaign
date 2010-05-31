<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<%@page import="com.beyond.constants.*" %>
<table style="background-color:white;border:1px solid rgb(240,240,240)" cellpadding="0px" cellspacing="0px" width="100%">
<tr> 
	<td valign="top" width="175px">						
		<table cellpadding="2px"  cellspacing="0px"  width="100%">
		<tr id="tblHR">
			<th valign="middle">Groups</th>
	 	</tr>
	 	<tr id="tr1">
	 		<td colspan="2"></td>
	 	</tr>
	 	<tr>
			<td>
				<div id="tblGrp">
		        	<c:forEach items="${sessionScope.customerGroupList}" var="customerGroupVO" >
	          	    <c:if test="${customerGroupVO.customerCount gt 0}">
		          	    <div id="tblRow">
		          	    	<label id="l" title="Click to select/unselect this group"  for="idGrpChk${customerGroupVO.groupId}">
			          	    	<span>
			          	    	<html:checkbox styleId="idGrpChk${customerGroupVO.groupId}" onclick="addRemoveGroup(this,'${customerGroupVO.groupName}','${customerGroupVO.customerCount}');"  property="groupIds" value="GroupID_${customerGroupVO.groupId}"/>
			          	    	${customerGroupVO.groupName}
			          	    	</span>
							</label>	           	    		
		          	    	<span id="l">
		          	    		<a style="text-decoration:underline" title="Click to view all contacts in this group" href="javascript:viewContacts('${customerGroupVO.groupId}','group','divCsr');">
		          	    		${customerGroupVO.customerCount}
		          	    		</a>
		          	    	</span>	          	    	
		          	   	</div>
					</c:if>	          	    												
			   		</c:forEach>
		   		</div>
			</td>
		</tr>
		</table>
	</td>
	<td valign="top">
				<table cellpadding="2px"  cellspacing="0px"  width="100%">
				<tr id="tblHR">
					<th valign="middle">Contacts</th>
					<th valign="middle">
						<table cellspacing="0px"  cellspacing="0px">
						<tr><td valign="middle"> 
						<input onkeydown="if (event.keyCode == 13){viewContacts(this.value,'contact','divCsr'); return false;}" id="idSearchContact" type="text" name="searchTerm" size="40"></input>
						</td><td>
						<j:Button label="Search" link="javascript:viewContacts(document.getElementById('idSearchContact').value,'contact','divCsr')">Search</j:Button>					
						</td></tr>
						</table>
					</th>
				</tr>
				<tr id="tr1"><td colspan="2">
				<span style="position:relative;left:5px;">
					<span id="spn_sel">
						<b>Select :</b> 
						<a href="javascript:jSel('divCsr',true,addRemoveContact)">[ All ]</a>&nbsp;
						<a href="javascript:jSel('divCsr',false,addRemoveContact)">[ None ]</a>&nbsp;
					</span>
					<span>
						<c:url var="xlsDoc" value="/customerController.do?mx=downloadExcel"></c:url>
						<a title="Download all contacts as EXCEL file"  href="${xlsDoc}">
						<img alt="Download as EXCEL"  style="margin-right:5px;float:right" src="<c:url value='/images/Excel-16.gif'/>"/>
						</a>
					
						<c:url var="pdfDoc" value="/customerController.do?mx=downloadPDF"></c:url>
						<a title="Download all contacts as PDF file" href="${pdfDoc}">
						<img alt="Download as PDF" style="margin-right:5px;float:right" src="<c:url value='/images/Reader-16.gif'/>"/>
						</a>
					</span>
				</span>
				</td></tr>
				<tr>  
					<td style="height:25px;" colspan="2">
					<div id="divCsr">
						<p>Please enter a value. </p>
						<p>You can enter either firstname, lastname or email address</p>
						<p><strong>Tip:</strong> Press enter key to start search</p>
				 	</div>
				 	
					</td>
				</tr>
				</table> 
	</td>
	<c:if test="${requestScope.dispType eq '3'}">
	<td valign="top" width="45%">
			<table cellpadding="2px"  cellspacing="0px"  width="100%">
				<tr id="tblHR">
				<th>Select a contact or group</th>
				</tr>
				<tr id="tr1"><td colspan="2" align="right">
				<span style="position:relative;right:5px;">
					<span id="spn_actions">
					
					</span>
				</span>
				</td>
				</tr>
				<tr ><td id="divCTInfo">
				
				</td></tr>
			</table>
	</td>
	</c:if>
</tr>
</table>
 
<script language="javascript">
var GLOBAL=new Array();
GLOBAL['selContacts']=new Array();
var prevTerm="";

	function pushPopArr(objChk){
		var strTmpVal=objChk.value;
		if(objChk.checked==true){
			var arrStr=GLOBAL['selContacts'].toString();	
			if(arrStr.indexOf(strTmpVal)==-1){
				GLOBAL['selContacts'].push(strTmpVal);
			}
		}else if(objChk.checked==false){
			var intIndex = GLOBAL['selContacts'].indexOf(strTmpVal);
			if(intIndex != -1){
			 	GLOBAL['selContacts'].splice(intIndex, 1);
			}	
		}	
	}
	 
	
	function addRemoveGroup(objChk,strGName,intCnt){
		if(intCnt>0){ 
			pushPopArr(objChk);
			document.getElementById('TXT_SEL_CUSTOMERS').value=GLOBAL['selContacts'];
		}
	}
	
	function addRemoveContact(objChk){
		pushPopArr(objChk);
		document.getElementById('TXT_SEL_CUSTOMERS').value=GLOBAL['selContacts'];
	} 	

	function viewContacts(strSearchTerm,strSearchKey,strDisplayIn) {
	 	var strTmpSearchTerm=strSearchTerm.trim();
	 	if(isValidSearchTerm(strTmpSearchTerm)==true){
			if(strTmpSearchTerm!="" && prevTerm!=strTmpSearchTerm){
				prevTerm=strTmpSearchTerm;
		 		document.getElementById(strDisplayIn).innerHTML="<span id='idWait'>Please wait...</span>";
				jCustomers.getCustomers(strTmpSearchTerm,strSearchKey,
					{callback:processList,errorHandler:remoteErrorHandler}
				);
			}
			
		}else{
			document.getElementById(strDisplayIn).innerHTML="<span id='idAlert'>Please enter valid values</span>";
			prevTerm=strTmpSearchTerm;
		} 	 
	} 
	
 	function processList(data) {
		
		if (data.length>0) 
		{
			var tblContacts="<div cellspacing='0' id='tbl100PCT'>";
			for (var i = 0; i<data.length; i++) 
			{ 
				var tmpCid="chkContact_" + data[i].customerId;
				tblContacts=tblContacts + "<div id='tblRow-Nc'>";
				tblContacts=tblContacts + "<label title='Click to select/unselect this contact' style='cursor:pointer' for='" + tmpCid + "'><span>";
				tblContacts=tblContacts + "<input class='chkContact' id='" + tmpCid + "' type='checkbox' name='" + tmpCid + "'";
				tblContacts=tblContacts + " value='" + data[i].email + "' />";
				tblContacts=tblContacts + "</span>";
				tblContacts=tblContacts + "<span>";
				tblContacts=tblContacts + data[i].firstName + " " + data[i].lastName;
				tblContacts=tblContacts + "</span><span><b>";
				tblContacts=tblContacts + data[i].email;
				tblContacts=tblContacts + "</b></span></label></div>";
			} 

			tblContacts=tblContacts+"</div>";
			document.getElementById('divCsr').innerHTML = tblContacts;
			jAssignEvent();
			$("#spn_sel").show();			
		}else{
			document.getElementById('divCsr').innerHTML = "<span id='idAlert'>No results found</span>";
			$("#spn_sel").hide('slow');
		}   
		
	}   
</script>
<script>
	function jSel(objDivId,boolS,jFun){
		$("#"+objDivId).find(':checkbox').attr('checked',boolS );
		$("#"+objDivId).find(':checkbox').each(function () {
			eval(jFun)($(this).context);        
	      }); 
	}
	function jAssignEvent(){
			$(".chkContact").each(
				 function(){
				 $(this).bind("click",
						 	function(event){
					 		addRemoveContact($(this).context);
							}	
				);
			});
	}
</script>
<script>
	if(typeof String.prototype.trim !== 'function') {
	  String.prototype.trim = function() {
	    return this.replace(/^\s+|\s+$/, ''); 
	  };
	}
	$("#spn_sel").hide();
</script>
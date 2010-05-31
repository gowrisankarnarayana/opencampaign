<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<%@page import="com.beyond.constants.*" %>
<table style="background-color:white;border:1px solid rgb(240,240,240)" cellpadding="0px" cellspacing="0px" width="100%">
<tr> 
	<td valign="top" width="175px">						
		<table cellspacing="0px" cellpadding="2px"  width="100%"> 
		<tr id="tblHR">
		<th colspan="2">Groups</th></tr>
		<tr id="tr1">
		<td colspan="2"> 
		</td>
		</tr>
		<tr>
			<td valign="top">
				<div>
					<table id="tblGrp" cellspacing="0"	  width="175">	
		        	<c:forEach items="${sessionScope.customerGroupList}" var="customerGroupVO" >
	          	    <tr id="tblRow-Nc">
	          	    <td width="20">
	          	    	<input title="Click to select/unselect this group" type="checkbox" name="groupIds" value="${customerGroupVO.groupId}" />
	          	    </td>
	          	    <td id="tdGrp">
	          	    	<a title="Click to view all contacts in this group" href="javascript:viewContacts('${customerGroupVO.groupId}','group','divCsr');">${customerGroupVO.groupName}</a></td>
	          	    <td id="tdCnt">
	          	    	${customerGroupVO.customerCount}
	          	    </td>	          	    	
	          	    </tr>												
			   		</c:forEach>
			   		</table>
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
				<div style="position:relative;left:5px;">
					<div id="spn_sel">
						<b>Select :</b> 
						<a href="javascript:jSel('divCsr',true,addRemoveContact)">[ All ]</a>&nbsp;
						<a href="javascript:jSel('divCsr',false,addRemoveContact)">[ None ]</a>&nbsp;
						<c:url var="xlsDoc" value="/customerController.do?mx=downloadExcel"></c:url>
						<a title="Download all contacts as EXCEL file"  href="${xlsDoc}">
						<img alt="Download as EXCEL"  style="margin-right:5px;float:right" src="<c:url value='/images/Excel-16.gif'/>"/>
						</a>
					
						<c:url var="pdfDoc" value="/customerController.do?mx=downloadPDF"></c:url>
						<a title="Download all contacts as PDF file" href="${pdfDoc}">
						<img alt="Download as PDF" style="margin-right:5px;float:right" src="<c:url value='/images/Reader-16.gif'/>"/>
						</a>
					</div>
				</div>
				</td></tr>
				<tr>  
					<td  colspan="2"> 
					<div id="divCsr">
						 <p class="jTip" style="width:250px;"> You can enter either firstname, lastname or email address </p>
				 	</div> 
					</td>
				</tr>
				</table> 
	</td> 
</tr>
</table> 
<div id="divContactDetails"></div>
<div id="divCTOptions">
	<div id="divCTInfo"></div>
	<div id="spn_actions">&nbsp;</div>
</div>
<script language="javascript">

var prevTerm="";

/*Page Scoped Array*/
var GLOBAL=new Array();

/*Search Results will be stored in this array*/
GLOBAL['contactData']=new Array();

/*All selected contacts will be stored in this array*/
GLOBAL['selContacts']=new Array();

/*All selected groups will be stored in this array*/
GLOBAL['selGroups']=new Array();

	function pushPopArr(objChk){
		var strTmpVal=objChk.value;
		var arrObj=GLOBAL['selContacts'];
		if(objChk.checked==true){
			var arrStr=arrObj.toString();	
			if(arrStr.indexOf(strTmpVal)==-1){
				arrObj.push(strTmpVal);
			}
		}else if(objChk.checked==false){
			var intIndex = arrObj.indexOf(strTmpVal);
			if(intIndex != -1){
				arrObj.splice(intIndex, 1);
			}
		}	
	}
	
	function addRemoveContact(objChk){
		pushPopArr(objChk);
	 	viewActionItems();
	} 	

	function viewContacts(strSearchTerm,strSearchKey,strDisplayIn) {
		 
		var strTmpSearchTerm=strSearchTerm.trim();
		
		if(isValidSearchTerm(strTmpSearchTerm)==true){
			if(strTmpSearchTerm!="" && prevTerm!=strTmpSearchTerm){
				prevTerm=strTmpSearchTerm;
				GLOBAL['selContacts']=new Array();
				document.getElementById(strDisplayIn).innerHTML="<span id='idWait'>Please wait...</span>";
				jCustomers.getCustomers(strTmpSearchTerm,strSearchKey,
					{callback:processList,errorHandler:remoteErrorHandler}
				);
			}
			
		}else{
			document.getElementById(strDisplayIn).innerHTML="<span id='idAlert'>Please enter valid values</span>";
			prevTerm=strTmpSearchTerm;
		} 	 
			viewActionItems();
	}

	function vwContactInfo(strEmail){
		var cData=GLOBAL['contactData'];
		for (var i = 0; i<cData.length; i++) 
		{
			 if(cData[i].email==strEmail){
				 processContact(cData[i]);
				 break;
			 }
		}
	}
	function bulkDelete(){
		var selData=GLOBAL['selContacts'];
		if(selData.length>0){
			if(confirm("Do you really want to delete all selected contacts?\nThis can not be undone.")){
			
				/*Step 1: Send delete request to server*/
					jCustomers.bulkDelete(selData,
							{callback:displayMessage,errorHandler:remoteErrorHandler}
					 	);
				/*Step 2: Delete from local array*/
					var cData=GLOBAL['contactData'];
					for(var x=0;x<selData.length;x++){
						var strEmail=selData[x];
						for (var i = 0; i<cData.length; i++) 
							{
							if(cData[i].email==strEmail){
							 cData.splice(i, 1);
							}
						}
					}
				/*Step 3: Reset selected contacts to 0*/
					GLOBAL['selContacts']=new Array();
					
				/*Step 4: Render new contacts list*/
					processList(cData);

				/*Step 5: Display Action Items*/
					viewActionItems();
			}
		}
	}

	/*Should change to bulk update*/
	function bulkUpdateStatus(intStatusId){
		var selData=GLOBAL['selContacts'];
		if(selData.length>0 && isNumber(intStatusId)){
			if(confirm("Do you really want to change status of all selected contacts?")){
			
				/*Step 1: Send delete request to server*/
					jCustomers.bulkUpdate(selData,intStatusId,
							{callback:displayMessage,errorHandler:remoteErrorHandler}
					 	); 
			 
				/*Step 2: Reset selected contacts to 0*/
					GLOBAL['selContacts']=new Array();
					
				/*Step 3: Render new contacts list*/
					processList(cData);

				/*Step 4: Display Action Items*/
					viewActionItems();
			}
		}
	}
	
	function delContact(strEmail){
		var cData=GLOBAL['contactData'];
		for (var i = 0; i<cData.length; i++) 
		{
			if(cData[i].email==strEmail){

				if(confirm("Do you really want to delete this contact?\nThis can not be undone.")){
					jCustomers.deleteContact(strEmail,
						{callback:displayMessage,errorHandler:remoteErrorHandler}
				 	);
			 		cData.splice(i, 1);
			 		processList(cData);
			 		document.getElementById('divCTInfo').innerHTML="";
			 		document.getElementById('spn_actions').innerHTML="";
			 		 $('#divContactDetails').dialog('close');
				}
				break;
			}  
		}
	}

 
	
	function displayMessage(data){
		remoteMessage(data);
	}
 	function processList(data) {
		
		if (data.length>0) 
		{
			GLOBAL['contactData']=data;
			
			var tblContacts="<table cellspacing='0' cellpadding='0' style='border-left:1px solid rgb(245,245,245);width:100%'>";
			for (var i = 0; i<data.length; i++) 
			{ 
				var tmpCid="chkContact_" + data[i].customerId;
				tblContacts=tblContacts + "<tr id='tblRow'><td>";
				tblContacts=tblContacts + "<label title='Click to select/unselect this contact' style='cursor:pointer' for='" + tmpCid + "'>";
				tblContacts=tblContacts + "<span><input class='chkContact' id='" + tmpCid + "' type='checkbox' name='" + tmpCid + "'";
				tblContacts=tblContacts + " value='" + data[i].email + "' /></span><span>";
				tblContacts=tblContacts + data[i].firstName + " " + data[i].lastName;
				tblContacts=tblContacts + "<br/>";
				tblContacts=tblContacts + data[i].email;
				tblContacts=tblContacts + "<span></label></td>"; 
				tblContacts=tblContacts + "<td width='30px' id='l' ><a title='View/Edit Contact' id='smallLink' href=\"javascript:vwContactInfo('" + data[i].email + "');\"><div class='jEdit'></div></a></td>";
				tblContacts=tblContacts + "<td width='30px' id='l' ><a title='Delete Contact' id='smallLink-Gray' href=\"javascript:delContact('" + data[i].email + "');\"><div class='jDelete'></div></a></td>";
				tblContacts=tblContacts + "</tr>";
			}

			tblContacts=tblContacts+"</table>";
			document.getElementById('divCsr').innerHTML = tblContacts;
			$("#spn_sel").show();
			jAssignEvent();						
		}else{
			document.getElementById('divCsr').innerHTML = "<span id='idAlert'>No results found</span>";
			$("#spn_sel").hide('slow');
		}   
		
	} 

	function processContact(data) {
	    var ctInfo="";

	     ctInfo=ctInfo+"<div id='divContactWindow'>";
		    ctInfo=ctInfo+"<table class='tblPlain'>";
		    ctInfo=ctInfo+"<input type='hidden' id='customerId' value='" + data.customerId + "'/>";
		    ctInfo=ctInfo+"<input type='hidden' id='groupId' value='" + data.groupId + "'/>";
		    ctInfo=ctInfo+"<tr><td>Title</td><td class='bld'><input  size='10' id='title' type='text' value='" + data.title + "'/></td></tr>";
		    ctInfo=ctInfo+"<tr><td>First Name</td><td class='bld'><input size='35' id='firstName' type='text' value='" + data.firstName + "'/></td></tr>";
		    ctInfo=ctInfo+"<tr><td>Last Name</td><td class='bld'><input  size='35' id='lastName'  type='text' value='" + data.lastName + "'/></td></tr>";
		    ctInfo=ctInfo+"<tr><td>EMail</td><td class='bld'><input size='35' id='email' type='text' value='" + data.email + "'/></td></tr>";
		    ctInfo=ctInfo+"<tr><td>Mobile</td><td class='bld'><input size='35' id='mobile' type='text' value='" + data.mobile + "'/></td></tr>";
		    ctInfo=ctInfo+"<tr><td>Land Phone</td><td class='bld'><input size='35' id='landPhone' type='text' value='" + data.landPhone + "'/></td></tr>";
		    ctInfo=ctInfo+"<tr><td>Address </td><td class='bld'><textarea id='contactDetails' cols='35' rows='4'>" + data.contactDetails + "</textarea></td></tr>";
		    ctInfo=ctInfo+"<tr>";
		    ctInfo=ctInfo+"<td colspan='2' align='right'>";
		    ctInfo=ctInfo+"<a class='jqBtn' href=\"javascript:delContact('" + data.email + "');\">Delete</a>";
		    ctInfo=ctInfo+"&nbsp;<a class='jqBtn' href=\"javascript:updateContact();\">Update Contact</a></td>";
		    ctInfo=ctInfo+"</table>";
		ctInfo=ctInfo+"</div>";   
	   
	    document.getElementById('divContactDetails').innerHTML =ctInfo;
	    $(".jqBtn").button();
	    $('#divContactDetails').dialog('open');
	}
		
	function alterContact(objChk){
		pushPopArr(objChk);
		viewActionItems();		
	}
	
	function viewContactDetails(){
		if(GLOBAL['selContacts'].length==1){
			var strTmpVal=GLOBAL['selContacts'][0];
			 vwContactInfo(strTmpVal);			 	
		}
	} 
	
	function validateContact(){
	 	 if(!isEmail($('#email').val())) {
			inlineMsg('email','Please enter valid email.');
			return false; 
		 	}
		 return true;
	}
	
	function updateContact(){

		if(validateContact()){		
			
			var cvo = new Object();
			cvo.customerId=dwr.util.getValue('customerId');
			cvo.groupId=dwr.util.getValue('groupId');
			cvo.title=dwr.util.getValue('title');
			cvo.firstName=dwr.util.getValue('firstName');
			cvo.lastName=dwr.util.getValue('lastName');
			cvo.email=dwr.util.getValue('email');
			cvo.mobile=dwr.util.getValue('mobile');
			cvo.landPhone=dwr.util.getValue('landPhone');
			cvo.contactDetails=dwr.util.getValue('contactDetails');
			
			/*Step 1: Send update request to server*/
			jCustomers.updateContact(cvo,
					{callback:displayMessage,errorHandler:remoteErrorHandler}
			 	);
	
			/*Step 2: Update local copy*/
			var cData=GLOBAL['contactData'];
			for (var i = 0; i<cData.length; i++) 
			{
				if(cData[i].customerId==cvo.customerId){ 
					cData[i]=cvo;
					break;
				}
			}

			$('#divContactDetails').dialog('close');
		}	
	}
	function viewActionItems(){
		
 		var clen=GLOBAL['selContacts'].length;

 		var ctItems= "<h2>" + clen +" Contacts Selected</h2>";
		document.getElementById('divCTInfo').innerHTML =ctItems;
 		 
		 var ctOptions="";
		 
		 ctOptions=ctOptions+ "<span id='l'>";
		 if(clen==1){
		 ctOptions=ctOptions+ "<a class='edit' href=\"javascript:vwContactInfo('"+GLOBAL['selContacts'][0]+"')\">Edit</a> | ";
		 }
		 ctOptions=ctOptions+ "<a class='delete' href='javascript:bulkDelete();'>Delete</a> | ";
		 ctOptions=ctOptions+ "<a href='#'>Suspend</a> | ";
		 ctOptions=ctOptions+ "<a href='#'>View Statistics</a> | ";
		 ctOptions=ctOptions+ "</span>";
		 document.getElementById('spn_actions').innerHTML =ctOptions;	 
         
		 if(GLOBAL['selContacts'].length==0){
		 	//$("#spn_actions").hide('slow');
			 $("#divCTOptions").dialog('close');
		 }else{
			 $("#divCTOptions").dialog('open'); 
			//$("#spn_actions").show(); 
		 }
		 
	}
</script>

<script>
$(function() {
 	$("#divContactDetails").dialog({
		height: 325,
		width: 400,
		modal: true,
		autoOpen: false,
		title: 'Contact Details'
	});
 	
 	$("#divCTOptions").dialog({
		height: 150,
		width: 300,
		modal: false,
		autoOpen: false,
		position:'right',
		title: 'Contact Options'
	});
	
});
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
						 		alterContact($(this).context);
								}	
					);
		});
		
	};
</script>

<script>
	if(typeof String.prototype.trim !== 'function') {
	  String.prototype.trim = function() {
	    return this.replace(/^\s+|\s+$/, ''); 
	  };
	}
	if(!Array.indexOf){
		  Array.prototype.indexOf = function(obj){
		   for(var i=0; i<this.length; i++){
		    if(this[i]==obj){
		     return i;
		    }
		   }
		   return -1;
		  };
	}	
</script>
 
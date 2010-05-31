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
  		  <style>
  		  a.jqBtn:hover{
  		  	color:white;
  		   }
   		  </style>
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
				<j:Block blockHeading="Email Profiles"> 
				<c:url value="/images/icons/32x32/email_add.png" var="urlEmailAdd"/> 
				<c:url value="/images/icons/arrow_refresh.png" var="urlRefresh"/>
				 <div style="padding-bottom:3px;"><a class="jqBtn"  href="#"><img style="float:left" src="${urlEmailAdd}"/>Add email profile</a></div> 
				 <table id="tblEmailProfiles" style="background-color:white;border:1px solid rgb(240,240,240)" cellpadding="2px" cellspacing="0px" width="100%">
				 <tr id="tblHR"><td align='center'>Sno</td><td>Profile Name</td><td>Send from email</td><td>Send as name</td><td>Reply to email</td><td><a title="Refresh Profiles" href="javascript:getMailProfiles()"><img src="${urlRefresh}"/></a></td></tr>
				 <c:forEach items="${profiles}" var="pVO" varStatus="status"> 
				 		<tr id="tblRow"><td style='background-color:rgb(249,249,249);' align='center'>${status.count}</td><td>${pVO.profileName}</td><td>${pVO.fromAddress}</td><td>${pVO.smtpFromName}</td><td>${pVO.replyToEmail}</td><td></td></tr>
				 </c:forEach>
				 </table>
				</j:Block>  
			</j:Content>
		</j:ContentArea>
	</j:Page>   
	<div id="divEmailProfile">
		<table>
		<tr><td>Profile Name</td><td><input  type="text" tabindex="1"  id="profileName" name="profileName" size="35" /></td></tr>
		<tr><td>From Email</td><td><input  type="text" tabindex="2"  id="fromAddress" name="fromAddress" size="35" /></td></tr>
		<tr><td>From Name</td><td><input  type="text" tabindex="3"  id="smtpFromName" name="smtpFromName" size="35" /></td></tr>
		<tr><td>ReplyTo Email</td><td><input  type="text" tabindex="4"  id="replyToEmail" name="replyToEmail" size="35" /></td></tr>
		<tr><td>SMTP Host</td><td><input  type="text" tabindex="5"  id="smtpHost" name="smtpHost" size="35" /></td></tr>
		<tr><td>SMTP Port</td><td><input  type="text" tabindex="6"  id="smtpPort" name="smtpPort" size="35" /></td></tr>
		<tr><td>SMTP User Name</td><td><input  type="text" tabindex="7"  id="smtpUser" name="smtpUser" size="35" /></td></tr>
		<tr><td>SMTP Password</td><td><input  type="password" tabindex="8"  id="smtpPassword" name="smtpPassword"  size="35" /></td></tr>
		<tr><td>SMTP Password Again</td><td><input  type="password" tabindex="8"  id="smtpPassword1" name="smtpPassword1"  size="35" /></td></tr>
		<tr><td colspan="2" align="right"> 
		SMTP TLS Enabled  <input  type="checkbox" tabindex="9"  id="smtpTlsEnabled" name="smtpTlsEnabled" value="true"/>
		SMTP Auth Required  <input  type="checkbox" tabindex="10" id="smtpAuth" name="smtpAuth" value="true" />
		</td></tr>
		<tr><td colspan="2">  
		<div class="ui-state-highlight ui-corner-all" style="height:20px;margin-top:15px; padding:4px;"> 
			 <div><span class="ui-icon ui-icon-info" style="float: left;margin-right: .3em;" ></span> 
			 <strong>Hey!</strong> All fields are mandatory</div> 
		</div> 
	 	</td></tr> 
		<tr><td colspan="2" align="right"> 
		<input class="jqBtn1" type="button" value="Save Profile" />
	 	</td></tr> 
		</table>
	</div> 
	<script language="javascript"> 
	 $(function() {
		$(".jqBtn").button();  
		$(".jqBtn").click(function(){$("#divEmailProfile").dialog('open');});
		
		$(".jqBtn1").button();  
		$(".jqBtn1").click(jValidateSave);
		  
		$("#divEmailProfile").dialog({ 
			width:475, 
		 	modal: true,
			autoOpen: false,
			title: 'Create a new email profile'
		});   
	});
    var jBlock=false;
	function jValidateSave(){  
		 	var emailProfile=new Object();
		 	emailProfile.profileName  =$('#profileName').val();
		 	emailProfile.fromAddress  =$('#fromAddress').val();
		 	emailProfile.smtpFromName =$('#smtpFromName').val();
		 	emailProfile.replyToEmail =$('#replyToEmail').val();
		 	emailProfile.smtpHost 	  =$('#smtpHost').val();
		 	emailProfile.smtpPort 	  =$('#smtpPort').val();
		 	emailProfile.smtpUser 	  =$('#smtpUser').val();
		 	emailProfile.smtpPassword =$('#smtpPassword').val();
		 	emailProfile.smtpTlsEnabled =$('#smtpTlsEnabled').val();
		 	emailProfile.smtpAuth 	  =$('#smtpAuth').val();  
			if(!(jBlock) && validate()){
			 jBlock=true;
			 jUsers.createMailProfile(emailProfile,
								{callback:displayMessage,errorHandler:remoteErrorHandler}
			 				  );
			} 
	}
	
	function displayMessage(data){
		remoteMessage(data);
		jBlok=false;
	}
	
	function getMailProfiles(){
		//jUsers.getMailProfiles(displayProfiles,
		//		{callback:displayMessage,errorHandler:remoteErrorHandler}
		//		  );
	}
	
	function displayProfiles(data){
		if(data.length>0){
		 for(var i=0; i<data.length; i++){ 
				addRow(data[i]);	 
			}
		} 
	}
	
	function addRow(obj){
		var awardTable = document.getElementById('tblEmailProfiles');
		newrowno = awardTable.rows.length;
	 	awardTable.insertRow(newrowno);
	 	
	 	awardTable.rows[newrowno].style.height="30px";
	 	awardTable.rows[newrowno].className="tblRow";
		awardTable.rows[newrowno].insertCell(0);	
		awardTable.rows[newrowno].insertCell(1);
		awardTable.rows[newrowno].insertCell(2);
		awardTable.rows[newrowno].insertCell(3);
		awardTable.rows[newrowno].insertCell(4);
	 
		awardTable.rows[newrowno].cells[0].innerHTML ="<span>" + obj.profileName + "</span>";
		awardTable.rows[newrowno].cells[1].innerHTML ="<span>" + obj.fromAddress + "</span>";
		awardTable.rows[newrowno].cells[2].innerHTML ="<span>" + obj.smtpFromName + "</span>";
		awardTable.rows[newrowno].cells[3].innerHTML ="<span>" + obj.replyToEmail + "</span>";
		awardTable.rows[newrowno].cells[4].width="20";  
		  
	} 
	function validate(){
	 	if(!isValidText($('#profileName').val())) {
			inlineMsg('profileName','Please enter valid profile name.');
			return false; 
		 	}
	 	if(!isEmail($('#fromAddress').val())) {
			inlineMsg('fromAddress','Please enter valid email address.');
			return false; 
		 	}
	 	if(!isValidSmtpText($('#smtpFromName').val())) {
			inlineMsg('smtpFromName','Please enter valid from name.');
			return false; 
		 	}
	 	if(!isEmail($('#replyToEmail').val())) {
			inlineMsg('replyToEmail','Please enter valid email address.');
			return false; 
		 	}
	 	if(!isValidText($('#smtpHost').val())) {
			inlineMsg('smtpHost','Please enter valid SMTP Host Name.');
			return false; 
		 	}
	 	if(!isNumber($('#smtpPort').val())) {
			inlineMsg('smtpPort','Please enter valid SMTP Port Number.');
			return false; 
		 	}
	 	if(!isValidSmtpText($('#smtpUser').val())) {
			inlineMsg('smtpUser','Please enter valid SMTP User Name.');
			return false; 
		 	}
	 	if(isNull($('#smtpPassword1').val()) || isNull($('#smtpPassword').val())){
			inlineMsg('smtpPassword','Please enter SMTP Password');
			return false; 
		 	}
	 	if(!($('#smtpPassword1').val()== $('#smtpPassword').val())) {
			inlineMsg('smtpPassword1','SMTP Passwords does not match');
			return false; 
		 	}
		 return true;
	}
	</script>
</j:HtmlBody>
</j:Html>
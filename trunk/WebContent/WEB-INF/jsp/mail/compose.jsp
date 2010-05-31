<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html" %>
<%@taglib prefix="logic" uri="http://joompal.com/beyondcontact/struts-logic" %>
<%@taglib prefix="bean"  uri="http://joompal.com/beyondcontact/struts-bean" %>
<%@taglib prefix="c" 	 uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="j" 	 uri="http://joompal.com/beyondcontact/ui-tags" %>
<%@page import="com.beyond.constants.*" %>
<j:Html>
<j:HtmlHeader> 
<title>Beyond Contact - Mail Home </title> 
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/editor/ckeditor.js"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/dwr/interface/jCustomers.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/dwr/interface/jMails.js'></script> 
<style>
th{
padding-left:7px;
}
.cke_skin_kama{
border:0px !important;
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
<jsp:include page="customFields.jsp"></jsp:include>
</j:SideBar> 
<j:Content >
<j:Block blockHeading="Compose Mail">
<html:form action="/mailer.do">
<html:hidden property="mx" 	  value="sendMail"></html:hidden>
<html:hidden property="profileId"  styleId="profileId"></html:hidden>
<html:hidden property="route" value="mailers/composeMail/new"></html:hidden>

	<c:choose>
	<c:when test="${not empty requestScope.actionVO.actionMessage and requestScope.actionVO.showMessage eq true }">
		<c:if test="${requestScope.actionVO.actionFailed eq true}">
			<table cellspacing="0" cellpadding="0" align="left" width="100%">
			<tr><td>
			<div class="ui-state-error ui-corner-all" style="height:20px;margin-top:15px; padding:4px;"> 
				 <div><span class="ui-icon ui-icon-info" style="float: left;margin-right: .3em;" ></span> 
				 <strong>Oops !</strong> Sorry, please action the items below</div> 
			</div>  
			</td></tr>
			<tr> 
			<td style="border:1px solid red" align="left">
		 	${actionVO.actionMessage}  
			</td></tr>
			</table>
		</c:if>
		<c:if test="${requestScope.actionVO.actionFailed eq false}">
			<table cellspacing="0" cellpadding="0" align="left" width="100%">
			<tr><td>
			<div class="ui-state-highlight ui-corner-all" style="height:20px;margin-top:15px; padding:4px;"> 
				 <div><span class="ui-icon ui-icon-info" style="float: left;margin-right: .3em;" ></span> 
				 <strong>Hey !</strong> ${actionVO.actionMessage}</div> 
			</div>  
			</td></tr> 
			</table>
		</c:if>
	</c:when>
	</c:choose>
<table cellspacing="0" width='100%'> 
			<tr>
			<c:url value="/images/icons/32x32/cog.png" var="urlEmailCog"/>   
			<c:url value="/images/icons/tblRow.png" var="urlUserAdd"/> 
			<td width="350px" valign="middle" align="left"><html:hidden styleId="TXT_SEL_CUSTOMERS" property="strToAddress"></html:hidden></td>
			<td valign="middle" align="right"><div id="btnMailProfile"><table><tr><td><img style="float:right" src="${urlEmailCog}"/></td><td><span id="spnMailProfile">Configure sending profile</span></td></tr></table></div></td>
			<td width="150px" align="left">
			<c:url value="/images/icons/32x32/email_go.png" var="urlEmailGo"/>  
        	<div id="btnSend"><table><tr><td valign="middle"><img style="float:right" src="${urlEmailGo}"/></td><td valign="middle">Send Mail</td></tr></table></div>  
			</td>
			</tr>
</table> 	 
<table cellspacing="0" cellpadding="1px" width="100%" style="border:1px solid rgb(220,220,220);margin-top:3px;">  
    <tr style="height:28px;background-image:url('${urlUserAdd}');background-repeat:repeat-x;" >   
    	<th style="width:50px;height:28px;" >To</th>
    	<td colspan="2" valign="middle" align="left">
	     <table><tr><td width="150px">
	     <label for="sgrp">
	     <html:radio onclick="jSetVisible('DIV_SELECT_CONTACTS',!this.checked);jSetVisible('DIV_SELECT_LIST',this.checked);" property="sendToGroup" value="true" styleId="sgrp"/><span class="l">Send To Lists </span>
	     </label>
	     </td><td>
	     <label for="cust">
		 <html:radio onclick="jSetVisible('DIV_SELECT_CONTACTS',this.checked);jSetVisible('DIV_SELECT_LIST',!this.checked);" property="sendToGroup" value="false" styleId="cust"/><span class="l">Custom Selection</span>
		 </label>
	 	 </td></tr>
	     </table>
	     </td> 
		</tr><tr>
			<td></td> 
			<td colspan="2"> 
			<j:Window display="none" title="Whom do you want to send" id="DIV_SELECT_CONTACTS">
			<jsp:include page="compose/selectCustomers.jsp"></jsp:include>
			</j:Window>
			<j:Window display="none" title="Whom do you want to send" id="DIV_SELECT_LIST">
			 <table style="background-color:white;border:1px solid rgb(240,240,240)" cellpadding="2px" cellspacing="0px" width="100%" id="div_custGrp" > 
				<c:choose>
				<c:when test="${not empty sessionScope.customerGroupList}">
					<c:forEach items="${sessionScope.customerGroupList}" var="customerGroupVO">
					<c:choose>
					<c:when test="${customerGroupVO.customerCount gt 0}">
						<tr class="tblRow">
							<td style="height:18px;">
							<label for="groupId${customerGroupVO.groupId}"> 
							<span>
							<input type="checkbox" name="groupIds" class="groupIds" id="groupId${customerGroupVO.groupId}" value="${customerGroupVO.groupId}" />
							</span>
							<span style="width:250px;">${customerGroupVO.groupName}</span>
							<span>${customerGroupVO.customerCount} Contacts</span>
							</label>
							</td> 
						</tr>
					</c:when>
					</c:choose>
					</c:forEach>
				</c:when> 
				<c:otherwise>
					<tr id="tblRow">
						<td>
						<div class="ui-state-highlight ui-corner-all" style="height:17px;margin-top:2px; padding:4px;"> 
							 <div><span class="ui-icon ui-icon-info" style="float: left;margin-right: .2em;" ></span> 
							 <strong>Hey !</strong> You have not created any list/group yet
							 </div> 
						</div>  
						</td>
					</tr>
				</c:otherwise>
				</c:choose> 
			</table>
			</j:Window>
			</td>
	        </tr>
	        <tr style="height:28px;background-image:url('${urlUserAdd}');background-repeat:repeat-x;" >
       		 <th style="width:50px;height:28px;" valign="middle" >When</th>
       		 <td colspan="2" style="height:28px;" valign="middle" align="left">
       		 <table><tr><td width="150px">
	       		<label for="sendNow">
	       		<html:radio onclick="jSetVisible('DIV_SCHEDULE_DELIVERY',!this.checked)" property="sendImmediate"  value="true" styleId="sendNow"/><span  style="width:250px" id="l">Send Immediately</span>
	       		</label>
	       	</td><td>
				<label for="sendLater">
				<html:radio onclick="jSetVisible('DIV_SCHEDULE_DELIVERY',this.checked)" property="sendImmediate"  value="false" styleId="sendLater"/><span id="l">Schedule for later</span>
				</label>
			</td></tr></table>
			</td>
		 </tr>
         <tr>
         	<td></td>
         	<td colspan="2"> 	
            <jsp:include page="compose/scheduleDelivery.jsp"></jsp:include>
          	</td>
         </tr>
     <tr style="height:28px;background-image:url('${urlUserAdd}');background-repeat:repeat-x;">  
	     <th style="height:28px;">What</th>
	     <td colspan="2" style="height:28px;" valign="middle" align="left">
	     <table><tr><td width="150px">
	     <label for="cn">
	     <html:radio onclick="jSetVisible('div_template_sel',!this.checked)" property="mailTemplate" value="false" styleId="cn"/><span  style="width:250px" id="l">Compose now... </span></label>
	     </td><td>
	     <label for="st">
		 <html:radio onclick="jSetVisible('div_template_sel',this.checked)" property="mailTemplate" value="true" styleId="st"/><span id="l">Select an existing mail template</span></label>
		 </td></tr></table>
	 	 </td>
     </tr>
     <tr>			 
     <td></td>
		<td colspan="2">
		<jsp:include page="compose/selectTemplate.jsp"></jsp:include>
		</td>
		</tr>
         <tr>
         	<th>Subject </th> 
         	<td>
            <html:text style="font-size:18px;font-weight:bold;border:2px solid rgb(220,220,220)" property="strSubject" styleId="strSubject" size="50"/>
         </td>
         <td align="right"> 
		    <input type="button" class="btn" onclick='showCFields();' value="Select Custom Fields"></input> 
		</td>
      </tr> 
      <tr>
		<td colspan="3">
		<html:textarea property="strMessage" styleId="htmlEditor"></html:textarea>
	 	<script type="text/javascript">
       	     	CKEDITOR.replace( 'htmlEditor',
				{ 
  	     			customConfig : '${pageContext.request.contextPath}/scripts/editor/staticBar.js',
					skin : 'kama',
					height:'412',
					toolbar:'StaticBar',
					filebrowserBrowseUrl: 'http://beyondcontact.com/index1.html',
					filebrowserImageBrowseUrl : 'http://beyondcontact.com/index1.html?type=Images' 
					
				});
		</script>
		</td>
      </tr>	
	  <tr style="height:30px;padding:2px;background:white url(${pageContext.request.contextPath}/yui/build/assets/skins/sam/sprite.png) repeat-x 0 -1488px;">
		<td colspan="3" align="right">
		<j:Button label="Send Mail" link="javascript:validateForm();">Save</j:Button>
		</td> 
      </tr>	                    
      </table>
      <!-- Begin Email Profile Selection  -->
			 <jsp:include page="profiles.jsp"/>
	  <!-- End Create Group Window  -->
      </html:form>
</j:Block>
</j:Content>
</j:ContentArea>
<script language="javascript">
	function validateData(){ 
		 
		if($('#sgrp').is(':checked')){
			if($('#div_custGrp input[type=checkbox]:checked').length==0){
				jMessageCB('Please select a group name',showList);
				return false;
			}
		} 
		if($('#sendLater').is(':checked')){
			if($('#from').val()=="" || $('#to').val()=="" || $('#time').val()==""){
				jMessageCB('Please enter from/to and time',showSchedule);
				return false;
			}
		}
		if($('#strSubject').val()==""){
				jMessage('Please select mail subject');
				$('#strSubject').focus();
				return false;
		}
		if(CKEDITOR.instances["htmlEditor"].getData() == ''){
				jMessage('Please select mail message');
				$('#htmlEditor').focus();
				return false;
		}
		if($('#profileId').val()=="" || $('#profileId').val()<=0) { 
				jMessageCB('Please select a mail profile',viewMailProfiles); 
				return false; 
		 }
		  
		return true;
		
	}
	function showSchedule(){
		jSetVisible('DIV_SCHEDULE_DELIVERY',true);
	}
	function showList(){
		jSetVisible('DIV_SELECT_LIST',true);
	}
 
	function jInsertField(strFieldVal){
		var objEditor = CKEDITOR.instances["htmlEditor"];
		objEditor.insertHtml(strFieldVal);
	} 
	function validateForm(){
		if(validateData()==true){
		document.forms['mailer'].submit();
		}
	} 
	$(function(){
		$(".btn").button();
		$("#btnMailProfile").button();
		$("#btnSend").button().click(function(){validateForm();});			 
		$("#btnUsers").button().click(function(){toggleDisplay("DIV_SELECT_CONTACTS");return false;});
		$("#btnMailProfile").click(viewMailProfiles); 
		initForm();
	});	
	
  /* GLOBAL STORE FOR REQUEST PARAMETERS
   * Using these parameters form values are initialized/pre-populated.
   */
   
	var INIT_GLOBAL=new Array();
	
    function setVal(assocval){
    	INIT_GLOBAL[assocval.split(',')[0]]=assocval.split(',')[1];
    }
	
	function initForm(){ 
		setVal('tid,${param.tId}');
		
		if(!(INIT_GLOBAL['tid']==null)){
			$("#templateId").val(INIT_GLOBAL['tid']);
			jViewTemplate(INIT_GLOBAL['tid']);
			$('#st').attr('checked', true);
		}
		
	} 
</script>
</j:Page>
</j:HtmlBody>
</j:Html>
<%@taglib prefix="c" 	 uri="http://java.sun.com/jsp/jstl/core" %>
<div id="divMailProfile"> 
	<table style="background-color:white;border:1px solid rgb(240,240,240)" cellpadding="2px" cellspacing="0px" width="100%">
		<tr id="tblHR">
		<td align='center'></td><td>Send from email</td><td>Send as name</td><td>Reply to email</td>
		</tr>
	<c:forEach items="${profiles}" var="pVO" varStatus="status"> 
		<tr class="tblRow" onclick="javascript:selProfile(event,'p${pVO.profileId}','${pVO.fromAddress}',${pVO.profileId});">
			<td style='background-color:rgb(249,249,249);' align='center'>
			<input type="radio" id="p${pVO.profileId}" name="pId" value="${pVO.profileId}" onclick="javascript:setProfile(event,'${pVO.fromAddress}',${pVO.profileId})"></input>
			</td><td>${pVO.fromAddress}</td>
			<td>${pVO.smtpFromName}</td><td>${pVO.replyToEmail}</td>
		</tr>
	</c:forEach> 
	<tr align="right">
		<td colspan="4"><input type="button" id="btnOk" value="OK"></input></td>
	</tr>
	</table>
</div>
<script language="javascript">
function viewMailProfiles(){
	$('#divMailProfile').dialog('open');
}
function setProfile(e,strEmail,lngPid){
	evt=e || window.event;
	evt.cancelBubble=true;  
	$("#spnMailProfile").html("Send As: <b>" + strEmail);  
	$("#profileId").val(lngPid); 
} 
function selProfile(e,strPid,strEmail,lngPid){ 
	var $radios = $('#'+strPid);
    if($radios.is(':checked') === false) {
        $radios.attr('checked', true);
    }  
    setProfile(e,strEmail,lngPid);
}  
$(function(){ 
	$("#btnOk").button().click(function(){$("#divMailProfile").dialog('close');});
	$("#divMailProfile").dialog({modal: true,width:700,autoOpen: false,title: 'Select a mail profile'}); 
});	
</script>
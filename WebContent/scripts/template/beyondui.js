/*
 * 
 * Beyond Contact - Dynamic EMail Experience v1.0
 * Copyright (c) 2010
 * Author Gowrisankar Narayan
 * Email gowrisankar.narayana@gmail.com
 * GTalk gowrisankar.narayana@gmail.com
 * 
 */
var jWindow=null;
 
function toggleDisplay(objElementId){
	var objStyle=document.getElementById(objElementId).style;
	
	if((objStyle.display).toLowerCase()=='none'){
		$('#'+objElementId).show('blind'); 
	}else if((objStyle.display).toLowerCase()=='block') {
		$('#'+objElementId).hide('blind');
	}
	
}
 
function jSetVisible(objElementId,boolValue){
	var objStyle=document.getElementById(objElementId).style;  
	if(boolValue==true && ((objStyle.display).toLowerCase()=='none' || (objStyle.display).toLowerCase()=='') ){
		$('#'+objElementId).show('blind'); 
	}else if(boolValue==false && (objStyle.display).toLowerCase()=='block' || (objStyle.display).toLowerCase()==''){
		$('#'+objElementId).hide('blind');
	}
}

function jCloseWindow(strJWindowId){ 
	var objStyle=document.getElementById(strJWindowId).style; 
	if((objStyle.display).toLowerCase()=='none'){
		$('#'+strJWindowId).show('blind'); 
	}else{
		$('#'+strJWindowId).hide('blind'); 
	}
}
function jMessage(strContent){ 
	$("#jGlobalMessage").dialog("option", "title", 'Message'); 
	$("#jMessageContent").html('<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>'+ strContent);	
	$("#dialog").dialog("destroy"); 
	$("#jGlobalMessage").dialog({
		modal: true,
		buttons: {
			Ok: function() {
				$(this).dialog('close');
			}
		}
	});	
	$("#jGlobalMessage").dialog('open');
}
function jMessageCB(strContent,funCallBack){ 
	$("#jGlobalMessage").dialog("option", "title", 'Message');  
	$("#jMessageContent").html('<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>'+ strContent);	
	$("#dialog").dialog("destroy");  
	$("#jGlobalMessage").dialog({
		modal: true,
		buttons: { Ok: function() { $(this).dialog('close');}},
	    beforeclose: function(event, ui) {funCallBack();}
	});	
	$("#jGlobalMessage").dialog('open');
 
}

function jConfirmCB(strContent,funCallBack){ 
	$("#jGlobalMessage").dialog("option", "title", 'Message'); 
	$("#jMessageContent").html('<span class="ui-icon ui-icon-notice" style="float:left; margin:0 7px 20px 0;"></span>'+ strContent);	
	$("#dialog").dialog("destroy"); 
	$("#jGlobalMessage").dialog({
		modal: true,
		buttons: 
			{ 
				Yes: function() { 
						funCallBack();
						$(this).dialog('close');
					},
				No: function(){
						$(this).dialog('close');
					}
			}
	});	
	$("#jGlobalMessage").dialog('open');
 
}
function remoteErrorHandler(strErrMessage){ 
//	var divObj=document.getElementById('div_remote_error'); 
//	var lnk="<a id='l' href='javascript:jCloseWindow(\"div_remote_error\");'>OK</a>";
//	divObj.innerHTML=  strErrMessage + "&nbsp;&nbsp;"  + lnk ;	
//	divObj.style.display="block"; 
	var erMsg="<font color='red'><strong>"+strErrMessage+"</strong></font>";
	jMessage(erMsg);
}

function remoteMessage(strMsg){ 
//	var divObj=document.getElementById('div_beyond_message');  
//	var lnk="<a id='l' href='javascript:jCloseWindow(\"div_beyond_message\");'>OK</a>";
//	divObj.innerHTML=  strMsg + "&nbsp;&nbsp;"  + lnk ;	
//	divObj.style.display="block"; 
	jMessage(strMsg);
}

function popSessTimeOut(){
 jMessageCB("Your session has been timed out",redirect); 
}

function redirect(){
 window.location = "/";
} 
function formatDate(d) { 
	  return d.getDate() + '/' + m_names[d.getMonth()] + '/' + d.getFullYear();
 } 
function formatTime(d) { 
	  return Math.round(d.getHours()) + ':' +  d.getMinutes();
}
var m_names = new Array("January", "February", "March", 
		"April", "May", "June", "July", "August", "September", 
		"October", "November", "December");
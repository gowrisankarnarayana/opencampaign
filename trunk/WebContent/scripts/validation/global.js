/* 
 * 
 * Beyond Contact - Dynamic Mail Experience v1.0
 * Copyright (c) 2010
 * Author Gowrisankar Narayan
 * Email gowrisankar.narayanan@gmail.com
 * GTalk gowrisankar.narayanan@gmail.com
 * 
 */
function isValidText(txtField){	
	if(isNull(txtField) || isEmpty(txtField)){
		return false;
	}else{
		var iChars = "!@#$%^&*()+=[]\\\;{}|\":<>?";
			for (var i = 0; i<txtField.length; i++) {
				if (iChars.indexOf(txtField.charAt(i)) != -1) {
					return false;
				}
			}
	}
 return true;	
}
function isValidSmtpText(txtField){	
	if(isNull(txtField) || isEmpty(txtField)){
		return false;
	}else{
		var iChars = "!#$%^&*()+=[]\\\;{}|\":<>?";
			for (var i = 0; i<txtField.length; i++) {
				if (iChars.indexOf(txtField.charAt(i)) != -1) {
					return false;
				}
			}
	}
 return true;	
}
function isEmail(strEmail){
	if(isNull(strEmail) || isEmpty(strEmail)){
		return false;
	}else{
	 var regX=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	 return regX.test(strEmail);
	}
}
function isDate(dateValue) {
    var regX=/^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((1[6-9]|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((1[6-9]|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((1[6-9]|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$/;
    return regX.test(dateValue);
}
function isDecimal(decValue){
  var regX=/(^-?\d\d*\.\d*$)|(^-?\d\d*$)|(^-?\.\d\d*$)/;
  return regX.test(decValue.toString());
}
function isNumber(numValue){
	if(isNull(numValue) || isEmpty(numValue)){
		return false;
	}else{
	  var regX=/(^-?\d\d*$)/;
	  return regX.test(numValue.toString());
	}
}
function isValidSearchTerm(txtValue){	
	var iChars = "`'£!@#$%^&*()+=[]\\\;{}|\":<>?";
	for (var i = 0; i<txtValue.length; i++) {
	  	if (iChars.indexOf(txtValue.charAt(i)) != -1) {
	  	return false;
	  	}
	} 
 return true;	
}	
function isNull(obj) {
	return (obj == null);			
}
function isEmpty(txtValue){
	return (trim(txtValue).length == 0);	
}
function trim(strValue){	
	return strValue.replace(/^\s+|\s+$/, ''); 
}



/* START OF INLINE MESSAGE SCRIPT 
 * 
 * */ 
var MSGTIMER = 20;
var MSGSPEED = 5;
var MSGOFFSET = 3;
var MSGHIDE = 3;

// build out the divs, set attributes and call the fade function //
function inlineMsg(target,string) {
  var msg;
  var msgcontent;
  var autohide=2;
  if(!document.getElementById('msg')) {
    msg = document.createElement('div');
    msg.id = 'msg';
    msgcontent = document.createElement('div');
    msgcontent.id = 'msgcontent';
    document.body.appendChild(msg);
    msg.appendChild(msgcontent);
    msg.style.filter = 'alpha(opacity=0)';
    msg.style.opacity = 0;
    msg.alpha = 0;
  }else {
    msg = document.getElementById('msg');
    msgcontent = document.getElementById('msgcontent');
  }
  msgcontent.innerHTML = string;
  msg.style.display = 'block';
  var msgheight = msg.offsetHeight;
  var targetdiv = document.getElementById(target);
  targetdiv.focus();
  var targetheight = targetdiv.offsetHeight;
  var targetwidth = targetdiv.offsetWidth;
  var topposition = topPosition(targetdiv) - ((msgheight - targetheight) / 2);
  var leftposition = leftPosition(targetdiv) + targetwidth + MSGOFFSET;
  msg.style.top = topposition + 'px';
  msg.style.left = leftposition + 'px';
  msg.style.zIndex= 99999999;
  clearInterval(msg.timer);
  msg.timer = setInterval("fadeMsg(1)", MSGTIMER);
  if(!autohide) {
    autohide = MSGHIDE;  
  }
  window.setTimeout("hideMsg()", (autohide * 1000));
}

// hide the form alert //
function hideMsg(msg) {
  var msg = document.getElementById('msg');
  if(!msg.timer) {
    msg.timer = setInterval("fadeMsg(0)", MSGTIMER);
  }
}

// face the message box //
function fadeMsg(flag) {
  if(flag == null) {
    flag = 1;
  }
  var msg = document.getElementById('msg');
  var value;
  if(flag == 1) {
    value = msg.alpha + MSGSPEED;
  } else {
    value = msg.alpha - MSGSPEED;
  }
  msg.alpha = value;
  msg.style.opacity = (value / 100);
  msg.style.filter = 'alpha(opacity=' + value + ')';
  if(value >= 99) {
    clearInterval(msg.timer);
    msg.timer = null;
  } else if(value <= 1) {
    msg.style.display = "none";
    clearInterval(msg.timer);
  }
}

// calculate the position of the element in relation to the left of the browser //
function leftPosition(target) {
  var left = 0;
  if(target.offsetParent) {
    while(1) {
      left += target.offsetLeft;
      if(!target.offsetParent) {
        break;
      }
      target = target.offsetParent;
    }
  } else if(target.x) {
    left += target.x;
  }
  return left;
}

// calculate the position of the element in relation to the top of the browser window //
function topPosition(target) {
  var top = 0;
  if(target.offsetParent) {
    while(1) {
      top += target.offsetTop;
      if(!target.offsetParent) {
        break;
      }
      target = target.offsetParent;
    }
  } else if(target.y) {
    top += target.y;
  }
  return top;
}

// preload the arrow // 
if(document.images) { 
  arrow = new Image(7,80); 
  arrow.src = "../../images/msg_arrow.png"; 
}
/*END OF INLINE MESSAGE SCRIPT*/

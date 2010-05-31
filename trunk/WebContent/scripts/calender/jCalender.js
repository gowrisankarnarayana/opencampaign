/*!
 * jCalender JavaScript Library v1.0
 * http://sm-ms.co.uk/
 *
 * Copyright 2010, Gowrisankar Narayan
 * Will be Released under the MIT, BSD, and GPL Licenses.
 * http://sm-ms.co.uk/jcalender/license
 *
 * Required:
 * jQuery JavaScript Library v1.4.2
 * http://jquery.com/
 * Copyright 2010, John Resig
 * Dual licensed under the MIT or GPL Version 2 licenses.
 *
 * Required:
 * jQuery UI 1.8
 * Copyright (c) 2010 AUTHORS.txt (http://jqueryui.com/about)
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 * http://docs.jquery.com/UI
 */

var jCALENDAR = function(){

	/* TaskHolder object 
	 * Place where all the jTask Objects are stored
	 */
	var _objTh;


	/* Enhanced TaskHolder Object
	 * Same as TaskHolder but
	 * Indexed on 'date and time' of task for exact lookup
	 * Simply put, its an associative array with keys being date and time in DD-MM-YYYY-HH-MM format.
	 */
	var _taskCache=new Array();


	/* User supplied DOM Id 
	 * Calendar is rendered on this id
	 */
	var _objDivId;

	/* Calendar properties. Goes as per the name*/
	var _minDate=null;
	var _maxDate=null;
	var _minTime='7.30';
	var _maxTime='5.30';
	var _intervalTime=30;
	var	_calTitle;
	var _calDesc;


	/* Event Handlers 
	 * 1) Before Initialise calendar
	 * 2) Before and after a Task is updated 
	 * 3) Before and after a Task is deleted
	 * 4) Before and after a Task is created
	 */
	 var _eventHandlers=new Array();

}
	
	/* CALENDER Status Constants */
	
	jCALENDAR.prototype.DUE=100;
	jCALENDAR.prototype.OK=200;
	jCALENDAR.prototype.OVERDUE=300;
	jCALENDAR.prototype.ERROR=400;
	
	/* CALENDER Event Listener Constants */
	jCALENDAR.prototype.INITIALIZE=100;
	jCALENDAR.prototype.BEFORE_UPDATE=300;
	jCALENDAR.prototype.AFTER_UPDATE=400;
	jCALENDAR.prototype.BEFORE_DELETE=500;
	jCALENDAR.prototype.AFTER_DELETE=600;
	jCALENDAR.prototype.BEFORE_CREATE=700;
	jCALENDAR.prototype.AFTER_CREATE=800;
	
	
	/*  Add Event Handler - stores event objects in _eventListeners array
	 *	1) jEvent Object
	 */
	
	jCALENDAR.prototype.addEventHandler = function(eventId,handler)    
	{ 
		var objEvent=new jEvent(eventId,handler);
		$(this._eventHandlers).push(objEvent);
	}
	
	
	/* getEventHandlers - retrieves array Of event handlers from _eventListeners array
	 */
	
	jCALENDAR.prototype.getEventHandlers = function(eventId)    
	{
		var eHandlers=new Array();
	
		$.each(this._eventHandlers.length,function( index, value ){
						  if(value.eventId=eventId){				 
							eHandlers.push(value.handler);
						  }
					}
		);
	
		return eHandlers;
	
	}
	
	/*  Initialize Calender Object with below arguments
	 *	1) TaskHolder Object
	 *	2) Object where the calendar must me displayed.
	 */
	
	jCALENDAR.prototype.init = function(objTh,objDivId)    
	{
		this._objTh=objTh;
		this._objDivId=objDivId;
	}
	
	
	/* Renders Calendar in the given DOM id
		1) PreConditions : TaskHolder Object and DivId must've been initialized
	*/
	jCALENDAR.prototype.render = function(){
	 
		if(!(this._objTh || this._objDivId) ){
			this.log('No tasks supplied. Please call setTasks() method');
		}else{
			this.prepareCalendar();
		}
	}
	
	/* Renders Calendar in the given DOM id
		1) PreConditions : TaskHolder Object and DivId must've been initialized
	*/
	jCALENDAR.prototype.prepareCalendar = function(){
	
		var divTop=document.createElement('div');
		divTop.id = "divTop";
		divTop.innerHTML='<h3>'+ this.getTitle() +' </h3>';
		
		var divLeft=document.createElement('div');
		divLeft.id = "divLeft";
	
		divLeft.innerHTML='<div id="txtDt"></div>';;
		
		var divCenter=document.createElement('div');
	    divCenter.id="divCenter";
	
		divCenter.innerHTML="";
		
		$.each(this._objTh,
					function( index, value ){
					  var dIndx=value.taskDate.getDate() + '|' + value.taskDate.getMonth()  + '|' + value.taskDate.getFullYear() + '|' ;
					      dIndx+=value.taskDate.getHours()+ '|' + value.taskDate.getMinutes();
						  $(divCenter).append(value.taskName + ' ' + value.taskStatus + ' ' + value.taskDesc + ' ' +  dIndx  + '<br/>');
					}
		);
	
		this._objDivId.appendChild(divCenter);
		this._objDivId.appendChild(divTop);
		this._objDivId.appendChild(divLeft);
	
		$('#txtDt').datepicker({minDate: '-1M', maxDate: '+2M +10D'});
	
	}
	
	
	/* Sets Calendar Object Properties
	 */
	jCALENDAR.prototype.setProperties = function(arrProps){
		if(arrProps){
			this._minDate=arrProps['minDate'];
			this._maxDate=arrProps['maxDate'];
			this._minTime=arrProps['minTime'];
			this._maxTime=arrProps['maxTime'];
			this._intervalTime=arrProps['intervalTime'];;
			this._calTitle=arrProps['calTitle'];
			this._calDesc=arrProps['calDesc'];
		}else{
			this.log('Invalid properties supplied.');
		}
	}
	
	/* Utility function which logs messages*/
	jCALENDAR.prototype.log = function(strMsg){
		$(this._objDivId).html(strMsg);
	}
	
	/*Read Calendar Title*/
	jCALENDAR.prototype.getTitle=function(){
		return this._calTitle;
	}
	
	/*Write Calendar Title*/
	jCALENDAR.prototype.setTitle=function(strTitle){
		this._calTitle=strTitle;
	}
	
	
	/*Holds array of Task Objects and */
	var jTaskHolder =function(arg1){
		var tasks= arg1 ;
	}
	
	var jTask =function(){
		var taskId;
		var taskName;
		var taskDesc;
		var taskStatus;
		var taskDate;
		var taskTime;
	}
	
	var jEvent =function(cEventId,fHandler){
		var eventId=cEventId;
		var handler=fHandler;
	}
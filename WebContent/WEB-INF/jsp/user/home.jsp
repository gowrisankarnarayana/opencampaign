<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<%@taglib prefix="c"  	 uri="http://java.sun.com/jsp/jstl/core"  %>
<j:Html>
<j:HtmlHeader>
<title>Beyond Contact - Free Email Marketing - Home </title>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/dwr/interface/jReports.js'></script>
</j:HtmlHeader>
<j:HtmlBody>
<j:NoScript/>
<j:Page>      
	<j:PageHeader />
            <j:MenuBar>
                <jsp:include page="/WEB-INF/jsp/auth/MainMenu.jsp"></jsp:include>          	
             </j:MenuBar>              
             <j:ContentArea>   
             <c:url value="/images/icons/arrow_refresh.png" 	var="urlRefresh"/>
             <c:url value="/images/icons/loaderSmall.gif"   	var="urlLoading"/>
             <c:url value="/images/icons/16x16/tick.png" 	    var="successUrl"/>    
             <c:url value="/images/icons/16x16/exclamation.png" var="failUrl"/>
             
			  <table style="margin-top:5px;" cellspacing="0" cellpadding="0">
			  <tr>
			  <td>
			  	<div class='jChartTab'>
			  	<div class='jChartTitle'>Overall Campaign Performance</div>
			  	<div class='jChartBody'>
			  		<div id="div_overall_performance" style="margin-top:10px;top:10px;width: 460px; height: 240px;">
			  		<div class='jLoading'></div>
			  		</div>
			  	</div> 
			  	</div>
			  </td>
			  <td rowspan='2'>
			  	<div class='jChartTabBig'>
			  	<div class='jChartTitle'>Account Statistics</div>
			  	<div class='jChartBody' style="padding-left:20px">
			  	
				  	<table id="tbl_average">
				  	<tr>
					  	<td><h3>Account Average</h3></td>
					  	<td><div class='jOpenRate'></div></td>
					  	<td><div class='jClickRate'></div></td>
					  	<td><div class='jUnSubsRate'></div></td>
				  	</tr>
				  	<tr>
				  		<td colspan='4'>
				  		<table width="100%" style="background-color:white;border:1px solid rgb(240,240,240)" cellpadding="2" cellspacing="0" >
				  		<tr class="tblHR">
					  		<th  colspan="3" align="left">Subscriber Stastics</th>
					  		<th align="right" style="padding-right:7px;"><a title="Refresh Statistics" href="javascript:getSubscriberStats()">
					  		<img id="idRefreshStats" src="${urlLoading}"/></a> 
					  		</th>
				  		</tr>
				  		<tr class="tblRow-Nc">
				  			<th width="200" align='left'>Total Subscribers</th><th align='left' colspan="3"><span id="totalSubscribers"></span></th>
				  		</tr>
				  		<tr class="tblRow-Nc">
				  			<td>New Subscribers Today</td><td style='background-color:rgb(249,249,249);'  width="75" align='center'><span id="subscribersToday"></span></td>
				  			<td width="200">Un Subscribers Today</td><td style='background-color:rgb(249,249,249);' width="75" align='center'><span id="unSubscribersToday"></span></td>
				  		</tr>				  		
				  		<tr class="tblRow-Nc">
				  			<td>New Subscribers This Week</td><td style='background-color:rgb(249,249,249);' align='center'><span id="subscribersWeek"></span></td>
				  			<td>Un Subscribers This Week</td><td style='background-color:rgb(249,249,249);' align='center'><span id="unSubscribersWeek"></span></td>
				  		</tr>		
				  		<tr class="tblRow-Nc">
				  			<td>New Subscribers This Month</td><td style='background-color:rgb(249,249,249);' align='center'><span id="subscribersMonth"></span></td>
				  			<td>Un Subscribers This Month</td><td style='background-color:rgb(249,249,249);' align='center'><span id="unSubscribersMonth"></span></td>
				  		</tr>		
				  		<tr class="tblRow-Nc">
				  			<td>New Subscribers This Year</td><td style='background-color:rgb(249,249,249);' align='center'><span id="subscribersYear"></span></td>
				  			<td>Un Subscribers This Year</td><td style='background-color:rgb(249,249,249);' align='center'><span id="unSubscribersYear"></span></td>
				  		</tr>		
				  		</table>
				  		</td>
				  	</tr>
				  	<tr>
				  		<td colspan='4'>
				  		<table width="100%" style="background-color:white;border:1px solid rgb(240,240,240)" cellpadding="2" cellspacing="0" >
				  		<thead>
					  		<tr class="tblHR">
						  		<th  colspan="4" align="left">Recent Mail Campaigns</th>
						  		<th align="right" style="padding-right:7px;">
						  		<a title="Refresh Mail Campaigns" href="javascript:getRecentCampaigns()">
						  		<img id="idRefreshCampaign" src="${urlLoading}"/></a> 
						  		</th>
					  		</tr>
					  		<tr>
					  			<th align="left">Date</th><th align="left">Time</th><th align="left">Mail Subject</th><th align="left">Sent To</th><th>Status</th>
					  		</tr>
				  		</thead>				  		
				  		<tbody id="idTblCampaigns">
				  			
				  		</tbody>
				  		</table>
				  		</td>
				  	</tr>
				  	<tr>
				  	<td colspan='4'>
				  	<div class='jTip' style="width:400px;"><strong>Note :</strong> Please talk to administrator if you notice error icon in status field above.</div>
				  	</td>
				  	</tr> 
				  	</table>
			  	</div>
			  	</div>
			  </td>
			  </tr>
			  <tr><td>
			  	<div class='jChartTab'>	 
			  	<div class='jChartTitle'>GEO Track Subscribers</div>   
			  	<div class='jChartBody'>
			  		<div id="div_geo_subscribers" style="margin-top:4px;top:4px;width: 460px; height: 240px;">
			  		<div class='jLoading'></div>
			  		</div>
			  	</div>      
	          	</div>
			  </td></tr>
			  </table> 
			  </j:ContentArea> 
 </j:Page> 
 
<script type="text/javascript"> 
 
google.load('visualization', "1", {packages:['corechart','geomap']}); 

function drawPerformanceChart(performanceVO){
		
	  var data = new google.visualization.DataTable();
	  
	  data.addColumn('string', 'Action');
	  data.addColumn('number', 'Count');
	  data.addRows(3);
	  data.setValue(0, 0, 'Sent Mails');
	  data.setValue(0, 1, performanceVO.sentCount);
	  data.setValue(1, 0, 'Opened');
	  data.setValue(1, 1, performanceVO.openCount);
	  data.setValue(2, 0, 'Unopened');
	  data.setValue(2, 1, performanceVO.unOpenCount);
	  
	  var opens=0.0;
	  if(performanceVO.openCount>0){
	  	opens=Math.round((performanceVO.openCount/performanceVO.sentCount)*100);
	  }
	  
	  $('.jOpenRate').html('Open Rate ' + opens + '%');
	  $('.jClickRate').html('Click Rate ' + opens + '%');
	  $('.jUnSubsRate').html('UnSubscribes ' + 0 + '%');

	  new google.visualization.PieChart(document.getElementById('div_overall_performance')).draw(data, {is3D: true});

	  
}

function drawGEOMap(geoList){ 
	  var data = new google.visualization.DataTable();
	  data.addColumn('string', 'Country');
	  data.addColumn('number', 'Subscribers');

	  var options={};
	  options['colors'] =[0xE0FFD4, 0xA5EF63, 0x50AA00, 0x267114];
	  options['width']='460';
	  options['height']='240'; 
	  
	  var ln= geoList.length;
	  data.addRows(ln);
	  
	  for(var i=0;i<ln;i++){
		  data.setValue(i, 0, geoList[i].countryCode);
		  data.setValue(i, 1, geoList[i].customerCount); 
	  }
	  
	  new google.visualization.GeoMap(document.getElementById('div_geo_subscribers')).draw(data,options); 
}

function viewSubscriberStats(statsVO){
	$('#totalSubscribers').html(statsVO.totalSubscribers);
	$('#subscribersToday').html(statsVO.subscribersToday);
	$('#subscribersWeek').html(statsVO.subscribersWeek);
	$('#subscribersMonth').html(statsVO.subscribersMonth);
	$('#subscribersYear').html(statsVO.subscribersYear);
	$('#unSubscribersToday').html(statsVO.unSubscribersToday);
	$('#unSubscribersWeek').html(statsVO.unSubscribersWeek);
	$('#unSubscribersMonth').html(statsVO.unSubscribersMonth);
	$('#unSubscribersYear').html(statsVO.unSubscribersYear);
	$("#idRefreshStats").attr("src","${urlRefresh}");
}

$(function(){  
	jReports.getOverallPerformance({callback:drawPerformanceChart,errorHandler:remoteErrorHandler}); 
	
	jReports.getGEOTracker({callback:drawGEOMap,errorHandler:remoteErrorHandler});

	getSubscriberStats();
	
	getRecentCampaigns();		 
}); 

function viewMailCampaigns(campaignList){ 
	var ln= campaignList.length;
	for(var i=0;i<ln;i++){
		var cvo=campaignList[i]; 
		var strRow='<tr class="tblRow-Nc"><td>'+ formatDate(cvo.deliveryTime) +'</td>';
		strRow+='<td>'+ formatTime(cvo.deliveryTime)  +'</td>';
		strRow+='<td>'+ cvo.mailSubject +'</td>';
		strRow+='<td>'+ cvo.contactCount +' Contacts</td>';
			if(cvo.deliveryStatusId==3){
				strRow+='<td align="center"><img src="${successUrl}"/></td>';
			}else{
				strRow+='<td align="center"><img src="${failUrl}"/></td>';
			}
		strRow+='</tr>';
		$('#idTblCampaigns').append(strRow); 
	}
	$("#idRefreshCampaign").attr("src","${urlRefresh}");
}

function getRecentCampaigns(){
	$("#idRefreshCampaign").attr("src","${urlLoading}");
	$('#idTblCampaigns').html(""); 
	jReports.getRecentMailCampaigns({callback:viewMailCampaigns,errorHandler:remoteErrorHandler}); 
}

function getSubscriberStats(){
	$("#idRefreshStats").attr("src","${urlLoading}");
	jReports.getSubscriberStats({callback:viewSubscriberStats,errorHandler:remoteErrorHandler}); 
} 
</script>
</j:HtmlBody>
</j:Html>
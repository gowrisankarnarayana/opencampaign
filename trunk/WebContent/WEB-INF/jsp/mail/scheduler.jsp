<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html" %>
<%@taglib prefix="logic" uri="http://joompal.com/beyondcontact/struts-logic" %>
<%@taglib prefix="bean"  uri="http://joompal.com/beyondcontact/struts-bean" %>
<%@taglib prefix="c"  	 uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<j:Html>
<j:HtmlHeader>
<title>Beyond Contact - Mail Home </title> 
<style>
.ui-state-default ui-corner-top{
color:white !important;
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
                    </j:SideBar>
                    <j:Content>
                    
                    <j:Block blockHeading="Mail Schedule"> 
						<script type="text/javascript">
							$(function() {
								$("#tabs").tabs();
							});
						</script> 
					<div class="demo"> 
						<c:url value="/images/icons/shape_move_forwards.png" var="appExtUrl"/>
		                <c:url value="/images/icons/cross.png" var="crossUrl"/>
		                <c:url value="/images/icons/16x16/time.png" var="clockUrl"/>   
		                <c:url value="/images/icons/16x16/date.png" var="dateUrl"/>
						<div id="tabs"> 
							<ul>
								<li><a class='c' href="#tabs-1">Send Once</a></li>
								<li><a class='c' href="#tabs-2">Daily Schedule</a></li>
								<li><a class='c' href="#tabs-3">Weekly Schedule</a></li>
								<li><a class='c' href="#tabs-4">Monthly Schedule</a></li>
							</ul>
							<div id="tabs-1">
		 						<table id="tbl_id_sent" style="border:1px solid rgb(240,240,240)" cellspacing="0">
		                    	<thead>
		                    		<tr id='tblHR'><th width="35"></th><th width="300">Template Name</th><th width="135">Delivery Date</th><th width="100">Delivery Time</th></tr>
		                    	</thead> 
		                    	<tbody> 
		                    	<c:forEach items="${sessionScope.userMails}" var="mailVO"> 
		                    	<c:choose>
		                    	<c:when test="${mailVO.mailScheduleVO.deliveryPatternId eq 800}">
									<tr onclick="javascript:toggleDisplay('div_delivery_${mailVO.mailerId}')" id='tblRow'>
										<td width="35" align="center"><img src="${appExtUrl}"/></td>
										<td width="300">${mailVO.templateName}</td>
										<td width="150" valign="middle">${mailVO.mailScheduleVO.startDate}</td> 
										<td width="150" valign="middle"><img src="${clockUrl}"/>${mailVO.mailScheduleVO.sendHours}:${mailVO.mailScheduleVO.sendMinutes}</td> 
								 	</tr>
								 	<tr> 
								 		<td></td>
								 		<td colspan='4'>
								 		<j:Window title="Delivery Log" display="none" id="div_delivery_${mailVO.mailerId}">
									 		<table style="border:1px solid rgb(240,240,240)" cellspacing="0"  width='100%'>
											<thead>
				                    		<tr id='tblHR'><th>Delivery Date</th><th>Delivery Time</th><th>Delivery Status</th></tr>
				                    		</thead>  
				                    		<tbody> 
				                    		<c:forEach items="${mailVO.deliveryLog}" var="delLog">
				                    			 <tr id='tblRow-Nc'> 
				                    			 <td width="150"><fmt:formatDate type="date" value="${delLog.deliveryTime}" /></td> 
												 <td width="150"><fmt:formatDate type="time" value="${delLog.deliveryTime}" /></td>
												 <td width="250">${delLog.deliveryStatus}</td>
											 	 </tr>
											</c:forEach>
				                    		</tbody>
				                    		</table> 
										</j:Window>
								 		</td>
								 	</tr>
								</c:when> 
								</c:choose>						 	
								</c:forEach>
		                    	</tbody>
		                    	</table> 
	                    	</div>
							<div id="tabs-2">
							  	<table id="tbl_id_sent" style="border:1px solid rgb(240,240,240)" cellspacing="0" cellpadding="0">
		                    	<thead>
		                    		<tr id='tblHR'><th width="50"></th><th width="400">Template Name</th><th width="110">Start Date</th><th width="110">End Date</th><th width="125">Delivery Time</th></tr>
		                    	</thead> 
		                    	<tbody> 
		                    	<c:forEach items="${sessionScope.userMails}" var="mailVO" varStatus="status">
		                    	<c:choose>
		                    	<c:when test="${mailVO.mailScheduleVO.deliveryPatternId eq 500}">
									<tr id='tblRow' onclick="javascript:toggleDisplay('div_delivery_${mailVO.mailerId}')">
										<td style='background-color:rgb(249,249,249);' align="center" width="35"><img src="${appExtUrl}"/></td>
										<td>${mailVO.templateName}</td>
										<td valign="middle">${mailVO.mailScheduleVO.startDate}</td>
										<td valign="middle">${mailVO.mailScheduleVO.endDate}</td>
										<td valign="middle"><img src="${clockUrl}"/>${mailVO.mailScheduleVO.sendHours}:${mailVO.mailScheduleVO.sendMinutes}</td> 
								 	</tr>	
								 	<tr>
								 		<td></td>
								 		<td colspan='4'>
								 		<j:Window title="Delivery Log" display="none" id="div_delivery_${mailVO.mailerId}">
									 		<table style="border:1px solid rgb(240,240,240)" cellspacing="0"  width='100%'>
											<thead>
				                    		<tr id='tblHR'><th width="35"></th><th>Delivery Date</th><th>Delivery Time</th><th>Delivery Status</th></tr>
				                    		</thead>   
				                    		<tbody> 
				                    			<c:forEach items="${mailVO.deliveryLog}" var="dailyLog" varStatus="status">
				                    			 <tr id='tblRow'> 
				                    			 <td style='background-color:rgb(249,249,249);' align="center">${status.count}</td> 
												 <td width="150" ><fmt:formatDate type="date" value="${dailyLog.deliveryTime}" /></td> 
												 <td><fmt:formatDate type="time" value="${dailyLog.deliveryTime}" /></td>
												 <td>${dailyLog.deliveryStatus}</td>
											 	 </tr>
												</c:forEach>
				                    		</tbody>
				                    		</table> 
										</j:Window>
								 		</td>
								 	</tr>
								</c:when> 
								</c:choose>						 	
								</c:forEach>
		                    	</tbody>
		                    	</table> 
							</div>
							<div id="tabs-3">
							  	<table id="tbl_id_sent" style="border:1px solid rgb(240,240,240)" cellspacing="0" cellpadding="0" width="100%">
		                    	<thead>
		                    		<tr id='tblHR'><th width="35"></th><th>Template Name</th><th>Start Date</th><th>End Date</th><th align="center">Delivery Time</th><th align="center">Sent To</th><th align="center">Open Count</th></tr>
		                    	</thead> 
		                    	<tbody> 
		                    	<c:forEach items="${sessionScope.userMails}" var="mailVO" varStatus="status">
		                    	<c:choose>
		                    	<c:when test="${mailVO.mailScheduleVO.deliveryPatternId eq 600}">
									<tr id='tblRow' onclick="javascript:toggleDisplay('div_delivery_${mailVO.mailerId}')">
										<td style='background-color:rgb(249,249,249);' align="center"><img src="${appExtUrl}"/></td>
										<td>${mailVO.templateName}</td>
										<td>${mailVO.mailScheduleVO.startDate}</td>
										<td>${mailVO.mailScheduleVO.endDate}</td>
										<td align="center"><img src="${clockUrl}"/>${mailVO.mailScheduleVO.sendHours}:${mailVO.mailScheduleVO.sendMinutes}</td>
										<td align="center">${mailVO.contactCount} Contacts</td>
										<td align="center">${mailVO.responseCount}</td>
								 	</tr>	
								 	<tr id="tblRow-Hide">
								 		<td></td>
								 		<td colspan='4'>
								 		<j:Window title="Delivery Log" display="none" id="div_delivery_${mailVO.mailerId}">
									 		<table style="border:1px solid rgb(240,240,240)" cellspacing="0"  width='100%'>
											<thead>
				                    		<tr id='tblHR'><th></th><th>Delivery Date</th><th>Delivery Time</th><th>Delivery Status</th></tr>
				                    		</thead>   
				                    		<tbody> 
				                    			<c:forEach items="${mailVO.deliveryLog}" var="dailyLog" varStatus="status">
				                    			 <tr id='tblRow'> 
				                    			 <td style='background-color:rgb(249,249,249);' align="center">${status.count}</td>
				                    			 <td>${dailyLog.deliveryDate}</td>
												 <td><fmt:formatDate type="time" value="${dailyLog.deliveryTime}" /></td>
												 <td>${dailyLog.deliveryStatus}</td>
											 	 </tr>
												</c:forEach>
				                    		</tbody>
				                    		</table> 
										</j:Window>
								 		</td>
								 	</tr>
								</c:when> 
								</c:choose>						 	
								</c:forEach>
		                    	</tbody>
		                    	</table> 
							</div>
							<div id="tabs-4">
									<table id="tbl_id_sent" style="border:1px solid rgb(240,240,240)" cellspacing="0" cellpadding="0" width="100%">
			                    	<thead> 
			                    		<tr id='tblHR'><th width="35"></th><th>Template Name</th><th>Start Date</th><th>End Date</th><th align="center">Delivery Time</th><th align="center">Sent To</th><th align="center">Open Count</th></tr>
			                    	</thead> 
			                    	<tbody> 
			                    	<c:forEach items="${sessionScope.userMails}" var="mailVO" varStatus="status">
			                    	<c:choose>
			                    	<c:when test="${mailVO.mailScheduleVO.deliveryPatternId eq 700}">
										<tr id='tblRow' onclick="javascript:toggleDisplay('div_delivery_${mailVO.mailerId}')">
											<td style='background-color:rgb(249,249,249);' align="center"><img src="${appExtUrl}"/></td>
											<td>${mailVO.templateName}</td>
											<td>${mailVO.mailScheduleVO.startDate}</td>
											<td>${mailVO.mailScheduleVO.endDate}</td>
											<td align="center"><img src="${clockUrl}"/>${mailVO.mailScheduleVO.sendHours}:${mailVO.mailScheduleVO.sendMinutes}</td>
											<td align="center">${mailVO.contactCount} Contacts</td>
											<td align="center">${mailVO.responseCount}</td>
									 	</tr>	
									 	<tr id="tblRow-Hide">
									 		<td></td>
									 		<td colspan='4'>
									 		<j:Window title="Delivery Log" display="none" id="div_delivery_${mailVO.mailerId}">
										 		<table style="border:1px solid rgb(240,240,240)" cellspacing="0"  width='100%'>
												<thead>
					                    		<tr id='tblHR'><th width="35"></th><th>Delivery Date</th><th>Delivery Time</th><th>Delivery Status</th></tr>
					                    		</thead>   
					                    		<tbody> 
					                    			<c:forEach items="${mailVO.deliveryLog}" var="dailyLog" varStatus="status">
					                    			 <tr id='tblRow'> 
					                    			 <td style='background-color:rgb(249,249,249);' align="center">${status.count}</td>
					                    			 <td>${dailyLog.deliveryDate}</td>
													 <td><fmt:formatDate type="time" value="${dailyLog.deliveryTime}" /></td>
													 <td>${dailyLog.deliveryStatus}</td>
												 	 </tr>
													</c:forEach>
					                    		</tbody>
					                    		</table> 
											</j:Window>
									 		</td>
									 	</tr>
									</c:when> 
									</c:choose>						 	
									</c:forEach>
			                    	</tbody>
			                    	</table> 
								</div>
						</div>
					</div>	 
					</j:Block>
                    </j:Content>
               </j:ContentArea>
</j:Page>
</j:HtmlBody>
</j:Html>
                    
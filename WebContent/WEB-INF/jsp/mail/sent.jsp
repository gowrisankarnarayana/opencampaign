<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html" %>
<%@taglib prefix="logic" uri="http://joompal.com/beyondcontact/struts-logic" %>
<%@taglib prefix="bean"  uri="http://joompal.com/beyondcontact/struts-bean" %>
<%@taglib prefix="c"  	 uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn"    uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<%@page import="com.beyond.constants.*" %>
<j:Html>  
<j:HtmlHeader> 
<title>Beyond Contact - Mail Home </title>
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
                    <j:Block blockHeading="Sent Mail"> 
                    <c:choose>
                    <c:when test="${empty sessionScope.mailDeliveryLog}">
                    	<div class="ui-widget" style="width:300px;"> 
								<div class="ui-state-highlight ui-corner-all" style="margin: 20px; padding: 0 .7em;"> 
									<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span> 
									<strong>Hey!</strong> No mails delivered yet </p> 
								</div> 
						 </div>            
                    </c:when>
                    <c:otherwise>
                    <div id="div_id_sent">
                    
                    <c:url value="/images/icons/16x16/time.png" var="clockUrl"/>  
                    <c:url value="/images/icons/16x16/tick.png" var="successUrl"/>    
                    <c:url value="/images/icons/16x16/exclamation.png" var="failUrl"/>
                    
                   	 <!-- Start : Required for pagination -->
		             <c:set value="<%=ApplicationConstants.DEFAULT_PAGE_SIZE%>" var="pageSize"/> 
		             <c:choose>
                     <c:when test="${empty param.s}"><c:set var="rowStart" value="1"/></c:when>
                     <c:otherwise><c:set var="rowStart" value="${param.s}"/></c:otherwise>
                     </c:choose>
                     <c:choose>
                     <c:when test="${empty param.e}"><c:set var="rowEnd" value="${pageSize}"/></c:when>
	                 <c:otherwise><c:set var="rowEnd" value="${param.e}"/></c:otherwise>
	                 </c:choose>
		             <!-- End : Required For Pagination -->
                     
                   	<table id="tbl_id_sent" style="border:1px solid rgb(240,240,240)" cellspacing="0"  width="100%">
                   	<thead>
                   		<tr id='tblHR'><th></th><th>Date</th><th>Time</th><th>Mail Subject</th><th>Template Name</th><th>Sent To</th><th></th></tr>
                   	</thead> 
                   	<tbody>
                   	
                   	<c:forEach items="${sessionScope.mailDeliveryLog}" begin="${rowStart-1}" step="1" end="${rowEnd-1}" varStatus="status" var="mailDelVO" >
						<tr id='tblRow' style="height:22px;">
							<td width="35" align="center"><img src="${clockUrl}"/></td>
							<td width="100"><fmt:formatDate type="date" value="${mailDelVO.deliveryTime}" /></td> 
							<td><fmt:formatDate type="time" value="${mailDelVO.deliveryTime}" /></td>
							 <td>${mailDelVO.mailSubject}</td>
							<td>${mailDelVO.templateName}</td>
							<td>${mailDelVO.contactCount} Contacts</td> 
							<c:choose>
							<c:when test="${3 eq mailDelVO.deliveryStatusId}">
								<td><img src="${successUrl}"></img></td>
							</c:when>
							<c:otherwise>
								<td><img title="${mailDelVO.errorMessage}" src="${failUrl}"></img></td>
							</c:otherwise>
							</c:choose>
					 	</tr> 	
					</c:forEach>
                   	</tbody>
                   	
                   	<!-- Start Pagination -->
                   	<c:set value="${fn:length(sessionScope.mailDeliveryLog)}" var="rLen"/> 
                   	
                   	<c:choose>
                   	<c:when test="${rLen lt rowEnd}"><c:set var="rCurrEnd" value="${rLen}"/></c:when>
                   	<c:otherwise><c:set var="rCurrEnd" value="${rowEnd}"/></c:otherwise>
                   	</c:choose>
                   	
                   	<tr id='tblHR'> 
                   		<td colspan="2">&nbsp;Showing ${rowStart}/${rCurrEnd} of ${rLen}
                  			</td>
                  			<td colspan="4" align="right">
                  				
                  				<c:if test="${rowStart gt 1}">
                  				<c:url value="/mailer.do?mx=viewSentMail&route=mailers/sentMail/sent&s=${rowStart-pageSize}&e=${rowEnd-pageSize}" var="urlPrev"/>
                  				<a href="${urlPrev}">&lt;&nbsp;Prev</a>&nbsp;
                  				</c:if>
                  				
                  				<c:forEach var="pStart" varStatus="status" begin="0" end="${rLen-1}" step="${pageSize}">
	                   			<c:url value="/mailer.do?mx=viewSentMail&route=mailers/sentMail/sent&s=${pStart+1}&e=${pStart+pageSize}" var="urlCurr"/>
	                   			
	                   			<span class="jPageNum">
	                   			<a href="${urlCurr}">&nbsp;${status.count}&nbsp;</a>
	                   			</span> &nbsp; 
	                   			
                  				</c:forEach>
                  				
                  				<c:if test="${rowEnd lt rLen}">
                  				<c:url value="/mailer.do?mx=viewSentMail&route=mailers/sentMail/sent&s=${rowStart+pageSize}&e=${rowEnd+pageSize}" var="urlNext"/>
                  				<a href="${urlNext}">Next&nbsp;&gt;</a>&nbsp;
                  				</c:if>
                  			</td>
                  			<td></td>
               		</tr>
               		<!-- End Pagination --> 
                   	</table>        	
                    </div>  
                    </c:otherwise>
                    </c:choose>
                    </j:Block>
                    </j:Content>
               </j:ContentArea>
</j:Page> 
</j:HtmlBody>
</j:Html>
                    
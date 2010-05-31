<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html" %>
<%@taglib prefix="logic" uri="http://joompal.com/beyondcontact/struts-logic" %>
<%@taglib prefix="bean"  uri="http://joompal.com/beyondcontact/struts-bean" %> 
<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<%@taglib prefix="c"  	 uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn"    uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@page import="com.beyond.constants.*" %>
<j:Html>
<j:HtmlHeader> 
<title>Beyond Contact - Free Email Marketing Templates Home </title>
<script type='text/javascript' src='${pageContext.request.contextPath}/dwr/interface/jTemplates.js'></script>
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
                    <j:Block blockHeading="Browse your templates">  
                    <!-- Load screen only when templates are available -->
                    <c:choose>
                    <c:when test="${empty sessionScope.templateHolder.dynamicTemplates && empty sessionScope.templateHolder.staticTemplates }">    
                      <div class="ui-widget" style="display:none"> 
						<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;"> 
							<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span> 
							<strong>Hey!</strong> You have not created any templates yet</p> 
						</div> 
				 	  </div>                  
                     </c:when>
                     <c:otherwise> 
                     <c:url value="/images/icons/delete.png" var="delImg" />
             	     <c:url value="/images/icons/16x16/email_go.png" var="urlMail" />
		             
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
		             
		             <!-- Start : Default template type is set to static -->
		             <c:choose>
			         <c:when test="${not empty param.typeId}"><c:set var="typeId" value="${param.typeId}"/></c:when>
			         <c:otherwise><c:set var="typeId" value="2"/></c:otherwise>
			         </c:choose>
			         <!-- End : Default template type is set to static -->
			         
                       <!-- Start : If template type is dynamic -->
                       <c:if test="${typeId eq 1}">
                      	<c:choose>
                          <c:when test="${not empty sessionScope.templateHolder.dynamicTemplates }"> 
                       <table width="100%" cellspacing="0" cellpadding="0px">
                       <tr><td width="100%" valign="top"> 
                       	<div id="accordion">   
                      	 <!-- <h3><a href='#'> Dynamic Templates </a></h3>  -->
                     	 	 <div>
	                      <table style="background-color:white;border:1px solid rgb(240,240,240)" cellpadding="2px" cellspacing="0px" width="100%">
	                      <tr id="tblHR"><td align='center'>Sno</td><td>Template Name</td><td  align="center">Sent</td><td>Last Sent</td><td  align="center">Received</td><td>Created By</td><td>Created On</td><td></td><td></td><td valign='middle'></td></tr>
                             	<c:forEach items="${sessionScope.templateHolder.dynamicTemplates}"  begin="${rowStart-1}" step="1" end="${rowEnd-1}" var="templateVO" varStatus="status">
                         	<tr id='tblRow' onclick="javascript:viewTemplate(${templateVO.templateId},'1');">
	                         	<td style='background-color:rgb(249,249,249);' align='center'>${status.count}</td>
	                         	<td>${templateVO.name}</td>
	                         	<td  align="center">${templateVO.sentCount}</td>
	                         	<td width="100" ><fmt:formatDate type="date" value="${templateVO.lastSentOn}" /></td> 
	                         	<td  align="center">${templateVO.responseCount}</td>
	                            <td>${templateVO.createdBy}</td>
		                        <td>${templateVO.createdOn}</td>
		                        <td><div class="jEdit"></div></td> 
		                        <td>
		                        <c:url value="/mailer.do?mx=newMail&route=mailers/composeMail/new&tId=${templateVO.templateId}" var="mUrl" />
		                        <a href="${mUrl}"><img title="Mail this template" src="${urlMail}"></a>
		                        </td>
		                        <td onclick="javascript:deleteTemplate(${templateVO.templateId},${templateVO.sentCount},this)" title="Delete template"  width='36'><div class="jDelete"></div></td>
	                        </tr>
                         	</c:forEach>
                         	<!-- Start Pagination -->
		                    	<c:set value="${fn:length(sessionScope.templateHolder.dynamicTemplates)}" var="rLen"/>
		                    	<c:choose>
		                    	<c:when test="${rLen lt rowEnd}"><c:set var="rCurrEnd" value="${rLen}"/></c:when>
		                    	<c:otherwise><c:set var="rCurrEnd" value="${rowEnd}"/></c:otherwise>
		                    	</c:choose>
		                    	<tr class='tblHR'> 
		                    		<td colspan="2">&nbsp;Showing ${rowStart}/${rCurrEnd} of ${rLen}</td>
		                   			<td colspan="7" align="right">
		                   				<c:if test="${rowStart gt 1}">
		                   				<c:url value="/templates.do?mx=showTemplates&route=templates/viewTemplates/view&typeId=1&s=${rowStart-pageSize}&e=${rowEnd-pageSize}" var="urlPrev"/>
		                   				<a href="${urlPrev}">&lt;&nbsp;Prev</a>&nbsp;
		                   				</c:if>
		                   				<c:forEach var="pStart" varStatus="status" begin="0" end="${rLen-1}" step="${pageSize}">
			                   			<c:url value="/templates.do?mx=showTemplates&route=templates/viewTemplates/view&typeId=1&s=${pStart+1}&e=${pStart+pageSize}" var="urlCurr"/>
			                   			<span class="jPageNum">
			                   			<a href="${urlCurr}">&nbsp;${status.count}&nbsp;</a>
			                   			</span> &nbsp;
		                   				</c:forEach>
		                   				<c:if test="${rowEnd lt rLen}">
		                   				<c:url value="/templates.do?mx=showTemplates&route=templates/viewTemplates/view&typeId=1&s=${rowStart+pageSize}&e=${rowEnd+pageSize}" var="urlNext"/>
		                   				<a href="${urlNext}">Next&nbsp;&gt;</a>&nbsp;
		                   				</c:if>
		                   			</td><td></td>
		                   		</tr>
	                   		<!-- End Pagination -->
			                   </table>
			                   </div>
				               </div>
			                   </td>
			                  </tr>
			                  </table>  
				             </c:when>   
				        </c:choose>
				    </c:if>
			    	<!-- End : If template type is dynamic -->
				    
				    <!-- Start : If template type is static -->    
			        <c:if test="${typeId eq 2}">
			        <c:choose>
                          <c:when test="${not empty sessionScope.templateHolder.staticTemplates}">
	                   		 <div id="accordion">   
		                   		 <!-- <h3><a href="#">Static Templates</a></h3> -->
		                   		 <div>
		                         <table style="background-color:white;border:1px solid rgb(240,240,240)" cellpadding="2px" cellspacing="0px" width="100%">
		                          <tr id="tblHR"><td align='center'>Sno</td><td>Template Name</td><td align="center">Sent</td><td>Last Sent</td><td width="200">Created By</td><td>Created On</td><td></td><td></td><td></td></tr>
		                         	<c:forEach items="${sessionScope.templateHolder.staticTemplates}" var="templateVO"  varStatus="status"  begin="${rowStart-1}" step="1" end="${rowEnd-1}">
		                         	<tr title="Click to view template" id='tblRow' onclick="javascript:viewTemplate(${templateVO.templateId},'0');" >
		                         	<td style='background-color:rgb(249,249,249);' align='center'>${status.count}</td>
		                         	<td>${templateVO.name}</td>
		                         	<td align="center">${templateVO.sentCount}</td> 
		                         	<td width="100" ><fmt:formatDate type="date" value="${templateVO.lastSentOn}" /></td> 
		                         	<td>${templateVO.createdBy}</td>
			                        <td>${templateVO.createdOn}</td>
			                        <td><div class="jEdit"></div></td> 
			                        <td>
			                        <c:url value="/mailer.do?mx=newMail&route=mailers/composeMail/new&tId=${templateVO.templateId}" var="mUrl" />
			                        <a href="${mUrl}"><img  title="Mail this template" src="${urlMail}"></img></a>
			                        </td>
			                        <td onclick="javascript:deleteTemplate(${templateVO.templateId},${templateVO.sentCount},this)" title="Delete template"  width='36'><div class="jDelete"></div></td>
			                        </tr>
		                         	</c:forEach>
		                         	<!-- Start Pagination -->
				                    	<c:set value="${fn:length(sessionScope.templateHolder.staticTemplates)}" var="rLen"/> 
				                    	<c:choose>
				                    	<c:when test="${rLen lt rowEnd}"><c:set var="rCurrEnd" value="${rLen}"/></c:when>
				                    	<c:otherwise><c:set var="rCurrEnd" value="${rowEnd}"/></c:otherwise>
				                    	</c:choose>
				                    	<tr class="tblHR"> 
				                    		<td colspan="2">Showing ${rowStart}/${rCurrEnd} of ${rLen}</td>
				                   			<td colspan="6" align="right">
				                   				<c:if test="${rowStart gt 1}">
				                   				<c:url value="/templates.do?mx=showTemplates&route=templates/viewTemplates/view&typeId=2&s=${rowStart-pageSize}&e=${rowEnd-pageSize}" var="urlPrev"/>
				                   				<a href="${urlPrev}">&lt;&nbsp;Prev</a>&nbsp;
				                   				</c:if>
				                   				<c:forEach var="pStart" varStatus="status" begin="0" end="${rLen-1}" step="${pageSize}">
					                   			<c:url value="/templates.do?mx=showTemplates&route=templates/viewTemplates/view&typeId=2&s=${pStart+1}&e=${pStart+pageSize}" var="urlCurr"/>
					                   			<span class="jPageNum">
					                   			<a href="${urlCurr}">&nbsp;${status.count}&nbsp;</a>
					                   			</span> &nbsp;
				                   				</c:forEach>
				                   				<c:if test="${rowEnd lt rLen}">
				                   				<c:url value="/templates.do?mx=showTemplates&route=templates/viewTemplates/view&typeId=2&s=${rowStart+pageSize}&e=${rowEnd+pageSize}" var="urlNext"/>
				                   				<a href="${urlNext}">Next&nbsp;&gt;</a>&nbsp;
				                   				</c:if>
				                   			</td><td></td>
				                   		</tr>
			                   		<!-- End Pagination --> 
		                         </table>
		                         </div>
	                         </div>
		                  </c:when>
				       </c:choose>
				       </c:if> 
			           <!-- End : If template type is dynamic --> 
			           
			           <!-- Used to display template content in a popup window -->
			           <div id="div_template_viewer"></div> 
			           
			           <!-- Used to display confirmation message on deleting template -->
			           <div id="dialog-confirm" title="Delete this template?">
					   <div><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>Template will be permanently deleted and cannot be recovered.<br/><br/><strong>Are you sure?</strong></div>
					   </div>
					   
			           <script type="text/javascript">
						$(function() {
							/*$("#accordion").accordion({
								autoHeight: false,
								navigation: true,
								collapsible: true
							});*/
							$("#div_template_viewer").dialog({ 
								width:750,
								modal: true,
								autoOpen: false, 
								title: 'Template'
							});
							$("#dialog").dialog("destroy"); 
							
							$("#dialog-confirm").dialog({
								resizable: false,
								autoOpen: false, 
								height:175,
								modal: true,
								buttons: {
									'Delete Template': function() {
										jTemplates.deleteTemplateById(tmpId,
												{callback:remoteMessage,errorHandler:remoteErrorHandler} 
										); 
										//var rIndex = objCurRow.sectionRowIndex;
										//objCurRow.parentNode.deleteRow(rIndex); 
										$(this).dialog('close');
									},
									Cancel: function() {
										$(this).dialog('close');
									}
								}
							});
						   });
						</script>
						<script>
						var tmpId;
						var objCurRow;
						function viewTemplate(strTempId,strTypeId) {
							jTemplates.getTemplateByIdAndType(strTempId,strTypeId,
									{callback:displayTemplate,errorHandler:remoteErrorHandler}
							); 
						}
						function displayTemplate(data){
						 	document.getElementById('div_template_viewer').innerHTML = data; 
						    $('#div_template_viewer').dialog('open');
						}
						function deleteTemplate(strTempId,lngCount,tdObj){
							window.event.cancelBubble = true; 
							objCurRow=tdObj.parentNode; 
							tmpId=strTempId;
							$("#dialog-confirm").dialog('open');  
						} 
					</script>  
	           </c:otherwise>
	           </c:choose>
             </j:Block>
           </j:Content>
       </j:ContentArea> 
	</j:Page> 
</j:HtmlBody>
</j:Html>
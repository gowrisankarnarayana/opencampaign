<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html" %>
<%@taglib prefix="logic" uri="http://joompal.com/beyondcontact/struts-logic" %>
<%@taglib prefix="bean"  uri="http://joompal.com/beyondcontact/struts-bean" %>
<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>                         
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.lang.management.*" %>
<%@page import="java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.beyond.constants.*" %>
<%@page import="com.beyond.cache.CacheManager"%>
<%
    MemoryMXBean memoryBean = ManagementFactory.getMemoryMXBean();
    pageContext.setAttribute("memoryBean", memoryBean);
    List<MemoryPoolMXBean>  poolBeans = ManagementFactory.getMemoryPoolMXBeans();
    pageContext.setAttribute("poolBeans", poolBeans);
%>
<j:Html>
<j:HtmlHeader>
<title>Welcome to Beyond Contact - Dynamic EMail Marketing Experience</title>
<script type='text/javascript' src='${pageContext.request.contextPath}/dwr/interface/jCacheManager.js'></script>
</j:HtmlHeader>
<j:HtmlBody>
<j:NoScript/>
<j:Page>      
	<j:PageHeader />
            <j:MenuBar>
                	      	
             </j:MenuBar>             
             <j:ContentArea>
                	<j:Content>
						<j:Block blockHeading="Cache Manager">
						
							<%request.setAttribute("cacheList", CacheManager.getCacheStatistics());%>
							<%request.setAttribute("initStatus", ApplicationConstants.CACHE_INITIALIZATION_IN_PROGRESS );%>
							<%request.setAttribute("initSuccess", ApplicationConstants.CACHE_INITIALIZED);%>
							
							<c:set var="cUrl" value="images/icons/ajax-loader.gif"></c:set>
						<table style="background-color:white;border:1px solid rgb(240,240,240)" cellpadding="2px" cellspacing="0px" width="100%">
						<tr id="tblHR"><td>Cache Name</td><td>Cache Entries</td><td>Cache Status</td><td>Last Refreshed</td><td>Action</td></tr>	
						<c:forEach items="${requestScope.cacheList}" var="cacheVO">
						<tr id='l'>
							<td>${cacheVO.cacheName}</td>
							<td>${cacheVO.size}</td>
							<td><strong>${cacheVO.status}</strong></td>
							<td><fmt:formatDate value="${cacheVO.lastInitDate}" type="both" timeStyle="long"/></td>
							<td>
							<c:choose>
							<c:when test="${cacheVO.status eq requestScope.initStatus}"><img src="${cUrl}"/></c:when> 
							<c:when test="${cacheVO.status eq requestScope.initSuccess}"><j:Button label="Refresh Cache" link="javascript:refreshCache('${cacheVO.cacheName}')">Refresh</j:Button>
							</c:when>  
							<c:otherwise>
								<j:Button label="Initialize Cache" link="javascript:initCache('${cacheVO.cacheName}')">Init</j:Button>
							</c:otherwise>
							</c:choose>   
							</td>
						</tr>
						</c:forEach>
						</table>
						<div id='div_result'></div>
                         </j:Block>
                         <j:Block blockHeading="Memory statistics">
						 	  <table width="99%" cellspacing="0" cellpadding="0" style="background-color:white;border:1px solid rgb(240,240,240)">
							    <tr id="tblHR">
							      <td>Usage</td>
							      <td title="The initial amount of memory that the Java virtual machine allocated" class='q'>Init</td>
							      <td title="The amount of used memory" >Used</td> 
							      <td title="The amount of committed memory">Committed</td>
							      <td title="The maximum amount of memory that can be used">Max</td>
							    </tr>
							    <tr id="tblRow-Nc">
							      <td >Heap Memory Usage</td>
							      <td ><fmt:formatNumber value="${memoryBean.heapMemoryUsage.init / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
							      <td ><fmt:formatNumber value="${memoryBean.heapMemoryUsage.used / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
							      <td ><fmt:formatNumber value="${memoryBean.heapMemoryUsage.committed / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
							      <td ><fmt:formatNumber value="${memoryBean.heapMemoryUsage.max / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
							    </tr>
							    <tr id="tblRow-Nc">
							      <td  >Non-heap Memory Usage</td>
							      <td ><fmt:formatNumber value="${memoryBean.nonHeapMemoryUsage.init / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
							      <td ><fmt:formatNumber value="${memoryBean.nonHeapMemoryUsage.used / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
							      <td ><fmt:formatNumber value="${memoryBean.nonHeapMemoryUsage.committed / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
							      <td ><fmt:formatNumber value="${memoryBean.nonHeapMemoryUsage.max / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
							    </tr>
							  </table>
						  <table  width="99%" cellspacing="0" cellpadding="0" style="background-color:white;border:1px solid rgb(240,240,240)">
						    <tr id='tblHR'>
						      <td>Name</td>
						      <td>Usage</td>
						      <td title="The initial amount of memory that the Java virtual machine allocated">Init</td>
						      <td title="The amount of used memory" >Used</td> 
						      <td title="The amount of committed memory">Committed</td>
						      <td title="The maximum amount of memory that can be used">Max</td>
						    </tr> 
						    <c:forEach var="bean" items="${poolBeans}">
						      <tr id="tblRow-Nc">
						        <td width="150">${bean.name}</td> 
						        <td >Memory Usage</td>
						        <td ><fmt:formatNumber value="${bean.usage.init / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
						        <td ><fmt:formatNumber value="${bean.usage.used / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
						        <td ><fmt:formatNumber value="${bean.usage.committed / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
						        <td ><fmt:formatNumber value="${bean.usage.max / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
						      </tr> 
						      <tr id="tblRow-Nc">
						        <td></td>
						        <td >Peak Usage</td>
						        <td ><fmt:formatNumber value="${bean.peakUsage.init / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
						        <td ><fmt:formatNumber value="${bean.peakUsage.used / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
						        <td ><fmt:formatNumber value="${bean.peakUsage.committed / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
						        <td ><fmt:formatNumber value="${bean.peakUsage.max / (1024 * 1024)}" maxFractionDigits="1"/> Mb</td>
						      </tr>
						    </c:forEach>
						  </table>
                         </j:Block>
					</j:Content>
           </j:ContentArea>
    </j:Page>
<script language='javascript'>
function initCache(cacheName){
	jCacheManager.initCache(cacheName,{callback:processResult,errorHandler:remoteErrorHandler});
}
function processResult(data){
	var s='<div class="ui-widget">';
	s=s+'<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">'; 
	s=s+'<p><span class="ui-icon ui-icon-info" style="float:left;margin-right:.3em;"></span>'; 
	s=s+'<strong>Hey!</strong>' + data + '</p>'; 
	s=s+'</div></div>'; 
	$('#div_result').html(s); 
	location.reload(true);
		
}
</script>  
</j:HtmlBody>
</j:Html>

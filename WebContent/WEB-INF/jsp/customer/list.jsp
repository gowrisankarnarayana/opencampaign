<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html" %>
<%@taglib prefix="logic" uri="http://joompal.com/beyondcontact/struts-logic" %>
<%@taglib prefix="bean"  uri="http://joompal.com/beyondcontact/struts-bean" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<%@page import="com.beyond.constants.*" %>
<j:Html>
<j:HtmlHeader>
<title>Beyond Contact - List of customers </title>
<script type='text/javascript' src='${pageContext.request.contextPath}/scripts/util/arrayUtil.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/dwr/interface/jCustomers.js'></script>
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
                    <j:Block blockHeading="List of your contacts">
                    <div id="DIV_CONTACT_SEARCH">
                    <c:set var="dispType" value="3" scope="request" ></c:set>
                    	<jsp:include page="search.jsp"/>                    	
                    </div>
                    </j:Block>
			       </j:Content>
			 </j:ContentArea>
 </j:Page> 
 </j:HtmlBody>
 </j:Html>
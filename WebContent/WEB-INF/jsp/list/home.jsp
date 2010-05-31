<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<j:Html>
<j:HtmlHeader> 
<title>Beyond Contact - Free Email Marketing - User Home </title>
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
           	 </j:ContentArea>
    </j:Page>
</j:HtmlBody>
</j:Html>

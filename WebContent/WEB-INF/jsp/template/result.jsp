<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<j:Html>
<j:HtmlHeader> 
<title>Beyond Contact - Free Email Marketing Templates Home </title>
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
                        <h2>Template Created</h2>
                    </j:Content>
           </j:ContentArea>
    </j:Page>
</j:HtmlBody>
</j:Html>
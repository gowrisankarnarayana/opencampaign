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
                    <j:Block blockHeading="List Subscription Forms">
                    <h3>List of Subscriptions</h3>
                    </j:Block>
                    </j:Content>
           </j:ContentArea>
    </j:Page>
</j:HtmlBody>
</j:Html>
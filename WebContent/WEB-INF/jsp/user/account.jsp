<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<j:Html>
<j:HtmlHeader>
<title>Beyond Contact - Free Email Marketing - User Account </title>
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
                         <j:Block blockHeading="Block 1">Empty Block</j:Block>  
                    </j:SideBar>
                    <j:Content>
                                    <h2>Account Settings</h2>
									                                 
								    <j:Button label="Update" link="#" >Now</j:Button>
                    </j:Content>
           </j:ContentArea>
    </j:Page>
</j:HtmlBody>
</j:Html>
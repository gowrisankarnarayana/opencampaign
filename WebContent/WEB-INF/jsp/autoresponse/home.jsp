<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<j:Html>
<j:HtmlHeader> 
<title>Beyond Contact - Free Email Marketing</title>
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
                        <h2>Auto Responders!</h2>
						<p>Autoresponders are emails that you can set up to be sent automatically to your subscribers at different intervals after they subscribe.</p>
						<p>You can use autoresponders to send a series of emails to your subscribers or as follow up emails</p>
                    </j:Content>
           </j:ContentArea>
    </j:Page>
</j:HtmlBody>
</j:Html>
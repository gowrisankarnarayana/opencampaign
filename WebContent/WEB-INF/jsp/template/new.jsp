<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html" %>
<%@taglib prefix="logic" uri="http://joompal.com/beyondcontact/struts-logic" %>
<%@taglib prefix="bean"  uri="http://joompal.com/beyondcontact/struts-bean" %>
<%@taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="j"     uri="http://joompal.com/beyondcontact/ui-tags" %>
<%@page import="com.beyond.constants.*" %>
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
                      <j:Block blockHeading="Select Template Type"> 
						 <c:url value="/images/icons/32x32/forms.png" var="urlFrm"/>
						 <c:url value="/images/icons/32x32/templates.png" var="urlTmp"/>
						 <c:url value="/images/banners/staticTemplates.png" var="urlSt"/>
						 <c:url value="/images/banners/dynamicTemplates.png" var="urlDn"/>
					<table style="height:300px;"><tr><td width="225">
						 <table width="100%" align="center">
                      	 <tr><td valign="middle" align="center">
					 	 	<div class="btnStatic" style="width:200px;"><table cellspacing="2" cellpadding="0"><tr><td>
					 	 	<img style="float:right" src="${urlTmp}"/></td><td>Static Template
					 	 	</td></tr></table>
					 	 	</div>
						 </td>
						 </tr><tr>
						 <td valign="middle" align="center">
							<div class="btnDynamic" style="width:200px;"><table cellspacing="2" cellpadding="0"><tr><td>
							<img style="float:left" src="${urlFrm}"/></td><td>Dynamic Template
							</td></tr></table>
							</div> 
						 </td></tr>
						 </table>
					 </td><td>
					 <img id="idDesc" src="${urlSt}"/>
					 </td></tr></table>
                   	  </j:Block>        
					</j:Content>
     </j:ContentArea>
    </j:Page> 
</j:HtmlBody>
<script>
$(function(){
	$('.btnStatic').button();
	$('.btnDynamic').button();  

	$('.btnDynamic').click(function(){
		window.location="${pageContext.request.contextPath}/templates.do?mx=newTemplate&route=templates/new/dynamicTemplate";
		}); 
	$('.btnStatic').click(function(){
		window.location="${pageContext.request.contextPath}/templates.do?mx=newTemplate&route=templates/new/staticTemplate";
		}); 
	$('.btnStatic').hover(function(){ 
				$('#idDesc').attr("src", "${urlSt}");
		}); 
	$('.btnDynamic').hover(function(){ 
				$('#idDesc').attr("src", "${urlDn}");
		});
	
	 
}); 
</script>
</j:Html>                            
<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html" %>
<%@taglib prefix="logic" uri="http://joompal.com/beyondcontact/struts-logic" %>
<%@taglib prefix="bean"  uri="http://joompal.com/beyondcontact/struts-bean" %>
<%@taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="j"     uri="http://joompal.com/beyondcontact/ui-tags" %>
<%@page import="com.beyond.constants.*" %>
<j:Html>
<j:HtmlHeader> 
<title>Beyond Contact - Free Email Marketing Templates Home </title>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/editor/ckeditor.js"></script>
<style>
th{
padding-left:7px;
}
.cke_skin_kama{
border:0px !important;
} 
</style>
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
                    <jsp:include page="/WEB-INF/jsp/mail/customFields.jsp"></jsp:include>
                    </j:SideBar>
                    <j:Content>
                      <j:Block blockHeading="New Static Template"> 
						<html:form action="/templates.html">
						<html:hidden styleId="mx" property="mx" value="saveTemplate"/> 
						<html:hidden styleId="route" property="route" value="templates/createTemplate/result"></html:hidden>
						<html:hidden property="dynamic" value="0"></html:hidden>
                        <table width="100%"><tr>
                            <td>&nbsp;&nbsp;Template Name </td><td align="left"><html:text style="font-weight:bold;font-size:12pt;" size="40" property="name"  /> </td>
                            <td align="right">
			               		<input type="button" class="btn" onclick='showCFields();' value="Select Custom Fields"></input> 
			               	</td>
			               	<td align="right">
			               	   <c:url value="/images/icons/32x32/database_save.png" var="urlEmailAdd"/>
							   <div class="jqBtn"><table cellspacing="2" cellpadding="0"><tr><td>
								 <img style="float:left" src="${urlEmailAdd}"/></td><td>Save Template</td></tr></table>
								</div>
			               	</td>
                            </tr> 
                            <tr>
                            <td colspan="6"> 
                            <html:textarea  rows="40" cols="120" styleId="htmlEditor" property="content"  /> 
                         	<script type="text/javascript">
                  	     	CKEDITOR.replace( 'htmlEditor',
								{ 
               	     			    customConfig : '${pageContext.request.contextPath}/scripts/editor/staticBar.js',
									skin : 'kama',
									height:'350',
									toolbar:'StaticBar',
									filebrowserBrowseUrl: 'http://beyondcontact.com/index1.html',
									filebrowserImageBrowseUrl : 'http://beyondcontact.com/index1.html?type=Images' 
								});
							</script>
                      		</td>
                           </tr> 
				   	    	<c:if test="${actionVO.showMessage eq true}" >
						   	<tr>   
								<td style="font-size:9;font-family:Arial, Helvetica, sans-serif" colspan=2> ${ actionVO.actionMessage} </td>
							</tr>
							</c:if>
					    </table>
                      </html:form>
                    </j:Block>        
		</j:Content>
     </j:ContentArea>
    </j:Page>
<script>
$(function(){
	$(".jqBtn").button().click(saveTemplate);
});
function saveTemplate(){
	document.forms['template'].submit();
}
</script>  
</j:HtmlBody>
</j:Html>                            
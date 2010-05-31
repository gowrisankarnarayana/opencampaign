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
                      <j:Block blockHeading="Create Template - Tell us how you wish to display the response?">
                      <h2>You are almost there...</h2>
                      <p>Just tell us how you want columns to be appeared in your report</p>
                      
                      <table cellspacing="0" cellpadding="4px" style="border:1px solid rgb(240,240,240)">
                      <tr style="padding:2px;height:30px;background-color:rgb(240,240,240)">
	                      <th>Field Name</th>
	                      <th>Field Label</th>
	                      <th>Display Order</th>
	                      <th>Max Length</th>
	                      <th>Ignore This Field</th>
                      </tr>
                      	<html:form action="/templates.html">
                      
						<html:hidden property="mx" 		value="saveTemplate"></html:hidden> 
						<html:hidden property="route" 	value="templates/createTemplate/result"></html:hidden>
						
						<logic:notEmpty name="template" property="elements">
						<logic:iterate 	name="template" property="elements" id="elementVO" 	indexId="eRowIndex">
			               <tr>
			               <td><bean:write name="elementVO" property="elementName" /></td>
			               <td><html:text  size="40"    name="elementVO" property="elementLabel"    indexed="true"/></td>
			               <td><html:text  size="5"     name="elementVO" property="elementOrder"    indexed="true"/></td>
			               <td><html:text  size="5"	    name="elementVO" property="maxLength"  		indexed="true"/></td>
			               <td align="center"><html:checkbox  name="elementVO" property="ignored"   indexed="true"/></td>
			               </tr>
						   </logic:iterate>	
						</logic:notEmpty>
						
					 	</html:form>
					 	<tr style="padding:2px;height:30px;background-color:rgb(240,240,240)">
					 	<td colspan="3" >
					 	<j:Button label="Back to template editor" link="javascript:history.back();">Back</j:Button>
					 	</td>
	                      <td colspan="2" align="right">
	                      <j:Button label="Confirm and Save"  link="javascript:document.forms['template'].submit();">Save</j:Button>
	                      </td>
                      </tr>
                     </table>
                     
                </j:Block>        
</j:Content>
     </j:ContentArea>
    </j:Page>
</j:HtmlBody>
</j:Html>                    
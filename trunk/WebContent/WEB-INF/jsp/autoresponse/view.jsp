<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html" %>
<%@taglib prefix="logic" uri="http://joompal.com/beyondcontact/struts-logic" %>
<%@taglib prefix="bean"  uri="http://joompal.com/beyondcontact/struts-bean" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page import="com.beyond.constants.*" %>
<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<j:Html> 
<j:HtmlHeader> 
<title>Beyond Contact - Free Email Marketing</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/editor/ckeditor.js"></script> 
<script type='text/javascript' src="${pageContext.request.contextPath}/dwr/interface/jAutoResponder.js"></script>

<style>
th{
padding-left:7px;
}
.cke_skin_kama{
border:0px !important;
} 
a.jqBtn:hover{
color:white;
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
                    </j:SideBar>
                    <j:Content>
                    <j:Block blockHeading="${autoResponse.autoResponseType}"> 
                      	 <c:if test="${not empty requestScope.autoResponse}">
                    <table width="100%"><tr><td>
                     	 <table width="100%" align="right">
                      	 <tr><td width="76%" valign="middle" align="right">
						 	<c:url value="/images/icons/32x32/cog.png" var="urlEmailCog"/>
						 	<input type="hidden" id="autoResponseId" value="${autoResponse.autoResponseId}"></input>
						 	<input type="hidden" id="profileId" value="${autoResponse.profileId}"></input>
						 	<div id="btnMailProfile"><table cellspacing="2" cellpadding="0"><tr><td><img style="float:right" src="${urlEmailCog}"/></td><td><span id="spnMailProfile">Configure sending profile</span></td></tr></table></div>
						 </td><td valign="middle" align="left">
							 <c:url value="/images/icons/32x32/database_save.png" var="urlEmailAdd"/>
							 <div class="jqBtn"><table cellspacing="2" cellpadding="0"><tr><td>
							 <img style="float:left" src="${urlEmailAdd}"/></td><td>Save Autoresponse
							 </td></tr></table>
							 </div> 
						 </td></tr>
						 </table>
                    </td></tr><tr><td>   	 
                       	 <table  style="background-color:white;border:1px solid rgb(240,240,240)" cellspacing="0" cellpadding="0" width="100%"> 
						 <tr id="tblHR"><td><strong>&nbsp;&nbsp;Mail Subject</strong></td>
						 	 <td>
                    	 	 <input size="100" type="text" id="autoResponseSubject" value="${autoResponse.autoResponseSubject}"/>
						 	 </td>
						 </tr>
						 <tr>
						 <td colspan='2'>	 
							 <textarea name="strMessage" id="htmlEditor">${autoResponse.autoResponseHTML}</textarea>
							 <script type="text/javascript">
							 CKEDITOR.replace( 'htmlEditor',{skin : 'kama',toolbar:'Basic',height:'412'});
							 </script>
							 <span id="spnIdMsg"></span>
						</td>
						</tr>
						</table>
					</td></tr></table>  	
						<!-- Begin Email Profile Selection  -->
						<jsp:include page="../mail/profiles.jsp"></jsp:include>
						<!-- End Create Group Window  --> 
						 </c:if>
					</j:Block>				
                    </j:Content>
           </j:ContentArea>
    </j:Page>
    <script language="javascript">
    var jBlock=false;
    $(function(){
	    $(".jqBtn").button();  
	    $("#btnMailProfile").button();
	    $("#btnMailProfile").click(viewMailProfiles);
	    $(".jqBtn").click(jValidateSave);  
    });  
 	function jValidateSave(){

 		if(!(jBlock) && validate()){
 	 		
			var autoRespVO=new Object();

			jBlock=false;

		 	autoRespVO.autoResponseId=$('#autoResponseId').val();
			autoRespVO.profileId=$('#profileId').val();
			autoRespVO.autoResponseSubject=$('#autoResponseSubject').val();
			autoRespVO.autoResponseHTML=CKEDITOR.instances["htmlEditor"].getData();

 			jBlock=true;
 			jAutoResponder.updateResponse(autoRespVO,{callback:displayMessage,errorHandler:remoteErrorHandler});

		} 
 	}
 	
 	function displayMessage(data){
		remoteMessage(data);
		jBlock=false;
	}
	
 	function validate(){
 	 	
	 	if(!isValidText($('#autoResponseSubject').val())) {
			inlineMsg('autoResponseSubject','Please enter valid subject.');
			return false; 
	 	}
	 	
	 	if(CKEDITOR.instances["htmlEditor"].getData() == ''){
			jMessage('Please select mail message');
			$('#htmlEditor').focus();
			return false;
		}
		 return true;
	}
    </script>
</j:HtmlBody>
</j:Html>
<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html" %>
<%@taglib prefix="logic" uri="http://joompal.com/beyondcontact/struts-logic" %>
<%@taglib prefix="bean"  uri="http://joompal.com/beyondcontact/struts-bean" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<j:Window display="none" title="Pick a template" id="div_template_sel">
<table cellspacing="0" cellpadding="0" width="100%">
<tr><td>
	
	<html:select styleId="templateId" property="templateId" onchange="jViewTemplate(this.options[this.selectedIndex].value)">
		<option value="-1">Select A Mail Template Created By You</option>
		<c:choose>
		 <c:when test="${not empty sessionScope.templateHolder.dynamicTemplates}">
		 <option value="-1" class='head'>Dynamic Templates</option> 
		  	<c:forEach varStatus="status" items="${sessionScope.templateHolder.dynamicTemplates}" var="templateVO" >
		  	<option class='row' value="${templateVO.templateId}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${templateVO.name}</option>
		  	</c:forEach>
	 	</c:when>
		</c:choose>
	
		<c:choose> 
	 	<c:when test="${not empty sessionScope.templateHolder.staticTemplates}">
	 	<option value="-1" class='head'>Static Templates</option>
		 	<c:forEach items="${sessionScope.templateHolder.staticTemplates}" var="templateVO" >
			<option  class='row'  value="${templateVO.templateId}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${templateVO.name}</option>
		 	</c:forEach>
	 	</c:when>
	 	</c:choose>
	</html:select>
	
</td><td>
<j:Button label="Browse Beyond Templates &trade;" link="#">Browse</j:Button>
</td></tr>
</table>
</j:Window>
<script language="javascript">
	function jViewTemplate(strTemplateKey){
		if(!(strTemplateKey=="-1")){
			var lngTemplateId=strTemplateKey;
			//var lngTemplateId=strTemplateKey.split(",")[0];
			//var intType=strTemplateKey.split(",")[1];
			jCustomers.getTemplateContent(lngTemplateId,
				{callback:showTemplate,errorHandler:remoteErrorHandler}
				);
		}else{
			var objEditor = CKEDITOR.instances["htmlEditor"];
			objEditor.setData("");
		}
	}
	function showTemplate(response){
		var objEditor = CKEDITOR.instances["htmlEditor"];
		objEditor.setData(response);
	}
</script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<j:Block blockHeading="${sessionScope.selectedMenuHeading}"> 
 <ul> 
 	<c:forEach items="${sessionScope.selectedMenuVO.listSubMenu}" var="subMenuVO" >
		<c:url value="${subMenuVO.subMenuLink}" var="subMenuURL" />
		<c:choose>
			<c:when test="${requestScope.actionVO.sub eq  subMenuVO.subMenuName}" >
			<li class="active"><a class ="tip" title="${subMenuVO.subMenuDesc}" href="#"><span><b>${subMenuVO.subMenuLabel}&nbsp;</b></span></a></li>
			</c:when>
			<c:otherwise>
			<li><a class ="tip" title="${subMenuVO.subMenuDesc}" href="${subMenuURL}"><span>${subMenuVO.subMenuLabel}</span></a></li>
			</c:otherwise>
		</c:choose>		
	</c:forEach>
</ul> 
</j:Block>

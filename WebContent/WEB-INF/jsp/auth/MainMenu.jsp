<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul class="art-menu">
<c:forEach items="${sessionScope.user.listMenuVO}" var="menuVO" >
	<c:choose>
		<c:when test="${requestScope.actionVO.mnu eq  menuVO.mainMenuName}">
		<c:set scope="session" var="selectedMenuVO" value="${menuVO}" />
		<c:set scope="session" var="selectedMenuHeading" value="${menuVO.mainMenuLabel}" />
		<c:url value="${menuVO.mainMenuLink}" var="menuURL" />
		<li> <a class=" active"><span class="l"></span><span class="r"></span><span class="t">${menuVO.mainMenuLabel}</span></a></li>		
		</c:when>
		
		<c:otherwise>
			<c:url value="${menuVO.mainMenuLink}" var="menuURL" />
			<li> <a href="${menuURL}"><span class="l"></span><span class="r"></span><span class="t">${menuVO.mainMenuLabel}</span></a></li>
		</c:otherwise>
	</c:choose>
</c:forEach> 
</ul>
 
<%@ tag description="Standard page template" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/" %>

<t:page>
	<jsp:attribute name="head">	
		<t:head />
	</jsp:attribute>
	
	<jsp:body>
		<jsp:doBody/>
	</jsp:body>
</t:page>
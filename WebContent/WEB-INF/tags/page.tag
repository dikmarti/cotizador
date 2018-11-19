<%@ tag description="Page template" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="head" fragment="true" %>
<%@ attribute name="header" fragment="true" %>
<%@ attribute name="footer" fragment="true" %>

<!DOCTYPE html>
<html>
	<title>Cotizador Web</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<head>
		<jsp:invoke fragment="head"/>
	</head>		
	<body>			
		<jsp:invoke fragment="header"/>		
			
		<jsp:doBody/>
		
		<jsp:invoke fragment="footer"/>			
	</body>
</html>
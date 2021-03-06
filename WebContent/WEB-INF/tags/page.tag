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
		<script type="text/javascript">   
		$(document).ready(function () {
			
			$body = $("body");
				
			$( document ).ajaxStart(function() {
			     $body.addClass("loading");		      
			});
			
			$( document ).ajaxStop(function() {		    
			    $body.removeClass("loading");   
			});
		 });
	</script>
	</head>		
	<body>	
		<div class="modal-loader"><!-- Place at bottom of page --></div>			
		<jsp:invoke fragment="header"/>		
			
		<jsp:doBody/>
		
		<jsp:invoke fragment="footer"/>			
	</body>
</html>
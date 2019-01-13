<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%
	String username = (String) request.getSession().getAttribute("usuario");
%>
<%
	String modulos = (String) request.getSession().getAttribute("all_modules_json");
%>
<%
	String allModulos = (String) request.getSession().getAttribute("index_modules_json");
%>

<t:standardPage>

	<!-- Page content -->
	<div class="w3-content w3-padding"
		style="max-width: 1564px; z-index: 1;">

		<!-- Contact Section -->
		<div class="w3-container w3-padding-32" id="contact">
			<br> <br> <br>
			<div class="container-2">
				<div id="page-wrapper">
					<div class="row">
						<div class="col-md-12">
							<div class="page-title">
								
							</div>
						</div>
					</div>					
				</div>
				<!-- page-wrapper END-->
			</div>
			<!-- container-1 END-->
		</div>
		<!-- End page content -->
	</div>

</t:standardPage>

<script type="text/javascript">    
	$(document).ready(function() {		
	
		var arrayColors = ["purple","red", "light-gray", "blue","orange","green","dark-blue", "yellow", "gray"];
	
		 var modulosUser = '<%=modulos != null ? modulos : null %>';     
	 	 var $divModulesByUSer = $("#page-wrapper");
	 	 var $divAllModules = $("#page-wrapper");   
	 	  
	 	 if (modulosUser != "null") {
	 		 console.log("modulos json" + modulosUser);		 
	 		// En caso de que ya este en session cargar lista de modulos
	 		
	 		var result = JSON.parse(modulosUser); 		
	 		createDivModules(result, $divModulesByUSer);
	 		
	 	 } else {
	 		 
	 		var modulos = '<%=allModulos != null ? allModulos : null%>';
			console.log("modulosUser json" + modulosUser);
			if (modulos != "null") {
				var result = JSON.parse(modulos);
				createDivModules(result, $divAllModules);
			} else {
				$.ajax({
					url : "/Cotizador/rest/modules/allModules",
					type : "GET",
					dataType : "json",
					contentType : "application/json; charset=utf-8",
					success : function(result) {
						console.log("termino");
						console.log(result);
						createDivModules(result,
								$divAllModules);

					},
					complete : function(result) {
						$body.removeClass("loading");
					},
					error : function(result) {
						console.log("error");
					}
				});
			}

		}

		function createDivModules(result, div) {
			var dividir = false;
			var i = 0;
			var contentModules = "";
			
			var usuarioLogueado = '<%=username != null ? username : null %>'; 
			
			$.each(result, function(index, element) {			
				
				if(i == 0) {
					contentModules += '<div class="row">'
				}				
				
				contentModules += '<div class="col-lg-2 col-sm-6 separated">'
				contentModules += '<div class="circle-tile">'
				contentModules += '<a href="#">'
				contentModules += '<div class="circle-tile-heading ' + arrayColors[index] +'">'
				contentModules += '<i class="fa fa-cogs fa-fw fa-3x"></i>'
				contentModules += '</div>'
				contentModules += '</a>'
				contentModules += '<div class="circle-tile-content  ' + arrayColors[index] +'">'
				contentModules += '<div class="circle-tile-description text-faded"> </div>'
				contentModules += '<div class="circle-tile-number text-faded"> M&oacute;dulo '
				contentModules += result[index].nombre + ' <span id="sparklineA"></span>'
				contentModules += '</div>'
				
				if(usuarioLogueado != "null") {
					contentModules += '<a id="btn-mod-one" href="'+ result[index].url + '" class="circle-tile-footer">Ir '	
				} else {
					contentModules += '<a id="btn-mod-one" href="login" class="circle-tile-footer">Ir '
				}	
				
				contentModules += '<i class="fa fa-chevron-circle-right"></i></a>'
				contentModules += '</div>'
				contentModules += '</div>'
				contentModules += '</div>'
				
				if(i == 3) {
					contentModules += '</div>'
					div.append(contentModules);	
					i = 0;
					contentModules = "";
				} else {
					i++;
				}
							
			});
		}
	});
</script>
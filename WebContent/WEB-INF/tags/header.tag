<%@ tag description="Header template"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<%@tag import="java.util.List" %>
<%@tag import="cotizador.controllers.models.ModuloResponseModel" %>

<% String username = (String)request.getSession().getAttribute("usuario"); %>
<% String modulos = (String)request.getSession().getAttribute("all_modules_json"); %>

<div class="header-top">
   <div class="header-bar header-white header-wide header-padding header-card">	
    <div id="header-logo" class="header-left"><img src="resources/images/logo.jpg" style="width: 100px; height: 40px; object-fit: contain;"></div>
    <div class="topnav2"  id="myTopnav2"> 
     <a href="javascript:void(0);" class="icon2" onclick="myFunction()">
	   	<i class="fa fa-bars"></i>
	   </a>	
    </div>
    <div class="topnav"  id="myTopnav">     	
		<div class="dropdown-m">
		    <button class="dropbtn-m">Servicios 
		      <i class="fa fa-caret-down"></i>
		    </button>
		    <div class="dropdown-content-m" id="servicios">
		    </div>
		</div>    
		<div class="dropdown-m">
		    <button class="dropbtn-m">Configuración 
		      <i class="fa fa-caret-down"></i>
		    </button>
		    <div class="dropdown-content-m" id="configuracion">
		    </div>
		</div>	
	   	<a class="fa fa-user fa-3x user"></a>	  
	 	<a href="login" id="linkLogin" style="text-decoration: none; padding-left: 5px; <%= username != null ? "pointer-events: none;" : "" %>" class='<%= username != null ? "login" : "" %>'><%= username != null ? username : "Ingresar" %></a>
	 	<a href="index" class="fa fa-home fa-5x home" style="font-size: 25px; text-decoration: none;"></a>
	 	<a id="linkLogout" class="fa fa-sign-out fa-5x <%= username != null ? "logout show" : "logout hide" %> signout" style="font-size: 25px; text-decoration: none;"></a>	
	 	 			  	     
	</div>	
  </div>
</div>

<script type="text/javascript">


	$(document).ready(function() {
	  	  
		 var firstLoadModule = false;
		 
		 $("#header-logo").click(function() {
			  location.href = "index";    	 
		 });
		
		 var userlogged = '<%= username != null ? username : null %>';
		 if (userlogged != "null") {		 
			 var modulesUser = '<%= modulos != null ? modulos : null %>';
			 if (modulesUser != "null") {
				 var result = JSON.parse(modulesUser);		
					createSubMenu(result);					
			 } else {
				 loadModules();
			 }			
		 } 
		 
		 function loadModules() {
			 $.ajax({
			  	  url: "/Cotizador/rest/modules/all",
			  	  type: "GET", 
			  	  dataType: "json",
			  	  contentType: "application/json; charset=utf-8",	  	
			  	  success: function(result){	
			  		  
			  		  firstLoadModule = true;
			  		
			  	      console.log("termino");
			  	      console.log(result);
			  	     	
			  	      createSubMenu(result);
			  	      
			  	      var user = '<%= username != null ? username : "" %>';
			  	      
			  	      if(user != "") {
			  	    	location.href = "index";  
			  	      }		  	      
			  	        
			  	  },
			  	  complete: function(result){
			  		$body.removeClass("loading");  
			  	  },
			  	  error: function(result){
			  	        console.log("error");
			  	  }		 
			 });
			 
		 }
		 
		 function createSubMenu(result){
			 
			 var $servicios = $("#servicios");
		      	var $configuracion = $("#configuracion");
		        var liServicios = "";
		      	var liConfiguracion = "";
		      	
		        $.each(result, function( index, element ) {
		        	
		        	if(result[index].tipoModulo == "0"){
		        		var li = "<a style='text-decoration: none;' href='" + result[index].url +"'>" + result[index].nombre + "</a>";
		        		liConfiguracion += li;
		        		console.log(result[index].nombre);
		        	}
		        	
		        	if(result[index].tipoModulo == "1"){
		        		var li = "<a style='text-decoration: none;' href='" + result[index].url +"'>" + result[index].nombre + "</a>";
		        		liServicios += li;
		        		console.log(result[index].nombre);
		        	}	  	        	
		        });	 
		        
		      $configuracion.append(liConfiguracion);
		      $servicios.append(liServicios);
		 }
	      
	      $("#linkLogout").click(function() {
	     	 var $usuario =  $("#linkLogin").text();    	 
	     	 $.ajax({
	 	    	  url: "/Cotizador/rest/login/out",
	 	    	  type: "POST",
	 	    	  data: JSON.stringify($usuario),
	 	    	  dataType: "json",
	 	    	  contentType: "application/json; charset=utf-8",
	 	    	  success: function(result){		    		
	 	    	        console.log("termino"); 	    	      
	 	    	        location.href = "index";
	 	    	        
	 	    	  },
	 	    	  complete: function(result){
	 	    	        console.log("complete");
	 	    	  },
	 	    	  error: function(result){
	 	    	        console.log("error " + result);
	 	    	  } 	    	  
	 	    	});     	 
	       }) 
	     
	 });   
      	
</script>
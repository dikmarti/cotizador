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
      	<a href="#" data-sub-menu="servicios" style="text-decoration: none;">Servicios</a>	  
	  	<a href="#" data-sub-menu="configuracion" style="text-decoration: none;">Configuración</a>	  
	   	<a href="#" data-sub-menu="contacto" style="text-decoration: none;">Contacto</a>	  
	 	<a href="login" id="linkLogin" style="text-decoration: none;" class='<%= username != null ? "login" : "" %>'><%= username != null ? username : "Ingresar" %></a>
	 	<a href="index" class="fa fa-home fa-5x" style="font-size: 25px; text-decoration: none;"></a>
	 	<a href="index" class="fa fa-sign-out fa-5x" style="font-size: 25px; text-decoration: none;"></a>	 			  	     
	</div>	
  </div>
</div>

<div class="sub-menu w3-container w3-pale-blue w3-leftbar w3-border-blue" id="servicios">
	<ul></ul>
</div>

<div class="sub-menu w3-container w3-pale-blue w3-leftbar w3-border-blue" id="configuracion">
	<ul></ul>
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
			 
			 var $servicios = $("#servicios ul");
		      	var $configuracion = $("#configuracion ul");
		        var liServicios = "";
		      	var liConfiguracion = "";
		      	
		        $.each(result, function( index, element ) {
		        	
		        	if(result[index].tipoModulo == "0"){
		        		var li = "<li><a href='" + result[index].url +"'>" + result[index].nombre + "</a></li>";
		        		liConfiguracion += li;
		        		console.log(result[index].nombre);
		        	}
		        	
		        	if(result[index].tipoModulo == "1"){
		        		var li = "<li><a href='" + result[index].url +"'>" + result[index].nombre + "</a></li>";
		        		liServicios += li;
		        		console.log(result[index].nombre);
		        	}	  	        	
		        });	 
		        
		      $configuracion.append(liConfiguracion);
		      $servicios.append(liServicios);
		 }
			
	      $("[data-sub-menu]").click(function() {
	    	 var $divSubMenu = $(this).data("sub-menu");    	 
	    	 var menus = $("[data-sub-menu]");
	    	 
		        $.each(menus, function( index , element) {
		        	var id = $(element).data("sub-menu");	 
		        	
		        	if(id != $divSubMenu){
		        		$( "html").addClass("body-overflow")
		        		$( "#"+id ).hide();	 
		        	}	    		   		   	        		        	
	  	        });	
	   	 
				if ( $("#"+$divSubMenu+":first").is( ":hidden" ) ) {
					var $contentSubmenu = $( "#"+$divSubMenu+" ul").text();
					
					if($contentSubmenu != "") {
						$( "html").addClass("body-overflow").addClass("on");
					 	$( "#"+$divSubMenu ).show();		
					}
				} else {
					$( "html").removeClass("on")
				   	$( "#"+$divSubMenu ).hide();
				}
	      });
	      
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
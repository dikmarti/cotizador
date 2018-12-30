<%@ tag description="Header template"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<% String username = (String)request.getSession().getAttribute("usuario"); %>

<div class="header-top">
   <div class="header-bar header-white header-wide header-padding header-card">	
    <div id="header-logo" class="header-left"><img src="resources/images/logo.jpg" style="width: 100px; height: 40px; object-fit: contain;"></div>
    <div class="topnav2"  id="myTopnav2"> 
     <a href="javascript:void(0);" class="icon2" onclick="myFunction()">
	   	<i class="fa fa-bars"></i>
	   </a>	
    </div>
    <div class="topnav"  id="myTopnav">   	
      	<a href="#" data-sub-menu="servicios">Servicios</a>	  
	  	<a href="#" data-sub-menu="configuracion">Configuración</a>	  
	   	<a href="#" data-sub-menu="contacto">Contacto</a>	  
	 	<a href="login" id="linkLogin" class='<%= username != null ? "login" : "" %>'><%= username != null ? username : "Ingresar" %></a>
	 	
	 	<div class='logout <%= username != null ? "on" : "" %>' id="logout">
			<img id="linkLogout" src="resources/images/logout.png" >	 
		</div>		  	     
	</div>	
  </div>
</div>

<div class="sub-menu" id="servicios">
	<ul></ul>
</div>

<div class="sub-menu" id="configuracion">
	<ul></ul>
</div>

<script type="text/javascript">


	$(document).ready(function() {
	  	  
	 $("#header-logo").click(function() {
		  location.href = "index";    	 
	 });
		
	  $.ajax({
	  	  url: "/Cotizador/rest/modules/all",
	  	  type: "GET", 
	  	  dataType: "json",
	  	  contentType: "application/json; charset=utf-8",	  	
	  	  success: function(result){		    		
	  	        console.log("termino");
	  	        console.log(result);
	  	     	var $servicios = $("#servicios ul");
	  	      	var $configuracion = $("#configuracion ul");
	  	        var liServicios = "";
	  	      	var liConfiguracion = "";
	  	      	
	  	        $.each(result, function( index, element ) {
	  	        	
	  	        	if(result[index].tipoModulo == "0"){
	  	        		var li = "<li>" + result[index].nombre + "</li>";
	  	        		liConfiguracion += li;
	  	        		console.log(result[index].nombre);
	  	        	}
	  	        	
	  	        	if(result[index].tipoModulo == "1"){
	  	        		var li = "<li>" + result[index].nombre + "</li>";
	  	        		liServicios += li;
	  	        		console.log(result[index].nombre);
	  	        	}	  	        	
	  	        });	 
	  	        
	  	      $configuracion.append(liConfiguracion);
	  	      $servicios.append(liServicios);
	  	        
	  	  },
	  	  complete: function(result){
	  		$body.removeClass("loading");  
	  	  },
	  	  error: function(result){
	  	        console.log("error");
	  	  }
	  });	
    
		
      $("[data-sub-menu]").click(function() {
    	 var $divSubMenu = $(this).data("sub-menu");    	 
    	 var menus = $("[data-sub-menu]");
    	 
	        $.each(menus, function( index , element) {
	        	var id = $(element).data("sub-menu");	
	        	
	        	if(id != $divSubMenu){
	        		$( "#"+id ).hide();	 
	        	}	    		   		   	        		        	
  	        });	
   	 
			if ( $("#"+$divSubMenu+":first").is( ":hidden" ) ) {
			  	$( "#"+$divSubMenu ).show();
			} else {
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
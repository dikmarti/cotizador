<%@ tag description="Header template"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<div class="header-top">
   <div class="header-bar header-white header-wide header-padding header-card">	
    <div class="header-left"><img src="resources/images/logo.jpg" style="width: 100px; height: 40px; object-fit: contain;"></div>
    <div class="topnav2"  id="myTopnav2"> 
     <a href="javascript:void(0);" class="icon2" onclick="myFunction()">
	   	<i class="fa fa-bars"></i>
	   </a>	
    </div>
    <div class="topnav"  id="myTopnav">   	
      	<a href="#" data-sub-menu="proyectos">Proyectos</a>	  
	  	<a href="#" data-sub-menu="configuracion">Configuración</a>	  
	   	<a href="#" data-sub-menu="contacto">Contacto</a>	  
	  	<a href="login" >Ingresar</a>	  	     
	</div>	
  </div>
</div>

<div class="sub-menu" id="proyectos">
	<ul>
	
	</ul>
</div>

<script type="text/javascript">
      
      $("[data-sub-menu]").click(function() {
    	 var $divSubMenu = $(this).data("sub-menu");
   	 
    	  if ( $("#"+$divSubMenu+":first").is( ":hidden" ) ) {
    		  	$( "#"+$divSubMenu ).slideDown( "slow" );
   		  } else {
   		    $( "#"+$divSubMenu ).hide();
   		  }
      });
      
    	(function() {
   	  	  /*
   		  $.ajax({
	    	  url: "/Cotizador/rest/shape/modules",
	    	  type: "GET",
	    	  dataType: "json",
	    	  contentType: "application/json; charset=utf-8",
	    	  async: false,
	    	  success: function(result){		    		
	    	        console.log("termino");
	    	        console.log(result);
	    	        
	    	        var $submenu = $(".sub-menu ul");
	    	        var lis = "";
	    	        $.each(result, function( index, element ) {	    	        	
	    	        		    	        	
	    	        	if(result[index].tipoModulo == "1"){
	    	        		var li = "<li>" + result[index].nombre + "</li>";
	    	        		lis += li;
	    	        		console.log(result[index].nombre);
	    	        	}
	    	        	
	    	        });
	    	        $submenu.html(lis);
	    	        
	    	  },
	    	  complete: function(result){
	    	        console.log("complete");
	    	  },
	    	  error: function(result){
	    	        console.log("error");
	    	  }
	    	});
		      
	     */
   	})();
      	
      	// Send products de un array JSON.stringify(arrayTV).replace(/(:)/g,',').replace(/(")/g,'')
      </script>
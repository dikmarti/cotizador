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
	   <a href="#projects" class=" active">Proyectos</a>
	   <a href="#about" >Configuración</a>
	   <a href="#contact" >Contacto</a>	   
	    <a href="#" >&lt;Usuario&gt;</a> 
	</div>	
  </div>
</div>

<script type="text/javascript">
      
    	(function() {
   	  	  
   		  $.ajax({
	    	  url: "/Cotizador/rest/shape/modules",
	    	  type: "GET",
	    	  dataType: "json",
	    	  contentType: "application/json; charset=utf-8",
	    	  async: false,
	    	  success: function(result){		    		
	    	        console.log("termino");
	    	        console.log(result);
	    	        var obj = JSON.stringify(result);
	    	        
	    	        //$("#divMensaje").html(obj);
	    	        
	    	       // var obj2 = JSON.parse(obj);
	    	  },
	    	  complete: function(result){
	    	        console.log("complete");
	    	  },
	    	  error: function(result){
	    	        console.log("error");
	    	  }
	    	});
		      
	     
   	})();
      	
      	// Send products de un array JSON.stringify(arrayTV).replace(/(:)/g,',').replace(/(")/g,'')
      </script>
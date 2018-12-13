<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:simplePage>

<!-- Page content -->
<div class="w3-content w3-padding background-form" style="max-width:1564px">

  <!-- Contact Section -->
    
	<div class="tab-content">
	  <div id="form-8-preview">
	  	<div class="form-style-8">
		  <h2>Login</h2>
		  <form id="loginForm" class="form-content">
		    <input id="usuario" type="text" name="usuario" placeholder="Usuario" maxlength="200"/>
		 
		    <input id="clave" type="password" name="clave" placeholder="Clave"  maxlength="50"/>
		    <img class="icon-pass hide-icon" src="resources/images/icon-hide.jpg"> 
		    <div class="msg-error">
		   			Debe ingresar los datos
		   	</div>
		   	<div class="form-style-button">
		   		<input type="button" value="Ingresar" id="btn-login"/>
		   	</div>

		  </form>
		</div>
	  </div>
	</div>
<!-- End page content -->
</div>

<script type="text/javascript">      
  
	 $('.icon-pass').click(function () {	
		
		 if ($(this).hasClass("hide-icon")) {
			  $('#clave').attr('type', 'text');
			    $(this).attr("src","resources/images/icon-show.png");
			    $(this).removeClass("hide-icon");
			    $(this).addClass("show-icon");
		 } else {
			 $('#clave').attr('type', 'password');
			    $(this).attr("src","resources/images/icon-hide.jpg");
			    $(this).removeClass("show-icon");
			    $(this).addClass("hide-icon");
		 }  
	 });
	

      $("#btn-login").click(function() {
    	 var $usuario =  $("#usuario").val();
    	 var $clave =  $("#clave").val();
    	 $(".msg-error").removeClass("on");
    	 
    	 if ($usuario == "" || $clave == "" ) {
    		  $(".msg-error").addClass("on");
    		  return false;
   		 } else {
   		      console.log("Hay valores");
   		 }
    	 
    	  var $form = $("#loginForm").serializeArray();    	  	  
	  	  var $formSerialized = objectifyForm($form);
    	 
    	 $.ajax({
	    	  url: "/Cotizador/rest/login/in",
	    	  type: "POST",
	    	  data: JSON.stringify($formSerialized),
	    	  dataType: "json",
	    	  contentType: "application/json; charset=utf-8",
	    	  success: function(result){		    		
	    	        console.log("termino");
	    	        var obj = JSON.stringify(result);
	    	        console.log(" objeto " + obj);
	    	       
	    	  },
	    	  complete: function(result){
	    	        console.log("complete");
	    	  },
	    	  error: function(result){
	    	        console.log("error");
	    	  }
	    	  
	    	});
    	 
      });
      
    ;
      	
</script>

</t:simplePage>
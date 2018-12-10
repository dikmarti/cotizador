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
		    <div>
			    <input id="clave" type="password" name="clave" placeholder="Clave"  maxlength="50"/>
			    <svg class="icon-pass" id="icon-show-pass" fill="#545759" height="24" viewBox="0 0 24 24" width="24" xmlns="https://www.w3.org/2000/svg" class="VhKI7c"><path d="M0 0h24v24H0zm0 0h24v24H0zm0 0h24v24H0zm0 0h24v24H0z" fill="none"></path><path d="M12 7c2.76 0 5 2.24 5 5 0 .65-.13 1.26-.36 1.83l2.92 2.92c1.51-1.26 2.7-2.89 3.43-4.75-1.73-4.39-6-7.5-11-7.5-1.4 0-2.74.25-3.98.7l2.16 2.16C10.74 7.13 11.35 7 12 7zM2 4.27l2.28 2.28.46.46C3.08 8.3 1.78 10.02 1 12c1.73 4.39 6 7.5 11 7.5 1.55 0 3.03-.3 4.38-.84l.42.42L19.73 22 21 20.73 3.27 3 2 4.27zM7.53 9.8l1.55 1.55c-.05.21-.08.43-.08.65 0 1.66 1.34 3 3 3 .22 0 .44-.03.65-.08l1.55 1.55c-.67.33-1.41.53-2.2.53-2.76 0-5-2.24-5-5 0-.79.2-1.53.53-2.2zm4.31-.78l3.15 3.15.02-.16c0-1.66-1.34-3-3-3l-.17.01z"></path></svg>
		    </div>
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
      
	 $('#icon-show-pass').hover(function () {
	    $('#clave').attr('type', 'text');
	 }, function () {
	    $('#clave').attr('type', 'password');
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
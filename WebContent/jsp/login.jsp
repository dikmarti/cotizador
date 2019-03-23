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
		    <div class="msg-error" id="error-login">
		   			Debe ingresar los datos
		   	</div>
		   	<div class="form-style-button">
		   		<input type="button" value="Ingresar" id="btn-login"/>
		   	</div>
		  </form>
			<a id="changePassword" href="javascript:void(0)" style="font-size: 15px;font-weight: bold;">Cambiar contraseña</a>
		</div>
	  </div>
	</div>
	
<!-- Modal -->
<div id="chagePass-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close js-close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title-text">Cambiar Contraseña</h4>
      </div>
      <div class="modal-body">
      		<form id="changePassForm" class="form-content">
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="usuarioChange" type="text" name="usuarioChange" placeholder="Usuario" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="claveChange" type="password" name="claveChange" placeholder="Clave" maxlength="200"/>
      			</div>
    		</div>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="claveNueva" type="password" name="claveNueva" placeholder="Clave Nueva" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="confirmarClaveNueva" type="password" name="confirmarClaveNueva" placeholder="Confirmar Clave Nueva" maxlength="200"/>
      			</div>
      		</div>
      		<div class="form-row">
      			<div class="form-group col-md-10">
				    <div class="msg-error" id="error-change"> 
				   			Debe ingresar todos los datos.
	      			</div>
      			</div>
			</div>
			<div class="form-style-button">
			   	<input type="button" value="Actualizar" id="btn-modal-change" class="btn btn-primary" style="width: 50%; margin-left: 65px;"/>
			</div>
		   	</form>
      </div>
    </div>

  </div>
</div>
<!-- End Modal -->

<!-- Modal Confirm-->
<div id="modal-confirm" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title-text">Confirmación</h4>
      </div>
      <div class="modal-body">
			<h4 style="text-align: center;"><p>¿Está seguro que desea cambiar la contraseña?</p></h4>
			<div class="modal-footer" style="border-top: none">
				<button type="button" id="btn-modal-confirm"  class="btn btn-primary">Confirmar</button>
				<button type="button" id="btn-modal-cancel" class="btn btn-secundary">Cancelar</button>
			</div>
      </div>
    </div>
  </div>
</div>
<!-- End Modal Confirm -->

<!-- Modal Thanks-->
<div id="modal-thanks" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="modal-title-text">Cambiar Contraseña</h4>
      </div>
      <div class="modal-body">
			<h4 style="text-align: center;"><p>Contraseña actualizada exitosamente.</p></h4>
			<div class="modal-footer" style="border-top: none">
				<button type="button" id="btn-modal-close" class="btn btn-primary">Cerrar</button>
			</div>
      </div>
    </div>
  </div>
</div>
<!-- End Modal Thnaks -->
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
	
	$("#clave").on('keypress', function (e) {
			if(e.keyCode == 13) {
				$( "#btn-login" ).trigger( "click" );
			}
	});	
	 
      $("#btn-login").click(function() {
    	 var $usuario =  $("#usuario").val();
    	 var $clave =  $("#clave").val();
    	 $("#error-login").removeClass("on");
	     $("#error-login").html("Debe ingresar los datos");
    	 
    	 if ($usuario == "" || $clave == "" ) {
    		  $("#error-login").addClass("on");
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
	    	        
	    	        $("#error-login").removeClass("on");
	    	        
	    	        if(obj === undefined) {	    	        	
	    	        	$("#error-login").html("El usuario y/o clave ingresados no son correctos.")
	    	        	$("#error-login").addClass("on");	    	        	 
	    	        } else {
	    	        	location.href = "index";
	    	        }
	    	       
	    	  },
	    	  complete: function(result){
	    	        console.log("complete");
	    	  },
	    	  error: function(result){
	    	        console.log("error");
	    	  }
	    	  
	    	});
    	 
      });
      
		$("#btn-modal-close").click(function() {
			$("#modal-thanks").modal("hide");
			location.href = "login";
		});
      
      $("#btn-modal-change").click(function() {
    	 var $usuario =  $("#usuarioChange").val();
    	 var $clave =  $("#claveChange").val();
    	 var $claveNueva =  $("#claveNueva").val();
    	 var $confirmarClaveNueva =  $("#confirmarClaveNueva").val();
    	 $("#error-change").removeClass("on");
    	 
    	 if ($usuario == "" || $clave == "" || $claveNueva == "" || $confirmarClaveNueva == "") {
    		  $("#error-change").addClass("on");
    		  return false;
   		 } else {
   		      console.log("Hay valores");
   		 }
    	 
    	 if($claveNueva != $confirmarClaveNueva) {
    		 $("#error-change").html("La contraseña nueva no coincide.");
    		 $("#error-change").addClass("on");
    		  return false;
    	 }
		$("#modal-confirm").modal("show");
		});
      $("#changePassword").click(function() {
   			$("#usuarioChange").val('');
     		$("#claveChange").val('');
     		$("#claveNueva").val('');
     		$("#confirmarClaveNueva").val('');
			$("#chagePass-modal").modal("show");
		});
		$("#btn-modal-cancel").click(function() {
			$("#modal-confirm").modal("hide");
		});
		$("#btn-modal-confirm").click(function() {
			$("#modal-confirm").modal("hide");
			 var $usuario =  $("#usuarioChange").val();
	    	 var $clave =  $("#claveChange").val();
	    	 var $claveNueva =  $("#claveNueva").val();
	    	 var $confirmarClaveNueva =  $("#confirmarClaveNueva").val();
	    	 $("#error-change").removeClass("on");
	    	 
	    	 
	    	 if ($usuario == "" || $clave == "" || $claveNueva == "" || $confirmarClaveNueva == "") {
	    		  $("#error-change").addClass("on");
	    		  return false;
	   		 } else {
	   		      console.log("Hay valores");
	   		 }
	    	 
	    	 if($claveNueva != $confirmarClaveNueva) {
	    		 $("#error-change").addClass("on");
	    		 $("error-chamge").html("La contraseña nueva no coincide.");
	    		  return false;
	    	 }
	    	$("#chagePass-modal").css('z-index', '1');
			$.ajax({
		    	  url: "/Cotizador/rest/login/changePassword",
		    	  type: "POST",
		    	  data: JSON.stringify({usuario: $usuario, clave: $clave, claveNueva: $claveNueva}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $("#error-change").removeClass("on");
		    	        
		    	        if(obj === undefined) {	 
		    	        	console.log("Ha ocurrido un error, la contraseña no pudo ser actualizada.")
		    	        	$("#chagePass-modal").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	$("#error-change").html("Ha ocurrido un error, la contraseña no pudo ser actualizada.");
		    	        	$("#error-change").addClass("on");	
		    	        } else {
		    	        	if(result == 0) {
		    	        		$("#modal-thanks").modal("show");
		    	        	} else if (result == 2) {
		    	        		$("#chagePass-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
			    	        	$("#error-change").html("Ha ocurrido un error, la contraseña no pudo ser actualizada.");
			    	        	$("#error-change").addClass("on");
		    	        	}
		    	        }
		    	       
		    	  },
		    	  complete: function(result){
		    	        console.log("complete");
		    	  },
		    	  error: function(result){
		    	        console.log("error");
		    	  }
		    	  
		    	});
		});
      
</script>

</t:simplePage>
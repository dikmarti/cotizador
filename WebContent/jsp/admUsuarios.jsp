<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:standardPage>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">

<div class="w3-container w3-padding-32" id="divForm">
<br>
<br>
<br>
	<div class="row icon button">
		<a id="btn-user-create" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
        	<span><strong>Crear</strong></span>            
    	</a>
    	<a id="btn-user-modify" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        	<span><strong>Editar</strong></span>            
    	</a>
    	<a id="btn-user-delete" class="btn btn-primary a-btn-slide-text">
       		<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
        	<span><strong>Borrar</strong></span>            
    	</a>
	</div>
<table id="dtUserModule" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Nombre

      </th>
      <th class="th-sm">Login

      </th>
      <th class="th-sm">Dirección

      </th>
      <th class="th-sm">Email

      </th>
      <th class="th-sm">Teléfono

      </th>
      <th class="th-sm">Cargo

      </th>
    </tr>
  </thead>
  <tbody id="user-table-data">
  </tbody>
  <tfoot>
    <tr>
      <th>Nombre
      </th>
      <th>Login
      </th>
      <th>Dirección
      </th>
      <th>Email
      </th>
      <th>Teléfono
      </th>
      <th>Cargo
      </th>
    </tr>
  </tfoot>
</table>
</div>

<!-- Modal -->
<div id="user-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Crear Usuario</h4>
      </div>
      <div class="modal-body">
      		<form id="createUserForm" class="form-content">
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="nombre" type="text" name="nombre" placeholder="Nombre" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="login" type="text" name="login" placeholder="Login" maxlength="200"/>
      			</div>
    		</div>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="clave" type="password" name="clave" placeholder="Clave"  maxlength="50"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="email" type="text" name="email" placeholder="Email" maxlength="200"/>
      			</div>
      		</div>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="direccion" type="text" name="direccion" placeholder="Dirección" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="telefono" type="text" name="telefono" placeholder="Teléfono" maxlength="200"/>
      			</div>
      		</div>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="cargo" type="text" name="cargo" placeholder="Cargo" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <select class="form-control form-control-sm" id="tipoUsuario" name="tipoUsuario" >
				    	<option value="">Tipo de Usuario</option>
				    	<option value="1">Estandard</option>
				    </select>
      			</div>
      		</div>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <div class="msg-error">
				   			Debe ingresar los datos.
	      			</div>
      			</div>
			</div>
			<div class="form-style-button">
			   	<input type="button" value="Crear" id="btn-modal-create" class="btn btn-primary" style="width: 50%; margin-left: 65px;"/>
			   	<input type="button" value="Modificar" id="btn-modal-update" class="btn btn-primary" style="width: 50%; margin-left: 65px; visibility: hidden;"/>
			</div>
		   	</form>
      </div>
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!--       </div> -->
    </div>

  </div>
</div>
<!-- End Modal -->
  
<!-- End page content -->
</div>

<script type="text/javascript">

$(document).ready(function() {
   	 $.ajax({
    	  url: "/Cotizador/rest/userModule/all",
    	  type: "GET",
    	  dataType: "json",
    	  contentType: "application/json; charset=utf-8",
    	  success: function(result){		    		
    	        console.log("termino");
    	        console.log(result);

    	        var $tableData = $("#user-table-data");
    	       	var dataUsers = "";
    	        
    	        $.each(result, function( index, element ) {	    	        	
    	        		    	        	
    	        		var li = "<tr role='row' id='"+ result[index].login +"'><td id='nombre'>" + result[index].nombre + "</td>"
    	        					+"<td id='login'>" + result[index].login + "</td>"
    	        					+"<td id='direccion'>" + result[index].direccion + "</td>"
    	        					+"<td id='email'>" + result[index].email + "</td>"
    	        					+"<td id='telefono'>" + result[index].telefono + "</td>"
    	        					+"<td id='cargo'>" + result[index].cargo + "</td></tr>";
    	        		dataUsers += li;
    	        });
    	        $tableData.html(dataUsers);
    	  },
    	  complete: function(result){
    	        console.log("complete");
    	  },
    	  error: function(result){
    	        console.log("error");
    	  }
    	  
    	});
   	 
   	var table = $('#dtUserModule').DataTable({
			  responsive: true,
			    "pagingType": "simple_numbers",
			    "pageLength": 10,
			    "language": {
		            "lengthMenu": "Historial Personas",
		            "zeroRecords": "No existen registros",
		            "emptyTable":     "No existen registros en tabla",
		            "info": "Mostrando del _START_ al _END_ de un total de _TOTAL_ registros.",
		            "infoEmpty": "",
		            "infoFiltered": "",
		            "search": "Buscar: ",
		            "paginate": {
		                "previous": "Atrás",
		                "next": "Siguiente"
		              }
		        }
		  }); 
		  $('.dataTables_length').addClass('bs-select');
		  
		  $('#dtUserModule tbody').on( 'click', 'tr', function () {
		        if ($(this).hasClass('selected')) {
		            $(this).removeClass('selected');
		        }
		        else {
		        	$('#dtUserModule').find('tr.selected').removeClass('selected');
		            $(this).addClass('selected'); 
		        }
		    } );

		$("#btn-user-create").click(function() {
			console.log("create user"); 
			$(".msg-error").removeClass("on");
			$("#tipoUsuario").val([""]);
			$('#user-modal').find('#btn-modal-update').css('visibility', 'hidden');
			$('#user-modal').find('#btn-modal-update').css('display', 'none');
			$('#user-modal').find('#btn-modal-create').css('visibility', 'visible');
			$('#user-modal').find('#btn-modal-create').css('display', '');
			$("#user-modal").modal("show");
		});
		
		$("#btn-user-modify").click(function() {
			console.log("modify user");   
			if($('#dtUserModule').find('tr.selected').length != 1) {
				console.log("No hay usuario seleccionado");   	 
				return false;
			} 
			var $userModify = $('#dtUserModule').find('tr.selected');
			console.log("modify user " + $userModify);
			var $nombre =  $userModify.find("#nombre").text();
	    	 var $login =  $userModify.find("#login").text();
	    	 var $email =  $userModify.find("#email").text();
	    	 var $direccion =  $userModify.find("#direccion").text();
	    	 var $telefono =  $userModify.find("#telefono").text();
	    	 var $cargo =  $userModify.find("#cargo").text();
			$('#user-modal').find('#nombre').val($nombre);
			$('#user-modal').find('#login').val($login);
			$('#user-modal').find('#direccion').val($direccion);
			$('#user-modal').find('#email').val($email);
			$('#user-modal').find('#telefono').val($telefono);
			$('#user-modal').find('#cargo').val($cargo);
			$('#user-modal').find('#btn-modal-create').css('visibility', 'hidden');
			$('#user-modal').find('#btn-modal-create').css('display', 'none');
			$('#user-modal').find('#btn-modal-update').css('visibility', 'visible');
			$('#user-modal').find('#btn-modal-update').css('display', '');
			$('#user-modal').find('#clave').attr('disabled', 'true');
			$('#user-modal').find('#tipousuario').attr('disabled', 'true');
			$("#user-modal").modal("show");
		});
		
		$("#btn-user-delete").click(function() {
			if($('#dtUserModule').find('tr.selected').length != 1) {
				console.log("No hay usuario seleccionado");   	 
				return false;
			} 
			var $userDelete = $('#dtUserModule').find('tr.selected').attr('id');
			console.log("delete user " + $userDelete);   	 
			
			$.ajax({
		    	  url: "/Cotizador/rest/userModule/delete",
		    	  type: "POST",
		    	  data: JSON.stringify({login: $userDelete}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino de borrar usuario");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $(".msg-error").removeClass("on");
		    	        
		    	        if(obj === undefined) {	    	        	
		    	        } else {
		    	        	if(result) {
			    	        	location.href = "admUsuarios";
		    	        	} else {
		    	        		console.log("Ha ocurrido un error, el usuario no pudo ser creado.")
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
		
		$("#btn-modal-create").click(function() {
			$("#user-modal").css('z-index', '1');
	    	 var $nombre =  $("#nombre").val();
	    	 var $login =  $("#login").val();
	    	 var $clave =  $("#clave").val();
	    	 var $email =  $("#email").val();
	    	 var $direccion =  $("#direccion").val();
	    	 var $telefono =  $("#telefono").val();
	    	 var $cargo =  $("#cargo").val();
	    	 var $tipoUsuario =  $("#tipoUsuario option:selected").val();
	    	 $(".msg-error").removeClass("on");
		     $(".msg-error").html("Debe ingresar los datos");
		     
		     if($tipoUsuario != 1) {
		    	 $(".msg-error").html("Debe seleccionar el tipo de usuario.")
		    	 $(".msg-error").addClass("on");
		    	 return false;
		     }
	    	 
	    	 if ($login == "" || $clave == "" || $nombre == "" || $email == "" || $direccion == "" 
	    			 || $telefono == "" || $cargo == "" || $tipoUsuario == "") {
	    		  $(".msg-error").addClass("on");
	    		  return false;
	   		 } else {
	   		      console.log("Hay valores");
	   		 }
	    	 
	    	  var $form = $("#createUserForm").serializeArray();    	  	  
		  	  var $formSerialized = objectifyForm($form);
	    	 
	    	 $.ajax({
		    	  url: "/Cotizador/rest/userModule/create",
		    	  type: "POST",
		    	  data: JSON.stringify($formSerialized),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino creacion de usuario");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $(".msg-error").removeClass("on");
		    	        
		    	        if(obj === undefined) {	    	  
		    	        	$("#user-modal").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	$(".msg-error").html("Ha ocurrido un error, el usuario no pudo ser creado.");
		    	        	$(".msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result == 0) {
			    	        	location.href = "admUsuarios";
		    	        	} else if (result == 1) {
		    	        		$("#user-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, login ya existe.");
			    	        	$(".msg-error").addClass("on");	 
		    	        	} else if (result == 2) {
		    	        		$("#user-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, el usuario no pudo ser creado.");
			    	        	$(".msg-error").addClass("on");	 
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
		
	  });   
		  
	</script>
	
</t:standardPage>
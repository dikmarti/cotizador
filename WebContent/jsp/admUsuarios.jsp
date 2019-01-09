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
    	<a id="btn-user-view" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
        	<span><strong>Ver</strong></span>            
    	</a>
    	<a id="btn-user-delete" class="btn btn-primary a-btn-slide-text">
       		<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
        	<span><strong>Borrar</strong></span>            
    	</a>
	</div>
<table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
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
			    <input id="nombre" type="text" name="nombre" placeholder="Nombre" maxlength="200"/>
			    <input id="login" type="text" name="login" placeholder="Login" maxlength="200"/>
			    <input id="clave" type="password" name="clave" placeholder="Clave"  maxlength="50"/>
			    <input id="email" type="text" name="email" placeholder="Email" maxlength="200"/>
			    <input id="direccion" type="text" name="direccion" placeholder="Dirección" maxlength="200"/>
			    <input id="telefono" type="text" name="telefono" placeholder="telefono" maxlength="200"/>
			    <input id="cargo" type="text" name="cargo" placeholder="Cargo" maxlength="200"/>
			    <input id="tipoUsuario" type="text" name="tipoUsuario" placeholder="Tipo de Usuario" maxlength="200"/>
			    <div class="msg-error">
			   			Debe ingresar los datos.
			   	</div>
			   	<div class="form-style-button">
		   			<input type="button" value="Crear" id="btn-modal-create"/>
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
    	        		    	        	
    	        		var li = "<tr><td>" + result[index].nombre + "</td>"
    	        					+"<td>" + result[index].login + "</td>"
    	        					+"<td>" + result[index].direccion + "</td>"
    	        					+"<td>" + result[index].email + "</td>"
    	        					+"<td>" + result[index].telefono + "</td>"
    	        					+"<td>" + result[index].cargo + "</td></tr>";
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
   	 
		$('#dtBasicExample').DataTable({
			  responsive: true,
			    "pagingType": "simple_numbers",
			    "pageLength": 10,
			    "language": {
		            "lengthMenu": "Historial Personas",
		            "zeroRecords": "No existen registros",
		            "emptyTable":     "No existen registros en tabla",
		            "info": "Mostrando del _START_ al _END_ de un total de _TOTAL_ registros.",
		            "infoEmpty": "Ningún registro disponible para la búsqueda.",
		            "infoFiltered": "",
		            "search": "Buscar: ",
		            "paginate": {
		                "previous": "Atrás",
		                "next": "Siguiente"
		              }
		        }
		  });
		  $('.dataTables_length').addClass('bs-select');

		$("#btn-user-create").click(function() {
			console.log("create user"); 
			$("#user-modal").modal("show");
		});
		
		$("#btn-user-modify").click(function() {
			console.log("modify user");   	 
		});
		
		$("#btn-user-delete").click(function() {
			console.log("delete user");   	 
		});
		
		$("#btn-modal-create").click(function() {
	    	 var $nombre =  $("#nombre").val();
	    	 var $login =  $("#login").val();
	    	 var $clave =  $("#clave").val();
	    	 var $email =  $("#email").val();
	    	 var $direccion =  $("#direccion").val();
	    	 var $telefono =  $("#telefono").val();
	    	 var $cargo =  $("#cargo").val();
	    	 var $tipoUsuario =  $("#tipoUsuario").val();
	    	 $(".msg-error").removeClass("on");
		     $(".msg-error").html("Debe ingresar los datos");
	    	 
	    	 if ($usuario == "" || $clave == "" || $nombre == "" || $email == "" || $direccion == "" 
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
		    	        console.log("termino");
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $(".msg-error").removeClass("on");
		    	        
		    	        if(obj === undefined) {	    	        	
		    	        	$(".msg-error").html("Ha ocurrido un error, el usuario no pudo ser creado.")
		    	        	$(".msg-error").addClass("on");	    	        	 
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
		
	  });   
		  
	</script>
	
</t:standardPage>
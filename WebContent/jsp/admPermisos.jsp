<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:standardPage>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">

<div class="w3-container w3-padding-32 scroll-admin" id="divForm">
<br>
<br>
<br>
	<div class="row icon button">
		<a id="btn-adm-permission" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        	<span><strong>Administrar Permisos</strong></span>            
    	</a>
	</div>
<table id="dtUserModulePermission" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Nombre
      </th>
      <th class="th-sm">Login
      </th>
      <th class="th-sm">Cargo
      </th>
    </tr>
  </thead>
  <tbody id="user-table-data-permission">
  </tbody>
  <tfoot>
    <tr>
      <th>Nombre
      </th>
      <th>Login
      </th>
      <th>Cargo
      </th>
    </tr>
  </tfoot>
</table>
</div>

<!-- Modal -->
<div id="user-modal-permission" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title-text">Administrar Permisos de Usuario</h4>
      </div>
      <div class="modal-body">
      		<form id="admUserPermissionForm" class="form-content">
				<input id="loginAnterior" type="hidden" name="loginAnterior"/>
	      		<div class="form-row">
	      			<div class="form-group col-md-4">
	      				<label>Nombre</label>
					    <input class="form-control" id="nombre" type="text" name="nombre" disabled="true"/>
	      			</div>
	      			<div class="form-group col-md-4">
	      				<label>Login</label>
					    <input class="form-control" id="login" type="text" name="login" disabled="true"/>
	      			</div>
	      			<div class="form-group col-md-4">
	      				<label>Cargo</label>
					    <input class="form-control" id="cargo" type="text" name="cargo" disabled="true"/>
	      			</div>
	    		</div>

				<div class="form-style-button">
				   	<input type="button" value="Actualizar" id="btn-modal-permission" class="btn btn-primary" style="width: 50%; margin-left: 65px;"/>
				</div>
		   	</form>
      </div>
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

    	        var $tableData = $("#user-table-data-permission");
    	       	var dataUsers = "";
    	        
    	        $.each(result, function( index, element ) {	    	        	
    	        		    	        	
    	        		var li = "<tr role='row' id='"+ result[index].login +"'><td id='nombreT'>" + result[index].nombre + "</td>"
    	        					+"<td id='loginT'>" + result[index].login + "</td>"
    	        					+"<td id='cargoT'>" + result[index].cargo + "</td></tr>";
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
   	 
   	var table = $('#dtUserModulePermission').DataTable({
			  responsive: true,
			    "pagingType": "simple_numbers",
			    "pageLength": 10,
			    "language": {
		            "lengthMenu": "Módulo de Permisos de Usuario",
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
		  
		  $('#dtUserModulePermission tbody').on( 'click', 'tr', function () {
		        if ($(this).hasClass('selected')) {
		            $(this).removeClass('selected');
		        }
		        else {
		        	$('#dtUserModulePermission').find('tr.selected').removeClass('selected');
		            $(this).addClass('selected'); 
		        }
		    } );

		$("#btn-adm-permission").click(function() {
			console.log("adm user permission");   
			if($('#dtUserModulePermission').find('tr.selected').length != 1) {
				console.log("No hay usuario seleccionado");   	 
				return false;
			} 
			var $userModify = $('#dtUserModulePermission').find('tr.selected');
			console.log("modify user permission " + $userModify);
			var $nombre =  $userModify.find("#nombreT").text();
	    	 var $login =  $userModify.find("#loginT").text();
	    	 var $cargo =  $userModify.find("#cargoT").text();
			$('#user-modal-permission').find('#nombre').val($nombre);
			$('#user-modal-permission').find('#login').val($login);
			$('#user-modal-permission').find('#cargo').val($cargo);
			$("#user-modal-permission").modal("show");
		});
		
	
		$("#btn-modal-permission").click(function() {
	    	 var $login =  $("#login").val();
	    	 var $tipoUsuario =  $("#tipoUsuario option:selected").val();
		     
		     if($tipoUsuario != 1) {
		    	 $(".msg-error").html("Debe seleccionar el tipo de usuario.")
		    	 $(".msg-error").addClass("on");
		    	 return false;
		     }
	    	 
	    	 if ($login == "" || $tipoUsuario == "") {
	    		  $(".msg-error").addClass("on");
	    		  return false;
	   		 } else {
	   		      console.log("Hay valores");
	   		 }
	    	 
	    	  var $form = $("#admUserPermissionForm").serializeArray();    	  	  
		  	  var $formSerialized = objectifyForm($form);
	    	 
	  	 	 $("#user-modal-permission").css('z-index', '1');
	    	 $.ajax({
		    	  url: "/Cotizador/rest/permission/updatePermission",
		    	  type: "POST",
		    	  data: JSON.stringify($formSerialized),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino actualizacion de permisos de usuario");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $(".msg-error").removeClass("on");
		    	        
		    	        if(obj === undefined) {	    	  
		    	        	$("#user-modal-permission").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	$(".msg-error").html("Ha ocurrido un error, el usuario no pudo ser creado.");
		    	        	$(".msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result == 0) {
			    	        	location.href = "admUsuarios";
		    	        	} else if (result == 1) {
		    	        		$("#user-modal-permission").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, login ya existe.");
			    	        	$(".msg-error").addClass("on");	 
		    	        	} else if (result == 2) {
		    	        		$("#user-modal-permission").css('z-index', '2');
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
		
		$("#tipoUsuario").click(function() {
			$(this).removeClass("custom-color");
		});	
		
	  });   
		  
	</script>
	
</t:standardPage>
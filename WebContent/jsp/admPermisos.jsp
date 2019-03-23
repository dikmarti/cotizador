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
      <th class="th-sm">Id
      </th>
      <th class="th-sm">Nombre
      </th>
      <th class="th-sm">Login
      </th>
      <th class="th-sm">Cargo
      </th>
      <th class="th-sm">Permisos
      </th>
    </tr>
  </thead>
  <tbody id="user-table-data-permission">
  </tbody>
  <tfoot>
    <tr>
      <th>Id
      </th>
      <th>Nombre
      </th>
      <th>Login
      </th>
      <th>Cargo
      </th>
      <th>Permisos
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
        <button type="button" class="close js-close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title-text">Administrar Permisos de Usuario</h4>
      </div>
      <div class="modal-body">
   	  	<div class="form-group row">
   			<label for="nombre" class="col-sm-2 col-form-label">Nombre:</label>
		    <div class="col-sm-10">
		      <input type="text" readonly class="form-control-plaintext" id="nombre" value="" style="border: none;">
		    </div>
 		</div>
   	  	<div class="form-group row">
   			<label for="login" class="col-sm-2 col-form-label">Login:</label>
		    <div class="col-sm-10">
		      <input type="text" readonly class="form-control-plaintext" id="login" value="" style="border: none;">
		    </div>
 		</div>
   		<label id="idUser" hidden></label>
      		<form id="admUserPermissionForm" class="form-content">
	      		<div class="form-group row">
	    			<label style="margin-top: 30px" class="col-sm-6 col-form-label">Añadir Permiso:</label>
    	  		</div>
	    		<div class="form-row">
					<div class="form-group col-md-6">
					    <select class="form-control form-control-sm custom-color" id="permissionModules" name="permissionModules" >
					    	<option class="placeholder-option" value="" disabled selected >Seleccione el módulo</option>
					    </select>
	      			</div>
					<div class="row icon button">
						<a id="btn-modal-add-permission" class="btn btn-primary a-btn-slide-text">
				        	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
				        	<span><strong>Añadir Permiso</strong></span>            
				    	</a>
					</div>
				</div>
				<div class="form-row">
	      			<div class="form-group col-md-6">
					    <div class="msg-error">
					   			*Debe seleccionar un módulo.
		      			</div>
	      			</div>
				</div>
		   	</form>
		   	
		   	<table id="dtPermission" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
			  <thead>
			    <tr>
			      <th class="th-sm">Id
			      </th>
			      <th class="th-sm">Nombre del Módulo
			      </th>
			      <th class="th-sm">Fecha de Asignación
			      </th>
			    </tr>
			  </thead>
			  <tbody id="table-data-permission">
			  </tbody>
			</table>
			
			<div class="row icon button">
				<a id="btn-modal-delete-permission" class="btn btn-primary a-btn-slide-text">
		        	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
		        	<span><strong>Eliminar Permiso</strong></span>            
		    	</a>
			</div>
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
			<h4 style="text-align: center;"><p>¿Está seguro que desea eliminarle al usuario el permiso seleccionado?</p></h4>
			<div class="modal-footer" style="border-top: none">
				<button type="button" id="btn-modal-confirm"  class="btn btn-primary">Confirmar</button>
				<button type="button" id="btn-modal-cancel" class="btn btn-secundary">Cancelar</button>
			</div>
      </div>
    </div>
  </div>
</div>
<!-- End Modal Confirm -->
  
<!-- End page content -->
</div>

<script type="text/javascript">

$(document).ready(function() {
   	 $.ajax({
    	  url: "/Cotizador/rest/permission/all",
    	  type: "GET",
    	  dataType: "json",
    	  contentType: "application/json; charset=utf-8",
    	  success: function(result){		    		
    	        console.log("termino");
    	        console.log(result);
    	        $.each(result, function( index, element ) {	    	        	
    	        	
    	        	table.rows.add(
    	        		       [{ "Id": result[index].id, 
    	        		       	  "Nombre": result[index].nombre, 
    	        		    	   "Login": result[index].login,
    	        		    	   "Cargo": result[index].cargo,
    	        		    	   "Permisos": result[index].permisos
    	        		    	}]).draw(); 
    	        });
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
		        },
		        columns:[
            	    {data: 'Id'},
            	    {data: 'Nombre'},
            	    {data: 'Login'},
            	    {data: 'Cargo'},
            	    {data: 'Permisos'}],
        	    "columnDefs": [
                    {
                        "targets": [ 0 ],
                        "visible": false,
                        "searchable": false
                    }]
		  }); 
   	
   	var tablePermission = $('#dtPermission').DataTable({
						  responsive: true,
						    "pagingType": "simple_numbers",
						    "pageLength": 5,
						    "searching": false,
						    "language": {
					            "lengthMenu": "Permisos Otorgados",
					            "zeroRecords": "No existen registros",
					            "emptyTable":     "No existen registros en tabla",
					            "info": "Mostrando del _START_ al _END_ de un total de _TOTAL_ registros.",
					            "infoEmpty": "",
					            "infoFiltered": "",
					            "paginate": {
					                "previous": "Atrás",
					                "next": "Siguiente"
					              }
					        },
					        columns:[
			            	    {data: 'Id'},
			            	    {data: 'Nombre'},
			            	    {data: 'Fecha'}],
			            	   
			            	"columnDefs": [
		                        {
		                            "targets": [ 0 ],
		                            "visible": false,
		                            "searchable": false
		                        }]
					  });
		  
		  $('#dtUserModulePermission tbody').on( 'click', 'tr', function () {
		        if ($(this).hasClass('selected')) {
		            $(this).removeClass('selected');
		        }
		        else {
		        	table.$('tr.selected').removeClass('selected');
		            $(this).addClass('selected'); 
		        }
		    } );
		  
		  $('#dtPermission tbody').on( 'click', 'tr', function () {
		        if ($(this).hasClass('selected')) {
		            $(this).removeClass('selected');
		        }
		        else {
		        	tablePermission.$('tr.selected').removeClass('selected');
		            $(this).addClass('selected'); 
		        }
		    } );

		$("#btn-adm-permission").click(function() {
			console.log("adm user permission");
			clear();
			if(table.$('tr.selected').length != 1) {
				console.log("No hay usuario seleccionado");   	 
				return false;
			} 
			var $userModify = table.rows('.selected').data()[0];
			console.log("modify user permission " + $userModify);
			var $id = $userModify.Id;
			var $nombre =  $userModify.Nombre;
	    	 var $login =  $userModify.Login;
			$('#user-modal-permission').find('#nombre').val($nombre);
			$('#user-modal-permission').find('#login').val($login);
			$('#user-modal-permission').find('#idUser').val($id);
			
			$.ajax({
		    	  url: "/Cotizador/rest/permission/retrieveUserPermission",
		    	  type: "POST",
		    	  data: JSON.stringify({login: $login}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino");
		    	        console.log(result);
		    	        
		    	        $.each(result, function( index, element ) {	 
		    	        	
		    	        	tablePermission.rows.add(
		    	        		       [{ "Nombre": result[index].nombre, 
		    	        		    	   "Fecha": result[index].fecha,
		    	        		    	   "Id": result[index].id
		    	        		    	}]).draw(); 
		    	        });
		    	  },
		    	  complete: function(result){
		    	        console.log("complete");
		    	  },
		    	  error: function(result){
		    	        console.log("error");
		    	  }
		    	  
		    	});
			
			$.ajax({
		    	  url: "/Cotizador/rest/permission/modulesToUser",
		    	  type: "POST",
		    	  data: JSON.stringify({login: $login}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino");
		    	        console.log(result);
		    	        
		    	        $.each(result, function( index, element ) {	 
		    	        	var o = new Option(result[index].nombre, result[index].id);
		    	        	$(o).html(result[index].nombre);
		    	        	$("#permissionModules").append(o);
		    	        
		    	        });
		    	        $("#user-modal-permission").modal("show");
		    	        $("#user-modal-permission").css('z-index', '2');
	    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        $("#user-modal-permission").off();
		    	  },
		    	  complete: function(result){
		    	        console.log("complete");
		    	  },
		    	  error: function(result){
		    	        console.log("error");
		    	  }
		    	  
		    	});
			
			
		});
		
	
		$("#btn-modal-add-permission").click(function() {
	    	 var $login =  $("#login").val();
	    	 var $moduleSelected =  $("#permissionModules option:selected").val();
	    	 $(".msg-error").removeClass("on");
	    	 
	    	 if ($login == "" || $moduleSelected == "") {
	    		  $(".msg-error").addClass("on");
	    		  return false;
	   		 } else {
	   		      console.log("Hay modulo seleccionado");
	   		 }
	    	 
	    	  var $form = $("#admUserPermissionForm").serializeArray();    	  	  
		  	  var $formSerialized = objectifyForm($form);
	    	 
	  	 	 $("#user-modal-permission").css('z-index', '1');
	    	 $.ajax({
		    	  url: "/Cotizador/rest/permission/addPermission",
		    	  type: "POST",
		    	  data: JSON.stringify({login: $login,  modulo: $moduleSelected}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino de agregar permiso al usuario");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $(".msg-error").removeClass("on");
		    	        $("#user-modal-permission").css('z-index', '2');
	    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        if(obj === undefined) {	    	  
		    	        	$(".msg-error").html("Ha ocurrido un error, el permiso no pudo ser otorgado.");
		    	        	$(".msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result != null) {
				    	        tablePermission.rows.add(
				    	        		       [{ "Nombre": result.nombre, 
				    	        		    	   "Fecha": result.fecha,
				    	        		    	   "Id": result.id
				    	        		    	}]).draw(); 
				    	        $("#permissionModules").val([""]);	
				    	        $("#permissionModules option[value='"+$moduleSelected+"']").remove();
				    	        
				    	        
		    	        	} else {
		    	        		$(".msg-error").html("Ha ocurrido un error, el permiso no pudo ser otorgado.");
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
		
		$("#btn-modal-delete-permission").click(function() {
			if(tablePermission.$('tr.selected').length != 1) {
				console.log("No hay permiso seleccionado");   	 
				return false;
			} 
			$("#modal-confirm").modal("show");
		});
		$("#btn-modal-cancel").click(function() {
			$("#modal-confirm").modal("hide");
		});
		$("#btn-modal-confirm").click(function() {
			$("#modal-confirm").modal("hide");
			if(tablePermission.$('tr.selected').length != 1) {
				console.log("No hay permiso seleccionado");   	 
				return false;
			} 
			var $login =  $("#idUser").val();
			var $permissionDelete = tablePermission.rows('.selected').data()[0]['Id'];
			var $permissionName = tablePermission.rows('.selected').data()[0]['Nombre'];
			console.log("delete permiso usuario " + $login);   	 
			console.log("delete permiso modulo " + $permissionDelete);   	 
			$("#user-modal-permission").css('z-index', '1');
			$.ajax({
		    	  url: "/Cotizador/rest/permission/deletePermission",
		    	  type: "POST",
		    	  data: JSON.stringify({login: $login, module: $permissionDelete}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino de borrar permiso");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $(".msg-error").removeClass("on");
		    	        $("#user-modal-permission").css('z-index', '2');
	    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        if(obj === undefined) {	    	        	
		    	        	console.log("Ha ocurrido un error, el permiso no pudo ser eliminado.")
		    	        } else {
		    	        	if(result) {
		    	        		tablePermission.rows('.selected').remove().draw( false );
		    	        		
		    	        		var o = new Option($permissionName, $permissionDelete);
			    	        	$(o).html($permissionName);
			    	        	$("#permissionModules").append(o);
		    	        	} else {
		    	        		console.log("Ha ocurrido un error, el usuario no pudo ser eliminado.");
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
		
		$("#permissionModules").click(function() {
			$(this).removeClass("custom-color");
		});	
		
		function clear() {
			$('#permissionModules').empty()
		    .append('<option class="placeholder-option" value="" disabled selected >Seleccione el módulo</option>');
			tablePermission.clear().draw();
		}
		
		$(".js-close").click(function(){
			  $(this).parents(".modal").modal("hide");
		});
	  });  
	  
		  
	</script>
	
</t:standardPage>
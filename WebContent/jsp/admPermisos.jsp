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
      		<form id="admUserPermissionForm" class="form-content">
	    		<div class="form-row">
					<div class="form-group col-md-6">
					    <select class="form-control form-control-sm custom-color" id="permissionModules" name="permissionModules" >
					    	<option class="placeholder-option" value="" disabled selected >Seleccione el m�dulo</option>
					    </select>
	      			</div>
					<div class="row icon button">
						<a id="btn-modal-add-permission" class="btn btn-primary a-btn-slide-text">
				        	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
				        	<span><strong>A�adir Permiso</strong></span>            
				    	</a>
					</div>
				</div>
				<div class="form-row">
	      			<div class="form-group col-md-6">
					    <div class="msg-error">
					   			*Debe seleccionar un m�dulo.
		      			</div>
	      			</div>
				</div>
		   	</form>
		   	
		   	<table id="dtPermission" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
			  <thead>
			    <tr>
			      <th class="th-sm">Nombre del M�dulo
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
    	        $.each(result, function( index, element ) {	    	        	
    	        	
    	        	table.rows.add(
    	        		       [{ "Nombre": result[index].nombre, 
    	        		    	   "Login": result[index].login,
    	        		    	   "Cargo": result[index].cargo
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
		            "lengthMenu": "M�dulo de Permisos de Usuario",
		            "zeroRecords": "No existen registros",
		            "emptyTable":     "No existen registros en tabla",
		            "info": "Mostrando del _START_ al _END_ de un total de _TOTAL_ registros.",
		            "infoEmpty": "",
		            "infoFiltered": "",
		            "search": "Buscar: ",
		            "paginate": {
		                "previous": "Atr�s",
		                "next": "Siguiente"
		             }
		        },
		        columns:[
            	    {data: 'Nombre'},
            	    {data: 'Login'},
            	    {data: 'Cargo'}]
		  }); 
   	
   	var tablePermission = $('#dtPermission').DataTable({
						  responsive: true,
						    "pagingType": "simple_numbers",
						    "pageLength": 5,
						    "searching": false,
						    "paging": false,
						    "language": {
					            "lengthMenu": "Permisos Otorgados",
					            "zeroRecords": "No existen registros",
					            "emptyTable":     "No existen registros en tabla",
					            "info": "Mostrando del _START_ al _END_ de un total de _TOTAL_ registros.",
					            "infoEmpty": "",
					            "infoFiltered": "",
					            "paginate": {
					                "previous": "Atr�s",
					                "next": "Siguiente"
					              }
					        },
					        columns:[
			            	    {data: 'Nombre'}]
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
			if(table.$('tr.selected').length != 1) {
				console.log("No hay usuario seleccionado");   	 
				return false;
			} 
			var $userModify = table.rows('.selected').data()[0];
			console.log("modify user permission " + $userModify);
			var $nombre =  $userModify.Nombre;
	    	 var $login =  $userModify.Login;
	    	 var $cargo =  $userModify.Cargo;
			$('#user-modal-permission').find('#nombre').val($nombre);
			$('#user-modal-permission').find('#login').val($login);
			$('#user-modal-permission').find('#cargo').val($cargo);
			
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
		    	  },
		    	  complete: function(result){
		    	        console.log("complete");
		    	  },
		    	  error: function(result){
		    	        console.log("error");
		    	  }
		    	  
		    	});
			
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
		    	        		       [{ "Nombre": result[index].modulo.nombre 
		    	        		    	}]).draw(); 
		    	        });
		    	        $("#user-modal-permission").modal("show");
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
		    	        
		    	        if(obj === undefined) {	    	  
		    	        	$("#user-modal-permission").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	$(".msg-error").html("Ha ocurrido un error, el permiso no pudo ser otorgado.");
		    	        	$(".msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result != null) {
				    	        	tablePermission.rows.add(
				    	        		       [{ "Nombre": result.modulo.nombre 
				    	        		    	}]).draw(); 
		    	        	} else {
		    	        		$("#user-modal-permission").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
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
		
		
	  });   
		  
	</script>
	
</t:standardPage>
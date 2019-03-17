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
		<a id="btn-provider-create" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
        	<span><strong>Crear</strong></span>            
    	</a>
    	<a id="btn-provider-modify" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        	<span><strong>Editar</strong></span>            
    	</a>
    	<a id="btn-provider-delete" class="btn btn-primary a-btn-slide-text">
       		<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
        	<span><strong>Borrar</strong></span>            
    	</a>
	</div>
<table id="dtProviderModule" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Id
      </th>
      <th class="th-sm">Código
      </th>
      <th class="th-sm">Nombre
      </th>
      <th class="th-sm">Dirección
      </th>
      <th class="th-sm">Nombre Contacto 1
      </th>
      <th class="th-sm">Correo Contacto 1
      </th>
      <th class="th-sm">Teléfono Contacto 1
      </th>
      <th class="th-sm">Nombre Contacto 2
      </th>
      <th class="th-sm">Correo Contacto 2
      </th>
      <th class="th-sm">Teléfono Contacto 2
      </th>
      <th class="th-sm">Nombre Contacto 3
      </th>
      <th class="th-sm">Correo Contacto 3
      </th>
      <th class="th-sm">Teléfono Contacto 3
      </th>
    </tr>
  </thead>
  <tbody id="provider-table-data">
  </tbody>
  <tfoot>
    <tr>
      <th>Id
      </th>
      <th>Código
      </th>
      <th>Nombre
      </th>
      <th>Dirección
      </th>
      <th>Nombre Contacto 1
      </th>
      <th >Correo Contacto 1
      </th>
      <th >Teléfono Contacto 1
      </th>
      <th>Nombre Contacto 2
      </th>
      <th >Correo Contacto 2
      </th>
      <th >Teléfono Contacto 2
      </th>
      <th >Nombre Contacto 3
      </th>
      <th >Correo Contacto 3
      </th>
      <th >Teléfono Contacto 3
      </th>
    </tr>
  </tfoot>
</table>
	<div class="form-group col-md-10">
		<div id="error-table" class="msg-error">
			Error.
		</div>
	</div>
</div>

<!-- Modal -->
<div id="provider-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close js-close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title-text">Crear Proveedor</h4>
      </div>
      <div class="modal-body">
      		<form id="createProviderForm" class="form-content">
			<input id="id" type="hidden" name="id"/>
			<input id="codigoAnterior" type="hidden" name="codigoAnterior"/>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="codigo" type="text" name="codigo" placeholder="Código" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="nombre" type="text" name="nombre" placeholder="Nombre" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="direccion" type="text" name="direccion" placeholder="Dirección" maxlength="200"/>
      			</div>
    		</div>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="nombreContacto1" type="text" name="nombreContacto1" placeholder="Nombre Contacto 1" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="correoContacto1" type="text" name="correoContacto1" placeholder="Correo Contacto 1" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="telefonoContacto1" type="text" name="telefonoContacto1" placeholder="Teléfono Contacto 1" maxlength="200"/>
      			</div>
      		</div>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="nombreContacto2" type="text" name="nombreContacto2" placeholder="Nombre Contacto 2" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="correoContacto2" type="text" name="correoContacto2" placeholder="Correo Contacto 2" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="telefonoContacto2" type="text" name="telefonoContacto2" placeholder="Teléfono Contacto 2" maxlength="200"/>
      			</div>
      		</div>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="nombreContacto3" type="text" name="nombreContacto3" placeholder="Nombre Contacto 3" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="correoContacto3" type="text" name="correoContacto3" placeholder="Correo Contacto 3" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="telefonoContacto3" type="text" name="telefonoContacto3" placeholder="Teléfono Contacto 3" maxlength="200"/>
      			</div>
      		</div>
      		<div class="form-row">
      			<div class="form-group col-md-10">
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
			<h4 style="text-align: center;"><p>¿Está seguro que desea eliminar el proveedor seleccionado?</p></h4>
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
    	  url: "/Cotizador/rest/provider/all",
    	  type: "GET",
    	  dataType: "json",
    	  contentType: "application/json; charset=utf-8",
    	  success: function(result){		    		
    	        console.log("termino");
    	        console.log(result);

    	        $.each(result, function( index, element ) {	   
    	        	
    	        	table.rows.add(
 	        		       [{ "Id": result[index].id, 
 	        		    	   "Codigo": result[index].codigo,
 	        		    	   "Nombre": result[index].nombre,
 	        		    	   "Direccion": result[index].direccion,
 	        		    	   "NombreContacto1": result[index].nombreContacto1,
 	        		    	   "CorreoContacto1": result[index].correoContacto1,
 	        		    	   "TelefonoContacto1": result[index].telefonoContacto1,
 	        		    	   "NombreContacto2": result[index].nombreContacto2,
	        		    	   "CorreoContacto2": result[index].correoContacto2,
	        		    	   "TelefonoContacto2": result[index].telefonoContacto2,
	        		    	   "NombreContacto3": result[index].nombreContacto3,
	        		    	   "CorreoContacto3": result[index].correoContacto3,
	        		    	   "TelefonoContacto3": result[index].telefonoContacto3 	        		    	
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
   	 
   	var table = $('#dtProviderModule').DataTable({
			  responsive: true,
			    "pagingType": "simple_numbers",
			    "pageLength": 10,
			    "language": {
		            "lengthMenu": "Módulo de Proveedores",
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
            	    {data: 'Codigo'},
            	    {data: 'Nombre'},
            	    {data: 'Direccion'},
            	    {data: 'NombreContacto1'},
            	    {data: 'CorreoContacto1'},
            	    {data: 'TelefonoContacto1'},
            	    {data: 'NombreContacto2'},
            	    {data: 'CorreoContacto2'},
            	    {data: 'TelefonoContacto2'},
            	    {data: 'NombreContacto3'},
            	    {data: 'CorreoContacto3'},
            	    {data: 'TelefonoContacto3'}],
	       	    "columnDefs": [
	                   {
	                       "targets": [ 0 ],
	                       "visible": false,
	                       "searchable": false
	                   }]
		  }); 
		  $('.dataTables_length').addClass('bs-select');
		  
		  $('#dtProviderModule tbody').on( 'click', 'tr', function () {
		        if ($(this).hasClass('selected')) {
		            $(this).removeClass('selected');
		        }
		        else {
		        	table.$('tr.selected').removeClass('selected');
		            $(this).addClass('selected'); 
		        }
		    } );

		$("#btn-provider-create").click(function() {
			console.log("create provider"); 
			table.$('tr.selected').removeClass('selected');
			$(".msg-error").removeClass("on");
			$("#id").val('');
	    	$("#codigoAnterior").val('');
	    	$("#codigo").val('');
	    	$("#nombre").val('');
	    	$("#direccion").val('');
	    	$("#nombreContacto1").val('');
	    	$("#correoContacto1").val('');
	    	$("#telefonoContacto1").val('');
	    	$("#nombreContacto2").val('');
	    	$("#correoContacto2").val('');
	    	$("#telefonoContacto2").val('');
	    	$("#nombreContacto3").val('');
	    	$("#correoContacto3").val('');
	    	$("#telefonoContacto3").val('');
			$('#provider-modal').find('#btn-modal-update').css('visibility', 'hidden');
			$('#provider-modal').find('#btn-modal-update').css('display', 'none');
			$('#provider-modal').find('#btn-modal-create').css('visibility', 'visible');
			$('#provider-modal').find('#btn-modal-create').css('display', '');
			$('#provider-modal').find('#modal-title-text').html('Crear Proveedor');
			$("#provider-modal").modal("show");
			$("#provider-modal").off();
		});
		
		$("#btn-provider-modify").click(function() {
			console.log("modify provider");   
			if(table.$('tr.selected').length != 1) {
				console.log("No hay proveedor seleccionado");   	 
				return false;
			} 
			var $providerModify = table.rows('.selected').data()[0];
			console.log("modify provider " + $providerModify);
			var $codigo =  $providerModify.Codigo;
	    	var $nombre =  $providerModify.Nombre;
	    	var $direccion =  $providerModify.Direccion;
	    	var $id =  $providerModify.Id;
	    	var $nombreContacto1 =  $providerModify.NombreContacto1;
	    	var $correoContacto1 =  $providerModify.CorreoContacto1;
	    	var $telefonoContacto1 =  $providerModify.TelefonoContacto1;
	    	var $nombreContacto2 =  $providerModify.NombreContacto2;
	    	var $correoContacto2 =  $providerModify.CorreoContacto2;
	    	var $telefonoContacto2 =  $providerModify.TelefonoContacto2;
	    	var $nombreContacto3 =  $providerModify.NombreContacto3;
	    	var $correoContacto3 =  $providerModify.CorreoContacto3;
	    	var $telefonoContacto3 =  $providerModify.TelefonoContacto3;
			$('#provider-modal').find('#id').val($id);
			$('#provider-modal').find('#codigo').val($codigo);
			$('#provider-modal').find('#codigoAnterior').val($codigo);
			$('#provider-modal').find('#nombre').val($nombre);
			$('#provider-modal').find('#direccion').val($direccion);
			$('#provider-modal').find('#nombreContacto1').val($nombreContacto1);
			$('#provider-modal').find('#correoContacto1').val($correoContacto1);
			$('#provider-modal').find('#telefonoContacto1').val($telefonoContacto1);
			$('#provider-modal').find('#nombreContacto2').val($nombreContacto2);
			$('#provider-modal').find('#correoContacto2').val($correoContacto2);
			$('#provider-modal').find('#telefonoContacto2').val($telefonoContacto2);
			$('#provider-modal').find('#nombreContacto3').val($nombreContacto3);
			$('#provider-modal').find('#correoContacto3').val($correoContacto3);
			$('#provider-modal').find('#telefonoContacto3').val($telefonoContacto3);
			$('#provider-modal').find('#btn-modal-create').css('visibility', 'hidden');
			$('#provider-modal').find('#btn-modal-create').css('display', 'none');
			$('#provider-modal').find('#btn-modal-update').css('visibility', 'visible');
			$('#provider-modal').find('#btn-modal-update').css('display', '');
			$('#provider-modal').find('#modal-title-text').html('Modificar Proveedor');
			$("#provider-modal").modal("show");
		});
		
		$("#btn-provider-delete").click(function() {
			if(table.$('tr.selected').length != 1) {
				console.log("No hay proveedor seleccionado");   	 
				return false;
			} 
			$("#modal-confirm").modal("show");
		});
		$("#btn-modal-cancel").click(function() {
			$("#modal-confirm").modal("hide");
		});
		$("#btn-modal-confirm").click(function() {
			$("#modal-confirm").modal("hide");
			if(table.$('tr.selected').length != 1) {
				console.log("No hay proveedor seleccionado");   	 
				return false;
			} 
			var $providerDelete = table.rows('.selected').data()[0]['Id'];
			console.log("delete proveedor " + $providerDelete);   	 
			
			$.ajax({
		    	  url: "/Cotizador/rest/provider/deleteProvider",
		    	  type: "POST",
		    	  data: JSON.stringify({id: $providerDelete}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino de borrar proveedor");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $("#error-table").removeClass("on");
		    	        
		    	        if(obj === undefined) {	 
		    	        	console.log("Ha ocurrido un error, el proveedor no pudo ser eliminado.")
		    	        	$("#error-table").html("Ha ocurrido un error, el proveedor no pudo ser eliminado.");
		    	        	$("#error-table").addClass("on");	
		    	        } else {
		    	        	if(result == 0) {
		    	        		table.rows('.selected').remove().draw( false );
		    	        	} else if(result == 2){
		    	        		console.log("Ha ocurrido un error, el proveedor no pudo ser eliminado.")
		    	        		$("#error-table").html("Ha ocurrido un error, el proveedor no pudo ser eliminado.");
			    	        	$("#error-table").addClass("on");	
		    	        	} else if(result == 1) {
		    	        		console.log("Ha ocurrido un error, el proveedor no pudo ser eliminado.")
		    	        		$("#error-table").html("El proveedor no pudo ser eliminado porque se encuentra asociado a una lista de precios.");
			    	        	$("#error-table").addClass("on");	
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
	    	var $codigo =  $("#codigo").val();
	    	var $nombre =  $("#nombre").val();
	    	var $direccion =  $("#direccion").val();
    		var $nombreContacto1 =  $("#nombreContacto1").val();
	    	var $correoContacto1 =  $("#correoContacto1").val();
	    	var $telefonoContacto1 = $("#telefonoContacto1").val();
	    	var $nombreContacto2 =  $("#nombreContacto2").val();
	    	var $correoContacto2 =  $("#correoContacto2").val();
	    	var $telefonoContacto2 = $("#telefonoContacto2").val();
	    	var $nombreContacto3 =  $("#nombreContacto3").val();
	    	var $correoContacto3 =  $("#correoContacto3").val();
	    	var $telefonoContacto3 = $("#telefonoContacto3").val();

	    	 $(".msg-error").removeClass("on");
		     $(".msg-error").html("Debe ingresar los datos.");		     
	    	 
	    	 if ($codigo == "" || $nombre == "" || $direccion == "" ||
	    		 $nombreContacto1 == "" || $correoContacto1 == "" || $telefonoContacto1 == "" ||
	    			 $nombreContacto2 == "" || $nombreContacto2 == "" || $telefonoContacto2 == "" ||
	    				 $nombreContacto3 == "" || $correoContacto3 == "" || $telefonoContacto3 == "") {
	    		  $(".msg-error").addClass("on");
	    		  return false;
	   		 } else {
	   		      console.log("Hay valores");
	   		 }
	    	 
	    	  var $form = $("#createProviderForm").serializeArray();    	  	  
		  	  var $formSerialized = objectifyForm($form);
	    	 
	  	 	 $("#provider-modal").css('z-index', '1');
	    	 $.ajax({
		    	  url: "/Cotizador/rest/provider/createProvider",
		    	  type: "POST",
		    	  data: JSON.stringify($formSerialized),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino creacion de proveedor");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $(".msg-error").removeClass("on");
		    	        
		    	        if(obj === undefined) {	    	  
		    	        	$("#provider-modal").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	$(".msg-error").html("Ha ocurrido un error, el proveedor no pudo ser creado.");
		    	        	$(".msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result == 0) {
			    	        	location.href = "admProveedores";
		    	        	} else if (result == 1) {
		    	        		$("#provider-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, codigo de proveedor ya existe.");
			    	        	$(".msg-error").addClass("on");	 
		    	        	} else if (result == 2) {
		    	        		$("#provider-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, el proveedor no pudo ser creado.");
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
		
		$("#btn-modal-update").click(function() {
	    	var $codigo =  $("#codigo").val();
	    	var $nombre =  $("#nombre").val();
	    	var $direccion =  $("#direccion").val();
	    	var $nombreContacto1 =  $("#nombreContacto1").val();
	    	var $correoContacto1 =  $("#correoContacto1").val();
	    	var $telefonoContacto1 = $("#telefonoContacto1").val();
	    	var $nombreContacto2 =  $("#nombreContacto2").val();
	    	var $correoContacto2 =  $("#correoContacto2").val();
	    	var $telefonoContacto2 = $("#telefonoContacto2").val();
	    	var $nombreContacto3 =  $("#nombreContacto3").val();
	    	var $correoContacto3 =  $("#correoContacto3").val();
	    	var $telefonoContacto3 = $("#telefonoContacto3").val();
	    	 
	    	 $(".msg-error").removeClass("on");
		     $(".msg-error").html("Debe ingresar los datos.");
		     
	    	 if ($codigo == "" || $nombre == "" || $direccion == "" ||
	    		 $nombreContacto1 == "" || $correoContacto1 == "" || $telefonoContacto1 == "" ||
	    			 $nombreContacto2 == "" || $nombreContacto2 == "" || $telefonoContacto2 == "" ||
	    				 $nombreContacto3 == "" || $correoContacto3 == "" || $telefonoContacto3 == "") {
	    		  $(".msg-error").addClass("on");
	    		  return false;
	   		 } else {
	   		      console.log("Hay valores");
	   		 }
	    	 
	    	 var $form = $("#createProviderForm").serializeArray();    	  	  
		  	 var $formSerialized = objectifyForm($form);
	    	 
	    	 $("#provider-modal").css('z-index', '1');
	    	 $.ajax({
		    	  url: "/Cotizador/rest/provider/updateProvider",
		    	  type: "POST",
		    	  data: JSON.stringify($formSerialized),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino actualizacion de proveedor");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $(".msg-error").removeClass("on");
		    	        
		    	        if(obj === undefined) {	    	  
		    	        	$("#provider-modal").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	$(".msg-error").html("Ha ocurrido un error, el proveedor no pudo ser actualizado.");
		    	        	$(".msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result == 0) {
			    	        	location.href = "admProveedores";
		    	        	} else if (result == 1) {
		    	        		$("#provider-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, código de proveedor ya existe.");
			    	        	$(".msg-error").addClass("on");	 
		    	        	} else if (result == 2) {
		    	        		$("#provider-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, el proveedor no pudo ser actualizado.");
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
		
		$(".js-close").click(function(){
			  $(this).parents(".modal").modal("hide");
		});
	  });   
		  
	</script>
	
</t:standardPage>
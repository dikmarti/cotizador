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
    </tr>
  </thead>
  <tbody id="user-table-data">
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
    </tr>
  </tfoot>
</table>
</div>

<!-- Modal -->
<div id="provider-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
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
    		</div>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="direccion" type="text" name="direccion" placeholder="Dirección" maxlength="200"/>
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
    </div>

  </div>
</div>
<!-- End Modal -->
  
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
 	        		    	   "Direccion": result[index].direccion
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
            	    {data: 'Direccion'}],
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
			$('#provider-modal').find('#btn-modal-update').css('visibility', 'hidden');
			$('#provider-modal').find('#btn-modal-update').css('display', 'none');
			$('#provider-modal').find('#btn-modal-create').css('visibility', 'visible');
			$('#provider-modal').find('#btn-modal-create').css('display', '');
			$('#provider-modal').find('#modal-title-text').html('Crear Proveedor');
			$("#provider-modal").modal("show");
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
			$('#provider-modal').find('#id').val($id);
			$('#provider-modal').find('#codigo').val($codigo);
			$('#provider-modal').find('#codigoAnterior').val($codigo);
			$('#provider-modal').find('#nombre').val($nombre);
			$('#provider-modal').find('#direccion').val($direccion);
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
		    	        
		    	        $(".msg-error").removeClass("on");
		    	        
		    	        if(obj === undefined) {	 
		    	        	console.log("Ha ocurrido un error, el proveedor no pudo ser eliminado.")
		    	        } else {
		    	        	if(result) {
			    	        	location.href = "admProveedores";
		    	        	} else {
		    	        		console.log("Ha ocurrido un error, el proveedor no pudo ser eliminado.")
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

	    	 $(".msg-error").removeClass("on");
		     $(".msg-error").html("Debe ingresar los datos.");
		     
	    	 
	    	 if ($codigo == "" || $nombre == "" || $direccion == "") {
	    		  $(".msg-error").addClass("on");
	    		  return false;
	   		 } else {
	   		      console.log("Hay valores");
	   		 }
	    	 
	    	  var $form = $("#createProviderForm").serializeArray();    	  	  
		  	  var $formSerialized = objectifyForm($form);
	    	 
	  	 	 $("#user-modal").css('z-index', '1');
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
		    	        	$("#user-modal").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	$(".msg-error").html("Ha ocurrido un error, el proveedor no pudo ser creado.");
		    	        	$(".msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result == 0) {
			    	        	location.href = "admProveedores";
		    	        	} else if (result == 1) {
		    	        		$("#user-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, codigo de proveedor ya existe.");
			    	        	$(".msg-error").addClass("on");	 
		    	        	} else if (result == 2) {
		    	        		$("#user-modal").css('z-index', '2');
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
	    	 
	    	 $(".msg-error").removeClass("on");
		     $(".msg-error").html("Debe ingresar los datos.");
		     
	    	 if ($codigo == "" || $nombre == "" || $direccion == "") {
	    		  $(".msg-error").addClass("on");
	    		  return false;
	   		 } else {
	   		      console.log("Hay valores");
	   		 }

	    	 
	    	 var $form = $("#createProviderForm").serializeArray();    	  	  
		  	 var $formSerialized = objectifyForm($form);
	    	 
	    	 $("#user-modal").css('z-index', '1');
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
		    	        	$("#user-modal").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	$(".msg-error").html("Ha ocurrido un error, el proveedor no pudo ser actualizado.");
		    	        	$(".msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result == 0) {
			    	        	location.href = "admProveedores";
		    	        	} else if (result == 1) {
		    	        		$("#user-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, código de proveedor ya existe.");
			    	        	$(".msg-error").addClass("on");	 
		    	        	} else if (result == 2) {
		    	        		$("#user-modal").css('z-index', '2');
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
	  });   
		  
	</script>
	
</t:standardPage>
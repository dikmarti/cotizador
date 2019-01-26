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
		<a id="btn-system-create" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
        	<span><strong>Crear</strong></span>            
    	</a>
    	<a id="btn-system-modify" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        	<span><strong>Editar</strong></span>            
    	</a>
    	<a id="btn-system-delete" class="btn btn-primary a-btn-slide-text">
       		<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
        	<span><strong>Borrar</strong></span>            
    	</a>
	</div>
<table id="dtSystemModule" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Id
      </th>
      <th class="th-sm">Nombre
      </th>
      <th class="th-sm">Descripción
      </th>
      <th class="th-sm">Elementos
      </th>
      <th class="th-sm">Materiales
      </th>
    </tr>
  </thead>
  <tbody id="system-table-data">
  </tbody>
  <tfoot>
    <tr>
      <th>Id
      </th>
      <th>Nombre
      </th>
      <th>Descripción
      </th>
      <th>Elementos
      </th>
      <th>Materiales
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
<div id="system-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title-text">Crear Sistema</h4>
      </div>
      <div class="modal-body">
      		<form id="createSystemForm" class="form-content">
			<input id="id" type="hidden" name="id"/>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="nombre" type="text" name="nombre" placeholder="Nombre" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="descripcion" type="text" name="descripcion" placeholder="Descripción" maxlength="200"/>
      			</div>
    		</div>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="elementos" type="text" name="elementos" placeholder="Elementos" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="materiales" type="text" name="materiales" placeholder="Materiales" maxlength="200"/>
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
  
<!-- End page content -->
</div>

<script type="text/javascript">

$(document).ready(function() {
   	 $.ajax({
    	  url: "/Cotizador/rest/system/all",
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
 	        		    	   "Descripcion": result[index].descripcion,
 	        		    	   "Elementos": result[index].elementos,
 	        		    	   "Materiales": result[index].materiales
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
   	 
   	var table = $('#dtSystemModule').DataTable({
			  responsive: true,
			    "pagingType": "simple_numbers",
			    "pageLength": 10,
			    "language": {
		            "lengthMenu": "Módulo de Sistemas",
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
            	    {data: 'Descripcion'},
            	    {data: 'Elementos'},
            	    {data: 'Materiales'}],
	       	    "columnDefs": [
	                   {
	                       "targets": [ 0 ],
	                       "visible": false,
	                       "searchable": false
	                   }]
		  }); 
		  $('.dataTables_length').addClass('bs-select');
		  
		  $('#dtSystemModule tbody').on( 'click', 'tr', function () {
		        if ($(this).hasClass('selected')) {
		            $(this).removeClass('selected');
		        }
		        else {
		        	table.$('tr.selected').removeClass('selected');
		            $(this).addClass('selected'); 
		        }
		    } );

		$("#btn-system-create").click(function() {
			console.log("create system"); 
			table.$('tr.selected').removeClass('selected');
			$(".msg-error").removeClass("on");
			$("#id").val('');
	    	$("#nombre").val('');
	    	$("#descripcion").val('');
	    	$("#elementos").val('');
	    	$("#materiales").val('');
			$('#system-modal').find('#btn-modal-update').css('visibility', 'hidden');
			$('#system-modal').find('#btn-modal-update').css('display', 'none');
			$('#system-modal').find('#btn-modal-create').css('visibility', 'visible');
			$('#system-modal').find('#btn-modal-create').css('display', '');
			$('#system-modal').find('#modal-title-text').html('Crear Sistema');
			$("#system-modal").modal("show");
		});
		
		$("#btn-system-modify").click(function() {
			console.log("modify system");   
			if(table.$('tr.selected').length != 1) {
				console.log("No hay sistema seleccionado");   	 
				return false;
			} 
			var $systemModify = table.rows('.selected').data()[0];
			console.log("modify system " + $systemModify);
	    	var $nombre =  $systemModify.Nombre;
			var $descripcion =  $systemModify.Descripcion;
	    	var $elementos =  $systemModify.Elementos;
	    	var $materiales =  $systemModify.Materiales;
	    	var $id =  $systemModify.Id;
			$('#system-modal').find('#id').val($id);
			$('#system-modal').find('#nombre').val($nombre);
			$('#system-modal').find('#descripcion').val($descripcion);
			$('#system-modal').find('#elementos').val($elementos);
			$('#system-modal').find('#materiales').val($materiales);
			$('#system-modal').find('#btn-modal-create').css('visibility', 'hidden');
			$('#system-modal').find('#btn-modal-create').css('display', 'none');
			$('#system-modal').find('#btn-modal-update').css('visibility', 'visible');
			$('#system-modal').find('#btn-modal-update').css('display', '');
			$('#system-modal').find('#modal-title-text').html('Modificar Sistema');
			$("#system-modal").modal("show");
		});
		
		$("#btn-system-delete").click(function() {
			if(table.$('tr.selected').length != 1) {
				console.log("No hay sistema seleccionado");   	 
				return false;
			} 
			var $systemDelete = table.rows('.selected').data()[0]['Id'];
			console.log("delete sistema " + $systemDelete);   	 
			
			$.ajax({
		    	  url: "/Cotizador/rest/system/deleteSystem",
		    	  type: "POST",
		    	  data: JSON.stringify({id: $systemDelete}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino de borrar sistema");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $("#error-table").removeClass("on");
		    	        
		    	        if(obj === undefined) {	 
		    	        	console.log("Ha ocurrido un error, el sistema no pudo ser eliminado.")
		    	        	$("#error-table").html("Ha ocurrido un error, el sistema no pudo ser eliminado.");
		    	        	$("#error-table").addClass("on");	
		    	        } else {
		    	        	if(result) {
		    	        		table.rows('.selected').remove().draw( false );
		    	        	} else {
		    	        		console.log("Ha ocurrido un error, el sistema no pudo ser eliminado.")
		    	        		$("#error-table").html("Ha ocurrido un error, el sistema no pudo ser eliminado.");
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
	    	 var $nombre =  $("#nombre").val();
	    	 var $descripcion =  $("#descripcion").val();
	    	 var $elementos =  $("#elementos").val();
	    	 var $materiales =  $("#materiales").val();

	    	 $(".msg-error").removeClass("on");
		     $(".msg-error").html("Debe ingresar los datos.");
		     
	    	 
	    	 if ($nombre == "" || $descripcion == "" || $elementos == "" || $materiales == "") {
	    		  $(".msg-error").addClass("on");
	    		  return false;
	   		 } else {
	   		      console.log("Hay valores");
	   		 }
	    	 
	    	  var $form = $("#createSystemForm").serializeArray();    	  	  
		  	  var $formSerialized = objectifyForm($form);
	    	 
	  	 	 $("#system-modal").css('z-index', '1');
	    	 $.ajax({
		    	  url: "/Cotizador/rest/system/createSystem",
		    	  type: "POST",
		    	  data: JSON.stringify($formSerialized),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino creacion de sistema");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $(".msg-error").removeClass("on");
		    	        
		    	        if(obj === undefined) {	    	  
		    	        	$("#system-modal").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	$(".msg-error").html("Ha ocurrido un error, el sistema no pudo ser creado.");
		    	        	$(".msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result == 0) {
			    	        	location.href = "admSistemas";
		    	        	} else if (result == 1) {
		    	        		$("#system-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, el sistema no pudo ser creado.");
			    	        	$(".msg-error").addClass("on");	 
		    	        	} else if (result == 2) {
		    	        		$("#system-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, el sistema no pudo ser creado.");
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
	    	 var $nombre =  $("#nombre").val();
	    	 var $descripcion =  $("#descripcion").val();
	    	 var $elementos =  $("#elementos").val();
	    	 var $materiales =  $("#materiales").val();
	    	 
	    	 $(".msg-error").removeClass("on");
		     $(".msg-error").html("Debe ingresar los datos.");
		     
	    	 if ($nombre == "" || $descripcion == "" || $elementos == "" || $materiales == "") {
	    		  $(".msg-error").addClass("on");
	    		  return false;
	   		 } else {
	   		      console.log("Hay valores");
	   		 }

	    	 
	    	 var $form = $("#createSystemForm").serializeArray();    	  	  
		  	 var $formSerialized = objectifyForm($form);
	    	 
	    	 $("#system-modal").css('z-index', '1');
	    	 $.ajax({
		    	  url: "/Cotizador/rest/system/updateSystem",
		    	  type: "POST",
		    	  data: JSON.stringify($formSerialized),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino actualizacion de sistema");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $(".msg-error").removeClass("on");
		    	        
		    	        if(obj === undefined) {	    	  
		    	        	$("#system-modal").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	$(".msg-error").html("Ha ocurrido un error, el sistema no pudo ser actualizado.");
		    	        	$(".msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result == 0) {
			    	        	location.href = "admSistemas";
		    	        	} else if (result == 1) {
		    	        		$("#system-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, el sistema no pudo ser actualizado.");
			    	        	$(".msg-error").addClass("on");	 
		    	        	} else if (result == 2) {
		    	        		$("#system-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, el sistema no pudo ser actualizado.");
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
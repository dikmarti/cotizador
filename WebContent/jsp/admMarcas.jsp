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
		<a id="btn-brand-create" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
        	<span><strong>Crear</strong></span>            
    	</a>
    	<a id="btn-brand-modify" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        	<span><strong>Editar</strong></span>            
    	</a>
    	<a id="btn-brand-delete" class="btn btn-primary a-btn-slide-text">
       		<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
        	<span><strong>Borrar</strong></span>            
    	</a>
	</div>
<table id="dtBrandModule" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Id
      </th>
      <th class="th-sm">Nombre
      </th>
      <th class="th-sm">Descripción
      </th>
    </tr>
  </thead>
  <tbody id="brand-table-data">
  </tbody>
  <tfoot>
    <tr>
      <th>Id
      </th>
      <th>Nombre
      </th>
      <th>Descripción
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
<div id="brand-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close js-close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title-text">Crear Marca</h4>
      </div>
      <div class="modal-body">
      		<form id="createBrandForm" class="form-content">
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
			<h4 style="text-align: center;"><p>¿Está seguro que desea eliminar la marca seleccionada?</p></h4>
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
    	  url: "/Cotizador/rest/brand/all",
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
 	        		    	   "Descripcion": result[index].descripcion 	        		    	   
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
   	 
   	var table = $('#dtBrandModule').DataTable({
			  responsive: true,
			    "pagingType": "simple_numbers",
			    "pageLength": 10,
			    "language": {
		            "lengthMenu": "Módulo de Marcas",
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
            	    {data: 'Descripcion'}],
	       	    "columnDefs": [
	                   {
	                       "targets": [ 0 ],
	                       "visible": false,
	                       "searchable": false
	                   }]
		  }); 
		  $('.dataTables_length').addClass('bs-select');
		  
		  $('#dtBrandModule tbody').on( 'click', 'tr', function () {
		        if ($(this).hasClass('selected')) {
		            $(this).removeClass('selected');
		        }
		        else {
		        	table.$('tr.selected').removeClass('selected');
		            $(this).addClass('selected'); 
		        }
		    } );

		$("#btn-brand-create").click(function() {
			console.log("create brand"); 
			table.$('tr.selected').removeClass('selected');
			$(".msg-error").removeClass("on");
			$("#id").val('');
	    	$("#nombre").val('');
	    	$("#descripcion").val('');	    	
			$('#brand-modal').find('#btn-modal-update').css('visibility', 'hidden');
			$('#brand-modal').find('#btn-modal-update').css('display', 'none');
			$('#brand-modal').find('#btn-modal-create').css('visibility', 'visible');
			$('#brand-modal').find('#btn-modal-create').css('display', '');
			$('#brand-modal').find('#modal-title-text').html('Crear Marca');
			$("#brand-modal").modal("show");
			$("#brand-modal").off();
		});
		
		$("#btn-brand-modify").click(function() {
			console.log("modify brand");   
			if(table.$('tr.selected').length != 1) {
				console.log("No hay marca seleccionada");   	 
				return false;
			} 
			var $brandModify = table.rows('.selected').data()[0];
			console.log("modify brand " + $brandModify);
	    	var $nombre =  $brandModify.Nombre;
			var $descripcion =  $brandModify.Descripcion;
	    	var $id =  $brandModify.Id;
			$('#brand-modal').find('#id').val($id);
			$('#brand-modal').find('#nombre').val($nombre);
			$('#brand-modal').find('#descripcion').val($descripcion);
			$('#brand-modal').find('#btn-modal-create').css('visibility', 'hidden');
			$('#brand-modal').find('#btn-modal-create').css('display', 'none');
			$('#brand-modal').find('#btn-modal-update').css('visibility', 'visible');
			$('#brand-modal').find('#btn-modal-update').css('display', '');
			$('#brand-modal').find('#modal-title-text').html('Modificar Marca');
			$("#brand-modal").modal("show");
		});
		
		$("#btn-brand-delete").click(function() {
			if(table.$('tr.selected').length != 1) {
				console.log("No hay marca seleccionada");   	 
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
				console.log("No hay marca seleccionada");   	 
				return false;
			} 
			var $brandDelete = table.rows('.selected').data()[0]['Id'];
			console.log("delete brand " + $brandDelete);   	 
			
			$.ajax({
		    	  url: "/Cotizador/rest/brand/deleteBrand",
		    	  type: "POST",
		    	  data: JSON.stringify({id: $brandDelete}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino de borrar marca");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $("#error-table").removeClass("on");
		    	        
		    	        if(obj === undefined) {	 
		    	        	console.log("Ha ocurrido un error, la marca no pudo ser eliminada.")
		    	        	$("#error-table").html("Ha ocurrido un error, la marca no pudo ser eliminada.");
		    	        	$("#error-table").addClass("on");	
		    	        } else {
		    	        	if(result == 0) {
		    	        		table.rows('.selected').remove().draw( false );
		    	        	} else if (result == 1) {
		    	        		console.log("Ha ocurrido un error, la marca no pudo ser eliminada porque posee productos asociados.")
		    	        		$("#error-table").html("Ha ocurrido un error, la marca no pudo ser eliminada porque posee productos asociados.");
			    	        	$("#error-table").addClass("on");
		    	        	} else if (result == 2) {
			    	        	console.log("Ha ocurrido un error, la marca no pudo ser eliminada.")
		    	        		$("#error-table").html("Ha ocurrido un error, la marca no pudo ser eliminada.");
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
	
	    	 $(".msg-error").removeClass("on");
		     $(".msg-error").html("Debe ingresar los datos.");
		    	    	
	    	 if ($nombre == "" || $descripcion == "") {
	    		  $(".msg-error").addClass("on");
	    		  return false;
	   		 } else {
	   		      console.log("Hay valores");
	   		 }
	    	 
	    	  var $form = $("#createBrandForm").serializeArray();    	  	  
		  	  var $formSerialized = objectifyForm($form);
	    	 
	  	 	 $("#brand-modal").css('z-index', '1');
	    	 $.ajax({
		    	  url: "/Cotizador/rest/brand/createBrand",
		    	  type: "POST",
		    	  data: JSON.stringify($formSerialized),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino creacion de marca");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $(".msg-error").removeClass("on");
		    	        
		    	        if(obj === undefined) {	    	  
		    	        	$("#brand-modal").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	$(".msg-error").html("Ha ocurrido un error, la marca no pudo ser creada.");
		    	        	$(".msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result == 0) {
			    	        	location.href = "admMarcas";
		    	        	} else if (result == 1) {
		    	        		$("#brand-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, la marca no pudo ser creada.");
			    	        	$(".msg-error").addClass("on");	 
		    	        	} else if (result == 2) {
		    	        		$("#brand-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, la marca no pudo ser creada.");
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
	    	 
	    	 $(".msg-error").removeClass("on");
		     $(".msg-error").html("Debe ingresar los datos.");
		     
	    	 if ($nombre == "" || $descripcion == "") {
	    		  $(".msg-error").addClass("on");
	    		  return false;
	   		 } else {
	   		      console.log("Hay valores");
	   		 }
	    	 
	    	 var $form = $("#createBrandForm").serializeArray();    	  	  
		  	 var $formSerialized = objectifyForm($form);
	    	 
	    	 $("#brand-modal").css('z-index', '1');
	    	 $.ajax({
		    	  url: "/Cotizador/rest/brand/updateBrand",
		    	  type: "POST",
		    	  data: JSON.stringify($formSerialized),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino actualizacion de marca");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $(".msg-error").removeClass("on");
		    	        
		    	        if(obj === undefined) {	    	  
		    	        	$("#brand-modal").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	$(".msg-error").html("Ha ocurrido un error, la marca no pudo ser actualizada.");
		    	        	$(".msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result == 0) {
			    	        	location.href = "admMarcas";
		    	        	} else if (result == 1) {
		    	        		$("#brand-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, la marca no pudo ser actualizada.");
			    	        	$(".msg-error").addClass("on");	 
		    	        	} else if (result == 2) {
		    	        		$("#brand-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, la marca no pudo ser actualizada.");
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
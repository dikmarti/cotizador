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
		<a id="btn-product-create" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
        	<span><strong>Crear</strong></span>            
    	</a>
    	<a id="btn-product-modify" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        	<span><strong>Editar</strong></span>            
    	</a>
    	<a id="btn-product-delete" class="btn btn-primary a-btn-slide-text">
       		<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
        	<span><strong>Borrar</strong></span>            
    	</a>
	</div>
<table id="dtProductModule" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Id
      </th>
      <th class="th-sm">Id MCO
      </th>
      <th class="th-sm">Id Fabricante
      </th>
      <th class="th-sm">Código
      </th>
      <th class="th-sm">Nombre
      </th>
      <th class="th-sm">Nombre Corto
      </th>
      <th class="th-sm">Descripción
      </th>
      <th class="th-sm">Porcentaje de Resguardo
      </th>
      <th class="th-sm">Observación
      </th>
      <th class="th-sm">Unidad de Medida
      </th>
      <th class="th-sm">Sistema
      </th>
    </tr>
  </thead>
  <tbody id="product-table-data">
  </tbody>
  <tfoot>
    <tr>
      <th>Id
      </th>
      <th>Id MCO
      </th>
      <th>Id Fabricante
      </th>
      <th>Código
      </th>
      <th>Nombre
      </th>
      <th>Nombre Corto
      </th>
      <th>Descripción
      </th>
      <th>Porcentaje de Resguardo
      </th>
      <th>Observación
      </th>
      <th>Unidad de Medida
      </th>
      <th>Sistema
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
<div id="product-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title-text">Crear Producto</h4>
      </div>
      <div class="modal-body">
      		<form id="createProductForm" class="form-content">
			<input id="id" type="hidden" name="id"/>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="idMco" type="text" name="idMco" placeholder="Id MCO" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="idFabricante" type="text" name="idFabricante" placeholder="Id Fabricante" maxlength="200"/>
      			</div>
    		</div>
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
				    <input class="form-control" id="nombreCorto" type="text" name="nombreCorto" placeholder="Nombre Corto" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="descripcion" type="text" name="descripcion" placeholder="Descripción" maxlength="200"/>
      			</div>
    		</div>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="porcentajeResguardo" type="text" name="porcentajeResguardo" placeholder="Porcentaje de Resguardo" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="observacion" type="text" name="observacion" placeholder="Observación" maxlength="200"/>
      			</div>
      		</div>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <select class="form-control form-control-sm custom-color" id="unidadMedida" name="unidadMedida" >
				    	<option class="placeholder-option" value="" disabled selected >Seleccione Tipo de Medida</option>
				    	<option value="0">Galón</option>				    	
				    	<option value="1">Metros</option>				    	
				    	<option value="2">Metros Cuadrados</option>				    	
				    	<option value="3">Metros Cúbicos</option>				    	
				    	<option value="4">Rollos</option>				    	
				    	<option value="5">Unidad</option>
				    </select>
      			</div>
     			<div class="form-group col-md-6">
				    <select class="form-control form-control-sm custom-color" id="sistemas" name="sistemas" >
				    	<option class="placeholder-option" value="" disabled selected >Seleccione el Sistema</option>
				    </select>
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
    	  url: "/Cotizador/rest/product/all",
    	  type: "GET",
    	  dataType: "json",
    	  contentType: "application/json; charset=utf-8",
    	  success: function(result){		    		
    	        console.log("termino");
    	        console.log(result);

    	        $.each(result, function( index, element ) {	   
    	        	
    	        	table.rows.add(
 	        		       [{ "Id": result[index].id, 
 	        		    	   "IdMco": result[index].idProductoMCO,
 	        		    	   "IdFabricante": result[index].idFabricante,
 	        		    	   "Codigo": result[index].codigo,
 	        		    	   "Nombre": result[index].nombre,
 	        		    	   "NombreCorto": result[index].nombreCorto,
 	        		    	   "Descripcion": result[index].descripcion,
 	        		    	   "PorcentajeResguardo": result[index].porcentajeResguardo,
 	        		    	   "Observacion": result[index].observacion,
 	        		    	   "UnidadMedida": result[index].unidadMedida,
 	        		    	   "Sistema": result[index].sistema.nombre
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
   	 
   	var table = $('#dtProductModule').DataTable({
			  responsive: true,
			    "pagingType": "simple_numbers",
			    "pageLength": 10,
			    "language": {
		            "lengthMenu": "Módulo de Productos",
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
            	    {data: 'IdMco'},
            	    {data: 'IdFabricante'},
            	    {data: 'Codigo'},
            	    {data: 'Nombre'},
            	    {data: 'NombreCorto'},
            	    {data: 'Descripcion'},
            	    {data: 'PorcentajeResguardo'},
            	    {data: 'Observacion'},
            	    {data: 'UnidadMedida'},
            	    {data: 'Sistema'}],
	       	    "columnDefs": [
	                   {
	                       "targets": [ 0 ],
	                       "visible": false,
	                       "searchable": false
	                   }]
		  }); 
		  $('.dataTables_length').addClass('bs-select');
		  
		  $('#dtProductModule tbody').on( 'click', 'tr', function () {
		        if ($(this).hasClass('selected')) {
		            $(this).removeClass('selected');
		        }
		        else {
		        	table.$('tr.selected').removeClass('selected');
		            $(this).addClass('selected'); 
		        }
		    } );

		$("#btn-product-create").click(function() {
			console.log("create product"); 
			table.$('tr.selected').removeClass('selected');
			$(".msg-error").removeClass("on");
			$("#id").val('');
			$("#idMco").val('');
			$("#idFabricante").val('');
	    	$("#codigo").val('');
	    	$("#nombre").val('');
	    	$("#nombreCorto").val('');
	    	$("#descripcion").val('');
	    	$("#porcentajeResguardo").val('');
	    	$("#observacion").val('');
	    	$("#unidadMedida").val([""]);
	    	$("#sistema").val([""]);
			$('#product-modal').find('#btn-modal-update').css('visibility', 'hidden');
			$('#product-modal').find('#btn-modal-update').css('display', 'none');
			$('#product-modal').find('#btn-modal-create').css('visibility', 'visible');
			$('#product-modal').find('#btn-modal-create').css('display', '');
			$('#product-modal').find('#modal-title-text').html('Crear Producto');
			
			$.ajax({
		    	  url: "/Cotizador/rest/system/all",
		    	  type: "GET",
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){	    		
		    	        console.log("termino");
		    	        console.log(result);
		    	        
		    	        $.each(result, function( index, element ) {	 
		    	        	var o = new Option(result[index].nombre, result[index].id);
		    	        	$(o).html(result[index].nombre);
		    	        	$("#sistemas").append(o);
		    	        
		    	        });
						$("#product-modal").modal("show");
		    	  },
		    	  complete: function(result){
		    	        console.log("complete");
		    	  },
		    	  error: function(result){
		    	        console.log("error");
		    	  }
		    	  
		    	});
			
		});
		
		$("#btn-product-modify").click(function() {
			console.log("modify product");   
			if(table.$('tr.selected').length != 1) {
				console.log("No hay producto seleccionado");   	 
				return false;
			} 
			var $productModify = table.rows('.selected').data()[0];
			console.log("modify product " + $productModify);
			
			$('#product-modal').find('#id').val($productModify.Id);
			$('#product-modal').find('#idMco').val($productModify.IdMco);
			$('#product-modal').find('#idFabricante').val($productModify.IdFabricante);
			$('#product-modal').find('#codigo').val($productModify.Codigo);
			$('#product-modal').find('#nombre').val($productModify.Nombre);
			$('#product-modal').find('#nombreCorto').val($productModify.NombreCorto);
			$('#product-modal').find('#descripcion').val($productModify.Descripcion);
			$('#product-modal').find('#porcentajeResguardo').val(productModify.PorcentajeResguardo);
			$('#product-modal').find('#observacion').val($productModify.Observacion);
			$('#product-modal').find('#unidadMedida').val($productModify.UnidadMedida);
			$('#product-modal').find('#sistemas').val($productModify.sistema);
			$('#product-modal').find('#btn-modal-create').css('visibility', 'hidden');
			$('#product-modal').find('#btn-modal-create').css('display', 'none');
			$('#product-modal').find('#btn-modal-update').css('visibility', 'visible');
			$('#product-modal').find('#btn-modal-update').css('display', '');
			$('#product-modal').find('#modal-title-text').html('Modificar Producto');
			$("#product-modal").modal("show");
		});
		
		$("#btn-product-delete").click(function() {
			if(table.$('tr.selected').length != 1) {
				console.log("No hay producto seleccionado");   	 
				return false;
			} 
			var $productDelete = table.rows('.selected').data()[0]['Id'];
			console.log("delete sistema " + $productDelete);   	 
			
			$.ajax({
		    	  url: "/Cotizador/rest/product/deleteProduct",
		    	  type: "POST",
		    	  data: JSON.stringify({id: $productDelete}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino de borrar producto");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $("#error-table").removeClass("on");
		    	        
		    	        if(obj === undefined) {	 
		    	        	console.log("Ha ocurrido un error, el producto no pudo ser eliminado.")
		    	        	$("#error-table").html("Ha ocurrido un error, el producto no pudo ser eliminado.");
		    	        	$("#error-table").addClass("on");	
		    	        } else {
		    	        	if(result) {
		    	        		table.rows('.selected').remove().draw( false );
		    	        	} else {
		    	        		console.log("Ha ocurrido un error, el producto no pudo ser eliminado.")
		    	        		$("#error-table").html("Ha ocurrido un error, el producto no pudo ser eliminado.");
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
	    	 var $idMco =  $("#idMco").val();
	    	 var $idFabricante =  $("#idFabricante").val();
	    	 var $codigo =  $("#codigo").val();
	    	 var $nombre =  $("#nombre").val();
	    	 var $nombreCorto =  $("#nombreCorto").val();
	    	 var $descripcion =  $("#descripcion").val();
	    	 var $porcentajeResguardo =  $("#porcentajeResguardo").val();
	    	 var $observacion =  $("#observacion").val();
	    	 var $unidadMedida =  $("#unidadMedida option:selected").val();
	    	 var $sistemas =  $("#sistemas option:selected").val();

	    	 $(".msg-error").removeClass("on");
		     $(".msg-error").html("Debe ingresar los datos.");
		     
	    	 
	    	 if ($idMco == "" || $idFabricante == "" || $codigo == "" || $nombre == "" || $nombreCorto == "" 
	    			 || $descripcion == "" || $porcentajeResguardo == "" || $observacion == "") {
	    		  $(".msg-error").addClass("on");
	    		  return false;
	   		 } else {
	   		      console.log("Hay valores");
	   		 }
	    	 
	    	 if($unidadMedida == "") {
		    	 $(".msg-error").html("Debe seleccionar el tipo de medida.")
		    	 $(".msg-error").addClass("on");
		    	 return false;
		     }
	    	 
	    	 if($sistemas == "") {
		    	 $(".msg-error").html("Debe seleccionar el sistema al que corresponde el producto.")
		    	 $(".msg-error").addClass("on");
		    	 return false;
		     }
	    	 
	    	  var $form = $("#createProductForm").serializeArray();    	  	  
		  	  var $formSerialized = objectifyForm($form);
	    	 
	  	 	 $("#product-modal").css('z-index', '1');
	    	 $.ajax({
		    	  url: "/Cotizador/rest/product/createProduct",
		    	  type: "POST",
		    	  data: JSON.stringify($formSerialized),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino creacion de producto");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $(".msg-error").removeClass("on");
		    	        
		    	        if(obj === undefined) {	    	  
		    	        	$("#product-modal").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	$(".msg-error").html("Ha ocurrido un error, el producto no pudo ser creado.");
		    	        	$(".msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result == 0) {
			    	        	location.href = "admProductos";
		    	        	} else if (result == 1) {
		    	        		$("#product-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, el producto no pudo ser creado.");
			    	        	$(".msg-error").addClass("on");	 
		    	        	} else if (result == 2) {
		    	        		$("#product-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, el producto no pudo ser creado.");
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
			 var $id =  $("#id").val();
			 var $idMco =  $("#idMco").val();
	    	 var $idFabricante =  $("#idFabricante").val();
	    	 var $codigo =  $("#codigo").val();
	    	 var $nombre =  $("#nombre").val();
	    	 var $nombreCorto =  $("#nombreCorto").val();
	    	 var $descripcion =  $("#descripcion").val();
	    	 var $porcentajeResguardo =  $("#porcentajeResguardo").val();
	    	 var $observacion =  $("#observacion").val();
	    	 var $unidadMedida =  $("#unidadMedida option:selected").val();
	    	 var $sistemas =  $("#sistemas option:selected").val();

	    	 $(".msg-error").removeClass("on");
		     $(".msg-error").html("Debe ingresar los datos.");
		     
	    	 
	    	 if ($idMco == "" || $idFabricante == "" || $codigo == "" || $nombre == "" || $nombreCorte == "" 
	    			 || $descripcion == "" || $porcentajeResguardo == "" || $observacion == "") {
	    		  $(".msg-error").addClass("on");
	    		  return false;
	   		 } else {
	   		      console.log("Hay valores");
	   		 }

	    	 if($unidadMedida == "") {
		    	 $(".msg-error").html("Debe seleccionar el tipo de medida.")
		    	 $(".msg-error").addClass("on");
		    	 return false;
		     }
	    	 
	    	 if($sistemas == "") {
		    	 $(".msg-error").html("Debe seleccionar el sistema al que corresponde el producto.")
		    	 $(".msg-error").addClass("on");
		    	 return false;
		     }
	    	 
	    	 var $form = $("#createProductForm").serializeArray();    	  	  
		  	 var $formSerialized = objectifyForm($form);
	    	 
	    	 $("#product-modal").css('z-index', '1');
	    	 $.ajax({
		    	  url: "/Cotizador/rest/product/updateProduct",
		    	  type: "POST",
		    	  data: JSON.stringify($formSerialized),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino actualizacion de producto");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $(".msg-error").removeClass("on");
		    	        
		    	        if(obj === undefined) {	    	  
		    	        	$("#product-modal").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	$(".msg-error").html("Ha ocurrido un error, el producto no pudo ser actualizado.");
		    	        	$(".msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result == 0) {
			    	        	location.href = "admProductos";
		    	        	} else if (result == 1) {
		    	        		$("#product-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, el producto no pudo ser actualizado.");
			    	        	$(".msg-error").addClass("on");	 
		    	        	} else if (result == 2) {
		    	        		$("#product-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, el producto no pudo ser actualizado.");
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
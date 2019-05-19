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
      <th class="th-sm">Id MCB
      </th>
      <th class="th-sm">Nombre
      </th>
      <th class="th-sm">Porcentaje de Resguardo
      </th>
      <th class="th-sm">Observación
      </th>
      <th class="th-sm">Unidad de Medida
      </th>
      <th class="th-sm">Sistema
      </th>
      <th class="th-sm">Marca
      </th>
    </tr>
  </thead>
  <tbody id="product-table-data">
  </tbody>
  <tfoot>
    <tr>
      <th>Id
      </th>
      <th>Id MCB
      </th>
      <th>Nombre
      </th>
      <th>Porcentaje de Resguardo
      </th>
      <th>Observación
      </th>
      <th>Unidad de Medida
      </th>
      <th>Sistema
      </th>
      <th>Marca
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
        <button type="button" class="close js-close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title-text">Crear Producto</h4>
      </div>
      <div class="modal-body">
      		<form id="createProductForm" class="form-content">
			<input id="id" type="hidden" name="id"/>
			<input id="sistemaAnterior" type="hidden" name="sistemaAnterior"/>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="idMcb" type="text" name="idMcb" placeholder="Id MCB" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="numParteFabricante" type="text" name="numParteFabricante" placeholder="Número de parte de fabricante" maxlength="200"/>
      			</div>
    		</div>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="nombre" type="text" name="nombre" placeholder="Nombre" maxlength="200"/>
      			</div>      			
    		</div>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="porcentajeResguardo" type="text" name="porcentajeResguardo" placeholder="Porcentaje de Resguardo" value="0" maxlength="200"/>
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
				    	<option value="1">Litros</option>
				    	<option value="2">Pulgadas</option>				    	
				    	<option value="3">Pies</option>
				    	<option value="4">Metros</option>
				    	<option value="5">Kilómetros</option>
				    	<option value="6">Yardas</option>				    	
				    	<option value="7">Metros Cuadrados</option>				    	
				    	<option value="8">Metros Cúbicos</option>				    	
				    	<option value="9">Rollos</option>				    	
				    	<option value="10">Unidad</option>
				    	<option value="11">Global</option>
				    </select>
      			</div>
     			<div class="form-group col-md-6">
				    <select class="form-control form-control-sm custom-color" id="sistema" name="sistema" >
				    	<option class="placeholder-option" value="" disabled selected >Seleccione el Sistema</option>
				    </select>
      			</div>
      		</div>
      		<div class="form-row">
     			<div class="form-group col-md-6">
				    <select class="form-control form-control-sm custom-color" id="marca" name="marca" >
				    	<option class="placeholder-option" value="" disabled selected >Seleccione la Marca</option>
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
			<h4 style="text-align: center;"><p>¿Está seguro que desea eliminar el producto seleccionado?</p></h4>
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
 	        		    	   "IdMcb": result[index].idProductoMCB,
 	        		    	   "Nombre": result[index].nombre,
 	        		    	   "PorcentajeResguardo": result[index].porcentajeResguardo,
 	        		    	   "Observacion": result[index].observacion,
 	        		    	   "UnidadMedida": returnUnidadMedida(result[index].unidadMedida),
 	        		    	   "Sistema": result[index].sistema.nombre,
 	        		    	   "Marca": result[index].marca != null ? result[index].marca.nombre : ''
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
   	
   	 function returnUnidadMedida(unidadMedida){
	       switch (unidadMedida) {
		case 0:  return "Galón";
			break;
		case 1: return "Litros";
			break;
		case 2: return "Pulgadas";
			break;
		case 3: return "Pies";
			break;
		case 4: return "Metros";
			break;
		case 5: return "Kilómetros";
			break;
		case 6: return "Yardas";
			break;
		case 7: return "Metros Cuadrados";
			break;
		case 8: return "Metros Cúbicos";
			break;
		case 9: return "Rollos";
			break;
		case 10: return "Unidades";
			break;
		case 11: return "Global";
			break;
		default: return "";
			break;
		}	    
  	}
   	 
   	function returnUnidadMedidaVal(unidadMedida){
	       switch (unidadMedida) {
		case "Galón":  return "0";
			break;
		case "Litros": return "1";
			break;
		case "Pulgadas": return "2";
			break;
		case "Pies": return "3";
			break;
		case "Metros": return "4";
			break;
		case "Kilómetros": return "5";
			break;
		case "Yardas":  return "6";
			break;
		case "Metros Cuadrados": return "7";
			break;
		case "Metros Cúbicos": return "8";
			break;
		case "Rollos": return "9";
			break;
		case "Unidades": return "10";
			break;
		case "Global": return "11";
			break;
		default: return "";
			break;
		}
	 
	}
   	
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
            	    {data: 'IdMcb'},
            	    {data: 'Nombre'},
            	    {data: 'PorcentajeResguardo'},
            	    {data: 'Observacion'},
            	    {data: 'UnidadMedida'},
            	    {data: 'Sistema'},
            	    {data: 'Marca'}],
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
			clear();
			console.log("create product"); 
			table.$('tr.selected').removeClass('selected');
			$(".msg-error").removeClass("on");
			$("#id").val('');
			$("#idMcb").val('');
			$("#numParteFabricante").val('');
	    	$("#nombre").val('');
	    	$("#porcentajeResguardo").val('');
	    	$("#observacion").val('');
	    	$("#unidadMedida").val([""]);
	    	$("#sistema").val([""]);
	    	$("#marca").val([""]);
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
		    	        	$("#sistema").append(o);
		    	        
		    	        });
		    	        
		    	        $.ajax({
		  		    	  url: "/Cotizador/rest/brand/all",
		  		    	  type: "GET",
		  		    	  dataType: "json",
		  		    	  contentType: "application/json; charset=utf-8",
		  		    	  success: function(result){	    		
		  		    	        console.log("termino buscar marca");
		  		    	        console.log(result);
		  		    	        
		  		    	        $.each(result, function( index, element ) {	 
		  		    	        	var o = new Option(result[index].nombre, result[index].id);
		  		    	        	$(o).html(result[index].nombre);
		  		    	        	$("#marca").append(o);
		  		    	        
		  		    	        });
		  						$("#product-modal").modal("show");
		  						$("#product-modal").off();
		  		    	  },
		  		    	  complete: function(result){
		  		    	        console.log("complete");
		  		    	  },
		  		    	  error: function(result){
		  		    	        console.log("error");
		  		    	  }
		  		    	  
		  		    	});
		    	        
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
			clear();
			console.log("modify product");   
			if(table.$('tr.selected').length != 1) {
				console.log("No hay producto seleccionado");   	 
				return false;
			} 
			var $productModify = table.rows('.selected').data()[0];
			console.log("modify product " + $productModify);
			
			$('#product-modal').find('#id').val($productModify.Id);
			$('#product-modal').find('#idMcb').val($productModify.IdMcb);
			$('#product-modal').find('#numParteFabricante').val($productModify.NumParteFabricante);
			$('#product-modal').find('#nombre').val($productModify.Nombre);
			$('#product-modal').find('#porcentajeResguardo').val($productModify.PorcentajeResguardo);
			$('#product-modal').find('#observacion').val($productModify.Observacion);
			$('#product-modal').find('#unidadMedida').val(returnUnidadMedidaVal($productModify.UnidadMedida));
			$("#unidadMedida").removeClass("custom-color");
			$('#product-modal').find('#btn-modal-create').css('visibility', 'hidden');
			$('#product-modal').find('#btn-modal-create').css('display', 'none');
			$('#product-modal').find('#btn-modal-update').css('visibility', 'visible');
			$('#product-modal').find('#btn-modal-update').css('display', '');
			$('#product-modal').find('#modal-title-text').html('Modificar Producto');

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
		    	        	$("#sistema").append(o);
		    	        	if($productModify.Sistema === result[index].nombre) {
		    	        		$('#product-modal').find('#sistema').val(result[index].id);
		    	        		$('#product-modal').find('#sistemaAnterior').val(result[index].id);
		    	        		$("#sistema").removeClass("custom-color");
		    	        	}
		    	        });
		    	        $.ajax({
		  		    	  url: "/Cotizador/rest/brand/all",
		  		    	  type: "GET",
		  		    	  dataType: "json",
		  		    	  contentType: "application/json; charset=utf-8",
		  		    	  success: function(result){	    		
		  		    	        console.log("termino marca");
		  		    	        console.log(result);
		  		    	        
		  		    	        $.each(result, function( index, element ) {	 
		  		    	        	var o = new Option(result[index].nombre, result[index].id);
		  		    	        	$(o).html(result[index].nombre);
		  		    	        	$("#marca").append(o);
		  		    	        	if($productModify.Marca === result[index].nombre) {
		  		    	        		$('#product-modal').find('#marca').val(result[index].id);
		  		    	        		$("#marca").removeClass("custom-color");
		  		    	        	} 
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
		    	  },
		    	  complete: function(result){
		    	        console.log("complete");
		    	  },
		    	  error: function(result){
		    	        console.log("error");
		    	  }
		    	  
		    	});
		
		});
		
		$("#btn-product-delete").click(function() {
			if(table.$('tr.selected').length != 1) {
				console.log("No hay producto seleccionado");   	 
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
		    	        	if(result == 0) {
		    	        		table.rows('.selected').remove().draw( false );
		    	        	} else if(result == 2){
		    	        		console.log("Ha ocurrido un error, el producto no pudo ser eliminado.")
		    	        		$("#error-table").html("Ha ocurrido un error, el producto no pudo ser eliminado.");
			    	        	$("#error-table").addClass("on");	
		    	        	} else if(result == 1) {
		    	        		console.log("Ha ocurrido un error, el producto no pudo ser eliminado.")
		    	        		$("#error-table").html("El producto no pudo ser eliminado porque se encuentra asociado a una lista de precios.");
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
	    	 var $idMcb =  $("#idMcb").val();
	    	 var $numParteFabricante =  $("#numParteFabricante").val();
	    	 var $nombre =  $("#nombre").val();
	    	 var $porcentajeResguardo =  $("#porcentajeResguardo").val();
	    	 var $observacion =  $("#observacion").val();
	    	 var $unidadMedida =  $("#unidadMedida option:selected").val();
	    	 var $sistema =  $("#sistema option:selected").val();
	    	 var $marca =  $("#marca option:selected").val();

	    	 $(".msg-error").removeClass("on");
		     $(".msg-error").html("Debe ingresar los datos.");
		     
	    	 
	    	 if ($idMcb == "" || $numParteFabricante == "" || $nombre == "" 
	    			 || $porcentajeResguardo == "" || $observacion == "") {
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
	    	 
	    	 if($sistema == "") {
		    	 $(".msg-error").html("Debe seleccionar el sistema que corresponde al producto.")
		    	 $(".msg-error").addClass("on");
		    	 return false;
		     }
	    	 
	    	 if($marca == "") {
		    	 $(".msg-error").html("Debe seleccionar la marca que corresponde al producto.")
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
			 var $idMcb =  $("#idMcb").val();
	    	 var $numParteFabricante =  $("#numParteFabricante").val();
	    	 var $nombre =  $("#nombre").val();
	    	 var $porcentajeResguardo =  $("#porcentajeResguardo").val();
	    	 var $observacion =  $("#observacion").val();
	    	 var $unidadMedida =  $("#unidadMedida option:selected").val();
	    	 var $sistema =  $("#sistema option:selected").val();
	    	 var $marca =  $("#marca option:selected").val();

	    	 $(".msg-error").removeClass("on");
		     $(".msg-error").html("Debe ingresar los datos.");
		     
	    	 
	    	 if ($idMcb == "" || $numParteFabricante == "" || $nombre == "" 
	    			 || $porcentajeResguardo == "" || $observacion == "") {
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
	    	 
	    	 if($sistema == "") {
		    	 $(".msg-error").html("Debe seleccionar el sistema que corresponde al producto.")
		    	 $(".msg-error").addClass("on");
		    	 return false;
		     }
	    	 if($marca == "") {
		    	 $(".msg-error").html("Debe seleccionar la marca que corresponde al producto.")
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
		
		$("#sistema").click(function() {
			$(this).removeClass("custom-color");
		});	
		$("#marca").click(function() {
			$(this).removeClass("custom-color");
		});	
		
		$("#unidadMedida").click(function() {
			$(this).removeClass("custom-color");
		});	
		
		$(".js-close").click(function(){
			  $(this).parents(".modal").modal("hide");
		});
		
		function clear() {
			$('#sistema').empty()
		    .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Sistema</option>');
			$('#marca').empty()
		    .append('<option class="placeholder-option" value="" disabled selected >Seleccione la Marca</option>');
		}
		

	});   
		  
	</script>
	
</t:standardPage>
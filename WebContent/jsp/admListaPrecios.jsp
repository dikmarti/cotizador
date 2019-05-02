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
		<a id="btn-priceList-create" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
        	<span><strong>Crear</strong></span>            
    	</a>
    	<a id="btn-priceList-modify" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        	<span><strong>Editar</strong></span>            
    	</a>
    	<a id="btn-priceList-delete" class="btn btn-primary a-btn-slide-text">
       		<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
        	<span><strong>Caducar</strong></span>            
    	</a>
	</div>
<table id="dtPriceListModule" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Id
      </th>
      <th class="th-sm">Producto
      </th>
      <th class="th-sm">Proveedor
      </th>
      <th class="th-sm">Precio Mínimo
      </th>
      <th class="th-sm">Precio Máximo
      </th>
      <th class="th-sm">Precio Promedio
      </th>
      <th class="th-sm">Fecha Inicio
      </th>
      <th class="th-sm">Fecha Fin
      </th>
    </tr>
  </thead>
  <tbody id="priceList-table-data">
  </tbody>
  <tfoot>
    <tr>
      <th>Id
      </th>
      <th>Producto
      </th>
      <th>Proveedor
      </th>
      <th>Precio Mínimo
      </th>
      <th>Precio Máximo
      </th>
      <th>Precio Promedio
      </th>
      <th>Fecha Inicio
      </th>
      <th>Fecha Fin
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
<div id="priceList-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close js-close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title-text">Crear Lista de Precios</h4>
      </div>
      <div class="modal-body">
      		<form id="createPriceListForm" class="form-content">
			<input id="id" type="hidden" name="id"/>
      		<div class="form-row">
      			<div class="form-group col-md-10">
				    <select class="form-control form-control-sm custom-color" id="sistema" name="sistema" >
				    	<option class="placeholder-option" value="" disabled selected >Seleccione el Sistema</option>
				    </select>
      			</div>
      			<div class="form-group col-md-10">
				    <select class="form-control form-control-sm custom-color" id="producto" name="producto">
				    	<option class="placeholder-option" value="" disabled selected >Seleccione el Producto</option>
				    </select>
      			</div>
    		</div>
      		<div class="form-row">
      			<div class="form-group col-md-10">
				    <select class="form-control form-control-sm custom-color" id="proveedor" name="proveedor">
				    	<option class="placeholder-option" value="" disabled selected >Seleccione el Proveedor</option>
				    </select>
      			</div>
      		</div>
      		<div class="form-row">
      			<div class="form -group col-md-6">
				    <input class="form-control" id="precioMinimo" type="text" name="precioMinimo" 
				    	placeholder="Precio Mínimo" maxlength="200"/>
      			</div>
      			<div class="form -group col-md-6">
				    <input class="form-control" id="precioMaximo" type="text" name="precioMaximo" 
				    	placeholder="Precio Máximo" maxlength="200"/>
      			</div>
      		</div>
      		<div class="form-row">
      			<div class="form -group col-md-6">
				    <input class="form-control" id="precioPromedio" type="text" name="precioPromedio" 
				    	placeholder="Precio Promedio" maxlength="200"  style="margin-top: 15px;" disabled/>
      			</div>
      		</div>
      		<div class="form-row">
      			<div class="form-group col-md-10">
				    <div class="msg-error" id="msg-error">
				   			Debe ingresar los datos.
	      			</div>
      			</div>
			</div>
			<div class="form-style-button">
			   	<input type="button" value="Crear" id="btn-modal-create" class="btn btn-primary" style="width: 50%; margin-left: 65px;"/>
			</div>
		   	</form>
      </div>
    </div>

  </div>
</div>
<!-- End Modal -->

<!-- Modal Update-->
<div id="modal-priceList-update" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title-text">Modificar Lista de Precios</h4>
      </div>
      <div class="modal-body">
      		<form id="updatePriceListForm" class="form-content">
			<input id="id" type="hidden" name="id"/>
      		<div class="form-group row">
      			<label for="producto" class="col-sm-4 col-form-label">Producto:</label>
			    <div class="col-sm-8">
			      <input type="text" readonly class="form-control-plaintext" id="producto" value="" style="border: none;">
			    </div>
    		</div>
    		<div class="form-group row">
      			<label for="proveedor" class="col-sm-4 col-form-label">Proveedor:</label>
			    <div class="col-sm-8">
			      <input type="text" readonly class="form-control-plaintext" id="proveedor" value="" style="border: none;">
			    </div>
    		</div>
      		<div class="form-group row">
      			<label for="precioMinimo" class="col-sm-4 col-form-label">Precio Mínimo:</label>
			    <div class="col-sm-4">
			      <input class="form-control" id="precioMinimo" type="text" name="precioMinimo" placeholder="Precio Mínimo" maxlength="200"/>
			    </div>
      		</div>
      		<div class="form-group row">
      			<label for="precioMaximo" class="col-sm-4 col-form-label">Precio Máximo:</label>
			    <div class="col-sm-4">
			      <input class="form-control" id="precioMaximo" type="text" name="precioMaximo" placeholder="Precio Máximo" maxlength="200" onkeyup="calcularPromedio(this);"/>
			    </div>
      		</div>
      		<div class="form-group row">
      			<label for="precioPromedio" class="col-sm-4 col-form-label">Precio Promedio:</label>
			    <div class="col-sm-4">
			      <input class="form-control" id="precioPromedio" type="text" name="precioPromedio" placeholder="Precio Promedio" maxlength="200"/>
			    </div>
      		</div>
      		<div class="form-row">
      			<div class="form-group col-md-10">
				    <div class="msg-error" id="msg-error-update">
				   			Debe ingresar los datos.
	      			</div>
      			</div>
			</div>
			<div class="form-style-button">
			   	<input type="button" value="Modificar" id="btn-modal-update" class="btn btn-primary" style="width: 50%; margin-left: 65px;"/>
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
			<h4 style="text-align: center;"><p>¿Está seguro que desea eliminar caducar la lista de precios seleccionada?</p></h4>
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

function calcularPromedio (element){
	var precioMin = parseFloat($(element).parent("div").parent("div").siblings().find("#precioMinimo").val());
	var precioMax = parseFloat($(element).val());
	var precioProm = 0;
	
	if (precioMin != "" && precioMax != "") {
		precioProm = (precioMin + precioMax) / 2;
		$(element).parent("div").parent("div").siblings().find("#precioPromedio").val(precioProm);
	}
}

$(document).ready(function() {
	
   	 $.ajax({
    	  url: "/Cotizador/rest/priceList/all",
    	  type: "GET",
    	  dataType: "json",
    	  contentType: "application/json; charset=utf-8",
    	  success: function(result){		    		
    	        console.log("termino");
    	        console.log(result);

    	        $.each(result, function( index, element ) {	   
    	        	
    	        	table.rows.add(
 	        		       [{ "Id": result[index].id, 
 	        		    	   "Producto": result[index].producto,
 	        		    	   "Proveedor": result[index].proveedor,
 	        		    	   "PrecioMinimo": result[index].precioMinimo,
 	        		    	   "PrecioMaximo": result[index].precioMaximo,
 	        		    	   "PrecioPromedio": result[index].precioPromedio,
 	        		    	   "FechaInicio": result[index].fechaInicio,
 	        		    	   "FechaFin": result[index].fechaFin
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
   	 
   	var table = $('#dtPriceListModule').DataTable({
			  responsive: true,
			    "pagingType": "simple_numbers",
			    "pageLength": 10,
			    "language": {
		            "lengthMenu": "Módulo de Lista de Precios",
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
            	    {data: 'Producto'},
            	    {data: 'Proveedor'},
            	    {data: 'PrecioMinimo'},
            	    {data: 'PrecioMaximo'},
            	    {data: 'PrecioPromedio'},
            	    {data: 'FechaInicio'},
            	    {data: 'FechaFin'}],
	       	    "columnDefs": [
	                   {
	                       "targets": [ 0 ],
	                       "visible": false,
	                       "searchable": false
	                   }]
		  }); 
		  $('.dataTables_length').addClass('bs-select');
		  
		  $('#dtPriceListModule tbody').on( 'click', 'tr', function () {
		        if ($(this).hasClass('selected')) {
		            $(this).removeClass('selected');
		        }
		        else {
		        	table.$('tr.selected').removeClass('selected');
		            $(this).addClass('selected'); 
		        }
		    } );

		$("#btn-priceList-create").click(function() {
			clear();
			console.log("create priceList"); 
			table.$('tr.selected').removeClass('selected');
			$("#msg-error").removeClass("on");
			$("#id").val('');
	    	$("#producto").val([""]);
	    	$("#proveedor").val([""]);
	    	$("#precioMinimo").val('');
	    	$("#precioMaximo").val('');
	    	$("#precioPromedio").val('');
	    	
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
		    	  },
		    	  complete: function(result){
		    	        console.log("complete");
		    	  },
		    	  error: function(result){
		    	        console.log("error");
		    	  }
		    	  
		    	});
	    	
	    	$.ajax({
		    	  url: "/Cotizador/rest/provider/all",
		    	  type: "GET",
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){	    		
		    	        console.log("termino");
		    	        console.log(result);
		    	        
		    	        $.each(result, function( index, element ) {	 
		    	        	var o = new Option(result[index].nombre, result[index].id);
		    	        	$(o).html(result[index].nombre);
		    	        	$("#proveedor").append(o);
		    	        
		    	        });
						$("#priceList-modal").modal("show");
						$("#priceList-modal").css('z-index', '2');
	    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
	    	        	$("#priceList-modal").off();
		    	  },
		    	  complete: function(result){
		    	        console.log("complete");
		    	  },
		    	  error: function(result){
		    	        console.log("error");
		    	  }
		    	  
		    	});
		});
		
		
		$("#btn-priceList-modify").click(function() {
			$('#modal-priceList-update').find("#msg-error-update").removeClass("on");
			$('#modal-priceList-update').find("#msg-error-update").html("Debe ingresar los datos.");
			console.log("modify priceList");   
			if(table.$('tr.selected').length != 1) {
				console.log("No hay lista de precios seleccionada");   	 
				return false;
			} 
			var $priceListModify = table.rows('.selected').data()[0];
			console.log("modify relation " + $priceListModify);
			$('#modal-priceList-update').find('#id').val($priceListModify.Id);
			$('#modal-priceList-update').find('#producto').val($priceListModify.Producto);
			$('#modal-priceList-update').find('#proveedor').val($priceListModify.Proveedor);
			$('#modal-priceList-update').find('#precioMinimo').val($priceListModify.PrecioMinimo);
			$('#modal-priceList-update').find('#precioMaximo').val($priceListModify.PrecioMaximo);
			$('#modal-priceList-update').find('#precioPromedio').val($priceListModify.PrecioPromedio);
			$("#modal-priceList-update").modal("show");
			
		});
		
		$("#btn-priceList-delete").click(function() {
			if(table.$('tr.selected').length != 1) {
				console.log("No hay lista de precios seleccionada");   	 
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
				console.log("No hay lista de precios seleccionado");   	 
				return false;
			} 
			var $priceListDelete = table.rows('.selected').data()[0]['Id'];
			console.log("delete lista de precio " + $priceListDelete);   	 
			
			$.ajax({
		    	  url: "/Cotizador/rest/priceList/deletePriceList",
		    	  type: "POST",
		    	  data: JSON.stringify({id: $priceListDelete}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino de borrar precio lista");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $("#error-table").removeClass("on");
		    	        
		    	        if(obj === undefined) {	 
		    	        	console.log("Ha ocurrido un error, la lista de precios no pudo ser eliminada.")
		    	        	$("#error-table").html("Ha ocurrido un error, la lista de precios no pudo ser caducada.")
		    	        	$("#error-table").addClass("on");	
		    	        } else {
		    	        	if(result) {
		    	        		location.href = "admListaPrecios";
		    	        	} else {
		    	        		console.log("Ha ocurrido un error, la lista de precios no pudo ser caducada.")
		    	        		$("#error-table").html("Ha ocurrido un error, la lista de precios no pudo ser caducada.");
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
	    	 var $sistema =  $("#sistema option:selected").val();
	    	 var $producto =  $("#producto option:selected").val();
	    	 var $proveedor =  $("#proveedor option:selected").val();
	    	 var $precioMinimo =  $("#precioMinimo").val();
	    	 var $precioMaximo =  $("#precioMaximo").val();
	    	 var $precioPromedio =  $("#precioPromedio").val();
	    	 $("#msg-error").removeClass("on");
		     $("#msg-error").html("Debe ingresar los datos.");
		     
		     if($sistema == "") {
		    	 $("#msg-error").html("Debe seleccionar el sistema.")
		    	 $("#msg-error").addClass("on");
		    	 return false;
		     } else if ($producto == "") {
		    	 $("#msg-error").html("Debe seleccionar el producto.")
		    	 $("#msg-error").addClass("on");
		    	 return false;
		     } else if($proveedor == ""){
		    	 $("#msg-error").html("Debe seleccionar el proveedor.")
		    	 $("#msg-error").addClass("on");
		    	 return false;
		     } 
	    	 
	    	 if ($precioMinimo == "" || precioMaximo == "" || precioPromedio == "") {
	    		  $("#msg-error").addClass("on");
	    		  return false;
	   		 } else {
	   		      console.log("Hay valores");
	   		 }
	    	 
	    	  var $form = $("#createPriceListForm").serializeArray();    	  	  
		  	  var $formSerialized = objectifyForm($form);
	    	 
	  	 	 $("#priceList-modal").css('z-index', '1');
	    	 $.ajax({
		    	  url: "/Cotizador/rest/priceList/createPriceList",
		    	  type: "POST",
		    	  data: JSON.stringify($formSerialized),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino creacion de lista de precios");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $("#msg-error").removeClass("on");
		    	        
		    	        if(obj === undefined) {	    	  
		    	        	$("#priceList-modal").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	$("#msg-error").html("Ha ocurrido un error, la lista de precios no pudo ser creada.");
		    	        	$("#msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result == 0) {
			    	        	location.href = "admListaPrecios";
		    	        	} else if (result == 1) {
		    	        		$("#priceList-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$("#msg-error").html("Ha ocurrido un error, existe una lista de precios vigente para el producto y proveedor seleccionado.");
			    	        	$("#msg-error").addClass("on");	 
		    	        	} else if (result == 2) {
		    	        		$("#priceList-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$("#msg-error").html("Ha ocurrido un error, la lista de precios no pudo ser creada.");
			    	        	$("#msg-error").addClass("on");	 
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
			var $id =  $('#modal-priceList-update').find("#id").val();
	    	 var $precioMinimo =  $('#modal-priceList-update').find("#precioMinimo").val();
	    	 var $precioMaximo =  $('#modal-priceList-update').find("#precioMaximo").val();
	    	 var $precioPromedio =  $('#modal-priceList-update').find("#precioPromedio").val();
	    	 $('#modal-priceList-update').find("#msg-error-update").removeClass("on");
	    	 $('#modal-priceList-update').find("#msg-error-update").html("Debe ingresar los datos.");
		     
	    	 if ($precioMinimo == "" || $precioMaximo == "" || $precioPromedio == "") {
	    		  $('#modal-priceList-update').find("#msg-error-update").addClass("on");
	    		  return false;
	   		 } else {
	   		      console.log("Hay valores");
	   		 }
			
	    	 var $form = $("#updatePriceListForm").serializeArray();    	  	  
		  	 var $formSerialized = objectifyForm($form);
	    	 $("#modal-priceList-update").css('z-index', '1');
	    	 $.ajax({
		    	  url: "/Cotizador/rest/priceList/updatePriceList",
		    	  type: "POST",
		    	  data: JSON.stringify($formSerialized),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino actualizacion de lista de precios");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $('#modal-priceList-update').find("#msg-error-update").removeClass("on");
		    	        
		    	        if(obj === undefined) {	    	  
		    	        	$("#modal-priceList-update").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	$('#modal-priceList-update').find("#msg-error-update").html("Ha ocurrido un error, la lista de precios no pudo ser actualizada.");
		    	        	$('#modal-priceList-update').find("#msg-error-update").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result == 0) {
			    	        	location.href = "admListaPrecios";
		    	        	} else if (result == 1) {
		    	        		$("#modal-priceList-update").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
			    	        	$('#modal-priceList-update').find("#msg-error-update").html("Ha ocurrido un error, la lista de precios no pudo ser actualizada.");
			    	        	$('#modal-priceList-update').find("#msg-error-update").addClass("on");	 
		    	        	} else if (result == 2) {
		    	        		$("#modal-priceList-update").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
			    	        	$('#modal-priceList-update').find("#msg-error-update").html("Ha ocurrido un error, la lista de precios no pudo ser actualizada.");
			    	        	$('#modal-priceList-update').find("#msg-error-update").addClass("on");	 
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
		
		$("#sistema").change(function() {
			$('#producto').empty()
		    .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Producto</option>');
			$('#proveedor').val([""]);
			var $val = $("#sistema option:selected").val();
			$("#priceList-modal").css('z-index', '1');
			$.ajax({
		    	  url: "/Cotizador/rest/product/bySystem",
		    	  type: "POST",
		    	  data: JSON.stringify({idSystem: $val}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){	
		    	        console.log("termino");
		    	        console.log(result);
		    	        
		    	        $.each(result, function( index, element ) {	 
		    	        	var o = new Option(result[index].nombre, result[index].id);
		    	        	$(o).html(result[index].nombre);
		    	        	$("#producto").append(o);
		    	        	
		    	        });
		    	  },
		    	  complete: function(result){
		    	        console.log("complete");
		    	  },
		    	  error: function(result){
		    	        console.log("error");
		    	  }
		    	  
		    	});
		    	        $("#priceList-modal").css('z-index', '2');
	    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		});	
		
		function clear() {
			$('#sistema').empty()
		    .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Sistema</option>');
			$('#producto').empty()
		    .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Producto</option>');
			$('#proveedor').empty()
		    .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Proveedor</option>');
		}
		$("#sistema").click(function() {
			$(this).removeClass("custom-color");
		});	
		$("#producto").click(function() {
			$(this).removeClass("custom-color");
		});	
		$("#proveedor").click(function() {
			$(this).removeClass("custom-color");
		});	

		$("#precioMinimo").on('keypress', function (e) {
			var regex = new RegExp("^([0-9]|\\.)$");
			if(!regex.test(e.key)) {
				return false;
			}
		});	  
		
		$("#precioMaximo").on('keypress', function (e) {
			var regex = new RegExp("^([0-9]|\\.)$");
			if(!regex.test(e.key)) {
				return false;
			}
		});	  
		
		$("#precioPromedio").on('keypress', function (e) {
			var regex = new RegExp("^([0-9]|\\.)$");
			if(!regex.test(e.key)) {
				return false;
			}
		});	 
		
		 $('#modal-priceList-update').find("#precioMinimo").on('keypress', function (e) {
			var regex = new RegExp("^([0-9]|\\.)$");
			if(!regex.test(e.key)) {
				return false;
			}
		});	  
		
		 $('#modal-priceList-update').find("#precioMaximo").on('keypress', function (e) {
			var regex = new RegExp("^([0-9]|\\.)$");
			if(!regex.test(e.key)) {
				return false;
			}
		});	  
		
		 $('#modal-priceList-update').find("#precioPromedio").on('keypress', function (e) {
			var regex = new RegExp("^([0-9]|\\.)$");
			if(!regex.test(e.key)) {
				return false;
			}
		});	  
		 
		 $(".js-close").click(function(){
			  $(this).parents(".modal").modal("hide");
		});
	  });  
		
		
	</script>
	
</t:standardPage>
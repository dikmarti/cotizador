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
		<a id="btn-relation-create" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
        	<span><strong>Crear</strong></span>            
    	</a>
    	<a id="btn-relation-modify" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        	<span><strong>Editar</strong></span>            
    	</a>
    	<a id="btn-relation-delete" class="btn btn-primary a-btn-slide-text">
       		<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
        	<span><strong>Borrar</strong></span>            
    	</a>
	</div>
<table id="dtRelationModule" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Id
      </th>
      <th class="th-sm">Sistema
      </th>
      <th class="th-sm">Producto
      </th>
      <th class="th-sm">Producto Relacionado
      </th>
      <th class="th-sm">Factor
      </th>
      <th class="th-sm">Operación
      </th>
    </tr>
  </thead>
  <tbody id="user-table-data-permission">
  </tbody>
  <tfoot>
    <tr>
      <th>Id
      </th>
      <th>Sistema
      </th>
      <th>Producto
      </th>
      <th>Producto Relacionado
      </th>
      <th>Factor
      </th>
      <th>Operación
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
<div id="product-modal-relation" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title-text">Crear Relación entre Productos</h4>
      </div>
      <div class="modal-body">
      		<form id="createRelationForm" class="form-content">
			<input id="id" type="hidden" name="id"/>
      		<div class="form-row">
      			<div class="form-group col-md-10">
				    <select class="form-control form-control-sm custom-color" id="sistema" name="sistema" >
				    	<option class="placeholder-option" value="" disabled selected >Seleccione el Sistema</option>
				    </select>
      			</div>
      			<div class="form-group col-md-10">
				    <select class="form-control form-control-sm custom-color" id="producto" 
				    		name="producto">
				    	<option class="placeholder-option" value="" disabled selected >Seleccione el Producto</option>
				    </select>
      			</div>
    		</div>
      		<div class="form-row">
      			<div class="form-group col-md-10">
				    <select class="form-control form-control-sm custom-color" id="productoRelacion" 
				    		name="productoRelacion">
				    	<option class="placeholder-option" value="" disabled selected >Seleccione el Producto a Relacionar</option>
				    </select>
      			</div>
      		</div>
      		<div class="form-row">
      			<div class="form-group col-md-4">
				    <input class="form-control" id="factor" type="text" name="factor" placeholder="Factor" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <select class="form-control form-control-sm custom-color" id="operacion" name="operacion" >
				    	<option class="placeholder-option" value="" disabled selected >Seleccion Operación</option>
				    	<option value="0">Dividir</option>
				    	<option value="1">Multiplicar</option>				    	
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
			</div>
		   	</form>
      </div>
    </div>

  </div>
</div>
<!-- End Modal -->

<!-- Modal -->
<div id="product-modal-relation-update" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title-text">Modificar Relación entre Productos</h4>
      </div>
      <div class="modal-body">
      		<form id="updateRelationForm" class="form-content">
			<input id="id" type="hidden" name="id"/>
      		<div class="form-group row">
      			<label for="sistema" class="col-sm-2 col-form-label">Sistema:</label>
			    <div class="col-sm-10">
			      <input type="text" readonly class="form-control-plaintext" id="sistema" value="" style="border: none;">
			    </div>
    		</div>
    		<div class="form-group row">
      			<label for="producto" class="col-sm-2 col-form-label">Producto:</label>
			    <div class="col-sm-10">
			      <input type="text" readonly class="form-control-plaintext" id="producto" value="" style="border: none;">
			    </div>
    		</div>
      		<div class="form-group row">
      			<label for="productoRelacion" class="col-sm-4 col-form-label">Producto Asociado:</label>
			    <div class="col-sm-8">
			      <input type="text" readonly class="form-control-plaintext" id="productoRelacion" value="" style="border: none;">
			    </div>
      		</div>
      		<div class="form-group row">
      			<div class="form-group col-md-4">
				    <input class="form-control" id="factor" type="text" name="factor" placeholder="Factor" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <select class="form-control form-control-sm custom-color" id="operacion" name="operacion" >
				    	<option class="placeholder-option" value="" disabled selected >Seleccion Operación</option>
				    	<option value="0">Dividir</option>
				    	<option value="1">Multiplicar</option>				    	
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
			   	<input type="button" value="Modificar" id="btn-modal-update" class="btn btn-primary" style="width: 50%; margin-left: 65px;"/>
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
    	  url: "/Cotizador/rest/relation/all",
    	  type: "GET",
    	  dataType: "json",
    	  contentType: "application/json; charset=utf-8",
    	  success: function(result){		    		
    	        console.log("termino");
    	        console.log(result);
    	        $.each(result, function( index, element ) {	    	        	
    	        	
    	        	table.rows.add(
    	        		       [{ "Id": result[index].id, 
    	        		       	  "Sistema": result[index].sistema.nombre, 
    	        		       	  "Producto": result[index].producto.nombre, 
    	        		    	  "ProductoRelacion": result[index].productoRelacion.nombre,
    	        		    	  "Factor": result[index].factor,
    	        		    	  "Operacion": returnOperacionVal(result[index].operacion)
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
   	 
   	var table = $('#dtRelationModule').DataTable({
			  responsive: true,
			    "pagingType": "simple_numbers",
			    "pageLength": 10,
			    "language": {
		            "lengthMenu": "Módulo de Relaciones entre Productos",
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
            	    {data: 'Sistema'},
            	    {data: 'Producto'},
            	    {data: 'ProductoRelacion'},
            	    {data: 'Factor'},
            	    {data: 'Operacion'}],
        	    "columnDefs": [
                    {
                        "targets": [ 0 ],
                        "visible": false,
                        "searchable": false
                    }]
		  }); 
   	
		  
		  $('#dtRelationModule tbody').on( 'click', 'tr', function () {
		        if ($(this).hasClass('selected')) {
		            $(this).removeClass('selected');
		        }
		        else {
		        	table.$('tr.selected').removeClass('selected');
		            $(this).addClass('selected'); 
		        }
		    } );
		  
		  
		  $("#btn-relation-create").click(function() {
			  	clear();
				console.log("create relation"); 
				table.$('tr.selected').removeClass('selected');
				$(".msg-error").removeClass("on");
				$("#id").val('');
				$("#sistema").val([""]);
				$("#producto").val([""]);
				$("#productoRelacion").val([""]);
		    	$("#factor").val('');
				$("#operacion").val([""]);
			
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
			    	        $("#product-modal-relation").modal("show");
			    	  },
			    	  complete: function(result){
			    	        console.log("complete");
			    	  },
			    	  error: function(result){
			    	        console.log("error");
			    	  }
			    	  
			    	});
		  });
			
			$("#btn-relation-modify").click(function() {
				console.log("modify relation");   
				if(table.$('tr.selected').length != 1) {
					console.log("No hay relacion seleccionado");   	 
					return false;
				} 
				var $relationModify = table.rows('.selected').data()[0];
				console.log("modify relation " + $relationModify);
				$('#product-modal-relation-update').find('#id').val($relationModify.Id);
				$('#product-modal-relation-update').find('#sistema').val($relationModify.Sistema);
				$('#product-modal-relation-update').find('#producto').val($relationModify.Producto);
				$('#product-modal-relation-update').find('#productoRelacion').val($relationModify.ProductoRelacion);
				$('#product-modal-relation-update').find('#factor').val($relationModify.Factor);
				$('#product-modal-relation-update').find('#operacion').val(returnOperacion($relationModify.Operacion));
				$('#product-modal-relation-update').find('#operacion').removeClass("custom-color");
				$("#product-modal-relation-update").modal("show");
			});
			
			$("#btn-relation-delete").click(function() {
				if(table.$('tr.selected').length != 1) {
					console.log("No hay relación seleccionado");   	 
					return false;
				} 
				var $relationDelete = table.rows('.selected').data()[0]['Id'];
				console.log("delete relation " + $relationDelete);   	 
				
				$.ajax({
			    	  url: "/Cotizador/rest/relation/deleteRelation",
			    	  type: "POST",
			    	  data: JSON.stringify({id: $relationDelete}),
			    	  dataType: "json",
			    	  contentType: "application/json; charset=utf-8",
			    	  success: function(result){		    		
			    	        console.log("termino de borrar relation");
			    	        console.log("result: " + result);
			    	        var obj = JSON.stringify(result);
			    	        console.log(" objeto " + obj);	    	        
			    	        
			    	        $(".msg-error").removeClass("on");
			    	        
			    	        if(obj === undefined) {	 
			    	        	console.log("Ha ocurrido un error, la relación no pudo ser eliminada.")
			    	        	$("#error-table").html("Ha ocurrido un error, la relación no pudo ser eliminada.");
			    	        	$("#error-table").addClass("on");	
			    	        } else {
			    	        	if(result) {
			    	        		table.rows('.selected').remove().draw( false );
			    	        	} else {
			    	        		console.log("Ha ocurrido un error, la relación no pudo ser eliminada.")
			    	        		$("#error-table").html("Ha ocurrido un error, la relación no pudo ser eliminada.");
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
		    	 var $productoRelacion =  $("#productoRelacion option:selected").val();
		    	 var $factor =  $("#factor").val();
		    	 var $operacion =  $("#operacion option:selected").val();
		    	 $(".msg-error").removeClass("on");
			     $(".msg-error").html("Debe ingresar los datos.");
			     
			     if($sistema == "") {
			    	 $(".msg-error").html("Debe seleccionar el sistema.")
			    	 $(".msg-error").addClass("on");
			    	 return false;
			     } else if ($producto == "") {
			    	 $(".msg-error").html("Debe seleccionar el producto.")
			    	 $(".msg-error").addClass("on");
			    	 return false;
			     } else if($productoRelacion == ""){
			    	 $(".msg-error").html("Debe seleccionar el producto a relacionar.")
			    	 $(".msg-error").addClass("on");
			    	 return false;
			     } else if($operacion == "") {
			    	 $(".msg-error").html("Debe seleccionar el tipo de operación.")
			    	 $(".msg-error").addClass("on");
			    	 return false;
			     }
		    	 
		    	 if ($factor == "") {
		    		  $(".msg-error").addClass("on");
		    		  return false;
		   		 } else {
		   		      console.log("Hay valores");
		   		 }
		    	 
		    	  var $form = $("#createRelationForm").serializeArray();    	  	  
			  	  var $formSerialized = objectifyForm($form);
		    	 
		  	 	 $("#product-modal-relation").css('z-index', '1');
		    	 $.ajax({
			    	  url: "/Cotizador/rest/relation/createRelation",
			    	  type: "POST",
			    	  data: JSON.stringify($formSerialized),
			    	  dataType: "json",
			    	  contentType: "application/json; charset=utf-8",
			    	  success: function(result){		    		
			    	        console.log("termino creacion de relacion");
			    	        console.log("result: " + result);
			    	        var obj = JSON.stringify(result);
			    	        console.log(" objeto " + obj);	    	        
			    	        
			    	        $(".msg-error").removeClass("on");
			    	        
			    	        if(obj === undefined) {	    	  
			    	        	$("#product-modal-relation").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
			    	        	$(".msg-error").html("Ha ocurrido un error, la relación no pudo ser creada.");
			    	        	$(".msg-error").addClass("on");	    	        	 
			    	        } else {
			    	        	if(result == 0) {
				    	        	location.href = "admRelaciones";
			    	        	} else if (result == 1) {
			    	        		$("#product-modal-relation").css('z-index', '2');
				    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
			    	        		$(".msg-error").html("Ha ocurrido un error, la relación ya existe.");
				    	        	$(".msg-error").addClass("on");	 
			    	        	} else if (result == 2) {
			    	        		$("#product-modal-relation").css('z-index', '2');
				    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
			    	        		$(".msg-error").html("Ha ocurrido un error, la relación no pudo ser creada.");
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
		    	 var $id =  $('#product-modal-relation-update').find("#id").val();
		    	 var $factor =  $('#product-modal-relation-update').find("#factor").val();
		    	 var $operacion = $('#product-modal-relation-update').find("#operacion option:selected").val();
		    	 
		    	 $(".msg-error").removeClass("on");
			     $(".msg-error").html("Debe ingresar los datos.");
			     
		    	 if ($factor == "") {
		    		  $(".msg-error").addClass("on");
		    		  return false;
		   		 } else {
		   		      console.log("Hay valores");
		   		 }

		    	 if($operacion == "") {
			    	 $(".msg-error").html("Debe seleccionar el tipo de operación.")
			    	 $(".msg-error").addClass("on");
			    	 return false;
			     }
		    	 
		    	 $("#product-modal-relation-update").css('z-index', '1');
		    	 $.ajax({
			    	  url: "/Cotizador/rest/relation/updateRelation",
			    	  type: "POST",
			    	  data: JSON.stringify({id: $id, factor: $factor, operacion: $operacion}),
			    	  dataType: "json",
			    	  contentType: "application/json; charset=utf-8",
			    	  success: function(result){		    		
			    	        console.log("termino actualizacion de relación");
			    	        console.log("result: " + result);
			    	        var obj = JSON.stringify(result);
			    	        console.log(" objeto " + obj);	    	        
			    	        
			    	        $(".msg-error").removeClass("on");
			    	        
			    	        if(obj === undefined) {	    	  
			    	        	$("#product-modal-relation-update").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
			    	        	$(".msg-error").html("Ha ocurrido un error, la relación no pudo ser actualizada.");
			    	        	$(".msg-error").addClass("on");	    	        	 
			    	        } else {
			    	        	if(result == 0) {
				    	        	location.href = "admRelaciones";
			    	        	} else if (result == 1) {
			    	        		$("#product-modal-relation-update").css('z-index', '2');
				    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
			    	        		$(".msg-error").html("Ha ocurrido un error, la relación no pudo ser actualizada.");
				    	        	$(".msg-error").addClass("on");	 
			    	        	} else if (result == 2) {
			    	        		$("#product-modal-relation-update").css('z-index', '2');
				    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
			    	        		$(".msg-error").html("Ha ocurrido un error, la relación no pudo ser actualizada.");
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
			$("#producto").click(function() {
				$(this).removeClass("custom-color");
			});	
			$("#productoRelacion").click(function() {
				$(this).removeClass("custom-color");
			});	
			$("#operacion").click(function() {
				$(this).removeClass("custom-color");
			});	

			function returnOperacion(operacion){
			       switch (operacion) {
				case "Dividir":  return 0;
					break;
				case "Multiplicar": return 1;
					break;
				default: return "";
					break;
				}
			}
			
			function returnOperacionVal(operacion){
			       switch (operacion) {
				case 0:  return "Dividir";
					break;
				case 1: return "Multiplicar";
					break;
				default: return "";
					break;
				}
			}
			
			$("#producto").change(function() {
				var $val = $("#producto option:selected").val();
				$("#productoRelacion").val([""]);	
				$("#productoRelacion option").removeAttr("disabled");
    	        $("#productoRelacion option[value='"+$val+"']")[0].disabled = true;
			});	
			
			$("#sistema").change(function() {
				$('#producto').empty()
			    .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Producto</option>');
				$('#productoRelacion').empty()
			    .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Producto a Relacionar</option>');
				var $val = $("#sistema option:selected").val();
				$("#product-modal-relation").css('z-index', '1');
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
			    	        	var a = new Option(result[index].nombre, result[index].id);
			    	        	$(a).html(result[index].nombre);
			    	        	$("#productoRelacion").append(a);
			    	        	
			    	        });
			    	  },
			    	  complete: function(result){
			    	        console.log("complete");
			    	  },
			    	  error: function(result){
			    	        console.log("error");
			    	  }
			    	  
			    	});
			    	        $("#product-modal-relation").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
			});	
			
			function clear() {
				$('#sistema').empty()
			    .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Sistema</option>');
				$('#producto').empty()
			    .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Producto</option>');
				$('#productoRelacion').empty()
			    .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Producto a Relacionar</option>');
			}
			
		  });   
		  
	</script>
	
</t:standardPage>
<!-- Modal -->
	<div id="nivel-modal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title" id="modal-title-text">Crear Nivel</h4>
	      </div>
	      <div class="modal-body">
	      		<form id="createNivelForm" class="form-content">
					
		      		<div class="form-row">
		      			<div class="form-group col-md-6">
						    <input class="form-control" id="nombre" type="text" name="nombre" placeholder="Nombre" maxlength="200"/>
		      			</div>	      			
		    		</div>
		      		<div class="form-row">
		      			<div class="form-group col-md-6">
						    <input class="form-control" id="descripcion-nivel" type="text" name="descripcion-nivel" placeholder="Descripción"  maxlength="200"/>
		      			</div>	      			
		      		</div>
		      		<div class="form-row">
		      			<div class="form-group col-md-6">
						    <input class="form-control" id="orden" type="text" name="orden" placeholder="Orden" maxlength="200"/>
		      			</div>	      			
		      		</div>	      		
		      		<div class="form-row">
		      			<div class="form-group col-md-12">
						    <div class="msg-error" id="msg-error-nivel">
						   			Debe ingresar los datos.
			      			</div>
		      			</div>
					</div>
					<div class="form-style-button proyecto">
					   	<input type="button" value="Guardar" id="btn-guardar-nivel" class="btn btn-primary" style="margin-left: 20%;"/>	
					   	<input type="button" value="Cancelar" id="btn-cancelar-nivel" class="btn btn-primary" style="margin-left: 10%;"/>			   
					</div>
			   	</form>
	      </div>
	
	    </div>
	
	  </div>
	</div>
	<!-- End Modal -->
	
	<!-- Modal Confirm-->
	<div id="confirm-elim-modal" class="modal fade" role="dialog">
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div class="modal-content" style="height: 180px;">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title" id="modal-title-text">Confirmar</h4>
	      </div>
	      <div class="modal-body">
	      		<div class="form-row">
		      		<div class="form-group col-md-6" style="width: 100%;">
						  <span class="confirm">¿ Est&aacute; seguro que desea eliminar el nivel?</span>						    
      				</div>	      			
	    		</div>		      		
				<div class="form-style-button proyecto">
				   	<input type="button" value="Aceptar" id="btn-confirm-elim" class="btn btn-primary confirm-ok" />	
				   	<input type="button" value="Cancelar" id="btn-confirm-cancel" class="btn btn-primary confirm-no" />			   
				</div>
		   	
	      </div>	
	    </div>	
	  </div>
	</div>
	<!-- End Modal -->
	
	
	<!-- Modal -->
	<div id="metrado-modal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title" id="modal-title-text">Metrado</h4>
	      </div>
	      <div class="modal-body">
	      		<form id="metradoForm" class="form-content">					
		      		<div class="form-row">
			      		<div class="form-group col-md-4">
						     <select class="form-control form-control-sm custom-color" id="sistema" name="sistema" >
						    	<option class="placeholder-option" value="" disabled selected >Sistema</option>
						    	<option value="0">Sistema 1</option>
						    	<option value="1">Sistema 2</option>
						    	<option value="2">Sistema 3</option>
						    	<option value="3">Sistema 4</option>				    	
						    </select>
				    	</div>
				    	<div class="form-group col-md-4">
						     <select class="form-control form-control-sm custom-color" id="producto" name="producto" >
						    	<option class="placeholder-option" value="" disabled selected >Producto</option>
						    	<option value="0">Producto 1</option>
						    	<option value="1">Producto 2</option>
						    	<option value="2">Producto 3</option>
						    	<option value="3">Producto 4</option>				    	
						    </select>
				    	</div>	
				    	<div class="form-group col-md-4">
						     <select class="form-control form-control-sm custom-color" id="proveedor" name="proveedor" >
						    	<option class="placeholder-option" value="" disabled selected >Proveedor</option>
						    	<option value="0">Proveedor 1</option>
						    	<option value="1">Proveedor 2</option>
						    	<option value="2">Proveedor 3</option>
						    	<option value="3">Proveedor 4</option>				    	
						    </select>
				    	</div>
				    	<div class="form-group col-md-4">
						     <select class="form-control form-control-sm custom-color" id="precio" name="precio" >
						    	<option class="placeholder-option" value="" disabled selected >Precio</option>
						    	<option value="0">Precio minimo</option>
						    	<option value="1">Precio promedio</option>
						    	<option value="2">Precio maximo</option>					    	
						    </select>
				    	</div>
				    	<div class="form-group col-md-4">
						     <span>Unidad de Medida</span>	
				    	</div>
				    	<div class="form-group col-md-4">
						      <input class="form-control" id="cantidad" type="text" name="cantidad" placeholder="Cantidad" maxlength="200"/>
				    	</div>		      			
		    		</div> 
		    		
		    		<div class="form-row">
		      			<div class="form-group col-md-12">
						    <div class="msg-error" id="msg-error-metrado">
						   			Debe ingresar los datos.
			      			</div>
		      			</div>
					</div>  				

					<div class="form-style-button proyecto">
					   	<input type="button" value="Agregar" id="btn-agregar-producto" class="btn btn-primary" style="margin-left: 20%;"/>	
					   	<input type="button" value="Cancelar" id="btn-cancelar-producto" class="btn btn-primary" style="margin-left: 10%;"/>			   
					</div>
			   	</form>
			   	
			   	<div class="form-row" id="sist-metrado" style="margin-top: 15px;">
			   		<div class="form-group col-md-4" id="sistemas">
				   		 <div class="panel-group" id="accordion">
						    
						    						    
					    </div>			   	
				   	</div>
			   	</div>
	      </div>
	
	    </div>
	
	  </div>
	</div>
	<!-- End Modal -->
	
<script type="text/javascript">

	var productosSelected = [];

	$(document).ready(function() {
		
		$("#producto").change(function() {
			$("#producto option:selected").prop('disabled', 'disabled');
			
			var sistema = $("#sistema option:selected").val();
			var producto = $("#producto option:selected").val();
			
			if(productosSelected[sistema ] == undefined) {
				productosSelected[sistema] = producto;
			} else {
				productosSelected[sistema] += "," + producto;
			}
			
		});
		
		$("#sistema").change(function() {
			
			var sistema = $("#sistema option:selected").val();
			
			if (productosSelected[sistema] != undefined) {
				var listaProductos = productosSelected[sistema].split(",");
				 $.each(listaProductos , function( index, element ) {				 
					 $("[value^=" + element + "]").prop('disabled', 'disabled');
	 	         });
			}			
		});
		
			
		$("#btn-agregar-producto").click(function() {
			
			$("#msg-error-metrado").removeClass("show");
			
			var sistema = $("#sistema option:selected").val();
			var producto = $("#producto option:selected").val();
			var proveedor = $("#proveedor option:selected").val();
			var precio = $("#precio option:selected").val();
			var cantidad = $("#cantidad").val();
			
			if(sistema == "" || producto == "" || proveedor == "" || precio == "" || cantidad == "") { 
				$("#msg-error-metrado").addClass("show");
				return false;
			}		
			
			var divSistema = $("#sistema_" + sistema);
			var html = "";
			var htmlProducto = "";
			
			htmlProducto += "<div id='producto_"+ producto +"'>";			

			htmlProducto += '		<a id="eliminarProducto"  onclick="eliminarProducto(this);" data-sistema="' + sistema + '" data-producto="' + producto + '" title="Eliminar producto" onclick="" href="javascript:void(0)" class="fa fa-trash fa-2x home" style="font-size: 16px; text-decoration: none; position: relative;top: 5px;float:right;color:black;"></a>';
			htmlProducto += '		<a id="modificarProducto" onclick="modificarProducto(this);" data-sistema="' + sistema + '" data-producto="' + producto + '" data-proveedor="' + proveedor + '" data-precio="' + precio + '" data-cantidad="' + cantidad + '" title="Editar producto" href="javascript:void(0)" class="fa fa-edit fa-3x home" style="font-size: 16px; text-decoration: none; position: relative;top: 5px;float:right;color:black;"></a>';
			
			htmlProducto += '<div class="form-group row font-products" style="margin-top: 15px;">';
			htmlProducto += '	<label for="nombre" class="col-sm-2 col-form-label label-products">Producto:</label>';
			htmlProducto += '   <div class="col-sm-10">';
			htmlProducto += '      <input type="text" readonly class="form-control-plaintext" id="nombre" value="' + $("#producto option:selected").text()+ '" style="border: none;">';
			htmlProducto += '    </div>';
			htmlProducto += '</div>';

			htmlProducto += '<div class="form-group row font-products">';
			htmlProducto += '	<label for="nombre" class="col-sm-2 col-form-label label-products">Proveedor:</label>';
			htmlProducto += '   <div class="col-sm-10">';
			htmlProducto += '      <input type="text" readonly class="form-control-plaintext" id="nombre" value="' + $("#proveedor option:selected").text()+ '" style="border: none;">';
			htmlProducto += '    </div>';
			htmlProducto += '</div>';

			htmlProducto += '<div class="form-group row font-products">';
			htmlProducto += '	<label for="nombre" class="col-sm-2 col-form-label label-products">Precio:</label>';
			htmlProducto += '   <div class="col-sm-10">';
			htmlProducto += '      <input type="text" readonly class="form-control-plaintext" id="nombre" value="' + $("#precio option:selected").text()+ '" style="border: none;">';
			htmlProducto += '    </div>';
			htmlProducto += '</div>';
			
			htmlProducto += '<div class="form-group row font-products">';
			htmlProducto += '	<label for="nombre" class="col-sm-2 col-form-label label-products">Cantidad:</label>';
			htmlProducto += '   <div class="col-sm-10">';
			htmlProducto += '      <input type="text" readonly class="form-control-plaintext" id="nombre" value="' + $("#cantidad").val()+ '" style="border: none;">';
			htmlProducto += '    </div>';
			htmlProducto += '</div>';
			
			htmlProducto += "</div>";
			
			if(divSistema.length > 0) {								
				divSistema.find(".panel-body").append(htmlProducto);
				$("#producto_" + producto).addClass("sep-products");
				
				
			} else {
				
				html += '<div class="panel panel-default" id="sistema_' + sistema + '">';
				html += '  <div class="panel-heading">';
				html += '    <h4 class="panel-title" style="height: 10px;">';
				html += '      <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" style="position: absolute;left: 30px;">' + $("#sistema option:selected").text() +'</a>';
				html += '     </h4>';
				html += '</div>';
				html += '<div id="collapse1" class="panel-collapse collapse in">';
				html += '    <div class="panel-body">';
				html += htmlProducto;
				html += '	 </div>';
				html += '</div>';
				html += '</div>';
			    
				$("#sist-metrado").append(html);	
				$("#producto_" + producto).addClass("sep-first-products");
		
			}			
			
		});	
		
	});
	
	function modificarProducto(element) {
		
		var sistema = $(element).data("sistema");
		var producto = $(element).data("producto");
		var proveedor = $(element).data("proveedor")
		var precio = $(element).data("precio")
		var cantidad = $(element).data("cantidad")
		
		$("#sistema").val(sistema);
		$("#producto").val(producto);
		$("#proveedor").val(proveedor);
		$("#precio").val(precio);
		$("#cantidad").val(cantidad);
		
//TODO que cuando le de guardar modifique el div que ya existe		
		
	}
	
	function eliminarProducto(element) {
		
		var sistema = $(element).data("sistema");
		var producto = $(element).data("producto")
		
		if (productosSelected[sistema] != undefined) {
			var listaProductos = productosSelected[sistema].split(",");
			
			if(listaProductos.length == 1){
				 $("[value^=" + producto + "]").prop('disabled', 'false');
				 productosSelected[sistema].replace(producto,'');
			} else {
				 $.each(listaProductos , function( index, element ) {				 
					 if(element == producto) {
						 $("[value^=" + element + "]").prop('disabled', 'false');
						 productosSelected[sistema].replace("," + producto,'');
					 }				
	 	         });	
			}
			 
			 $("#producto_"+ producto).remove();			 
			 var contentSistemas = $.trim($("#sistema_"+ sistema).find("panel-body").text());
			 
			 if(contentSistemas == "") {
				 $("#sistema_"+ sistema).remove();
			 }			 
		}		
		
	}

</script>
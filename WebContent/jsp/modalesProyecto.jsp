<!-- Modal -->
	<div id="nivel-modal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close js-close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title" id="modal-title-text">Crear Nivel</h4>
	      </div>
	      <div class="modal-body">
	      		<form id="createNivelForm" class="form-content">
					
					<input id="idNivel" type="hidden" name="id" />
					<input id="idBloque" type="hidden" name="idBloque" />
					
		      		<div class="form-row">
		      			<div class="form-group col-md-6">
						    <input class="form-control js-text" id="nombre-nivel" type="text" name="nombre" placeholder="Nombre" maxlength="200"/>
		      			</div>	      			
		    		</div>
		      		<div class="form-row">
		      			<div class="form-group col-md-6">
						    <input class="form-control js-text" id="descripcion-nivel" type="text" name="descripcion" placeholder="Descripci�n"  maxlength="200"/>
		      			</div>	      			
		      		</div>
		      		<div class="form-row">
		      			<div class="form-group col-md-6">
						    <input class="form-control js-numeric" id="orden" type="text" name="orden" placeholder="Orden" maxlength="200"/>
		      			</div>	      			
		      		</div>	      		
		      		<div class="form-row">
		      			<div class="form-group col-md-12">
						    <div class="msg-error" id="msg-error-nivel">
						   			Debe ingresar los datos.
			      			</div>
		      			</div>
					</div>
					<div class="form-row">
		    			<div class="form-group col-md-12">
						    <div class="msg-exito" id="msg-exito-nivel">
						   			Se guard� el nivel exitosamente.
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
	
	<!-- Modal -->
	<div id="bloque-modal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close js-close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title" id="modal-title-text">Crear Bloque</h4>
	      </div>
	      <div class="modal-body">
	      		<form id="createBloqueForm" class="form-content">
					
					<input id="idProyecto" type="hidden" name="idProyecto"/>
					<input id="idBloque" type="hidden" name="id" />
					
		      		<div class="form-row">
		      			<div class="form-group col-md-6">
						    <input class="form-control js-text" id="nombre-bloque" type="text" name="nombre" placeholder="Nombre" maxlength="200"/>
		      			</div>	      			
		    		</div>
		      		<div class="form-row">
		      			<div class="form-group col-md-6">
						    <input class="form-control js-text" id="descripcion-bloque" type="text" name="descripcion" placeholder="Descripci�n"  maxlength="200"/>
		      			</div>	      			
		      		</div>	      		
		      		<div class="form-row">
		      			<div class="form-group col-md-12">
						    <div class="msg-error" id="msg-error-bloque">
						   			Debe ingresar los datos.
			      			</div>
		      			</div>
					</div>
					<div class="form-row">
		    			<div class="form-group col-md-12">
						    <div class="msg-exito" id="msg-exito-bloque">
						   			Se guard� el nivel exitosamente.
			     			</div>
		    			</div>
					</div>
					<div class="form-style-button proyecto">
					   	<input type="button" value="Guardar" id="btn-guardar-bloque" class="btn btn-primary" style="margin-left: 20%;"/>	
					   	<input type="button" value="Cancelar" id="btn-cancelar-bloque" class="btn btn-primary" style="margin-left: 10%;"/>			   
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
	        <button type="button" class="close js-close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title" id="modal-title-text">Confirmar</h4>
	      </div>
	      <div class="modal-body">
	      		<div class="form-row">
		      		<div class="form-group col-md-6" style="width: 100%;">
						  <span class="confirm">� Est&aacute; seguro que desea eliminar el elemento?</span>						    
      				</div>	      			
	    		</div>
	    		<div class="form-row">
	      			<div class="form-group col-md-12">
					    <div class="msg-error" id="msg-error-elim-nivel">
					   			Ocurri� un error al eliminar el nivel.
		      			</div>
	      			</div>
				</div>		      		
				<div class="form-style-button proyecto">
				   	<input type="button" value="Aceptar" id="btn-confirm-elim-nivel" class="btn btn-primary confirm-ok" />	
				   	<input type="button" value="Cancelar" id="btn-confirm-cancel" class="btn btn-primary confirm-no" />			   
				</div>
		   	
	      </div>	
	    </div>	
	  </div>
	</div>
	<!-- End Modal -->
	
	<!-- Modal Confirm-->
	<div id="confirm-elim-bloque-modal" class="modal fade" role="dialog">
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div class="modal-content" style="height: 180px;">
	      <div class="modal-header">
	        <button type="button" class="close js-close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title" id="modal-title-text">Confirmar</h4>
	      </div>
	      <div class="modal-body">
	      		<div class="form-row">
		      		<div class="form-group col-md-6" style="width: 100%;">
						  <span class="confirm">� Est&aacute; seguro que desea eliminar el elemento?</span>						    
      				</div>	      			
	    		</div>
	    		<div class="form-row">
	      			<div class="form-group col-md-12">
					    <div class="msg-error" id="msg-error-elim-bloque">
					   			Ocurri� un error al eliminar el bloque.
		      			</div>
	      			</div>
				</div>		      		
				<div class="form-style-button proyecto">
				   	<input type="button" value="Aceptar" id="btn-confirm-elim-bloque" class="btn btn-primary confirm-ok" />	
				   	<input type="button" value="Cancelar" id="btn-confirm-cancel-bloque" class="btn btn-primary confirm-no" />			   
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
	        <button type="button" class="close js-close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title" id="modal-title-text">Metrado</h4>
	      </div>
	      <div class="modal-body">
	      		<form id="metradoForm" class="form-content">
	      			<input id="nivelId" type="hidden">	      						
		      		<div class="form-group row">
			      		<div class="col-md-6">
						     <select class="form-control form-control-sm custom-color" id="sistema" name="sistema" >
						    	<option class="placeholder-option" value="" disabled selected >Seleccione el Sistema</option>
						    </select>
				    	</div>
				    	<div class="col-md-6">
						     <select class="form-control form-control-sm custom-color" id="producto" name="producto" >
						    	<option class="placeholder-option" value="" disabled selected >Seleccione el Producto</option>
						    </select>
				    	</div>
				    	
				    </div>
				    <div class="form-group row">	
				    	<div class="col-md-6">
						     <select class="form-control form-control-sm custom-color" id="proveedor" name="proveedor" data-price-list>
						    	<option class="placeholder-option" value="" disabled selected >Seleccione el Proveedor</option>
						    </select>
				    	</div>
				    	<div class="col-md-6">
						     <select class="form-control form-control-sm custom-color" id="precio" name="precio" >
						    	<option class="placeholder-option" value="" disabled selected >Seleccione el Precio</option>
						    </select>
				    	</div>
				    </div>
				    <div class="form-group row">
				    	<div class="col-md-6">
						      <input class="form-control js-numeric" id="cantidad" type="text" name="cantidad" placeholder="Cantidad" maxlength="200"/>
				    	</div>
				    	<div class="col-md-6">
						      <span id="medida">
						      
						      </span>						      
				    	</div>
				    		      			
		    		</div> 
		    		
		    		<div class="form-row">
		      			<div class="form-group col-md-12">
						    <div class="msg-error" id="msg-error-metrado">
						   			Debe ingresar los datos.
			      			</div>
		      			</div>
					</div>
					
					<div class="form-group col-md-12">
				    	<div class="msg-exito" id="msg-exito-metrado">
				   			Se guard� la configuraci�n del metrado exitosamente.
			     			</div>
		    			</div>
					</div> 
						
				   <div class="form-group row">				   
				   		
					   		<input type="button" value="Agregar" id="btn-agregar-producto" class="btn btn-primary" style="margin-left: 12%; width: 15%"/>	
					   		
					   		<input type="button" value="Guardar Metrado" id="guardar-metrado" class="btn btn-primary" style="margin-left: 10%; width: 25%"/>
		      			
						   	<input type="button" value="Modificar" id="btn-modificar-producto" class="btn btn-primary" style="margin-left: 10%; display:none; width: 15%"/>
		      			
						   	<input type="button" value="Cancelar" id="btn-cancelar-producto" class="btn btn-primary" style="margin-left: 10%;width: 15%"/>			   
		      			
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
	var preciosXProveedor = [];
	var priceList = [];
	var metradoEliminados = "";

	$(document).ready(function() {
								
		$("#guardar-metrado").click(function() {
		
			var productDivs = $(".js-product");
			var lengthProducts = productDivs.length			

			if(lengthProducts == 0) {
				$("#msg-error-metrado").addClass("show");
				return false;
			}
			
			$("#msg-exito-metrado").removeClass("show");
			
			var result = "{ \"listaMetradoEliminados\":  \""+ metradoEliminados.toString() +"\", \"listaMetrados\": [";

			var errorProductos = false;
			
			$.each(productDivs, function( index, element ) {	 
			 	var metrado = $(element).data("metrado");
				var producto = $(element).find("#modificarProducto").data("producto");
				var proveedor = $(element).find("#modificarProducto").data("proveedor");
				var precio = $(element).find("#modificarProducto").data("precio");
				var cantidad = $(element).find("#modificarProducto").data("cantidad");
				var precioLista = priceList[producto + "_" + proveedor];
				
				$("#producto_" + producto).find("#msg-error-producto").removeClass("show");
				
				if(proveedor === "" || precio === "") {
					$("#producto_" + producto).find("#msg-error-producto").addClass("show");
					errorProductos = true;
					return false;
				}
				
				var id = "";
				if(metrado != undefined) {
					id = metrado;
				} 
				
				result += JSON.stringify({"id": id,"nivel": parseInt($("#nivelId").val()), "producto": producto,"proveedor": proveedor,"precio": precio,"cantidad": cantidad, "precioLista": precioLista})
					
				if(lengthProducts > 1) {
					result += ",";
					lengthProducts--;
				}
 	        });	
			
			result += "]}";
			
			if(!errorProductos){
				$("#metrado-modal").css('z-index', '1');
				$.ajax({
			    	  url: "/Cotizador/rest/metrado/create",
			    	  type: "POST",
			    	  data: result,
			    	  dataType: "json",
			    	  contentType: "application/json; charset=utf-8",
			    	  success: function(result){	
			    	        console.log("termino");
			    	        console.log(result);
			    	        
			    	        $("#msg-exito-metrado").addClass("show");
			    	        $("#metrado-modal").css('z-index', '2');
				    	    $(".modal-backdrop.fade.in").css('z-index', '1');
				    	    			    	        
			    	  },
			    	  complete: function(result){
			    	        console.log("complete");
			    	  },
			    	  error: function(result){
			    	        console.log("error");
			    	  }
			    	  
			    	});
			}
			
			$('#producto').empty()
		    .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Producto</option>');
			$('#proveedor').empty()
			 .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Proveedor</option>');
			$('#precio').empty()
			 .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Precio</option>');
			$('#cantidad').val("");			

		});
		
		$("#proveedor").change(function() {
				
			var proveedor = $("#proveedor option:selected").val();			
			var precios = preciosXProveedor[proveedor];
			
			$('#precio').empty()
			 .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Precio</option>');
			
			if($('#cantidad').data("mod-prod-rel") != undefined && $('#cantidad').data("mod-prod-rel") != "1"){
				$('#cantidad').val("");	
			}	
			
			if(precios != undefined) {
				
				var listaPrecios = precios.split(",");
				
				 $.each(listaPrecios, function( index, element ) {	 
				 	var o = new Option(element, index);
    	        	$(o).html(element);
    	        	$("#precio").append(o);		
	 	        });	
				 
				 $("#precio").val(precioActual); 
			}
						
		});
		
		$("#producto").change(function() {
			
			var sistema = $("#sistema").val();
			var producto = $("#producto").val();
			
			if(productosSelected[sistema ] == undefined) {
				productosSelected[sistema] = producto;
			} else {
				productosSelected[sistema] += "," + producto;
			}
			
			$('#proveedor').empty()
			 .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Proveedor</option>');
			$('#precio').empty()
			 .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Precio</option>');
			
			if($('#cantidad').data("mod-prod-rel") != undefined && $('#cantidad').data("mod-prod-rel") != "1"){
				$('#cantidad').val("");	
			}			
		  
			var $val = $("#producto option:selected").val();
			$("#metrado-modal").css('z-index', '1');
			$.ajax({
		    	  url: "/Cotizador/rest/priceList/byProduct",
		    	  type: "POST",
		    	  data: JSON.stringify({idProduct: $val}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){	
		    	        console.log("termino");
		    	        console.log(result);
		    	        var unidadMedida = "";
		    	        $.each(result, function( index, element ) {	 
		    	        	var o = new Option(result[index].proveedor.nombre, result[index].proveedor.id);
		    	        	$(o).html(result[index].nombre);
		    	        	$("#proveedor").append(o);	
		    	        	unidadMedida = result[index].producto.unidadMedida;
		    	        	priceList[result[index].producto.id + "_" + result[index].proveedor.id] = result[index].id;
		    	        	preciosXProveedor[result[index].proveedor.id] = result[index].precioMinimo + "," + result[index].precioMaximo + "," + result[index].precioPromedio;
		    	        });

		    	        switch(unidadMedida) {
			    	        case 0:
			    	        	unidadMedida = "Gal�n"; break;
			    	        case 1:
			    	        	unidadMedida = "Litros"; break;
			    	        case 2:
			    	        	unidadMedida = "Pulgadas"; break;
			    	        case 3:
			    	        	unidadMedida = "Pies"; break;
			    	        case 4:
			    	        	unidadMedida = "Metros"; break;
			    	        case 5:
			    	        	unidadMedida = "Kil�metros"; break;
			    	        case 6:
			    	        	unidadMedida = "Yardas"; break;
			    	        case 7:
			    	        	unidadMedida = "Metros Cuadrados"; break;
			    	        case 8:
				    	        unidadMedida = "Mtros C�bicos"; break;
			    	        case 9:
			    	        	unidadMedida = "Rollo"; break;
			    	        case 10:
			    	        	unidadMedida = "Unidades"; break;
			    	        case 11:
			    	        	unidadMedida = "Global"; break;
		    	      	}
		    	        
		    	        $("#medida").html(unidadMedida);
		    	  },
		    	  complete: function(result){
		    	        console.log("complete");
		    	  },
		    	  error: function(result){
		    	        console.log("error");
		    	  }
		    	  
		    	});
		    	
				$("#metrado-modal").css('z-index', '2');
	    	    $(".modal-backdrop.fade.in").css('z-index', '1');
	    	  	    	    			
		});
		
		$("#sistema").change(function() {
						
			var sistema = $("#sistema option:selected").val();
			
			if (productosSelected[sistema] != undefined) {
				var listaProductos = productosSelected[sistema].split(",");
				 $.each(listaProductos , function( index, element ) {				 
					 $("select#producto").find("[value^=" + element + "]").prop('disabled', 'disabled');
	 	         });
			}
			
			$('#producto').empty()
		    .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Producto</option>');
			$('#proveedor').empty()
			 .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Proveedor</option>');
			$('#precio').empty()
			 .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Precio</option>');
			$('#cantidad').val("");
			
			var $val = $("#sistema option:selected").val();
			$("#metrado-modal").css('z-index', '1');
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
		    	        
		    	        var metradoProducts = $("#sistema_" + sistema).find(".js-product");
		    			
		   			 	$.each(metradoProducts , function( index, element ) {				 
			   				var product = $(element).find("#modificarProducto").data("producto");
			   				$("select#producto").find("[value^=" + product + "]").prop('disabled', 'disabled');
			   				
		   					if(productosSelected[sistema ] == undefined) {
		   						productosSelected[sistema] = product;
		   					} else {
		   						productosSelected[sistema] += "," + product;
		   					}					
		    	        });	
		   			 	
		   			 	$("#metrado-modal").css('z-index', '2');
			    	    $(".modal-backdrop.fade.in").css('z-index', '1');
			    	   		    	   
		    	  },
		    	  complete: function(result){
		    	        console.log("complete");
		    	  },
		    	  error: function(result){
		    	        console.log("error");
		    	  }
		    	  
		    	});	
							
		});
		
			
		$("#btn-agregar-producto").click(function() {
			
			$("#msg-error-metrado").removeClass("show");
			
			var sistema = $("#sistema option:selected").val();
			var producto = $("#producto option:selected").val();
			var proveedor = $("#proveedor option:selected").val();
			var precio = $("#precio option:selected").text();
			var cantidad = $("#cantidad").val();
			
			if(sistema == "" || producto == "" || proveedor == "" || precio == "" || cantidad == "") { 
				$("#msg-error-metrado").addClass("show");
				return false;
			}		
			
			var divSistema = $("#sistema_" + sistema);
			var html = "";
			var htmlProducto = "";
			
			htmlProducto += "<div id='producto_"+ producto +"' class='js-product'>";			

			htmlProducto += '		<a id="eliminarProducto"  onclick="eliminarProducto(this);" data-sistema="' + sistema + '" data-producto="' + producto + '" title="Eliminar producto" onclick="" href="javascript:void(0)" class="fa fa-trash fa-2x home" style="font-size: 16px; text-decoration: none; position: relative;top: 5px;float:right;color:black;"></a>';
			htmlProducto += '		<a id="modificarProducto" onclick="modificarProducto(this,0);" data-sistema="' + sistema + '" data-producto="' + producto + '" data-proveedor="' + proveedor + '" data-precio="' + precio + '" data-cantidad="' + cantidad + '" title="Editar producto" href="javascript:void(0)" class="fa fa-edit fa-3x home" style="font-size: 16px; text-decoration: none; position: relative;top: 5px;float:right;color:black;"></a>';
			
			htmlProducto += '<div class="form-group row font-products" style="margin-top: 15px;">';
			htmlProducto += '	<label for="nombre" class="col-sm-2 col-form-label label-products">Producto:</label>';
			htmlProducto += '   <div class="col-sm-10">';
			htmlProducto += '      <input type="text" readonly class="form-control-plaintext" id="label-producto" value="' + $("#producto option:selected").text()+ '" style="border: none;width: 420px;">';
			htmlProducto += '    </div>';
			htmlProducto += '</div>';

			htmlProducto += '<div class="form-group row font-products">';
			htmlProducto += '	<label for="nombre" class="col-sm-2 col-form-label label-products">Proveedor:</label>';
			htmlProducto += '   <div class="col-sm-10">';
			htmlProducto += '      <input type="text" readonly class="form-control-plaintext" id="label-proveedor" value="' + $("#proveedor option:selected").text()+ '" style="border: none;width: 420px;">';
			htmlProducto += '    </div>';
			htmlProducto += '</div>';

			htmlProducto += '<div class="form-group row font-products">';
			htmlProducto += '	<label for="nombre" class="col-sm-2 col-form-label label-products">Precio:</label>';
			htmlProducto += '   <div class="col-sm-10">';
			htmlProducto += '      <input type="text" readonly class="form-control-plaintext" id="label-precio" value="' + $("#precio option:selected").text()+ '" style="border: none;">';
			htmlProducto += '    </div>';
			htmlProducto += '</div>';
			
			htmlProducto += '<div class="form-group row font-products">';
			htmlProducto += '	<label for="nombre" class="col-sm-2 col-form-label label-products">Cantidad:</label>';
			htmlProducto += '   <div class="col-sm-10">';
			htmlProducto += '      <input type="text" readonly class="form-control-plaintext" id="label-cantidad" value="' + $("#cantidad").val()+ '" style="border: none;">';
			htmlProducto += '    </div>';
			htmlProducto += '</div>';
	
			htmlProducto += '<div class="form-group row font-products">';
			htmlProducto += '   <div class="msg-error" id="msg-error-producto">';
			htmlProducto += '      Debe ingresar los datos.';
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
			
			$("#producto option:selected").prop('disabled', 'disabled');
			$('#producto').val("");		    
			$('#proveedor').empty()
			 .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Proveedor</option>');
			$('#precio').empty()
			 .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Precio</option>');
			$('#cantidad').val("");
							
			$.ajax({
		    	  url: "/Cotizador/rest/relation/findByProduct",
		    	  type: "POST",
		    	  data: JSON.stringify({id: parseInt(producto)}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){	
		    	        console.log("termino");
		    	        console.log(result);
		    		    	        
		    	        console.log("Recorrer lista productos relacionados: ");
		    	        
		    	        $.each(result.relacionProducto, function( index, element ) {	 
		    	        	
		    	        	var preciosProductoRelacion = result.precioProductoRelacion[index];
		    	        	var proveedor = preciosProductoRelacion[0].proveedor.nombre;
		    	        	var precios = preciosProductoRelacion[0];
		    	        	var sistemaProd =  element.producto.sistema.id;
		    	        	var sistemaNombre =  element.producto.sistema.nombre;
		    	        	
		    	        	priceList[preciosProductoRelacion[0].producto.id + "_" + preciosProductoRelacion[0].proveedor.id] = precios.id;
		    	        	
		    	        	console.log("producto: " + preciosProductoRelacion[0].producto.id);
		    	        	console.log("proveedor: " + preciosProductoRelacion[0].proveedor.id);
		    	        	console.log("priceList: " + priceList);
		    	        	
		    	        	var precio;
		    	        	
		    	        	var tipoPrecioProy = $("#tipoPrecio").val();
		    	        	
		    	        	if (tipoPrecioProy == 0) {
		    	        		precio = precios.precioMinimo;
		    	        	}
		    	        	
							if (tipoPrecioProy == 1) {
								precio = precios.precioMaximo;	        		
							}
									    	        	
							if (tipoPrecioProy == 2) {
								precio = precios.precioPromedio;
							}
		    	        	
		    	        	var cantidadRelacion = 0;
		    	        	var operacion = element.operacion;
		    	        	var factor = element.factor;		    
		    	        			    	        			    	        	
		    	        	if(operacion == 0){
		    	        		cantidadRelacion = (cantidad / factor);
		    	        	}
		    	        	
							if(operacion == 1){
								cantidadRelacion = ( cantidad * factor);
		    	        	}
							
							var prodRel = $("#producto_"+element.producto.id);
							
							if (prodRel.length > 0){
								var oldCantidad = prodRel.find("label-cantidad");								
								cantidadRelacion += oldCantidad.val();
								
								var operacionAnterior = prodRel.data("operacion");
								var factorAnterior = prodRel.data("factor");
								var cantidadAnterior = prodRel.data("cantidad");
								var parentAnterior = prodRel.data("parent-product");
								
								operacionAnterior += "," + operacion;
								factorAnterior += "," + factor;
								cantidadAnterior += "," + cantidad;
								
								prodRel.data("operacion", operacionAnterior);
								prodRel.data("factor", factorAnterior);
								prodRel.data("cantidad", cantidadAnterior);
								prodRel.data("parent-product", parentAnterior);
								
								oldCantidad.val(cantidadRelacion);
								
							} else {
		    	        	
			    	        	htmlProducto = "";
			    				
			    				htmlProducto += "<div id='producto_"+ element.producto.id +"' class='js-product' data-operacion='" + operacion+ "' data-factor='"+ factor+"' data-cantidad='"+ cantidad+"'  data-parent-product='" + producto+ "'>";			
			    				
			    				htmlProducto += '		<a id="modificarProducto" onclick="modificarProducto(this,1);" data-sistema="' + element.producto.sistema.id + '" data-producto="' +  element.producto.id + '" data-proveedor="' + preciosProductoRelacion[0].proveedor.id + '" data-precio="' + precio + '" data-cantidad="' + cantidadRelacion + '" title="Editar producto" href="javascript:void(0)" class="fa fa-edit fa-3x home" style="font-size: 16px; text-decoration: none; position: relative;top: 5px;float:right;color:black;"></a>';
			    				
			    				htmlProducto += '<div class="form-group row font-products" style="margin-top: 15px;">';
			    				htmlProducto += '	<label for="nombre" class="col-sm-2 col-form-label label-products">Producto:</label>';
			    				htmlProducto += '   <div class="col-sm-10">';
			    				htmlProducto += '      <input type="text" readonly class="form-control-plaintext" id="label-producto" value="' + element.producto.nombre+ '" style="border: none;width: 420px;">';
			    				htmlProducto += '    </div>';
			    				htmlProducto += '</div>';
	
			    				htmlProducto += '<div class="form-group row font-products">';
			    				htmlProducto += '	<label for="nombre" class="col-sm-2 col-form-label label-products">Proveedor:</label>';
			    				htmlProducto += '   <div class="col-sm-10">';
			    				htmlProducto += '      <input type="text" readonly class="form-control-plaintext" id="label-proveedor" value="' + proveedor + '" style="border: none; width: 420px;">';
			    				htmlProducto += '    </div>';
			    				htmlProducto += '</div>';
	
			    				htmlProducto += '<div class="form-group row font-products">';
			    				htmlProducto += '	<label for="nombre" class="col-sm-2 col-form-label label-products">Precio:</label>';
			    				htmlProducto += '   <div class="col-sm-10">';
			    				htmlProducto += '      <input type="text" readonly class="form-control-plaintext" id="label-precio" value="' + precio + '" style="border: none;">';
			    				htmlProducto += '    </div>';
			    				htmlProducto += '</div>';
			    				
			    				htmlProducto += '<div class="form-group row font-products">';
			    				htmlProducto += '	<label for="nombre" class="col-sm-2 col-form-label label-products">Cantidad:</label>';
			    				htmlProducto += '   <div class="col-sm-10">';
			    				htmlProducto += '      <input type="text" readonly class="form-control-plaintext" id="label-cantidad" value="' + cantidadRelacion+ '" style="border: none;">';
			    				htmlProducto += '    </div>';
			    				htmlProducto += '</div>';
			    				
			    				htmlProducto += '<div class="form-group row font-products">';
			    				htmlProducto += '   <div class="msg-error" id="msg-error-producto">';
			    				htmlProducto += '      Debe ingresar los datos.';
			    				htmlProducto += '    </div>';
			    				htmlProducto += '</div>';
			    				
			    				htmlProducto += "</div>";
			    				
			    				 var divSistema = $("[id^=sistema_"+sistemaProd+"]");
			    				 html = "";
			    				 if(divSistema.length > 0) {								
			    					divSistema.find(".panel-body").append(htmlProducto);
			    					$("#producto_" + element.producto.id).addClass("sep-products");			    						
		    					} else {
		    						
		    						html += '<div class="panel panel-default" id="sistema_' + sistemaProd + '">';
		    						html += '  <div class="panel-heading">';
		    						html += '    <h4 class="panel-title" style="height: 10px;">';
		    						html += '      <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" style="position: absolute;left: 30px;">' + sistemaNombre +'</a>';
		    						html += '     </h4>';
		    						html += '</div>';
		    						html += '<div id="collapse1" class="panel-collapse collapse in">';
		    						html += '    <div class="panel-body">';
		    						html += htmlProducto;
		    						html += '	 </div>';
		    						html += '</div>';
		    						html += '</div>';
		    					    
		    						$("#sist-metrado").append(html);	
		    						$("#producto_" + element.producto.id).addClass("sep-first-products");
		    				
		    					}
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
		
		$("#btn-modificar-producto").click(function() {
			
			var sistema = $("#sistema option:selected").val();
			var producto = $("#producto option:selected").val();
			var proveedor = $("#proveedor option:selected").text();
			var precio = $("#precio option:selected").text();
			var cantidad = $("#cantidad").val();
			
			 $("#producto_"+ producto).find("#label-proveedor").val(proveedor);
			 $("#producto_"+ producto).find("#label-precio").val(precio);
			 $("#producto_"+ producto).find("#label-cantidad").val(cantidad);
			 
			 $("#producto_"+ producto).find("#modificarProducto").data("proveedor",$("#proveedor option:selected").val());
			 $("#producto_"+ producto).find("#modificarProducto").data("precio",precio);
			 
			 $("#sistema").removeAttr('disabled');
			 $("#producto").removeAttr('disabled');
			 $("#cantidad").removeAttr('disabled');
			 
			$("#btn-modificar-producto").css("display","none");
			$("#btn-agregar-producto").css("display","inline-block");
			
			limpiarCombos();
			
			var productDivs = $("[data-parent-product="+producto+"]");
			
			$.each(productDivs, function( index, element ) {	
		
				var labelCantidad = $(element).find("#label-cantidad");
				
				var cantidadRelacion = 0;
				
				var operacionAnterior = $(element).data("operacion");
				var factorAnterior = $(element).data("factor");
				var cantidadAnterior = $(element).data("cantidad");
				var parentAnterior = $(element).data("parent-product")+ "";
				
				var listaParent = parentAnterior.split(",");
				
				 $.each(listaParent, function( index, element ) {	
					 
					 if(element == producto) {
						var cantSinProducto = labelCantidad.val() - cantidadAnterior[index];
								   	        	
		   	        	if(operacionAnterior[index] == 0){
		   	        		cantidadRelacion = (cantidad / factorAnterior[index]);
		   	        	}
		   	        	
						if(operacionAnterior[index] == 1){
							cantidadRelacion = (cantidad * factorAnterior[index]);
		   	        	}
						
						cantidadAnterior[index] = cantidadRelacion;
						cantSinProducto += cantidadRelacion;
						labelCantidad.val(cantSinProducto);	
						
						 $(element).data("cantidad", cantidadAnterior);
					 }
				 	
	 	        });	
				
				if (listaParent.length == 1) {
					var operacion = $(element).data("operacion");
	   	        	var factor = $(element).data("factor");
	   	        	
	   	        	if(operacion == 0){
	   	        		cantidadRelacion = (cantidad / factor);
	   	        	}
	   	        	
					if(operacion == 1){
						cantidadRelacion = (cantidad * factor);
	   	        	}
					
					$(element).data("cantidad", cantidadRelacion);
					labelCantidad.val(cantidadRelacion);
				}
				   	        		
			});		
			
		});	
		
		$("#btn-cancelar-producto").click(function() {
// si esta el boton guardar mostrar mensaje seguro que desea salir ??
			
			$("#sistema").removeAttr('disabled');
			$("#producto").removeAttr('disabled');
			$("#cantidad").removeAttr('disabled');
			
			$("#btn-modificar-producto").css("display","none");
			$("#btn-agregar-producto").css("display","inline-block");
			
			limpiarCombos();
			$("#msg-error-metrado").removeClass("show");
			$("#msg-exito-metrado").removeClass("show");
			$(".js-product").find("#msg-error-producto").removeClass("show");
			
			$("#metrado-modal").modal("hide");
			
		});	
				
		
	});
	
	$(".js-numeric").on('keypress', function (e) {
		var regex = new RegExp("^[0-9]$");
		if(!regex.test(e.key)) {
			return false;
		}
	});	 
	
	$(".js-decimal").on('keypress', function (e) {
		var regex = new RegExp("^([0-9]|\\.)$");
		if(!regex.test(e.key)) {
			return false;
		}
	});	
		
	$(".js-text").on('keypress', function (e) {
		var regex = new RegExp("^([������aa-z������A-Z0-9 ]|\\.|\\,|\\(|\\)|\\_|\\-)$");
		if(!regex.test(e.key)) {
			return false;
		}
	});	
	
	
	$('.js-numeric').on('paste', function (e) {
	    var $this = $(this);
	    setTimeout(function (e) {
	        if (($this.val()).match(/[^0-9]/g)) {
				$this.val("");        	
	            setTimeout(function (e) {
	                $this.val(null);
	            },2500);
	        }                   
	    }, 5);
	});
	
	$('.js-decimal').on('paste', function (e) {
	    var $this = $(this);
	    setTimeout(function (e) {
	        if (($this.val()).match(/[^0-9]|\\./g)) {
				$this.val("");        	
	            setTimeout(function (e) {
	                $this.val(null);
	            },2500);
	        }                   
	    }, 5);
	});
	
	$(".js-close").click(function(){
	  $(this).parents(".modal").modal("hide");
	});
	
	function limpiarCombos(){
		$("#sistema").val("");
		$("#producto").val("");
		$("#proveedor").val("");
		$("#precio").val("");
		$("#cantidad").val("");		
	}
	
	
	
	function loadMetrado(){
		var nivel = $("#nivelId").val();
		
		 $("#sist-metrado").empty();
		 
		$.ajax({
	    	  url: "/Cotizador/rest/metrado/findByNivel",
	    	  type: "POST",
	    	  data: JSON.stringify({idNivel: nivel}),
	    	  dataType: "json",
	    	  contentType: "application/json; charset=utf-8",
	    	  success: function(result){	
	    	        console.log("termino");
	    	        console.log(result);
	    	        
	    	       
    	        
	    	        $.each(result, function( index, element ) {	 
	    	        	var metrado = element.id;
	    	        	var sistema = element.sistema;
	    				var producto = element.producto;
	    				var proveedor = element.proveedor;
	    				var precio = element.precio;
	    				var cantidad = element.cantidad;
	    				var factor = "";
	    				var operacion = "";
	    				
	    				if(productosSelected[sistema ] == undefined) {
	   						productosSelected[sistema] = producto;
	   					} else {
	   						productosSelected[sistema] += "," + producto;
	   					}		
	    				
	    				var idParentProduct = "";
	    				
	    				if (element.idParentProduct != undefined && element.idParentProduct != null) {
	    					idParentProduct = element.idParentProduct;
	    					factor = element.factor;
		    				operacion = element.operacion;
	    				}	    				
	    				
	    				var sistemaNombre = element.nombreSistema;
	    				var productoNombre = element.nombreProducto;
	    				var proveedorNombre = element.nombreProveedor;

	    				priceList[producto + "_" + proveedor] = element.precio.id;
	    				
	    				if(sistema == "" || producto == "" || proveedor == "" || precio == "" || cantidad == "") { 
	    					$("#msg-error-metrado").addClass("show");
	    					return false;
	    				}		
	    				
	    				var divSistema = $("#sistema_" + sistema);
	    				var html = "";
	    				var htmlProducto = "";
	    				
	    				htmlProducto += "<div id='producto_"+ producto +"' class='js-product' data-metrado='"+metrado+"' data-factor='"+factor+"' data-operacion='"+operacion+"' data-sistema='"+sistema+"' data-parent-product='" + idParentProduct+ "'>";			

	    				if (idParentProduct == "") { 	
	    					htmlProducto += '		<a id="eliminarProducto"  onclick="eliminarProducto(this);" data-sistema="' + sistema + '" data-producto="' + producto + '" title="Eliminar producto" onclick="" href="javascript:void(0)" class="fa fa-trash fa-2x home" style="font-size: 16px; text-decoration: none; position: relative;top: 5px;float:right;color:black;"></a>';
	    				}
	    				
	    				htmlProducto += '		<a id="modificarProducto" onclick="modificarProducto(this,0);" data-sistema="' + sistema + '" data-producto="' + producto + '" data-proveedor="' + proveedor + '" data-precio="' + precio + '" data-cantidad="' + cantidad + '" title="Editar producto" href="javascript:void(0)" class="fa fa-edit fa-3x home" style="font-size: 16px; text-decoration: none; position: relative;top: 5px;float:right;color:black;"></a>';
	    				
	    				htmlProducto += '<div class="form-group row font-products" style="margin-top: 15px;">';
	    				htmlProducto += '	<label for="nombre" class="col-sm-2 col-form-label label-products">Producto:</label>';
	    				htmlProducto += '   <div class="col-sm-10">';
	    				htmlProducto += '      <input type="text" readonly class="form-control-plaintext" id="label-producto" value="' + productoNombre+ '" style="border: none; width: 420px;">';
	    				htmlProducto += '    </div>';
	    				htmlProducto += '</div>';

	    				htmlProducto += '<div class="form-group row font-products">';
	    				htmlProducto += '	<label for="nombre" class="col-sm-2 col-form-label label-products">Proveedor:</label>';
	    				htmlProducto += '   <div class="col-sm-10">';
	    				htmlProducto += '      <input type="text" readonly class="form-control-plaintext" id="label-proveedor" value="' + proveedorNombre+ '" style="border: none; width: 420px;">';
	    				htmlProducto += '    </div>';
	    				htmlProducto += '</div>';

	    				htmlProducto += '<div class="form-group row font-products">';
	    				htmlProducto += '	<label for="nombre" class="col-sm-2 col-form-label label-products">Precio:</label>';
	    				htmlProducto += '   <div class="col-sm-10">';
	    				htmlProducto += '      <input type="text" readonly class="form-control-plaintext" id="label-precio" value="' + precio+ '" style="border: none;">';
	    				htmlProducto += '    </div>';
	    				htmlProducto += '</div>';
	    				
	    				htmlProducto += '<div class="form-group row font-products">';
	    				htmlProducto += '	<label for="nombre" class="col-sm-2 col-form-label label-products">Cantidad:</label>';
	    				htmlProducto += '   <div class="col-sm-10">';
	    				htmlProducto += '      <input type="text" readonly class="form-control-plaintext" id="label-cantidad" value="' + cantidad+ '" style="border: none;">';
	    				htmlProducto += '    </div>';
	    				htmlProducto += '</div>';
	    		
	    				htmlProducto += '<div class="form-group row font-products">';
	    				htmlProducto += '   <div class="msg-error" id="msg-error-producto">';
	    				htmlProducto += '      Debe ingresar los datos.';
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
	    					html += '      <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" style="position: absolute;left: 30px;">' + sistemaNombre +'</a>';
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
	    	  },
	    	  complete: function(result){
	    	        console.log("complete");
	    	  },
	    	  error: function(result){
	    	        console.log("error");
	    	  }
	    	  
	    	});
	}
	
	function modificarProducto(element,rel) {
				 
		var sistema = $(element).data("sistema");
		var producto = $(element).data("producto");
		var proveedor = $(element).data("proveedor")
		var precio = $(element).data("precio")
		var cantidad = $(element).data("cantidad")
		
		$("#sistema").val(sistema);		
		
		loadCombos(sistema, producto, proveedor, precio, cantidad, rel);
		
	}
	
	function loadCombos(sistema, producto, proveedor, precio, cantidad, rel) {

		if (productosSelected[sistema] != undefined) {
			var listaProductos = productosSelected[sistema].split(",");
			 $.each(listaProductos , function( index, element ) {				 
				 $("select#producto").find("[value^=" + element + "]").prop('disabled', 'disabled');
 	         });
		}
		
		$('#producto').empty()
	    .append('<option class="placeholder-option" value="" selected >Seleccione el Producto</option>');
		$('#proveedor').empty()
		 .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Proveedor</option>');
		$('#precio').empty()
		 .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Precio</option>');
		$('#cantidad').val("");
		
		var $val = sistema.toString();
		$("#metrado-modal").css('z-index', '1');
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
	    	        
	    	        var metradoProducts = $("#sistema_" + sistema).find(".js-product");
	    			
	   			 	$.each(metradoProducts , function( index, element ) {				 
		   				var product = $(element).find("#modificarProducto").data("producto");
		   				$("select#producto").find("[value^=" + product + "]").prop('disabled', 'disabled');
		   				
	   					if(productosSelected[sistema ] == undefined) {
	   						productosSelected[sistema] = product;
	   					} else {
	   						productosSelected[sistema] += "," + product;
	   					}					
	    	        });	
	   			 	
	   			 	$("#metrado-modal").css('z-index', '2');
		    	    $(".modal-backdrop.fade.in").css('z-index', '1');
		    	    		    	    	    		
					if(productosSelected[sistema ] == undefined) {
						productosSelected[sistema] = producto;
					} else {
						productosSelected[sistema] += "," + producto;
					}
					
					$('#proveedor').empty()
					 .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Proveedor</option>');
					$('#precio').empty()
					 .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Precio</option>');
					
					if($('#cantidad').data("mod-prod-rel") != undefined && $('#cantidad').data("mod-prod-rel") != "1"){
						$('#cantidad').val("");	
					}			
				  
					var $val = producto.toString();;
					$("#metrado-modal").css('z-index', '1');
					$.ajax({
				    	  url: "/Cotizador/rest/priceList/byProduct",
				    	  type: "POST",
				    	  data: JSON.stringify({idProduct: $val}),
				    	  dataType: "json",
				    	  contentType: "application/json; charset=utf-8",
				    	  success: function(result){	
				    	        console.log("termino");
				    	        console.log(result);
				    	        
				    	        $.each(result, function( index, element ) {	 
				    	        	var o = new Option(result[index].proveedor.nombre, result[index].proveedor.id);
				    	        	$(o).html(result[index].nombre);
				    	        	$("#proveedor").append(o);		    	        	
				    	        	priceList[result[index].producto.id + "_" + result[index].proveedor.id] = result[index].id;
				    	        	preciosXProveedor[result[index].proveedor.id] = result[index].precioMinimo + "," + result[index].precioMaximo + "," + 
				    	        	result[index].precioPromedio;
				    	        });
				    	       				    	       				    	        
				    			var precios = preciosXProveedor[proveedor];
				    			
				    			$('#precio').empty()
				    			 .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Precio</option>');
				    			
				    			if($('#cantidad').data("mod-prod-rel") != undefined && $('#cantidad').data("mod-prod-rel") != "1"){
				    				$('#cantidad').val("");	
				    			}	
				    			
				    			if(precios != undefined) {
				    				
				    				var listaPrecios = precios.split(",");
				    				
				    				 $.each(listaPrecios, function( index, element ) {	 
				    				 	var o = new Option(element, index);
				        	        	$(o).html(element);
				        	        	$("#precio").append(o);	
				        	        	
				        	        	if ( element == precio) {		    								
		    								$("#precio").val(index);	
		    							}
				    	 	        });			    				 
				    					
				    			}
				    			
				    			$("#cantidad").val(cantidad);
				    			$("#producto option").removeAttr('selected'); $("#producto option[value^="+ producto +"]").attr("selected",true)
				    			$("#proveedor").val(proveedor);
				    				
				    			$("#btn-modificar-producto").css("display","inline-block");
				    			$("#btn-agregar-producto").css("display","none");
				    			
				    			$("#sistema").prop('disabled', 'disabled');
				    			$("#producto").prop('disabled', 'disabled');		
				    			$("#cantidad").removeAttr('disabled');
				    			
				    			if(rel == 1){
				    				$("#cantidad").prop('disabled', 'disabled');
				    				$("#cantidad").data("mod-prod-rel","1")
				    			} else {
				    				$("#cantidad").data("mod-prod-rel","0")
				    			}
				    			
				    			$("#producto_" + producto).find("#msg-error-producto").removeClass("show");
				    		
				    	  },
				    	  complete: function(result){
				    	        console.log("complete");
				    	  },
				    	  error: function(result){
				    	        console.log("error");
				    	  }
				    	  
				    	});
				    	
						$("#metrado-modal").css('z-index', '2');
			    	    $(".modal-backdrop.fade.in").css('z-index', '1');
		    	   		    	   
	    	  },
	    	  complete: function(result){
	    	        console.log("complete");
	    	  },
	    	  error: function(result){
	    	        console.log("error");
	    	  }
	    	  
	    	});
	}
	
	function eliminarProducto(element) {
		
		var sistema = $(element).data("sistema");
		var producto = $(element).data("producto")
		
		if (productosSelected[sistema] != undefined) {
			var listaProductos = productosSelected[sistema].split(",");
			
			if(listaProductos.length == 1){
				$("select#producto").find("[value^=" + producto + "]").prop('disabled', 'false');
				 productosSelected[sistema].replace(producto,'');
			} else {
				 $.each(listaProductos , function( index, element ) {				 
					 if(element == producto) {
						 $("select#producto").find("[value^=" + producto + "]").prop('disabled', 'false');
						 productosSelected[sistema].replace("," + producto,'');
					 }				
	 	         });	
			}
			
			var idMetrado = $(element).parent("div").data("metrado")
			
			if (idMetrado != undefined) {
				metradoEliminados += "," + idMetrado.toString();		
			}					
			 
			 $("#producto_"+ producto).remove();
			 
			 // recorrer todos los div de proyecto y hacer split de parent 
			 // para verificatr los hijos de ese padre
			 // si esta ahi restar la cantidad de la relacion con el padre
			
			var productDivs = $(".js-product");			
			$.each(productDivs, function( index, elementProd ) {
				
				var parentData = $(elementProd).data("parent-product") + "";	
				
				var parents = parentData.split(",");
				var cantidades = ($(elementProd).data("cantidad")+"").split(",");	
				
				$.each(parents, function( index, element ) {
					
					if(element == producto) {
						
						var cantProd =  cantidades[index];	
						var labelCantidad = $(element).find("#label-cantidad");
						var cantSinProducto = labelCantidad.val() - cantProd;
						
						labelCantidad.val(cantSinProducto);
						
						var idMetradoRel = $(element).data("metrado");
						var cantProducto = $(element).data("cantidad");
						
						if (idMetradoRel != undefined) {
							metradoEliminados += "," + idMetradoRel.toString();	
						}
						
						if (parents.length == 1) {
							$(elementProd).remove();	
						}											
					}
					
				});				
				
			});
			 
			 var contentSistemas = $.trim($("#sistema_"+ sistema).find("panel-body").text());
			 
			 if(contentSistemas == "") {
				 $("#sistema_"+ sistema).remove();
			 }			 
		}		
		
	}

</script>
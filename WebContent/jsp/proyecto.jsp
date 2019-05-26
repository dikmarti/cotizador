<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:standardPage>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">

  <br>
  <!-- Contact Section -->
  <div class="w3-container w3-padding-32" id="contact">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Ficha T&eacute;nica</h3>
    
 
  		<form id="createProjectForm" class="form-content">
	
			<input id="idProject" type="hidden" name="id"/>
    		<div class="form-row">
    			<div class="form-group col-md-4">
		    		<input class="form-control js-numeric" id="idCrmMCO" type="text" name="idCrmMCO" placeholder="Crm MCO" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
				    <input class="form-control js-text" id="nombreCliente" type="text" name="nombreCliente" placeholder="Nombre del Cliente" maxlength="200"/>
    			</div>  
    			<div class="form-group col-md-4">
		    		<input class="form-control js-numeric" id="ruc" type="text" name="ruc" placeholder="RUC" maxlength="200"/>
    			</div>   			
  			</div>
    		<div class="form-row">
    			<div class="form-group col-md-4">
				    <input class="form-control js-text" id="nombreProyecto" type="text" name="nombreProyecto" placeholder="Nombre del Proyecto" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
		    		<input class="form-control js-text" id="localidad" type="text" name="localidad" placeholder="Localidad" maxlength="200"/>
    			</div>    			
    			<div class="form-group col-md-4">
		    		<input class="form-control js-text" id="direccion" type="text" name="direccion" placeholder="DirecciÛn" maxlength="200"/>
    			</div>
    		</div>
    		<div class="form-row">
    			<div class="form-group col-md-4">
				    <input class="form-control js-text" id="nombreContacto" type="text" name="nombreContacto" placeholder="Nombre de Contacto" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
				    <input class="form-control js-text" id="cargoContacto" type="text" name="cargoContacto" placeholder="Cargo de Contacto" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
				    <input class="form-control js-text" id="correoContacto" type="text" name="correoContacto" placeholder="Correo de Contatco" maxlength="200"/>
    			</div>
    		</div>
    		
    		<div class="form-row">
    			<div class="form-group col-md-4">
				    <input class="form-control js-text" id="telefonoContacto" type="text" name="telefonoContacto" placeholder="TelÈfono de Contatco" maxlength="200"/>
    			</div>
    			
    			<div class="form-group col-md-4">
    			 	<select class="form-control form-control-sm custom-color" id="tipoPrecio" name="tipoPrecio" >
				    	<option class="placeholder-option" value="-1" disabled selected >Tipo de Precio</option>
				    	<option value="0">MÌnimo</option>
				    	<option value="1">M·ximo</option>	
				    	<option value="2">Promedio</option>				    	
				    </select>				    
    			</div>
    		</div>
    		<div class="form-row">
    			<div class="form-group col-md-12">
				    <div class="msg-exito" id="fechaCreacion" name="fechaCreacion">
				   		Fecha de Creaci&oacute;n:&nbsp;
	     			</div>
    			</div>
    			<div class="form-group col-md-12">
				    <div class="msg-exito" id="fechaModificacion" name="fechaModificacion">
				   		Fecha de Modificaci&oacute;n:&nbsp;		
	     			</div>
    			</div>
			</div>
    		    		
    		<div class="form-row">
    			<div class="form-group col-md-12">
				    <div class="msg-error" id="msg-error-proyecto">
				   			Debe ingresar los datos.
	     			</div>
    			</div>
			</div>
			<div class="form-row">
    			<div class="form-group col-md-12">
				    <div class="msg-exito" id="msg-exito-proyecto">
				   			Se guardÛ el proyecto exitosamente.
	     			</div>
    			</div>
			</div>
			<div class="div-btns">
			   	<input type="button" value="Guardar" id="btn-guardar-proyecto" class="btn btn-primary" />			   	
			   	<input type="button" value="Crear Bloque" id="btn-crear-bloque" class="btn btn-primary" style="display:none;" />
			</div>
			
		 </form>  
   	
   		<div id="bloques">
			
  		</div>
  
<!-- End page content -->

	</div>

</div>

<jsp:include page="/jsp/modalesProyecto.jsp" />

<script type="text/javascript">
	
	var nivelActual = "";
	var proyectoActual = "";
	var precioActual = "";
	var bloqueActual = "";
	
	function crearNivelPorBloque (element) {
		var idBloque = $(element).parent().data("id");
		bloqueActual = idBloque;
		$(this).data("bloque", idBloque);
		$("#nombre-nivel").val("");
		$("#descripcion-nivel").val("");
		$("#orden").val("")
		
		$("#msg-exito-nivel").removeClass("show");
		$("#niveles").addClass("show");			
		$("#nivel-modal").modal("show");
		
		$("#nivel-modal").off();
		
		$("#nivel-modal").css('z-index', '2');
    	$(".modal-backdrop.fade.in").css('z-index', '1');
	}
	
	$(document).ready(function() {
		
		var color1 = "rgb(0, 72, 118)";
		var color2 = "rgb(242, 245,248)";
		var indexColorNivel = 0;
		var cantMaxNiveles = 50;
		var ordenesNivelArray = [];
		
		var colorArray = interpolateColors(color1, color2, cantMaxNiveles);
		
		var $idProyecto = "${param['idProyecto']}";
		
		if ($idProyecto != undefined && $idProyecto != null) {
			loadProyectData($idProyecto);
		}	
		
		function loadProyectData(){
			
			proyectoActual = $idProyecto;
						
			if($idProyecto == undefined || $idProyecto == ""){
				return false;
			}
			
			$("#btn-crear-bloque").css("display","inline-block");
			
			$.ajax({
		    	  url: "/Cotizador/rest/project/byId",
		    	  type: "POST",
		    	  data: JSON.stringify({idProyecto: $idProyecto.toString()}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){	
		    	        console.log("termino");
		    	        console.log(result);
		    	        
		    	        $("#idCrmMCO").val(result.idCrmMCO);
		    	        $("#nombreCliente").val(result.nombreCliente);
		    	        $("#ruc").val(result.ruc);
		    	        $("#nombreProyecto").val(result.nombreProyecto);
		    	        $("#localidad").val(result.localidad);
		    	        $("#direccion").val(result.direccion);
		    	        $("#nombreContacto").val(result.nombreContacto);
		    	        $("#cargoContacto").val(result.cargoContacto);
		    	        $("#correoContacto").val(result.correoContacto);
		    	        $("#telefonoContacto").val(result.telefonoContacto);
		    		    $("#tipoPrecio").val(result.tipoPrecio);
		    			
		    	        precioActual = $("#tipoPrecio").val();
			    	    			    	        
		    	  },
		    	  complete: function(result){
		    	        console.log("complete");
		    	  },
		    	  error: function(result){
		    	        console.log("error");
		    	  }
		    	  
		    	});
			
			$.ajax({
		    	  url: "/Cotizador/rest/nivel/findNivelByProject",
		    	  type: "POST",
		    	  data: JSON.stringify({idProject: $idProyecto}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){	
		    	        console.log("termino");
		    	        console.log(result);
		    	        
		    	        $.each(result, function( index, element ) {	
		    	        	var nombre = result[index].nombre;
		    	        	var orden = result[index].orden;
		    	        	var descripcion = result[index].descripcion;
		    	        	var id = result[index].id;
		    	        	
	    	        		var colorNivelCreado = colorArray[indexColorNivel];
	    	    			var colorFont = "white";
	    	    			
	    	    			if (indexColorNivel >= cantMaxNiveles/2) {
	    	    				colorFont = "dark";
	    	    			}	
	    	    			
	    	    			$("#niveles").addClass("show");	
	    	    			
	    	    			var html = '<div data-id="' + id + '" data-orden=' + orden + ' data-nombre="' + nombre + '" data-descripcion-nivel="' + descripcion + '"';
	    	    			html += ' class="col-sm-12 nivel-font '+ colorFont +'" style="background-color:rgb(' + colorNivelCreado +');height: 40px;">';
	    	    			html += '<p>' + nombre + '</p>';
	    	    			html += '<a id="eliminarNivel" title="Eliminar nivel" onclick="eliminarNivel($(this));" href="javascript:void(0)" class="fa fa-trash fa-2x home" style="font-size: 16px; text-decoration: none; position: relative;top: -29px;float:right; color:white;margin-right: 0px;padding-left: 4px;"></a>';
	    	    			html += '<a id="metrarNivel" data-nivel-id="'+id+'" title="Metrar nivel" onclick="metrarNivel($(this));" href="javascript:void(0)" class="fa fa-calculator fa-3x home" style="font-size: 13px; text-decoration: none; position: relative;top: -27px;float:right;color:white;padding-left: 4px;"></a>';
	    	    			html += '<a id="editarNivel" title="Editar nivel" onclick="editarNivel($(this));" href="javascript:void(0)" class="fa fa-edit fa-3x home" style="font-size: 16px; text-decoration: none; position: relative;top: -28px;float:right;color:white;"></a>';
	    	    			html += '</div>';			
	    	    			
	    	    			$("#row-niveles").prepend(html);	
	    	    									
	    	    			var $test = $('#row-niveles div').sort(function(a,b) {
	    	    			     return parseInt($(b).data('orden')) - parseInt($(a).data('orden'));
	    	    			});
	    	    			
	    	    			$("#row-niveles").html("");			
	    	    			$("#row-niveles").append($test);	
	    	    			
	    	    			indexColorNivel++;		    	        	
		    	        
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
		
		$("#garantia").click(function() {
			$(this).removeClass("custom-color");
		});	
		$("#soporte").click(function() {
			$(this).removeClass("custom-color");
		});	
		$("#tipoPrecio").click(function() {
			$(this).removeClass("custom-color");
		});	
		$("#btn-guardar-proyecto").click(function() {	
			
			$("#msg-error-proyecto").removeClass("on");

			var idCrmMCO = $("#idCrmMCO").val();
			var nombreCliente = $("#nombreCliente").val();
			var ruc = $("#ruc").val();
			var nombreProyecto = $("#nombreProyecto").val();
			var localidad = $("#localidad").val();
			var direccion = $("#direccion").val();
			var nombreContacto = $("#nombreContacto").val();
			var cargoContacto = $("#cargoContacto").val();
			var correoContacto = $("#correoContacto").val();
			var telefonoContacto = $("#nombreContacto").val();
			var tipoPrecio = $("#tipoPrecio").val();
			$("#idProject").val(proyectoActual);
			
			$("#msg-error-proyecto").removeClass("show");
			
			if(idCrmMCO.trim() == "" || ruc.trim() == "" || nombreCliente.trim() == "" ||
				nombreProyecto.trim() == "" || localidad.trim() == "" || nombreContacto.trim() == ""
					|| cargoContacto.trim() == "" || correoContacto.trim() == "" || telefonoContacto.trim() == "") {
				
				$("#msg-error-proyecto").addClass("show");
				return false;
			}
			
			  var $form = $("#createProjectForm").serializeArray();    	  	  
		  	  var $formSerialized = objectifyForm($form);
		  	  
			 $.ajax({
		    	  url: "/Cotizador/rest/project/createProject",
		    	  type: "POST",
		    	  data: JSON.stringify($formSerialized),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino creacion de projecto");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $(".msg-error").removeClass("on");
		    	        
		    	        if(obj === undefined) {	
		    	        	$(".msg-error").html("Ha ocurrido un error, el proyecto no pudo ser creado.");
		    	        	$(".msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result != null) {
		    	        		$("#msg-exito-proyecto").addClass("show");
		    	        		proyectoActual = result.id;

		    	        		$("#fechaCreacion").append(result.fechaCreacion.substring(0, 10));
		    	        		$("#fechaCreacion").addClass("show");
		    	        		
		    	        		precioActual = tipoPrecio;
		    	        		
		    	        		if(result.fechaModificacion != undefined && result.fechaModificacion != "") {
		    	        			$("#fechaModificacion").append(result.fechaModificacion.substring(0, 10));	
		    	        			$("#fechaModificacion").addClass("show");
		    	        		}
		    	        		
		    	        		$("#btn-crear-bloque").css("display","inline-block");
		    	        		
		    	        	} else {	    	        	
		    	        		$(".msg-error").html("Ha ocurrido un error, el proyecto no pudo ser creado.");
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
				
		$("#btn-crear-bloque").click(function() {
			
			$("#nombre-bloque").val("");
			$("#descripcion-bloque").val("");
			
			$("#msg-exito-bloque").removeClass("show");
			$("#bloque-modal").modal("show");
			
			$("#bloque-modal").off();
			
			$("#bloque-modal").css('z-index', '2');
        	$(".modal-backdrop.fade.in").css('z-index', '1');
		});
		
		$("#editarNivel").click(function() {
			$("#nivel-modal").modal("show");
			$("#nivel-modal").off();
		});
		
		$("#btn-cancelar-nivel").click(function() {
			$("div.edit").removeClass("edit");
			$("#nombre-nivel").val("");
			$("#descripcion-nivel").val("");
			$("#orden").val("")
			
			$("#nivel-modal").modal("hide");
		});
		
		$("#btn-confirm-cancel").click(function() {
			$("div.remove").removeClass("remove");
			$("#confirm-elim-modal").modal("hide");
		});
		
		$("#btn-confirm-elim").click(function() {

			$("#msg-error-elim-nivel").removeClass("on");
			
			var $idNivel = $("div.remove").data("id");
			
			$("#confirm-elim-modal").css('z-index', '1');
			
 			$.ajax({
		    	  url: "/Cotizador/rest/nivel/deleteNivel",
		    	  type: "POST",
		    	  data: JSON.stringify({idNivel: $idNivel}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino eliminacion de nivel");
		    	        console.log(result);
		    	        
		    	        if (result) {
		    	        	
		    	        	$("#confirm-elim-modal").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');  
		    	        	
		    	            $("div.remove").remove();
			    			
			    			var $test = $('#row-niveles div').sort(function(a,b) {
			    			     return parseInt($(b).data('orden')) - parseInt($(a).data('orden'));
			    			});
			    			
			    			$("#row-niveles").html("");			
			    			$("#row-niveles").append($test);	
			    			
			    			$("#confirm-elim-modal").modal("hide");
		    	        } else {
		    	        	$("#msg-error-elim-nivel").addClass("on");
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
		
		$("#btn-guardar-bloque").click(function() {
			
			var nombreBloque = $("#nombre-bloque").val();
			var descripcionBloque = $("#descripcion-bloque").val();
			
			$("#msg-error-bloque").removeClass("show");
			if(nombreBloque.trim() == "" || descripcionBloque.trim() == "") {
				$("#msg-error-bloque").addClass("show");
				return false;
			}
						
			$("#idProyecto").val(proyectoActual);
			 var $form = $("#createBloqueForm").serializeArray();    	  	  
		  	 var $formSerialized = objectifyForm($form);
		  	  
		  	 $("#bloque-modal").css('z-index', '1');
		  	 
			 $.ajax({
		    	  url: "/Cotizador/rest/bloque/createBloque",
		    	  type: "POST",
		    	  data: JSON.stringify($formSerialized),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino creacion de nivel");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $("#msg-error-bloque").removeClass("on");
		    	        
		    	        if(obj === undefined) {	
		    	        	
		    	        	$("#blouqe-modal").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	
		    	        	$("#msg-error-bloque").html("Ha ocurrido un error, el bloque no pudo ser creado.");
		    	        	$("#msg-error-bloque").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result != null) {
		    	        		$("#msg-exito-bloque").addClass("show");
		    	        		bloqueActual = result;	
		    	        		
		    	      			var idBloque = result;
	    	        			var html = "<div id='bloque_"+idBloque+"' data-id='" + idBloque + "' style='width: 30%; float: left; border: 2px solid; border-radius: 5px; box-shadow: -6px -4px 5px 0px rgba(0,0,0,0.2);padding: 5px; margin-left: 10px;  margin-top: 10px;'>"; 
	    	        			html += '<a id="editarBloque" title="Editar bloque" onclick="editarBloque($(this));" href="javascript:void(0)" class="fa fa-edit fa-3x home" style="padding: 4px;font-size: 16px; text-decoration: none; float:left;color:rgb(0,72,118);"></a>';
	    	        			html += ' <b>Bloque:</b> ' + nombreBloque;
	    	        			var paramIdBloque = '"' + idBloque + '"';
	    	        		   	html += "<input type='button' data-bloque='' value='Crear Nivel' id='btn-crear-nivel-bloque-" + idBloque + "' class='btn btn-primary' style='inline-block;float: right' onclick='crearNivelPorBloque($(this));'/>";
	    	        			html += "</br></br></br></div>";
	    	        		
	    	        			$("#bloques").append(html);
	    	        						
	    	        			var divNiveles = '<div id="niveles" class="niveles show" style="float: left;">';
	    	        			divNiveles += "</div> ";
	    	
	    	        			$("#bloque_" + idBloque).append(divNiveles);
	    	        			
	    	        			$("#bloque-modal").css('z-index', '2');
	    	                	$(".modal-backdrop.fade.in").css('z-index', '1');
	    	                
	    	        			$("#bloque-modal").modal("hide");
	    	    	    	    			
		    	    			$("#nombre-bloque").val("");
		    	    			$("#descripcion-bloque").val("");
		    	    			
		    	        	} else {
		    	        		
		    	        		$("#bloque-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
			    	        	
		    	        		$("#msg-error-bloque").html("Ha ocurrido un error, el bloque no pudo ser creado.");
			    	        	$("#msg-error-bloque").addClass("on");	 
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
		
		$("#btn-cancelar-bloque").click(function() {

			$("#nombre-bloque").val("");
			$("#descripcion-bloque").val("");
			
			$("#bloque-modal").modal("hide");
		});
		
		$("#btn-guardar-nivel").click(function() {
			
			var orden = $("#orden").val();
			var nombre = $("#nombre-nivel").val();
			var descripcion = $("#descripcion-nivel").val();
			
			$("#msg-error-nivel").removeClass("show");
			
			if(orden.trim() == "" || nombre.trim() == "" || descripcion.trim() == "") {
				$("#msg-error-nivel").addClass("show");
				return false;
			}	
			
			$("#idBloque").val(bloqueActual);
			 var $form = $("#createNivelForm").serializeArray();    	  	  
		  	 var $formSerialized = objectifyForm($form);
		  	  
		  	 $("#nivel-modal").css('z-index', '1');
		  	 
			 $.ajax({
		    	  url: "/Cotizador/rest/nivel/createNivel",
		    	  type: "POST",
		    	  data: JSON.stringify($formSerialized),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino creacion de nivel");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $("#msg-error-nivel").removeClass("on");
		    	        
		    	        if(obj === undefined) {	
		    	        	
		    	        	$("#nivel-modal").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	
		    	        	$("#msg-error-nivel").html("Ha ocurrido un error, el nivel no pudo ser creado.");
		    	        	$("#msg-error-nivel").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result != null) {
		    	        		$("#msg-exito-nivel").addClass("show");
		    	        		nivelActual = result;	
		    	        		
		    	        		if( $("div.edit").length > 0) {
		    	    				$("div.edit").find("p").html(nombre);
		    	    				
		    	    				$("div.edit").data("id",result);
		    	    				$("div.edit").data("orden", orden);
		    	    				$("div.edit").data("nombre", nombre);
		    	    				$("div.edit").data("descripcion-nivel", descripcion);
		    	    				
		    	    				$("#nivel-modal").css('z-index', '2');
				    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
				    	        	
			    	    			$("#nivel-modal").modal("hide");
			    	    			
			    	    			$("#nombre-nivel").val("");
			    	    			$("#descripcion-nivel").val("");
			    	    			$("#orden").val("");
		    	    				return false;
		    	    			}

		    	    			var colorNivelCreado = colorArray[indexColorNivel];
		    	    			var colorFont = "white";
		    	    			
		    	    			if (indexColorNivel >= cantMaxNiveles/2) {
		    	    				colorFont = "dark";
		    	    			}			
		    	    			
		    	    			var html = '<div data-id="' + result + '" data-orden=' + orden + ' data-nombre="' + nombre + '" data-descripcion-nivel="' + descripcion + '"';
		    	    			html += ' class="col-sm-12 nivel-font '+ colorFont +'" style="background-color:rgb(' + colorNivelCreado +');height: 40px;">';
		    	    			html += '<p>' + nombre + '</p>';
		    	    			html += '<a id="eliminarNivel" title="Eliminar nivel" onclick="eliminarNivel($(this));" href="javascript:void(0)" class="fa fa-trash fa-2x home" style="font-size: 16px; text-decoration: none; position: relative;top: -29px;float:right; color:white;margin-right: 0px;padding-left: 4px;"></a>';
		    	    			html += '<a id="metrarNivel" data-nivel-id="'+result+'" title="Metrar nivel" onclick="metrarNivel($(this));" href="javascript:void(0)" class="fa fa-calculator fa-3x home" style="font-size: 13px; text-decoration: none; position: relative;top: -27px;float:right;color:white;padding-left: 4px;"></a>';
		    	    			html += '<a id="editarNivel" title="Editar nivel" onclick="editarNivel($(this));" href="javascript:void(0)" class="fa fa-edit fa-3x home" style="font-size: 16px; text-decoration: none; position: relative;top: -28px;float:right;color:white;"></a>';
		    	    			html += '</div>';			
		    	    			
		    	    			var rowNiveles = '<div class="row div-row" id="row-niveles">';
       			   			    rowNiveles += '</div>';
       			   			    
       			   			    var $niveles = $("#bloque_"+bloqueActual).find("#niveles");
       			   			    $niveles.append(rowNiveles);
       			   			    
       			   			    var $rows = $niveles.find("#row-niveles");
       			   			    $rows.prepend(html);	
		    	    									
		    	    			var $test = $niveles.find("#row-niveles div").sort(function(a,b) {
		    	    			     return parseInt($(b).data('orden')) - parseInt($(a).data('orden'));
		    	    			});
		    	    			
		    	    			$rows.html("");			
		    	    			$rows.append($test);	
		    	    			
		    	    			indexColorNivel++;
		    	        		
		    	    			$("#nivel-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
			    	        	
		    	    			$("#nivel-modal").modal("hide");
		    	    			
		    	    			$("#nombre-nivel").val("");
		    	    			$("#descripcion-nivel").val("");
		    	    			$("#orden").val("");
		    	    			
		    	        	} else {
		    	        		
		    	        		$("#nivel-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
			    	        	
		    	        		$("#msg-error-nivel").html("Ha ocurrido un error, el nivel no pudo ser creado.");
			    	        	$("#msg-error-nivel").addClass("on");	 
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
			
						
		function interpolateColor(color1, color2, factor) {
		    if (arguments.length < 3) { 
		        factor = 0.5; 
		    }
		    var result = color1.slice();
		    for (var i = 0; i < 3; i++) {
		        result[i] = Math.round(result[i] + factor * (color2[i] - color1[i]));
		    }
		    return result;
		};
		
		function interpolateColors(color1, color2, steps) {
		    var stepFactor = 1 / (steps - 1),
		        interpolatedColorArray = [];

		    color1 = color1.match(/\d+/g).map(Number);
		    color2 = color2.match(/\d+/g).map(Number);

		    for(var i = 0; i < steps; i++) {
		        interpolatedColorArray.push(interpolateColor(color1, color2, stepFactor * i));
		    }

		    return interpolatedColorArray;
		}
		
		$("#orden").on('keypress', function (e) {
			if(!/^([0-9])*$/.test(e.key)) {
				return false;
			}
		});	
		
	});
	
	function editarNivel(elem){
		elem.parent().addClass("edit");
		$("#orden").val(elem.parent().data("orden"));
		$("#nombre-nivel").val(elem.parent().data("nombre"));
		$("#descripcion-nivel").val(elem.parent().data("descripcion-nivel"));
		$("#idNivel").val(elem.parent().data("id"));
		
		$("#msg-exito-nivel").removeClass("show");
		
		$("#nivel-modal").modal("show");
		$("#nivel-modal").css('z-index', '2');
		$(".modal-backdrop.fade.in").css('z-index', '1');
		$("#nivel-modal").off();
	}
	
	function editarBloque(elem){
		elem.parent().addClass("edit");
		
		$("#nombre-bloque").val(elem.parent().data("nombre"));
		$("#descripcion-bloque").val(elem.parent().data("descripcion-nivel"));
		$("#idBloque").val(elem.parent().data("id"));
		
		$("#msg-exito-bloque").removeClass("show");
		
		$("#bloque-modal").modal("show");
		$("#bloque-modal").css('z-index', '2');
		$(".modal-backdrop.fade.in").css('z-index', '1');
		$("#bloque-modal").off();
	}
	
	
	function eliminarNivel(elem){
		elem.parent().addClass("remove");	
		$("#confirm-elim-modal").modal("show");
	}
	
	function metrarNivel(elem){
		elem.parent().addClass("metric");	
		$("#nivelId").val(elem.data("nivel-id"));
		
		var idNivel = elem.parent("div").data("id");
		$('#sistema').empty()
	    .append('<option class="placeholder-option" value="" disabled selected >Seleccione el Sistema</option>');
		
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
    	        nivelActual = idNivel;
    			$("#metrado-modal").modal("show");
    			$("#metrado-modal").off();
    			$("#msg-exito-metrado").removeClass("show");
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
		
		loadMetrado();
	}
	
	$("#btn-cancelar-metrado").click(function() {
		$("div.metric").removeClass("metric");
		$("#metrado-modal").modal("hide");
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
		var regex = new RegExp("^([·ÈÌÛ˙Òa-z ]|[¡…Õ”⁄ÒA-Z]|[0-9]|\\.|\\,|\\(|\\)|\\_|\\-)$");
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
	
</script>

</t:standardPage>
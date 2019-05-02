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
				    <input class="form-control js-text" id="nombre" type="text" name="nombre" placeholder="Nombre del Proyecto" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
		    		<input class="form-control js-text" id="localidad" type="text" name="localidad" placeholder="Localidad" maxlength="200"/>
    			</div>    			
    			<div class="form-group col-md-4">
		    		<input class="form-control js-decimal" id="montoInversion" type="text" name="montoInversion" placeholder="Monto de inversión" maxlength="200"/>
    			</div>
    		</div>
    		<div class="form-row">
    			<div class="form-group col-md-4">
				    <input class="form-control js-decimal" id="montoPresupuesto" type="text" name="montoPresupuesto" placeholder="Monto de partida" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
				    <input class="form-control js-text" id="nivelConstruccion" type="text" name="nivelConstruccion" placeholder="Nivel de construccion" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
				    <input class="form-control js-decimal" id="areaConstruccion" type="text" name="areaConstruccion" placeholder="Área de construccion" maxlength="200"/>
    			</div>
    		</div>
    		<div class="form-row">
    			<div class="form-group col-md-4">
				     <select class="form-control form-control-sm custom-color" id="soporte" name="soporte" >
				    	<option class="placeholder-option" value="" disabled selected >Soporte</option>
				    	<option value="0">Si</option>
				    	<option value="1">No</option>				    	
				    </select>
		    	</div>
		    	<div class="form-group col-md-4">
				     <select class="form-control form-control-sm custom-color" id="mcoCare" name="mcoCare" >
				    	<option class="placeholder-option" value="" disabled selected >MCO Care</option>
				    	<option value="1">1 año</option>
				    	<option value="2">2 años</option>				    	
				    	<option value="3">3 años</option>
				    	<option value="4">4 años</option>			    	
				    	<option value="5">5 años</option>
				    	<option value="6">Mayor a 5 años</option>
				    </select>
		    	</div>
		    	<div class="form-group col-md-4">
				   <select class="form-control form-control-sm custom-color" id="garantia" name="garantia" >
				    	<option class="placeholder-option" value="" disabled selected >Garantía de fábrica</option>
				    	<option value="0">Sí</option>
				    	<option value="1">No</option>				    	
				    </select>
				</div>
    		</div>
    		<div class="form-row">
    			<div class="form-group col-md-4">
				     <select class="form-control form-control-sm custom-color" id="garantiaCableado" name="garantiaCableado" >
				    	<option class="placeholder-option" value="" disabled selected >Garantía de cableado estructurado</option>
				    	<option value="5">5 años</option>
				    	<option value="10">10 años</option>				    	
				    	<option value="15">15 años</option>
				    	<option value="20">20 años</option>
				    </select>
		    	</div>
    			<div class="form-group col-md-4">
				     <input class="form-control js-text" id="tipoProyecto" type="text" name="tipoProyecto" placeholder="Tipo Proyecto" maxlength="200"/> 
    			</div>
    			<div class="form-group col-md-4">
    			 	<select class="form-control form-control-sm custom-color" id="tipoPrecio" name="tipoPrecio" >
				    	<option class="placeholder-option" value="-1" disabled selected >Tipo de Precio</option>
				    	<option value="0">Mínimo</option>
				    	<option value="1">Máximo</option>	
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
				   			Se guardó el proyecto exitosamente.
	     			</div>
    			</div>
			</div>
			<div class="div-btns">
			   	<input type="button" value="Guardar" id="btn-guardar-proyecto" class="btn btn-primary" />			   	
			   	<input type="button" value="Crear Nivel" id="btn-crear-nivel" class="btn btn-primary" style="display:none;" />
			</div>
			
		 </form>  
   	
	   	<div id="niveles" class="niveles">
			<div class="row div-row" id="row-niveles">
			   			 
			</div>  
  		</div>
  
<!-- End page content -->

	</div>

</div>

<jsp:include page="/jsp/modalesProyecto.jsp" />

<script type="text/javascript">
	
	var nivelActual = "";
	var proyectoActual = "";
	var precioActual = "";
	
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
			
			$("#btn-crear-nivel").css("display","inline-block");
			
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
		    	        $("#nombre").val(result.nombre);
		    	        $("#localidad").val(result.localidad);
		    	        $("#montoInversion").val(result.montoInversion);
		    	        $("#montoPresupuesto").val(result.montoPresupuesto);
		    	        $("#nivelConstruccion").val(result.nivelConstruccion);
		    	        $("#areaConstruccion").val(result.areaConstruccion);
		    	        $("#soporte").val(result.soporte ? "0" : "1");
		    	        $("#mcoCare").val(result.mcoCare);
		    	        $("#garantia").val(result.garantia ? "0" : "1");
		    	        $("#garantiaCableado").val(result.garantiaCableado);
		    	        $("#tipoProyecto").val(result.tipoProyecto);
		    	        $("#tipoPrecio").val(result.tipoPrecio);
		    	        
			    	    			    	        
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
			var nombre = $("#nombre").val();
			var localidad = $("#localidad").val();
			var montoInversion = $("#montoInversion").val();
			var montoPresupuesto = $("#montoPresupuesto").val();
			var nivelConstruccion = $("#nivelConstruccion").val();
			var areaConstruccion = $("#areaConstruccion").val();
			var soporte = $("#soporte").val();
			var garantia = $("#garantia").val();
			var tipoProyecto = $("#tipoProyecto").val();
			var garantiaCableado = $("#garantiaCableado").val();
			var mcoCare = $("#mcoCare").val();
			var tipoPrecio = $("#tipoPrecio").val();
			$("#idProject").val(proyectoActual);
			
			if(idCrmMCO.trim() == "" || ruc.trim() == "" || nombreCliente.trim() == "" ||
				nombre.trim() == "" || localidad.trim() == "" || nivelConstruccion.trim() == "" ||
					montoInversion.trim() == "" || montoPresupuesto.trim() == "" || areaConstruccion.trim() == "" ||
					 nivelConstruccion.trim() == "" || soporte == null || garantia == null || 
					 	tipoProyecto.trim() == "" || garantiaCableado.trim() == "" || mcoCare.trim() == "") {
				
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
		    	        		
		    	        		$("#btn-crear-nivel").css("display","inline-block");
		    	        		
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
		
		$("#btn-crear-nivel").click(function() {
			
//TODO validar si es nuevo o esta modificando para mostrar los valores
			$("#nombre-nivel").val("");
			$("#descripcion-nivel").val("");
			$("#orden").val("")
			
			$("#msg-exito-nivel").removeClass("show");
			$("#niveles").addClass("show");			
			$("#nivel-modal").modal("show");
			
			$("#nivel-modal").off();
			
			$("#nivel-modal").css('z-index', '2');
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

		$("#btn-guardar-nivel").click(function() {
			
			var orden = $("#orden").val();
			var nombre = $("#nombre-nivel").val();
			var descripcion = $("#descripcion-nivel").val();
			
			if(orden.trim() == "" || nombre.trim() == "" || descripcion.trim() == "") {
				$("#msg-error-nivel").addClass("show");
				return false;
			}	
			
			$("#idProyecto").val(proyectoActual);
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
		    	        	
		    	        	$("#msg-error-nivel").html("Ha ocurrido un error, el proyecto no pudo ser creado.");
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
		    	    			
		    	    			$("#row-niveles").prepend(html);	
		    	    									
		    	    			var $test = $('#row-niveles div').sort(function(a,b) {
		    	    			     return parseInt($(b).data('orden')) - parseInt($(a).data('orden'));
		    	    			});
		    	    			
		    	    			$("#row-niveles").html("");			
		    	    			$("#row-niveles").append($test);	
		    	    			
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
			    	        	
		    	        		$("#msg-error-nivel").html("Ha ocurrido un error, el proyecto no pudo ser creado.");
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
		var regex = new RegExp("^([áéíóúña-z ]|[ÁÉÍÓÚñA-Z]|[0-9]|\\.|\\,|\\(|\\)|\\_|\\-)$");
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
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
	
    		<div class="form-row">
    			<div class="form-group col-md-4">
		    		<input class="form-control" id="idCrmMCO" type="text" name="idCrmMCO" placeholder="Crm MCO" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
				    <input class="form-control" id="nombreCliente" type="text" name="nombreCliente" placeholder="Nombre del Cliente" maxlength="200"/>
    			</div>  
    			<div class="form-group col-md-4">
		    		<input class="form-control" id="ruc" type="text" name="ruc" placeholder="RUC" maxlength="200"/>
    			</div>   			
  			</div>
    		<div class="form-row">
    			<div class="form-group col-md-4">
				    <input class="form-control" id="nombre" type="text" name="nombre" placeholder="nombre" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
		    		<input class="form-control" id="localidad" type="text" name="localidad" placeholder="Localidad" maxlength="200"/>
    			</div>    			
    			<div class="form-group col-md-4">
		    		<input class="form-control" id="montoInversion" type="text" name="montoInversion" placeholder="Monto de inversión" maxlength="200"/>
    			</div>
    		</div>
    		<div class="form-row">
    			<div class="form-group col-md-4">
				    <input class="form-control" id="montoPresupuesto" type="text" name="montoPresupuesto" placeholder="Monto de partida" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
				    <input class="form-control" id="nivelConstruccion" type="text" name="nivelConstruccion" placeholder="Nivel de construccion" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
				    <input class="form-control" id="areaConstruccion" type="text" name="areaConstruccion" placeholder="Área de construccion" maxlength="200"/>
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
				   <select class="form-control form-control-sm custom-color" id="garantia" name="garantia" >
				    	<option class="placeholder-option" value="" disabled selected >Garantía</option>
				    	<option value="0">Sí</option>
				    	<option value="1">No</option>				    	
				    </select>
				</div>
		    	<div class="form-group col-md-4">
				     <input class="form-control" id="tipoProyecto" type="text" name="tipoProyecto" placeholder="Tipo Proyecto" maxlength="200"/> 
    			</div>
    		</div>
    		<div class="form-row">
    			<div class="form-group col-md-4">
				    <input class="form-control" id="categoriaConstruccion" type="text" name="categoriaConstruccion" placeholder="Categoria de Construcción" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
				    <input class="form-control" id="porcentajeHolgura" type="text" name="porcentajeHolgura" placeholder="Porcentaje de Holgura" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
    			 	<select class="form-control form-control-sm custom-color" id="tipoPrecio" name="tipoPrecio" >
				    	<option class="placeholder-option" value="" disabled selected >Tipo de Precio</option>
				    	<option value="0">Mínimo</option>
				    	<option value="1">Máximo</option>	
				    	<option value="2">Promedio</option>				    	
				    </select>				    
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

<script type="text/javascript">
	
	var nivelActual = "";
	var proyectoActual = "";
	
	$(document).ready(function() {
		
		var color1 = "rgb(0, 72, 118)";
		var color2 = "rgb(242, 245,248)";
		var indexColorNivel = 0;
		var cantMaxNiveles = 50;
		var ordenesNivelArray = [];
		
		var colorArray = interpolateColors(color1, color2, cantMaxNiveles);
		
		$("#btn-guardar-proyecto").click(function() {			

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
			var categoriaConstruccion = $("#categoriaConstruccion").val();
			var porcentajeHolgura = $("#porcentajeHolgura").val();
			var tipoPrecio = $("#tipoPrecio").val();
			
			if(idCrmMCO.trim() == "" || ruc.trim() == "" || nombreCliente.trim() == "" || tipoPrecio.trim() == "" ||
				nombre.trim() == "" || localidad.trim() == "" || nivelConstruccion.trim() == "" ||
					montoInversion.trim() == "" || montoPresupuesto.trim() == "" || areaConstruccion.trim() == "" ||
					 nivelConstruccion.trim() == "" || soporte.trim() == "" || garantia.trim() == "" || 
					 	tipoProyecto.trim() == "" || categoriaConstruccion.trim() == "" || porcentajeHolgura.trim() == "") {
				
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
		    	        		proyectoActual = result;
		    	        		
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
			
			$("#nivel-modal").css('z-index', '2');
        	$(".modal-backdrop.fade.in").css('z-index', '1');
		});
		
		$("#editarNivel").click(function() {
			
//TODO traer los de bd para mostrar los valores		
			$("#nivel-modal").modal("show");
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

// TODO eliminar de bd

// eliminar div y ordenar divs

			$("div.remove").remove();
			
			var $test = $('#row-niveles div').sort(function(a,b) {
			     return parseInt($(b).data('orden')) - parseInt($(a).data('orden'));
			});
			
			$("#row-niveles").html("");			
			$("#row-niveles").append($test);	
			
			$("#confirm-elim-modal").modal("hide");
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
		    	    				return false;
		    	    			}

		    	    			var colorNivelCreado = colorArray[indexColorNivel];
		    	    			var colorFont = "white";
		    	    			
		    	    			if (indexColorNivel >= cantMaxNiveles/2) {
		    	    				colorFont = "dark";
		    	    			}			
		    	    			
		    	    			var html = '<div data-id="" data-orden=' + orden + ' data-nombre="' + nombre + '" data-descripcion-nivel="' + descripcion + '"';
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
		$("#nombre").val(elem.parent().data("nombre"));
		$("#descripcion-nivel").val(elem.parent().data("descripcion-nivel"));
		
		$("#nivel-modal").modal("show");	
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
    	  },
    	  complete: function(result){
    	        console.log("complete");
    	  },
    	  error: function(result){
    	        console.log("error");
    	  }	    	  
    	});
	}
	
	$("#btn-cancelar-metrado").click(function() {
		$("div.metric").removeClass("metric");
		$("#metrado-modal").modal("hide");
	});
	
	
</script>

<jsp:include page="/jsp/modalesProyecto.jsp" />

</t:standardPage>
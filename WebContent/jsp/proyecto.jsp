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
    
    
  		<form id="createProyectForm" class="form-content">
	
    		<div class="form-row">
    			<div class="form-group col-md-4">
		    <input class="form-control" id="idCrmMCO" type="text" name="idCrmMCO" placeholder="Crm MCO" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
		    <input class="form-control" id="ruc" type="text" name="ruc" placeholder="RUC" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
		    <input class="form-control" id="descripcion" type="text" name="descripcion" placeholder="Descripcion" maxlength="200"/>
    			</div>     			
  			</div>
    		<div class="form-row">
    			<div class="form-group col-md-4">
		    <input class="form-control" id="contratista" type="text" name="contratista" placeholder="Contratista" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
		    <input class="form-control" id="unidadEjecutora" type="text" name="unidadEjecutora" placeholder="Unidad ejecutora" maxlength="200"/>
    			</div>
    			
    			<div class="form-group col-md-4">
		    <input class="form-control" id="nivelConstruccion" type="text" name="nivelConstruccion" placeholder="Nivel construcción" maxlength="200"/>
    			</div>
    		</div>
    		<div class="form-row">
    			<div class="form-group col-md-4">
		    <input class="form-control" id="montoInversion" type="text" name="montoInversion" placeholder="Monto de inversion" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
		    <input class="form-control" id="montoPartida" type="text" name="montoPartida" placeholder="Monto de partida" maxlength="200"/>
    			</div>
    			<div class="form-group col-md-4">
		    <input class="form-control" id="areaConstruccion" type="text" name="areaConstruccion" placeholder="Área de construccion" maxlength="200"/>
    			</div>
    		</div>
    		<div class="form-row">
    			<div class="form-group col-md-4">
				     <select class="form-control form-control-sm custom-color" id="soporteTecnico" name="soporteTecnico" >
				    	<option class="placeholder-option" value="" disabled selected >Soporte</option>
				    	<option value="0">Si</option>
				    	<option value="1">No</option>				    	
				    </select>
		    			</div>
		    			<div class="form-group col-md-4">
				   <select class="form-control form-control-sm custom-color" id="garantiaCableado" name="garantiaCableado" >
				    	<option class="placeholder-option" value="" disabled selected >Garantía Cableado</option>
				    	<option value="0">Sí</option>
				    	<option value="1">No</option>				    	
				    </select>
		    			</div>
		    			<div class="form-group col-md-4">
				     <select class="form-control form-control-sm custom-color" id="garantiaEquipos" name="garantiaEquipos" >
				    	<option class="placeholder-option" value="" disabled selected >Garantía Equipos</option>
				    	<option value="0">Si</option>
				    	<option value="1">No</option>				    	
				    </select>
    			</div>
    		</div>
    		<div class="form-row">
    			<div class="form-group col-md-4">
		    		<input class="form-control" id="localidad" type="text" name="localidad" placeholder="Localidad" maxlength="200"/>
    			</div> 			
    		</div>
    		<div class="form-row">
    			<div class="form-group col-md-12">
		    <div class="msg-error" id="msg-error-proyecto">
		   			Debe ingresar los datos.
     			</div>
    			</div>
			</div>
			
			<div class="div-btns">
			   	<input type="button" value="Guardar" id="btn-guardar-proyecto" class="btn btn-primary" />			   	
			   	<input type="button" value="Crear Nivel" id="btn-crear-nivel" class="btn btn-primary" />
			</div>
			
		 </form>  
   	
	   	<div id="niveles" class="niveles">
			<div class="row div-row" id="row-niveles">
			   
			 
			</div>  
  		</div>
  
<!-- End page content -->

	

	</div>


</div>

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
						    <input class="form-control" id="orden" type="number" name="orden" placeholder="Orden" maxlength="200"/>
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


<script type="text/javascript">

	$(document).ready(function() {
		
		var color1 = "rgb(0, 72, 118)";
		var color2 = "rgb(242, 245,248)";
		var indexColorNivel = 0;
		var cantMaxNiveles = 50;
		var ordenesNivelArray = [];
		
		var colorArray = interpolateColors(color1, color2, cantMaxNiveles);
		
		$("#btn-guardar-proyecto").click(function() {			

			var idCrmMCO = $("#idCrmMCO").val();
			var ruc = $("#ruc").val();
			var descripcion = $("#descripcion").val();
			var contratista = $("#contratista").val();
			var unidadEjecutora = $("#unidadEjecutora").val();
			var nivelConstruccion = $("#nivelConstruccion").val();
			var montoInversion = $("#montoInversion").val();
			var montoPartida = $("#montoPartida").val();
			var areaConstruccion = $("#areaConstruccion").val();
			var soporteTecnico = $("#soporteTecnico").val();
			var garantiaCableado = $("#garantiaCableado").val();
			var garantiaEquipos = $("#garantiaEquipos").val();
			var localidad = $("#localidad").val();
			
			if(idCrmMCO.trim() == "" || ruc.trim() == "" || descripcion.trim() == "" ||
				contratista.trim() == "" || unidadEjecutora.trim() == "" || nivelConstruccion.trim() == "" ||
					montoInversion.trim() == "" || montoPartida.trim() == "" || areaConstruccion.trim() == "" ||
						soporteTecnico.trim() == "" || garantiaCableado.trim() == "" || garantiaEquipos.trim() == "" ||
							localidad.trim() == "") {
				
				$("#msg-error-proyecto").addClass("show");
				return false;
			}	
		});
		
		$("#btn-crear-nivel").click(function() {
			
//TODO validar si es nuevo o esta modificando para mostrar los valores
			$("#nombre").val("");
			$("#descripcion-nivel").val("");
			$("#orden").val("")
			
			$("#niveles").addClass("show");			
			$("#nivel-modal").modal("show");
		});
		
		$("#btn-cancelar-nivel").click(function() {

			$("#nombre").val("");
			$("#descripcion-nivel").val("");
			$("#orden").val("")
			
			$("#nivel-modal").modal("hide");
		});

		$("#btn-guardar-nivel").click(function() {
			
			var orden = $("#orden").val();
			var nombre = $("#nombre").val();
			var descripcion = $("#descripcion-nivel").val();
			
			if(orden.trim() == "" || nombre.trim() == "" || descripcion.trim() == "") {
				$("#msg-error-nivel").addClass("show");
				return false;
			}			

// TODO Ir a bd y guardar el nivel
			
			var colorNivelCreado = colorArray[indexColorNivel];
			var colorFont = "white";
			
			if (indexColorNivel >= cantMaxNiveles/2) {
				colorFont = "dark";
			}			
			
			var html = '<div data-orden=' + orden + ' class="col-sm-12 nivel-font '+ colorFont +'" style="background-color:rgb(' + colorNivelCreado +');height: 40px;">';
			html += '<p>' + nombre + '</p>';
			html += '<a id="eliminarNivel" href="#" class="fa fa-trash fa-2x home" style="font-size: 16px; text-decoration: none; position: relative;top: -29px;float:right; color:white;margin-right: 5px;"></a>';
			html += '<a id="editarNivel" href="index" class="fa fa-edit fa-3x home" style="font-size: 16px; text-decoration: none; position: relative;top: -28px;float:right;color:white;"></a>';
			html += '</div>';			
			
			$("#row-niveles").prepend(html);	
									
			var $test = $('#row-niveles div').sort(function(a,b) {
			     return parseInt($(b).data('orden')) - parseInt($(a).data('orden'));
			});
			
			$("#row-niveles").html("");			
			$("#row-niveles").append($test);		
			
			indexColorNivel++;
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
	});   

</script>

</t:standardPage>
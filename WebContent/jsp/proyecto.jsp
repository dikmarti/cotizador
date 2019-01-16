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
      			<div class="form-group col-md-8">
				    <div class="msg-error">
				   			Debe ingresar los datos.
	      			</div>
      			</div>
			</div>
			<div class="form-style-button">
				<div class="form-group col-md-12" style="margin: auto; padding-left: 20%; padding-top: 5%;">
				   	<input type="button" value="Crear" id="btn-modal-create" class="btn btn-primary" style="width: 50%; margin-left: 65px;"/>
				   	<input type="button" value="Modificar" id="btn-modal-update" class="btn btn-primary" style="width: 50%; margin-left: 65px; visibility: hidden;"/>
				</div>
			</div>
		   	</form>  
  
  
  </div>
  
<!-- End page content -->
</div>

<script type="text/javascript">

	$(document).ready(function() {
		
	});   

</script>
}

</t:standardPage>
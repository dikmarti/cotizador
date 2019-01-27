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
						    	<option value="0">Si</option>
						    	<option value="1">No</option>				    	
						    </select>
				    	</div>
				    	<div class="form-group col-md-4">
						     <select class="form-control form-control-sm custom-color" id="producto" name="producto" >
						    	<option class="placeholder-option" value="" disabled selected >Producto</option>
						    	<option value="0">Si</option>
						    	<option value="1">No</option>				    	
						    </select>
				    	</div>	
				    	<div class="form-group col-md-4">
						     <select class="form-control form-control-sm custom-color" id="proveedor" name="proveedor" >
						    	<option class="placeholder-option" value="" disabled selected >Proveedor</option>
						    	<option value="0">Si</option>
						    	<option value="1">No</option>				    	
						    </select>
				    	</div>
				    	<div class="form-group col-md-4">
						     <select class="form-control form-control-sm custom-color" id="medida" name="medida" >
						    	<option class="placeholder-option" value="" disabled selected >Medida</option>
						    	<option value="0">Unidad</option>
						    	<option value="1">Metros</option>				    	
						    </select>
				    	</div>		      			
		    		</div>   				

					<div class="form-style-button proyecto">
					   	<input type="button" value="Guardar" id="btn-guardar-metrado" class="btn btn-primary" style="margin-left: 20%;"/>	
					   	<input type="button" value="Cancelar" id="btn-cancelar-metrado" class="btn btn-primary" style="margin-left: 10%;"/>			   
					</div>
			   	</form>
	      </div>
	
	    </div>
	
	  </div>
	</div>
	<!-- End Modal -->
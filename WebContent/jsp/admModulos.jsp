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
    	<a id="btn-module-modify" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        	<span><strong>Editar</strong></span>            
    	</a>
	</div>
<table id="dtModule" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Nombre
      </th>
      <th class="th-sm">Descripción
      </th>
    </tr>
  </thead>
  <tbody id="module-data">
  </tbody>
  <tfoot>
    <tr>
      <th>Nombre
      </th>
      <th>Descripción
      </th>
    </tr>
  </tfoot>
</table>
</div>

<!-- Modal -->
<div id="module-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title-text">Modificar Módulo</h4>
      </div>
      <div class="modal-body">
      		<form id="EditModuleForm" class="form-content">
			<input id="id" type="hidden" name="id"/>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <input class="form-control" id="nombre" type="text" name="nombre" placeholder="Nombre" maxlength="200"/>
      			</div>
      			<div class="form-group col-md-6">
				    <input class="form-control" id="descripcion" type="text" name="descripcion" placeholder="Descripción" maxlength="200"/>
      			</div>
    		</div>
      		<div class="form-row">
      			<div class="form-group col-md-6">
				    <div class="msg-error">
				   			Debe ingresar los datos.
	      			</div>
      			</div>
			</div>
			<div class="form-style-button">
			   	<input type="button" value="Modificar" id="btn-modal-update" class="btn btn-primary" style="width: 50%; margin-left: 65px; visibility: hidden;"/>
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
    	  url: "/Cotizador/rest/modules/allModules",
    	  type: "GET",
    	  dataType: "json",
    	  contentType: "application/json; charset=utf-8",
    	  success: function(result){		    		
    	        console.log("termino");
    	        console.log(result);

    	        $.each(result, function( index, element ) {	   
    	        	
    	        	table.rows.add(
 	        		       [{ "Nombre": result[index].nombre, 
 	        		    	   "Descripcion": result[index].descripcion,
 	        		    	   "Id": result[index].id
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
   	 
   	var table = $('#dtModule').DataTable({
			  responsive: true,
			    "pagingType": "simple_numbers",
			    "pageLength": 10,
			    "language": {
		            "lengthMenu": "Administración de Módulos",
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
            	    {data: 'Nombre'},
            	    {data: 'Descripción'},
            	    {data: 'Id'},],
          	    "columnDefs": [
                      {
                          "targets": [ 2 ],
                          "visible": false,
                          "searchable": false
                      }]
		  }); 
		  $('.dataTables_length').addClass('bs-select');
		  
		  $('#dtModule tbody').on( 'click', 'tr', function () {
		        if ($(this).hasClass('selected')) {
		            $(this).removeClass('selected');
		        }
		        else {
		        	table.$('tr.selected').removeClass('selected');
		            $(this).addClass('selected'); 
		        }
		    } );

		$("#btn-module-modify").click(function() {
			console.log("modify module");   
			if(table.$('tr.selected').length != 1) {
				console.log("No hay modulo seleccionado");   	 
				return false;
			} 
			var $moduleModify = table.rows('.selected').data()[0];
			console.log("modify module " + $moduleModify);
			var $nombre =  $moduleModify.Nombre;
	    	 var $descripcion =  $moduleModify.Descripcion;
	    	 var $id =  $moduleModify.id;
			$('#module-modal').find('#nombre').val($nombre);
			$('#module-modal').find('#descripcion').val($descripcion);
			$('#module-modal').find('#id').val($id);
			$("#module-modal").modal("show");
		});
			
		$("#btn-modal-update").click(function() {
	    	 var $nombre =  $("#nombre").val();
	    	 var $descripcion =  $("#descripcion").val();
	    	 var $id =  $("#id").val();
	    	 
	    	 $(".msg-error").removeClass("on");
		     $(".msg-error").html("Los campos son obligatorios.");
		     
	    	 if ($descripcion == "" || $nombre == "" ) {
	    		  $(".msg-error").addClass("on");
	    		  return false;
	   		 } else {
	   		      console.log("Hay valores");
	   		 }

	    	 
	    	 $("#user-modal").css('z-index', '1');
	    	 $.ajax({
		    	  url: "/Cotizador/rest/modules/updateModule",
		    	  type: "POST",
		    	  data: JSON.stringify({id: $id, nombre: $nombre, descripcion: $descripcion}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino actualizacion de modulo");
		    	        console.log("result: " + result);
		    	        var obj = JSON.stringify(result);
		    	        console.log(" objeto " + obj);	    	        
		    	        
		    	        $(".msg-error").removeClass("on");
		    	        
		    	        if(obj === undefined) {	    	  
		    	        	$("#user-modal").css('z-index', '2');
		    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        	$(".msg-error").html("Ha ocurrido un error, el modulo no pudo ser actualizado.");
		    	        	$(".msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result == 0) {
			    	        	location.href = "admModulos";
		    	        	} else {
		    	        		$("#user-modal").css('z-index', '2');
			    	        	$(".modal-backdrop.fade.in").css('z-index', '1');
		    	        		$(".msg-error").html("Ha ocurrido un error, el modulo no pudo ser actualizado.");
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

	  });   
		  
	</script>
	
</t:standardPage>
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
		<a id="btn-project-create" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
        	<span><strong>Crear</strong></span>            
    	</a>
    	<a id="btn-project-modify" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        	<span><strong>Editar</strong></span>            
    	</a>
	</div>
<table id="dtProjectModule" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Id
      </th>
      <th class="th-sm">Id CRM MCO
      </th>
      <th class="th-sm">Nombre Cliente
      </th>
      <th class="th-sm">RUC
      </th>
      <th class="th-sm">Nombre Proyecto
      </th>
      <th class="th-sm">Localidad
      </th>
      <th class="th-sm">Fecha Creación
      </th>
      <th class="th-sm">Fecha Modificación
      </th>
      <th class="th-sm">Fecha Fin
      </th>
      <th class="th-sm">Generar Metrado
      </th>
      <th class="th-sm">Generar Versión
      </th>
    </tr>
  </thead>
  <tbody id="system-table-data">
  </tbody>
  <tfoot>
    <tr>
      <th>Id
      </th>
      <th>Id CRM MCO
      </th>
      <th>Nombre Cliente
      </th>
      <th>RUC
      </th>
      <th>Nombre Proyecto
      </th>
      <th>Localidad
      </th>
      <th>Fecha Creación
      </th>
      <th>Fecha Modificación
      </th>
      <th>Fecha Fin
      </th>
      <th>Generar Metrado
      </th>
      <th>Generar Versión
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
 
<!-- Modal Generar Metrado-->
<div id="modal-metrado" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title-text">Generar Metrado</h4>
      </div>
      <div class="modal-body">
			<div class="modal-footer" style="border-top: none; text-align: center">
				<button type="button" id="btn-modal-metrado-bloque"  class="btn btn-primary">Metrar Bloque</button>
				<a href='javascript:void(0)' id="btn-modal-metrado-proyecto" class="btn btn-primary">Metrar Proyecto</a>
			</div>
      </div>
    </div>
  </div>
</div>
<!-- End Modal Generar Metrado -->

<!-- Modal Bloquees -->
<div id="modal-bloque" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close js-close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title-text">Bloques</h4>
      </div>
      <div class="modal-body">
		   	<table id="dtModalBloque" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
			  <thead>
			    <tr>
			      <th class="th-sm">Id
			      </th>
			      <th class="th-sm">Nombre
			      </th>
			      <th class="th-sm">Descripción
			      </th>
			    </tr>
			  </thead>
			  <tbody id="table-data-bloque">
			  </tbody>
			</table>
			
			<div class="row icon button">
				<a id="btn-modal-metrar-bloque" class="btn btn-primary a-btn-slide-text">
		        	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
		        	<span><strong>Metrar Bloque</strong></span>            
		    	</a>
			</div>
      </div>
    </div>

  </div>
</div>
<!-- End Modal -->

<div id="modal-confirm-metrar-bloque" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal-title-text">Confirmación</h4>
      </div>
      <div class="modal-body">
			<h4 style="text-align: center;"><p>¿Está seguro que desea generar el metrado de el bloque seleccionado?</p></h4>
			<div class="modal-footer" style="border-top: none">
				<button type="button" id="btn-modal-confirm"  class="btn btn-primary">Confirmar</button>
				<button type="button" id="btn-modal-cancel" class="btn btn-secundary">Cancelar</button>
			</div>
      </div>
    </div>
  </div>
</div>
<!-- End page content -->
</div>

<script type="text/javascript">

$(document).ready(function() {
   	 $.ajax({
    	  url: "/Cotizador/rest/project/all",
    	  type: "GET",
    	  dataType: "json",
    	  contentType: "application/json; charset=utf-8",
    	  success: function(result){		    		
    	        console.log("termino");
    	        console.log(result);
    	    	
    	        $.each(result, function( index, element ) {	   
    	        	
    	        	table.rows.add(
 	        		       [{ "Id": result[index].id, 
 	        		    	   "IdCrmMco": result[index].idCrmMCO,
 	        		    	   "NombreCliente": result[index].nombreCliente,
 	        		    	   "Ruc": result[index].ruc, 	        		    	   
 	        		    	   "NombreProyecto": result[index].nombreProyecto,
 	        		    	   "Localidad": result[index].localidad,
 	        		    	   "FechaCreacion": result[index].fechaCreacion,
 	        		    	   "FechaModificacion": result[index].fechaModificacion,
 	        		    	   "FechaFin": result[index].fechaFin,
 	        		    	   "GenerarMetrado": "<a href='javascript:void(0)' onclick='showModalMetrado("+result[index].id+");' class='btn btn-primary'>Generar Metrado</a>",
 	        		    	   "GenerarVersion": "<a href='javascript:void(0)' onclick='' class='btn btn-primary'>Generar Versión</a>"
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
   	 
   	var table = $('#dtProjectModule').DataTable({
			  responsive: true,
			    "pagingType": "simple_numbers",
			    "pageLength": 10,
			    "language": {
		            "lengthMenu": "Módulo de Proyectos",
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
            	    {data: 'IdCrmMco'},
            	    {data: 'NombreCliente'},
            	    {data: 'Ruc'},
            	    {data: 'NombreProyecto'},
            	    {data: 'Localidad'},
            	    {data: 'FechaCreacion'},
            	    {data: 'FechaModificacion'},
            	    {data: 'FechaFin'},
            	    {data: 'GenerarMetrado'},
            	    {data: 'GenerarVersion'}],
	       	    "columnDefs": [
	                   {
	                       "targets": [ 0 ],
	                       "visible": false,
	                       "searchable": false
	                   },
	                   {
	                       "targets": [ 9 ],
	                       "className": 'dt-body-center',
	                       "searchable": false
	                   },
	                   {
	                       "targets": [ 10 ],
	                       "className": 'dt-body-center',
	                       "searchable": false
	                   }]
		  }); 
		  $('.dataTables_length').addClass('bs-select');
		  
		  $('#dtProjectModule tbody').on( 'click', 'tr', function () {
		        if ($(this).hasClass('selected')) {
		            $(this).removeClass('selected');
		        }
		        else {
		        	table.$('tr.selected').removeClass('selected');
		            $(this).addClass('selected'); 
		        }
		    } );
		    
		$("#btn-project-create").click(function() {
			table.$('tr.selected').removeClass('selected');
			location.href = "formProyecto";
		});
		
		$("#btn-project-modify").click(function() {
			console.log("modify project");   
			if(table.$('tr.selected').length != 1) {
				console.log("No hay proyecto seleccionado");   	 
				return false;
			} 
			
			var $projectModify = table.rows('.selected').data()[0];
			var $idProyecto =  $projectModify.Id;
			location.href = "formProyecto?idProyecto="+$idProyecto;
			
		});
	  });   
	  
		function showModalMetrado(id) {
			$("#btn-modal-metrado-bloque").attr("data-project", id)
			$("#btn-modal-metrado-proyecto").attr("data-project", id)
			$("#modal-metrado").modal("show");
		}
		function downloadFile(id) {
			$.ajax({
		    	  url: "/Cotizador/rest/project/generateFile?idProject="+id,
		    	  type: "POST",
		    	  success: function(result){	
		    		  var decodedString = atob(result);
		    		  saveByteArray("Metrado.xls", s2ab(decodedString));
		    	  },
		    	  complete: function(result){
		    	        console.log("complete");
		    	  },
		    	  error: function(result){
		    	        console.log("error");
		    	  }
		    	  
		    	});
		}
		function generateVersion(id) {
			$.ajax({
		    	  url: "/Cotizador/rest/project/generateVersion?idProject="+id,
		    	  type: "POST",
		    	  success: function(result){	
		    		  	console.log("termino generar version");
	    	        	console.log("result: " + result);
	    	        	var obj = JSON.stringify(result);
		    		  if(obj === undefined) {	    	  
		    	        	$(".msg-error").html("Ha ocurrido un error, el proyecto no pudo ser versionado.");
		    	        	$(".msg-error").addClass("on");	    	        	 
		    	        } else {
		    	        	if(result == 0) {
			    	        	location.href = "admProyectos";
		    	        	} else if (result == 1) {
		    	        		$("#error-table").html("Ha ocurrido un error, el proyecto no pudo ser versionado.");
			    	        	$(".msg-error").addClass("on");	 
		    	        	} else if (result == 2) {
		    	        		$("#error-table").html("Ha ocurrido un error, el proyecto no pudo ser versionado.");
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
		}
		
		function saveByteArray(reportName, file) {
		    var blob = new Blob([file], {type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"});
		    var link = document.createElement('a');
		    link.href = window.URL.createObjectURL(blob);
		    var fileName = reportName;
		    link.download = fileName;
		    link.click();
		};
		
		function s2ab(s) {
			  var buf = new ArrayBuffer(s.length);
			  var view = new Uint8Array(buf);
			  for (var i=0; i!=s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;
			  return buf;
			}
		
		$("#btn-modal-metrado-bloque").click(function() {
	    	var $idProject =  $("#btn-modal-metrado-bloque").attr("data-project");
			$("#modal-metrado").modal("hide");
			$.ajax({
		    	  url: "/Cotizador/rest/bloque/findBloqueByProject",
		    	  type: "POST",
		    	  data: JSON.stringify({idProject: $idProject}),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  success: function(result){		    		
		    	        console.log("termino buscar bloques");
		    	        console.log(result);
		    	        
		    	        $.each(result, function( index, element ) {	 
		    	        	
		    	        	dtModalBloque.rows.add(
		    	        		       [{ "Nombre": result[index].nombre, 
		    	        		    	  "Descripcion": result[index].descripcion,
		    	        		    	  "Id": result[index].id
		    	        		    	}]).draw(); 
		    	        });
					$("#modal-bloque").modal("show");
		    	  },
		    	  complete: function(result){
		    	        console.log("complete");
		    	  },
		    	  error: function(result){
		    	        console.log("error");
		    	  }
		    	  
		    	});
	      });
		$("#btn-modal-metrado-proyecto").click(function() {
	    	var $idProject =  $("#btn-modal-metrado-proyecto").attr("data-project");
			$("#modal-metrado").modal("hide");
			downloadFile($idProject);
	      });
		
		var dtModalBloque = $('#dtModalBloque').DataTable({
			  responsive: true,
			    "pagingType": "simple_numbers",
			    "pageLength": 8,
			    "searching": false,
			    "language": {
		            "lengthMenu": "Seleccionar Bloque:",
		            "zeroRecords": "No existen registros",
		            "emptyTable":     "No existen registros en tabla",
		            "info": "Mostrando del _START_ al _END_ de un total de _TOTAL_ registros.",
		            "infoEmpty": "",
		            "infoFiltered": "",
		            "paginate": {
		                "previous": "Atrás",
		                "next": "Siguiente"
		              }
		        },
		        columns:[
          	    {data: 'Id'},
          	    {data: 'Nombre'},
          	    {data: 'Descripcion'}],
          	   
          	"columnDefs": [
                  {
                      "targets": [ 0 ],
                      "visible": false,
                      "searchable": false
                  }]
		  });
		
		$("#btn-modal-metrar-bloque").click(function() {
			if(dtModalBloque.$('tr.selected').length != 1) {
				console.log("No hay bloque seleccionado");   	 
				return false;
			} 
			$("#modal-confirm-metrar-bloque").modal("show");
		});
		
		$("#btn-modal-cancel").click(function() {
			$("#modal-confirm-metrar-bloque").modal("hide");
		});
		$("#btn-modal-confirm").click(function() {
			$("#modal-confirm-metrar-bloque").modal("hide");
			if(dtModalBloque.$('tr.selected').length != 1) {
				console.log("No hay bloque seleccionado");   	 
				return false;
			} 
			var $idBloque = dtModalBloque.rows('.selected').data()[0]['Id'];
		});
		

		$('#dtModalBloque tbody').on( 'click', 'tr', function () {
		  if ($(this).hasClass('selected')) {
		      $(this).removeClass('selected');
		  }
		  else {
			  dtModalBloque.$('tr.selected').removeClass('selected');
		      $(this).addClass('selected'); 
		  }
		} );
	</script>
	
</t:standardPage>
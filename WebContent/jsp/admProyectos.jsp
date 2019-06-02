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
 	        		    	   "GenerarMetrado": "<a href='javascript:void(0)' onclick='downloadFile("+result[index].id+");' class='btn btn-primary'>Generar Metrado</a>",
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
            	    {data: 'GenerarMetrado'},
            	    {data: 'GenerarVersion'}],
	       	    "columnDefs": [
	                   {
	                       "targets": [ 0 ],
	                       "visible": false,
	                       "searchable": false
	                   },
	                   {
	                       "targets": [ 8 ],
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
		    	  type: "GET",
		    	  success: function(result){	
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
	</script>
	
</t:standardPage>
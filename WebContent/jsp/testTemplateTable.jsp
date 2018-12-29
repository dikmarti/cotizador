<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:standardPage>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">

<div class="w3-container w3-padding-32" id="divForm">
<br>
<br>
<br>
	<div class="row icon button">
		<a href="#" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
        	<span><strong>Añadir</strong></span>            
    	</a>
    	<a href="#" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        	<span><strong>Editar</strong></span>            
    	</a>
    	<a href="#" class="btn btn-primary a-btn-slide-text">
        	<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
        	<span><strong>Ver</strong></span>            
    	</a>
    	<a href="#" class="btn btn-primary a-btn-slide-text">
       		<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
        	<span><strong>Borrar</strong></span>            
    	</a>
	</div>
<table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Nombre

      </th>
      <th class="th-sm">Login

      </th>
      <th class="th-sm">Dirección

      </th>
      <th class="th-sm">Email

      </th>
      <th class="th-sm">Teléfono

      </th>
      <th class="th-sm">Cargo

      </th>
    </tr>
  </thead>
  <tbody id="user-table-data">
  </tbody>
  <tfoot>
    <tr>
      <th>Nombre
      </th>
      <th>Login
      </th>
      <th>Dirección
      </th>
      <th>Email
      </th>
      <th>Teléfono
      </th>
      <th>Cargo
      </th>
    </tr>
  </tfoot>
</table>
</div>
  
<!-- End page content -->
</div>

<script type="text/javascript">

$(document).ready(function() {
   	 $.ajax({
    	  url: "/Cotizador/rest/userModule/all",
    	  type: "GET",
    	  dataType: "json",
    	  contentType: "application/json; charset=utf-8",
    	  success: function(result){		    		
    	        console.log("termino");
    	        console.log(result);

    	        var $tableData = $("#user-table-data");
    	       	var dataUsers = "";
    	        
    	        $.each(result, function( index, element ) {	    	        	
    	        		    	        	
    	        		var li = "<tr><td>" + result[index].nombre + "</td>"
    	        					+"<td>" + result[index].login + "</td>"
    	        					+"<td>" + result[index].direccion + "</td>"
    	        					+"<td>" + result[index].email + "</td>"
    	        					+"<td>" + result[index].telefono + "</td>"
    	        					+"<td>" + result[index].cargo + "</td></tr>";
    	        		dataUsers += li;
    	        });
    	        $tableData.html(dataUsers);
    	  },
    	  complete: function(result){
    	        console.log("complete");
    	  },
    	  error: function(result){
    	        console.log("error");
    	  }
    	  
    	});
   	 
		$('#dtBasicExample').DataTable({
			  responsive: true,
			    "pagingType": "simple_numbers",
			    "pageLength": 10,
			    "language": {
		            "lengthMenu": "Historial Personas",
		            "zeroRecords": "No existen registros",
		            "emptyTable":     "No existen registros en tabla",
		            "info": "Mostrando del _START_ al _END_ de un total de _TOTAL_ registros.",
		            "infoEmpty": "Ningún registro disponible para la búsqueda.",
		            "infoFiltered": "",
		            "search": "Buscar: ",
		            "paginate": {
		                "previous": "Atrás",
		                "next": "Siguiente"
		              }
		        }
		  });
		  $('.dataTables_length').addClass('bs-select');

	  });   
	</script>
	
</t:standardPage>
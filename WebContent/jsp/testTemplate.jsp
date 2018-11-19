<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:standardPage>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">

	<div class="w3-container w3-padding-32" id="divForm">
   		<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Formulario prueba</h3>
   		
   		<form id="formTest" name="formTest" method="post" class="form-signin"> 	 
	 	  <input class="form-control" type="text" placeholder="Name" required name="name" id="name">
	 	  <input class="form-control" type="text" placeholder="Description" required name="desc" id="desc">    
	      <input class="btn btn-lg btn-primary btn-block btn-signin" type="button" value="exec" id="btnExec"/> 
	      <div id="divMensaje" style="color:red"></div>
    	</form>
    	
    </div>
    
  <!-- Contact Section -->
  <div class="w3-container w3-padding-32" id="contact">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Contact</h3>
    <p>Lets get in touch and talk about your next project.</p>
    <form action="/action_page.php" target="_blank">
      <input class="w3-input w3-border" type="text" placeholder="Name" required name="Name">
      <input class="w3-input w3-section w3-border" type="text" placeholder="Email" required name="Email">
      <input class="w3-input w3-section w3-border" type="text" placeholder="Subject" required name="Subject">
      <input class="w3-input w3-section w3-border" type="text" placeholder="Comment" required name="Comment">
      <button class="w3-button w3-black w3-section" type="submit">
        <i class="fa fa-paper-plane"></i> SEND MESSAGE
      </button>
    </form>
  </div>
  
<!-- End page content -->
</div>


</t:standardPage>
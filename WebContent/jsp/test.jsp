<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources/js/main.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/main.css">
	<link rel="stylesheet" type="text/css" href="resources/css/header.css">
	<link rel="stylesheet" type="text/css" href="resources/css/footer.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<!-- HEADER -->

<div class="header-top">
   <div class="header-bar header-white header-wide header-padding header-card">	
    <div class="header-left"><img src="resources/images/logo.jpg" style="width: 100px; height: 40px; object-fit: contain;"></div>
    <div class="topnav2"  id="myTopnav2"> 
     <a href="javascript:void(0);" class="icon2" onclick="myFunction()">
	   	<i class="fa fa-bars"></i>
	   </a>	
    </div>
    <div class="topnav"  id="myTopnav">   	 
	   <a href="#projects" class=" active">Projects</a>
	   <a href="#about" >About</a>
	   <a href="#contact" >Contact</a>	   
	    <a href="#" >&lt;Usuario&gt;</a>
	  
	</div>	
  </div>
</div>

    
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


<!-- Footer -->
<footer class="footer" role="contentinfo">
	<section class="bg-darkgray" style='position:relative;'>
		<div class='footer--info centered'>
			<div class="four columns">
				<img src="resources/images/logo.png" style="width: 100%; height: 70px; margin-top:75px; object-fit: contain;">
			</div>
			<div class="four columns">
				<h3><strong>Men&uacute;</strong></h3>
				<ul class="footer--info--navigate">
					<li><a href="">Proyectos</a></li>
					<li><a href="">Configuraci&oacute;n</a></li>
				</ul>
			</div>
			<div class="four columns">
				<h3><strong>Contacto</strong></h3>
				<ul class="footer--info--contact">
					<li><a href="mailto:info@mcoglobal.net">info@mcoglobal.net</a></li>
					<li><a href="tel:+1 786-801-1836">+1 786-801-1836</a></li>
					<li><a href="https://goo.gl/maps/krsy5Zd1BMr" target="_blank">2500 NW 107th Ave<br />Ste 402<br />Doral FL 33172</a></li>
				</ul>
			</div>
			<div class="four columns">
					<h3><strong>Redes</strong></h3>
					<ul class="footer--info--connect">
					<li><a href="https://twitter.com/mcoglobal" target="_blank"><img src='resources/images/icon-twitter.svg' /></a></li>
					<li><a href="https://www.facebook.com/mcoglobal" target="_blank"><img src='resources/images/icon-facebook.svg' /></a></li>
					<li><a href="https://www.linkedin.com/company/mco-global" target="_blank"><img src='resources/images/icon-linkedin.svg' /></a></li>
				</ul>
			</div>
		</div>
	</section>

	<section class="bg-black" style='position:relative;'>
		<div class="footer--copyright centered">
			<p>&copy; Copyright 2018 - 2019 Dian Inc. </p>
		</div>
	</section>
</footer>

<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

      <script type="text/javascript">
      
	      function myFunction() {
	    	    var x = document.getElementById("myTopnav");
	    	    if (x.className === "topnav") {
	    	        x.className += " responsive";
	    	    } else {
	    	        x.className = "topnav";
	    	    }
	    	}
      
      	(function() {
      		
      		function objectifyForm(formArray) {//serialize data function

      		  var returnArray = {};
      		  for (var i = 0; i < formArray.length; i++){
      		    returnArray[formArray[i]['name']] = formArray[i]['value'];
      		  }
      		  return returnArray;
      		}
	    	  
    	  	$("#btnExec").click(function() {
    	  	  var $form = $("#formTest").serializeArray();    	  	  
    	  	  var $formSerialized = objectifyForm($form);
    	  	  
    		  $.ajax({
		    	  url: "/Cotizador/rest/shape/prueba",
		    	  type: "POST",
		    	  data: JSON.stringify($formSerialized),
		    	  dataType: "json",
		    	  contentType: "application/json; charset=utf-8",
		    	  async: false,
		    	  success: function(result){		    		
		    	        console.log("termino");
		    	        var obj = JSON.stringify(result);
		    	        
		    	        $("#divMensaje").html(obj);
		    	        
		    	        var obj2 = JSON.parse(obj);
		    	  },
		    	  complete: function(result){
		    	        console.log("complete");
		    	  },
		    	  error: function(result){
		    	        console.log("error");
		    	  }
		    	});
			});		      
		     
    	})();
      	
      	// Send products de un array JSON.stringify(arrayTV).replace(/(:)/g,',').replace(/(")/g,'')
      </script>
</body>
</html>

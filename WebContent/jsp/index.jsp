<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:standardPage>

<!-- Page content -->
<div class="w3-content w3-padding" style="max-width: 1564px">

	<!-- Contact Section -->
	<div class="w3-container w3-padding-32" id="contact">
		<br> <br> <br>
		<div class="container-2">
			<div id="page-wrapper">
				<div class="row">
					<div class="col-md-12">
						<div class="page-title">
							<h2>
								Dashboard<small> Content Overview</small>
							</h2>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-2 col-sm-6">
						<div class="circle-tile">
							<a href="#">
								<div class="circle-tile-heading dark-blue">
									<i class="fa fa-users fa-fw fa-3x"></i>
								</div>
							</a>
							<div class="circle-tile-content dark-blue">
								<div class="circle-tile-description text-faded">Módulo 1</div>
								<div class="circle-tile-number text-faded">
									Usuarios <span id="sparklineA"></span>
								</div>
								<a href="#" class="circle-tile-footer">Administrar <i
									class="fa fa-chevron-circle-right"></i></a>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-sm-6">
						<div class="circle-tile">
							<a href="#">
								<div class="circle-tile-heading green">
									<i class="fa fa-money fa-fw fa-3x"></i>
								</div>
							</a>
							<div class="circle-tile-content green">
								<div class="circle-tile-description text-faded">Módulo 2</div>
								<div class="circle-tile-number text-faded">Proyectos</div>
								<a href="#" class="circle-tile-footer">Crear <i
									class="fa fa-chevron-circle-right"></i></a>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-sm-6">
						<div class="circle-tile">
							<a href="#">
								<div class="circle-tile-heading orange">
									<i class="fa fa-bell fa-fw fa-3x"></i>
								</div>
							</a>
							<div class="circle-tile-content orange">
								<div class="circle-tile-description text-faded">Módulo 3</div>
								<div class="circle-tile-number text-faded">Administración</div>
								<a href="#" class="circle-tile-footer">Configurar <i
									class="fa fa-chevron-circle-right"></i></a>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-sm-6">
						<div class="circle-tile">
							<a href="#">
								<div class="circle-tile-heading blue">
									<i class="fa fa-tasks fa-fw fa-3x"></i>
								</div>
							</a>
							<div class="circle-tile-content blue">
								<div class="circle-tile-description text-faded">Módulo 4</div>
								<div class="circle-tile-number text-faded">
									Productos <span id="sparklineB"></span>
								</div>
								<a href="#" class="circle-tile-footer">Actualizar <i
									class="fa fa-chevron-circle-right"></i></a>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-sm-6">
						<div class="circle-tile">
							<a href="#">
								<div class="circle-tile-heading red">
									<i class="fa fa-shopping-cart fa-fw fa-3x"></i>
								</div>
							</a>
							<div class="circle-tile-content red">
								<div class="circle-tile-description text-faded">Módulo 5</div>
								<div class="circle-tile-number text-faded">
									Proyectos Metrados <span id="sparklineC"></span>
								</div>
								<a href="#" class="circle-tile-footer">Ver historial <i
									class="fa fa-chevron-circle-right"></i></a>
							</div>
						</div>
					</div>
					<div class="col-lg-2 col-sm-6">
						<div class="circle-tile">
							<a href="#">
								<div class="circle-tile-heading purple">
									<i class="fa fa-comments fa-fw fa-3x"></i>
								</div>
							</a>
							<div class="circle-tile-content purple">
								<div class="circle-tile-description text-faded">Módulo 6
								</div>
								<div class="circle-tile-number text-faded">
									Trazas <span id="sparklineD"></span>
								</div>
								<a href="#" class="circle-tile-footer">Ver actividad <i
									class="fa fa-chevron-circle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- page-wrapper END-->
		</div>
		<!-- container-1 END-->
	</div>
	<!-- End page content -->
</div>

</t:standardPage>
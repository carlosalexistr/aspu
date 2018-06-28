<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav
	class="layout-navbar navbar navbar-expand-lg align-items-lg-center bg-white container-p-x"
	id="layout-navbar">

	<!-- Brand demo (see assets/css/demo/demo.css) -->
	<a href="/Aspu/" class="navbar-brand demo-brand d-lg-none py-0"> <span
		class="demo-brand-logo bg-primary"> <img
			src="/Aspu/assets_/img/aspu.ico">
	</span> <span class="demo-brand-name font-weight-normal ml-2">ASPU</span>
	</a>
	<div
		class="nav-item d-none d-lg-block text-big font-weight-light line-height-1 opacity-25 mr-3 ml-1">|</div>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#layout-navbar-collapse">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="navbar-collapse collapse" id="layout-navbar-collapse">
		<!-- Divider -->
		<hr class="d-lg-none w-100 my-2">

		<div class="navbar-nav align-items-lg-center">
			<a class="nav-item nav-link" href="/Aspu/noticias">Noticias</a> <a
				class="nav-item nav-link" href="/Aspu/profesores">Profesores</a> <a
				class="nav-item nav-link" href="/Aspu/nosotros">Nosostros</a> <a
				class="nav-item nav-link" href="/Aspu/contactenos">Contactenos</a>

		</div>

		<div class="navbar-nav align-items-lg-center ml-auto">
			<!-- Divider -->
			<div
				class="nav-item d-none d-lg-block text-big font-weight-light line-height-1 opacity-25 mr-3 ml-1">|</div>
			<c:set var="usuario" value="${sessionScope.usuario}" />
			<c:choose>
				<c:when test="${usuario == null}">

					<div class="navbar-nav">
						<a class="nav-link" href="/Aspu/login">  Ingresar
						</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="demo-navbar-user nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#"
							data-toggle="dropdown"> <span
							class="d-inline-flex flex-lg-row-reverse align-items-center align-middle">
								<img src="assets_/img/avatars/avatar.png" alt
								class="d-block ui-w-30 rounded-circle"> <span
								class="px-1 mr-lg-2 ml-2 ml-lg-0">${usuario}</span>
						</span>
						</a>
						<div class="dropdown-menu dropdown-menu-right">
							<a href="/Aspu/cambiarPassword" class="dropdown-item"> <i
								class="ion ion-ios-person text-lightest"></i> &nbsp;Cambiar
								Password
							</a> <a href="/Aspu/usuarios" class="dropdown-item"> <i
								class="ion ion-md-settings text-lightest"></i> &nbsp; Admin
							</a> <a href="/Aspu/logout" class="dropdown-item"> <i
								class="ion ion-ios-log-out text-danger"></i> &nbsp; Salir
							</a>

						</div>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
</nav>
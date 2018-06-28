<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en" class="default-style">


<!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
<head>
<title>Profesor | ASPU</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1">
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<link rel="icon" type="image/x-icon" href="favicon.ico">

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900"
	rel="stylesheet">

<!-- Icon fonts -->
<link rel="stylesheet" href="assets_/vendor/fonts/fontawesome.css">
<link rel="stylesheet" href="assets_/vendor/fonts/ionicons.css">
<link rel="stylesheet" href="assets_/vendor/fonts/linearicons.css">
<link rel="stylesheet" href="assets_/vendor/fonts/open-iconic.css">
<link rel="stylesheet" href="assets_/vendor/fonts/pe-icon-7-stroke.css">

<!-- Core stylesheets -->
<link rel="stylesheet" href="assets_/vendor/css/rtl/bootstrap.css"
	class="theme-settings-bootstrap-css">
<link rel="stylesheet" href="assets_/vendor/css/rtl/appwork.css"
	class="theme-settings-appwork-css">
<link rel="stylesheet" href="assets_/vendor/css/rtl/theme-corporate.css"
	class="theme-settings-theme-css">
<link rel="stylesheet" href="assets_/vendor/css/rtl/colors.css"
	class="theme-settings-colors-css">
<link rel="stylesheet" href="assets_/vendor/css/rtl/uikit.css">
<link rel="stylesheet" href="assets_/css/demo.css">
<style type="text/css">
.carousel img {
	max-height: 500px;
	margin: 0 auto;
}
</style>

<script src="assets_/vendor/js/material-ripple.js"></script>
<script src="assets_/vendor/js/layout-helpers.js"></script>

<!-- Theme settings -->
<!-- This file MUST be included after core stylesheets and layout-helpers.js in the <head> section -->
<script src="assets_/vendor/js/theme-settings.js"></script>
<script>
	window.themeSettings = new ThemeSettings({
		cssPath : 'assets_/vendor/css/rtl/',
		themesPath : 'assets_/vendor/css/rtl/'
	});
</script>

<!-- Core scripts -->
<script src="assets_/vendor/js/pace.js"></script>
<script src="assets_/vendor/js/jquery.min.js"></script>

<!-- Libs -->
<link rel="stylesheet"
	href="assets_/vendor/libs/perfect-scrollbar/perfect-scrollbar.css">
<link
	rel="assets_/vendor/libs/bootstrap-datepicker/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="assets_/vendor/libs/bootstrap-daterangepicker/bootstrap-daterangepicker.css">

</head>

<body>
	<div class="page-loader">
		<div class="bg-primary"></div>
	</div>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-1 layout-without-sidenav">
		<div class="layout-inner">

			<!-- Layout navbar -->
			<jsp:include page="layouts/header.jsp" />
			<!-- / Layout navbar -->

			<!-- Layout container -->
			<div class="layout-container">

				<!-- Layout content -->
				<div class="layout-content">

					<!-- Content -->
					<div class="container-fluid flex-grow-1 container-p-y">

						<div class="card mb-4">
							<h6 class="card-header">Datos Personales</h6>
							<div class="card-body">
								<form method="post" action="${requestScope.action_url}">
									<input name="id" type="hidden"
										value="${requestScope.profesor.id}">
									<c:choose>
										<c:when test="${ret != null && ret.estado}">
											<div
												class="alert alert-dark-info alert-dismissible fade show">
												<button type="button" class="close" data-dismiss="alert">�</button>
												${ret.valor}
											</div>
										</c:when>
										<c:when test="${ret !=null && !ret.estado}">
											<div
												class="alert alert-dark-danger alert-dismissible fade show">
												<button type="button" class="close" data-dismiss="alert">�</button>
												${ret.valor}
											</div>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label class="form-label">Nombres</label> <input
												required="required" name="nombres" type="text"
												class="form-control" placeholder="Nombres"
												value="${requestScope.profesor.nombres}">
										</div>
										<div class="form-group col-md-6">
											<label class="form-label">Apellidos</label> <input
												required="required"
												value="${requestScope.profesor.apellidos}" name="apellidos"
												type="text" class="form-control" placeholder="Apellidos">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-4">
											<label class="form-label">Especializacion</label> <input
												required="required"
												value="${requestScope.profesor.especializacion}"
												name="especializacion" type="text" class="form-control"
												placeholder="Ultimos estudios">
										</div>
										<div class="form-group col-md-4">
											<label class="form-label">Genero</label> <select
												name="genero" class="custom-select">
												<c:forEach var="item" items="${requestScope.generos}">
													<c:choose>
														<c:when test="${item == requestScope.profesor.genero}">
														  <option selected value="${item}">${item}</option>
														</c:when>														
														<c:otherwise>
														  <option value="${item}">${item}</option>
														</c:otherwise>
													</c:choose>													
												</c:forEach>
											</select>
										</div>

										<div class="col-md-4">

											<div class="form-group">
												<!-- Date input -->
												<label class="form-label" for="date">Fecha de
													Nacimiento</label> <input required="required"
													name="fecha_nacimiento" class="form-control" id="date" placeholder="dd/mm/yyyy"
													type="date" value="${requestScope.profesor.fechaNacimiento}" />
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="form-label">Email</label> <input
											required="required" name="email" type="email"
											class="form-control" placeholder="Email" value="${requestScope.profesor.email}">
									</div>

									<div class="form-group">
										<label class="form-label">Telefono</label> <input
											required="required" name="telefono" type="text"
											class="form-control" placeholder="Telefono" value="${requestScope.profesor.telefono}">
									</div>

									<button type="submit" class="btn btn-primary">guardar</button>
								</form>
							</div>
						</div>



					</div>
					<!-- / Content -->

					<!-- Layout footer -->
					<jsp:include page="layouts/footer.jsp" />
					<!-- / Layout footer -->

				</div>
				<!-- Layout content -->

			</div>
			<!-- / Layout container -->

		</div>
	</div>
	<!-- / Layout wrapper -->

	<!-- Core scripts -->
	<script src="assets_/vendor/libs/popper/popper.js"></script>
	<script src="assets_/vendor/js/bootstrap.js"></script>
	<script src="assets_/vendor/js/sidenav.js"></script>

	<!-- Libs -->
	<script
		src="assets_/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script src="assets_/vendor/libs/moment/moment.js"></script>
	<script
		src="assets_/vendor/libs/bootstrap-datepicker/bootstrap-datepicker.js"></script>

	<!-- Demo -->
	<script src="assets_/js/demo.js"></script>

</body>


<!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
</html>
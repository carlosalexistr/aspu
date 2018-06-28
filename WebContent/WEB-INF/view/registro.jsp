<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html class="default-style">

<head>
<title>Registrarse | ASPU</title>

<meta charset="utf-8">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Libs -->
<link rel="stylesheet"
	href="assets_/vendor/libs/perfect-scrollbar/perfect-scrollbar.css">
<!-- Page -->
<link rel="stylesheet"
	href="assets_/vendor/css/pages/authentication.css">
</head>

<body>
	<div class="page-loader">
		<div class="bg-primary"></div>
	</div>

	<!-- Content -->

	<div
		class="authentication-wrapper authentication-2 ui-bg-cover ui-bg-overlay-container px-4"
		style="background-image: url('/products/appwork/v100/assets_/img/bg/1.jpg');">
		<div class="ui-bg-overlay bg-dark opacity-25"></div>

		<div class="authentication-inner py-5">

			<div class="card">
				<div class="p-4 px-sm-5 pt-sm-5">
					<!-- Logo -->
					<div
						class="d-flex justify-content-center align-items-center pb-2 mb-4">
						<div class="ui-w-60">
							<div class="w-100 position-relative" style="padding-bottom: 54%">
								<img class="w-100 position-relative" src="assets_/img/aspu.ico">
							</div>
						</div>
					</div>
					<!-- / Logo -->

					<h5 class="text-center text-muted font-weight-normal mb-4">Crear
						Cuenta</h5>

					<!-- Form -->
					<form method="post" action="registro">
						<c:choose>
							<c:when test="${ret != null && ret.estado}">
							    <div class="alert alert-dark-info alert-dismissible fade show">
									<button type="button" class="close" data-dismiss="alert">×</button>
									${ret.valor}
								</div>
							</c:when>
							<c:when test="${ret !=null && !ret.estado}">
								<div class="alert alert-dark-danger alert-dismissible fade show">
									<button type="button" class="close" data-dismiss="alert">×</button>
									${ret.valor}
								</div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
						<div class="form-group">
							<label class="form-label">Nombres</label> <input
								required="required" name="nombres" type="text"
								class="form-control">
						</div>
						<div class="form-group">
							<label class="form-label">Apellidos</label> <input
								required="required" name="apellidos" type="text"
								class="form-control">
						</div>
						<div class="form-group">
							<label class="form-label">Genero</label> <select name="genero"
								class="form-control">
								<option value="masculino">Masculino</option>
								<option value="femenino">Femenino</option>
							</select>
						</div>
						<div class="form-group">
							<label class="form-label">Email</label> <input
								required="required" name="email" type="text"
								class="form-control">
						</div>
						<div class="form-group">
							<label class="form-label">Password</label> <input
								required="required" name="password" type="password"
								class="form-control">
						</div>
						<button type="submit" class="btn btn-primary btn-block mt-4">Registrarse</button>
						<div class="text-light small mt-4">
							By clicking "Sign Up", you agree to our <a
								href="javascript:void(0)">terms of service and privacy
								policy</a>. We’ll occasionally send you account related emails.
						</div>
					</form>
					<!-- / Form -->

				</div>
				<div class="card-footer py-3 px-4 px-sm-5">
					<div class="text-center text-muted">
						Ya tiene una cuenta ? <a href="login">Iniciar Sesion</a>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- / Content -->

	<!-- Core scripts -->
	<script src="assets_/vendor/libs/popper/popper.js"></script>
	<script src="assets_/vendor/js/bootstrap.js"></script>
	<script src="assets_/vendor/js/sidenav.js"></script>

	<!-- Libs -->
	<script
		src="assets_/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<!-- Demo -->
	<script src="assets_/js/demo.js"></script>

</body>

</html>
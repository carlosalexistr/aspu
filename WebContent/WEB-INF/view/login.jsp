<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html lang="en" class="default-style">

<head>
<title>Login | ASPU</title>

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
<script src="assets_/vendor/js/jquery.min.js"></script>

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

	<div class="authentication-wrapper authentication-1 px-4">
		<div class="authentication-inner py-5">

			<!-- Logo -->
			<h5 class="text-center text-muted font-weight-normal mb-4"></h5>
			<div class="d-flex justify-content-center align-items-center">
				<div class="ui-w-60">
					<div class="w-100 position-relative" style="padding-bottom: 54%">
						<img class="w-100 position-relative" src="assets_/img/aspu.ico">
					</div>
				</div>
			</div>
			<!-- / Logo -->

			<!-- Form -->
			<form class="my-5" action="login" method="post">
				<c:if test="${requestScope.mensaje_validacion != null}">
					<div class="alert alert-dark-danger alert-dismissible fade show">
						<button type="button" class="close" data-dismiss="alert">×</button>
						${requestScope.mensaje_validacion}
					</div>
				</c:if>

				<div class="form-group">
					<label class="form-label">Email</label> <input name="email"
						type="text" class="form-control">
				</div>
				<div class="form-group">
					<label
						class="form-label d-flex justify-content-between align-items-end">
						<div>Password</div> <a href="javascript:void(0)"
						class="d-block small">Forgot password?</a>
					</label> <input name="password" type="password" class="form-control">
				</div>
				<div class="d-flex justify-content-between align-items-center m-0">
					<label class="custom-control custom-checkbox m-0"> <input
						type="checkbox" class="custom-control-input"> <span
						class="custom-control-label">Recordarme</span>
					</label>
					<button type="submit" class="btn btn-primary">Entrar</button>
				</div>
			</form>
			<!-- / Form -->

			<div class="text-center text-muted">
				No tiene cuenta ? <a href="registro">Registrate</a>
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
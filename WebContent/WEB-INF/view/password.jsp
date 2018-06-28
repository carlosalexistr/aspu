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

			<div class="card card-outline-secondary">
                        <div class="card-header">
                            <h3 class="mb-0">Cambiar Password</h3>
                        </div>
                        <div class="card-body">
                            <form class="form" method="post" action="cambiarPassword" role="form" autocomplete="off">
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
                                    <label for="inputPasswordOld">Current Password</label>
                                    <input name="passwordOld" type="password" class="form-control" id="inputPasswordOld" required="">
                                </div>
                                <div class="form-group">
                                    <label for="inputPasswordNew">New Password</label>
                                    <input name="passwordNew" type="password" class="form-control" id="inputPasswordNew" required="">
                                    <span class="form-text small text-muted">
                                            The password must be 8-20 characters, and must <em>not</em> contain spaces.
                                        </span>
                                </div>
                                <div class="form-group">
                                    <label for="inputPasswordNewVerify">Verify</label>
                                    <input name="validar" type="password" class="form-control" id="inputPasswordNewVerify" required="">
                                    <span class="form-text small text-muted">
                                            To confirm, type the new password again.
                                        </span>
                                </div>
                                <div class="form-group">
                                    <a href="inicio" class="btn btn-danger btn-lg float-left">Cancelar</a>
                                    <button type="submit" class="btn btn-success btn-lg float-right">Guardar</button>
                                </div>
                            </form>
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
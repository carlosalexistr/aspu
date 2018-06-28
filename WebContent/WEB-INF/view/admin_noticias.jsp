<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en" class="default-style">

<head>
<title>Noticia | Admin Aspu</title>

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
<link rel="stylesheet" href="assets_/vendor/libs/perfect-scrollbar/perfect-scrollbar.css">

</head>

<body>
	<div class="page-loader">
		<div class="bg-primary"></div>
	</div>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-2">
		<div class="layout-inner">

			<!-- Layout sidenav -->
			<jsp:include page="layouts/menu_admin.jsp" />
			<!-- / Layout sidenav -->

			<!-- Layout container -->
			<div class="layout-container">
				<!-- Layout navbar -->
				<jsp:include page="layouts/header_admin.jsp" />
				<!-- / Layout navbar -->

				<!-- Layout content -->
				<div class="layout-content">

					<!-- Content -->
					<div class="container-fluid flex-grow-1 container-p-y">
					<h4
                                class="d-flex flex-wrap justify-content-between align-items-center pt-3 mb-4">
                                <ol class="breadcrumb font-weight-bold mb-3">
                                    <li class="breadcrumb-item"><a href="javascript:void(0)">
                                            <i class="ion ion-ios-chatbubbles"></i> ASPU
                                        </a></li>
                                    <li class="breadcrumb-item"><a href="javascript:void(0)">Noticias</a>
                                    </li>
                                </ol>

                                <div class="col-12 col-md-3 p-0 mb-3">
                                <form method="post" action="listarNoticias">
                                    <div class="row">
                                    
                                        <div class="col-2">
                                            <button type="submit"  class="btn icon-btn btn-outline-dark">
                                                <span class="fas fa-search"></span>
                                            </button>
                                        </div>
                                        <div class="col-10">
                                            <input name="palabra" type="text" class="form-control"
                                                   placeholder="Buscar noticias">
                                        </div>
                                        
                                    </div>
                                    </form>                                    
                                </div>
                            </h4>
                            <table class="table">
              <thead class="thead-dark">
                <tr>
                  <th>Titulo</th>
                  <th>Descripcion</th>
                  <th>Fecha</th>
                  <th>acciones</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="item" items="${requestScope.noticias}">
              <tr>
                  <td>${item.titulo}</td>
                  <td>${item.descripcion}</td>
                  <td>${item.fecha}</td>
                  <td><a href="actualizarNoticia?id=${item.id}"  class="btn icon-btn btn btn-outline-dark btn_estado">
                        <span class="fas fa-edit"></span>
                      </a></td>
                </tr>
                 </c:forEach>
               
              </tbody>
            </table>
                            
						
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

		<!-- Overlay -->
		<div class="layout-overlay layout-sidenav-toggle"></div>
	</div>
	<!-- / Layout wrapper -->

	<!-- Core scripts -->
	<script src="assets_/vendor/libs/popper/popper.js"></script>
	<script src="assets_/vendor/js/bootstrap.js"></script>
	<script src="assets_/vendor/js/sidenav.js"></script>

	<!-- Libs -->
	<script src="assets_/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>


	<!-- Demo -->
	<script src="assets_/js/demo.js"></script>
	

</body>

</html>
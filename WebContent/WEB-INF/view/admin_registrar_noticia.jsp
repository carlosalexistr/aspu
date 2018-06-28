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
<link rel="stylesheet"
	href="assets_/vendor/libs/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="assets_/vendor/libs/summernote/summernote.css">
<link rel="stylesheet" href="assets_/vendor/libs/toastr/toastr.css">

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
								<li class="breadcrumb-item active">Registrar Noticia</li>
							</ol>
						</h4>

						<hr class="border-light container-m--x mt-0 mb-4">
						<form method="post" id="frm_registrar" action="javascript:void(0)">
							<input name="noticiaId" value="${requestScope.noticia.id}"
								type="hidden">
							<div class="card">
								<div class="card-body media align-items-center">
									<img src="assets_/img/avatars/avatar.png"
										class="d-block ui-w-40 rounded-circle" alt="">
									<div class="media-body ml-3">
										<a href="javascript:void(0)" class="d-block text-dark"> <strong>${sessionScope.usuario}</strong>
											<span class="text-muted">@admin</span>
										</a> Created at ${requestScope.noticia.fecha}
									</div>
								</div>
								<hr class="m-0">

								<div class="card-body pb-2">


									<div class="form-group">
										<label class="form-label">Titulo</label> <input
											required="required" name="titulo" type="text"
											class="form-control"
											value="${requestScope.noticia.titulo}">
									</div>
									<div class="form-group">
										<label class="form-label">Categoria</label> <select
											name="categoria" class="form-control">
											<c:set var="idCategoria"
												value="${requestScope.noticia.categoria.id}" />
											<c:forEach var="item" items="${requestScope.categorias}">
												<c:choose>
													<c:when test="${item.id == idCategoria}">
														<option selected="selected" value="${item.id}">${ item.descripcion }</option>
													</c:when>
													<c:otherwise>
														<option value="${item.id}">${ item.descripcion }</option>
													</c:otherwise>
												</c:choose>

											</c:forEach>
										</select>
									</div>

									<div class="form-group">
										<div id="summernote">${requestScope.noticia.contenido}</div>
									</div>



								</div>
								<hr class="m-0">
								<div class="card-body pb-2">
									<h6 class="small font-weight-semibold mb-4">Meta datos</h6>


									<div class="form-group">
										<label class="form-label">Descripcion</label>
										<textarea required="required" name="descripcion"
											class="form-control" rows="3">${requestScope.noticia.descripcion}</textarea>
									</div>

									<div class="form-group">
										<label class="form-label">Palabras claves</label> <input
											required="required" name="palabras_clave" type="text"
											class="form-control"
											value="${requestScope.noticia.palabrasClave}">
									</div>
								</div>

							</div>

							<div class="text-right mt-3">
								<button id="btn_submit" type="submit" style="display: none;"></button>
								<button id="btn_guardar" type="button" class="btn btn-primary">Guardar</button>
								&nbsp;
								<a href="listarNoticias" class="btn btn-default">Cancelar</a>
							</div>
						</form>


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
	<script
		src="assets_/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script src="assets_/vendor/libs/summernote/summernote.js"></script>
	<script src="assets_/vendor/libs/toastr/toastr.js"></script>

	<!-- Demo -->
	<script src="assets_/js/demo.js"></script>
	<script type="text/javascript">
		$(function() {
			var summer = $('#summernote').summernote({
				height : 300,
				popover : {
					image : [],
					link : [],
					air : []
				}
			});

			$("#btn_guardar").click(function() {
				$("#btn_submit").trigger('click');
				var form_registrar = $('#frm_registrar');
				var estado = $(form_registrar)[0].checkValidity();
				if (estado) {
					var formData = $(form_registrar).serializeArray();
					formData.push({
						name : "contenido",
						value : summer.summernote("code")
					})
					$.ajax({
						method : "POST",
						url : '<c:out value="${requestScope.url_action}"/>',
						data : formData,
						dateType: "json"
					}).done(function(msg) {
						console.log(msg);
					    toastr.info(msg.mensaje, "Aspu");
					});
				}
			});

		});
	</script>

</body>

</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html lang="en" class="default-style">


<!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
<head>
<title>Detalles Noticia | ASPU</title>

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
<link rel="stylesheet"
	href="assets_/vendor/libs/summernote/summernote.css">

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
						<h4
							class="d-flex flex-wrap justify-content-between align-items-center pt-3 mb-4">
							<ol class="breadcrumb font-weight-bold mb-3">
								<li class="breadcrumb-item"><a href="javascript:void(0)">
										<i class="ion ion-ios-chatbubbles"></i> ASPU
								</a></li>
								<li class="breadcrumb-item"><a href="javascript:void(0)">Noticias</a>
								</li>
								<li class="breadcrumb-item active">Detalles noticia</li>
							</ol>
						</h4>
						<c:set var="usuarioP" value="${requestScope.noticia.usuario}" />
						<div class="card mb-4">
							<div class="card-header">
								<div class="media flex-wrap align-items-center">
									<img src="assets_/img/avatars/3-small.png"
										class="d-block ui-w-40 rounded-circle" alt>
									<div class="media-body ml-3">
										<a href="javascript:void(0)">${usuarioP.nombres}
											${usuarioP.apellidos}</a>
										<div class="text-muted small">${requestScope.noticia.fecha}</div>
										<div class="text-muted small">
											<c:out value="${requestScope.noticia.titulo}" />
										</div>
									</div>
									<div class="text-muted small ml-3">
										<i class="fas fa-tag  text-lighter text-large align-middle"></i>
										<span class="align-middle">${requestScope.noticia.categoria.descripcion}</span>
									</div>
								</div>
							</div>
							<div class="card-body">
								<h4 class="align-middle">${requestScope.noticia.titulo}</h4>
								<hr>
								${requestScope.noticia.contenido}
							</div>
							<div
								class="card-footer d-flex flex-wrap justify-content-between align-items-center px-0 pt-0 pb-3">
								<div class="px-4 pt-3">
									<a href="javascript:void(0)" class="text-muted"> <i
										class="fas fa-comments text-large align-middle"></i>&nbsp; <span
										class="align-middle"></span>
									</a> <span class="text-muted ml-4"> <i
										class="fas fa-info-circle  text-lighter text-large align-middle"></i>
										<span class="align-middle">${requestScope.noticia.palabrasClave}</span>
									</span>
								</div>
								<div class="px-4 pt-3">
									<button type="button" class="btn btn-primary">
										<i class="ion ion-md-create"></i>&nbsp; Modificar
									</button>
								</div>
							</div>
						</div>
						
						
						<c:set var="comentarios"
							value="${requestScope.noticia.comentarioList}" />
						<c:forEach var="item" items="${comentarios}">
							<c:set var="usuario" value="${item.usuario}" />
							<div class="card mb-3">
								<div class="card-body">
									<div class="media">
										<img src="assets_/img/avatars/avatar.png" alt
											class="d-block ui-w-40 rounded-circle">
										<div class="media-body ml-4">
											<div class="float-right text-muted small">${item.fecha}</div>
											<a href="javascript:void(0)"><c:out
													value="${usuario.nombres}" /></a>
											<div class="text-muted small">Member since 01/12/2017
												&nbsp;·&nbsp; 345 posts</div>
											<div class="mt-2">${item.contenido}</div>
											<div class="small mt-2">
												<a href="javascript:void(0)" class="text-light">Reply</a> <a
													href="javascript:void(0)" class="text-light ml-3"> <i
													class="ion ion-ios-thumbs-up"></i> 15
												</a> <a href="javascript:void(0)" class="text-light ml-3"> <i
													class="ion ion-ios-thumbs-down"></i> 3
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

                      <c:if test="${sessionScope.usuario !=null}">
						<div class="card mb-3">
							<div class="card-body">
								<div class="media">
									<img src="assets_/img/avatars/avatar.png" alt
										class="d-block ui-w-40 rounded-circle">
									<div class="media-body ml-4">

										<a href="javascript:void(0)">${sessionScope.usuario}</a>

										<div class="mt-2">
											<input type="hidden" value="${requestScope.noticia.id}"
												id="idNoticia">
											<div class="form-group">

												<div id="summernote"></div>
											</div>
										</div>
										<div class="small mt-2">

											<a id="btn_publicar" href="javascript:void(0)"
												class="btn btn-default">Publicar</a> </a>
										</div>
									</div>
								</div>
							</div>
						</div>
					  </c:if>
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
		<script src="assets_/vendor/libs/summernote/summernote.js"></script>


		<!-- Demo -->
		<script src="assets_/js/demo.js"></script>
		<c:if test="${sessionScope.usuario !=null}">
		   <script type="text/javascript">
			$(function() {
				var summer =$('#summernote').summernote({
					height : 200,
					popover : {
						image : [],
						link : [],
						air : []
					}
				});
				
				$('#btn_publicar').click(function() {
					var htmlCodificado = summer.summernote("code");
					var idN = $("#idNoticia").val(); // esto lo pasa el servidor
					$.ajax({
						method : "POST",
						url : "registrarComentario",
						dateType:"json",
						data : {
							idNoticia : idN,
							contenido : htmlCodificado
						}
					}).done(function(msg) {
						if(msg.estado){
							location.reload();
						}else{
							alert(msg.mensaje);
						}
						
					});
				});
			});
		</script>
		</c:if>
</body>


<!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
</html>
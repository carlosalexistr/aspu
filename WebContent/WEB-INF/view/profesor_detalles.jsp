<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html lang="es" class="default-style">


<!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
<head>
  <title>Profesores | ASPU</title>

  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1">
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
  <link rel="icon" type="image/x-icon" href="favicon.ico">

  <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900" rel="stylesheet">

  <!-- Icon fonts -->
  <link rel="stylesheet" href="assets_/vendor/fonts/fontawesome.css">
  <link rel="stylesheet" href="assets_/vendor/fonts/ionicons.css">
  <link rel="stylesheet" href="assets_/vendor/fonts/linearicons.css">
  <link rel="stylesheet" href="assets_/vendor/fonts/open-iconic.css">
  <link rel="stylesheet" href="assets_/vendor/fonts/pe-icon-7-stroke.css">

  <!-- Core stylesheets -->
  <link rel="stylesheet" href="assets_/vendor/css/rtl/bootstrap.css" class="theme-settings-bootstrap-css">
  <link rel="stylesheet" href="assets_/vendor/css/rtl/appwork.css" class="theme-settings-appwork-css">
  <link rel="stylesheet" href="assets_/vendor/css/rtl/theme-corporate.css" class="theme-settings-theme-css">
  <link rel="stylesheet" href="assets_/vendor/css/rtl/colors.css" class="theme-settings-colors-css">
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
      cssPath: 'assets_/vendor/css/rtl/',
      themesPath: 'assets_/vendor/css/rtl/'
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
         
                <div class="media align-items-center py-3 mb-3">
              <img src="assets_/img/avatars/avatar.png" alt="" class="d-block ui-w-100 rounded-circle">
              <div class="media-body ml-4">
                <h4 class="font-weight-bold mb-0"><c:out value="${requestScope.profesor.nombres} ${requestScope.profesor.apellidos}"/>
                  <span class="text-muted font-weight-normal"></span>
                </h4>
                <div class="text-muted mb-2">ID: <c:out value="${requestScope.profesor.id}"/> </div>
               
              </div>
            </div>

            <div class="card mb-4">
              <div class="card-body">
              <h6 class="mt-4 mb-3">Datos de registro</h6>
                <table class="table user-view-table m-0">
                  <tbody>
                    <tr>
                      <td>Registro:</td>
                      <td><c:out value="${requestScope.profesor.fechaRegistro}"/></td>
                    </tr>
                    <tr>
                      <td>Verificado:</td>
                      <td>
                        <span class="ion ion-md-checkmark text-primary"></span>&nbsp; Yes</td>
                    </tr>
                    <tr>
                      <td>Rol:</td>
                      <td>Profesor</td>
                    </tr>
                    <tr>
                      <td>Estado:</td>
                      <td>
                        <span class="badge badge-outline-success">Active</span>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <hr class="border-light m-0">
              
            </div>

            <div class="card mb-4">
              <div class="card-body">
              <h6 class="mt-4 mb-3">Datos de contacto</h6>
                <table class="table user-view-table m-0">                
                  <tbody>
                    <tr>
                      <td>Nombres:</td>
                      <td><c:out value="${requestScope.profesor.nombres}"/></td>
                    </tr>
                    <tr>
                      <td>Apellidos:</td>
                      <td><c:out value="${requestScope.profesor.apellidos}"/></td>
                    </tr>
                    <tr>
                      <td>E-mail:</td>
                      <td><c:out value="${requestScope.profesor.email}"/></td>
                    </tr>
                    <tr>
                      <td>Telefono:</td>
                      <td><c:out value="${requestScope.profesor.telefono}"/></td>
                    </tr>
                    <tr>
                      <td>Estudios:</td>
                      <td><c:out value="${requestScope.profesor.especializacion}"/></td>
                    </tr>
                  </tbody>
                </table>


      

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
  <script src="assets_/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

  <!-- Demo -->
  <script src="assets_/js/demo.js"></script>

</body>


<!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
</html>
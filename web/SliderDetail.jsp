<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Slider Details | EShopee</title>

      <link rel="apple-touch-icon" sizes="180x180"
            href="assets/img/favicon_io/apple-touch-icon.png">
      <link rel="icon" type="image/png" sizes="32x32"
            href="assets/img/favicon_io/favicon-32x32.png">
      <link rel="icon" type="image/png" sizes="16x16"
            href="assets/img/favicon_io/favicon-16x16.png">
      <link rel="manifest" href="/site.webmanifest">
      <!-- Bootstrap icons-->
      <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
      <!-- Nucleo Icons -->
      <link href="./css/nucleo-icons.css" rel="stylesheet" />
      <link href="./css/nucleo-svg.css" rel="stylesheet" />
      <!-- Font Awesome Icons -->
      <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
      <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.css" />
      <!-- Material Icons -->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
      <!-- CSS Files -->
      <link id="pagestyle" href="../assets/css/material-dashboard.css?v=3.1.0" rel="stylesheet" />
      <!-- Nepcha Analytics (nepcha.com) -->
      <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
      <script defer data-site="http://localhost:8080/QuizPracticeOnline/home" src="https://api.nepcha.com/js/nepcha-analytics.js"></script>
      <%@include file="base-view/baseTag.jsp" %>
   </head>
   <body class="g-sidenav-show  bg-gray-200">


      <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
         <!-- Navbar -->

         <!-- End Navbar -->
         <main class="container">
            <div class="row">
               <div class="col-md-12 mt-8" id="listSliderItems">
                  <div class="card">
                     <div class="card-header pb-0 p-3">
                        <div class="row">
                           <div class="col-2 d-flex align-items-center">
                              <h4 class="">Slider Detail</h4>
                           </div>
                           <div class ="row mt-5">

                              <div class="mb-3 mx-auto d-block shadow p-3 mb-5 bg-white rounded" style="padding: 10px 0px 10px 10px; border-radius: 8px; width: 32%; margin-left: 10px; width: 100% !important">
                                 <form action="slider-detail" method="POST">
                                    <a href="${requestScope.listSliderById.backlink}"><img class="mx-auto d-block img-fluid" src="images/slider/${requestScope.listSliderById.image}" /></a>
                                    <h2 class="text-center mt-4"> ${requestScope.listSliderById.title} </h2>
                                    <ul style="margin-left: 8%; font-size: 24px">
                                       <li><b>Status: </b>${requestScope.listSliderById.status == 1?"Active":"Inactive"}</li>
                                       <li><b>Notes: </b>${requestScope.listSliderById.notes}</li>
                                    </ul>
                                    <div class="text-center">
                                       <a href="edit-slider?id=${requestScope.listSliderById.id}" class="btn btn-primary"/>Edit</a>
                                    </div>
                                 </form>
                              </div><br>

                              <div class="form-row">
                                 <div class="form-group col-md-12">
                                    <a href="slider-list" class="btn btn-danger" style="float: right !important">Back</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>

                  </main>
                  </body>
                  <script src="./assets/js/core/popper.min.js"></script>
                  <script src="./assets/js/core/bootstrap.min.js"></script>
                  <script src="./assets/js/plugins/perfect-scrollbar.min.js"></script>
                  <script src="./assets/js/plugins/smooth-scrollbar.min.js"></script>
                  <script src="./assets/js/plugins/chartjs.min.js"></script>
                  <script>
                     var win = navigator.platform.indexOf('Win') > -1;
                     if (win && document.querySelector('#sidenav-scrollbar')) {
                        var options = {
                           damping: '0.5'
                        }
                        Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
                     }
                  </script>
                  <!-- Github buttons -->
                  <script async defer src="https://buttons.github.io/buttons.js"></script>
                  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
                  <script src="./assets/js/material-dashboard.min.js?v=3.1.0"></script>
                  <script src="./js/home.js"></script>
                  </html>

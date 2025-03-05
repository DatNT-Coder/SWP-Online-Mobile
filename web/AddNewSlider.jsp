<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Add Slider | EShopee</title>

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



      <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg pt-7">
         <div class="row">
            <div class="container-fluid px-4 px-lg-5 mb-5" >
               <h1>Add Slider</h1>
               <div class ="row mt-5">
                  <div class="mb-3 mx-auto d-block shadow p-3 mb-5 bg-white rounded" style="padding: 10px 0px 10px 10px; border-radius: 8px; width: 32%; margin-left: 10px; width: 100% !important">

                     <form action="add-slider" method="post" class="container row mx-auto" enctype="multipart/form-data">
                        <!--<img class="mx-auto d-block img-fluid" src="images/"/>-->


                        <div class="my-3 col-7">
                           <b>Title: <input type="text" class="form-control" id="title" name="title" placeholder="Slider Title" required></b>
                        </div>
                        <div class="mb-3 col-3 ps-5">                                
                           <br><br>
                           <b>Status: <input type="radio" name="status" value="1" class="mx-2 my-1" required/>Active
                              <input type="radio" name="status" value="0" class="mx-2 my-1" required/>Inactive</b>
                        </div>
                        <!--                            <div class="mb-3">
                                                        <b>Slider_url: <input type="text" class="form-control" id="slider_url" name="slider_url" placeholder="Slider Img_url"></b>
                                                    </div>-->
                        <div class="mb-3">
                           <b>Slider Image: <input type="file" class="custom-file-input" id="file-input" accept=".png, .jpg, .jpeg" name="image" placeholder="Slider Image" required></b>
                        </div>
                        <div class="mb-3 col-6">
                           <b>Backlink: <br><textarea name="backlink" rows="3" style="width: 100%" placeholder="Slider Content" required></textarea></b>
                        </div>

                        <div class="mb-3 col-6">                                
                           <b>Notes: <br><textarea name="notes" rows="3" style="width: 100%" placeholder="Slider Notes" required></textarea></b>
                        </div>
                        <div class="text-center mt-5">
                           <button class="btn btn-success"/>Add</button>
                        </div>
                     </form>
                  </div><br>

               </div>
               <div class="form-row">
                  <div class="form-group col-md-12">
                     <a href="${sessionScope.backlink}" class="btn btn-danger" style="float: right !important">Back</a>
                  </div>
               </div>
               </main>
            </div>
         </div>



         <%@include file="base-view/footer.jsp" %>
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
   <script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>


</html>

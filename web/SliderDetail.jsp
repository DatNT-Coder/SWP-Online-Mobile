<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Slider Details | EShopee</title>
      <link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicon_io/apple-touch-icon.png">
      <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicon_io/favicon-32x32.png">
      <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicon_io/favicon-16x16.png">
      <link rel="manifest" href="/site.webmanifest">
      <!-- Bootstrap icons-->
      <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
      <!-- Font Awesome Icons -->
      <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
      <%@include file="base-view/baseTag.jsp" %>
      <style>
         :root {
            --teal-light: #e0f2f1;
            --teal-main: #26a69a;
            --teal-dark: #00897b;
            --teal-accent: #80cbc4;
            --teal-card: #f0f9f8;
         }

         body {
            background-color: #f5f5f5;
         }

         .slider-detail-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
         }

         .slider-image {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            border: 2px solid var(--teal-accent);
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
         }

         .slider-title {
            color: var(--teal-dark);
            margin: 20px 0;
            text-align: center;
         }

         .detail-list {
            list-style: none;
            padding: 0;
            margin: 30px 0;
            font-size: 18px;
         }

         .detail-list li {
            padding: 10px 0;
            border-bottom: 1px solid var(--teal-light);
            display: flex;
         }

         .detail-list li b {
            min-width: 100px;
            color: var(--teal-dark);
         }

         .btn-primary {
            background-color: var(--teal-main);
            border-color: var(--teal-main);
            padding: 8px 20px;
            font-size: 16px;
         }

         .btn-primary:hover {
            background-color: var(--teal-dark);
            border-color: var(--teal-dark);
         }

         .btn-danger {
            padding: 8px 20px;
            font-size: 16px;
         }

         .card-header {
            background-color: var(--teal-main);
            color: white;
            border-radius: 10px 10px 0 0 !important;
         }
      </style>
   </head>

   <body class="g-sidenav-show bg-gray-200">
      <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
         <div class="container-fluid py-4">
            <div class="row">
               <div class="col-12">
                  <div class="slider-detail-card">
                     <div class="card-header pb-0 p-3">
                        <div class="d-flex justify-content-between align-items-center">
                           <h4 class="mb-0"><i class="bi bi-sliders me-2"></i>Slider Detail</h4>
                           <a href="slider-list" class="btn btn-danger">
                              <i class="bi bi-arrow-left me-1"></i> Back to List
                           </a>
                        </div>
                     </div>

                     <div class="card-body p-4">
                        <div class="text-center">
                           <a href="${requestScope.listSliderById.backlink}">
                              <img class="slider-image" src="images/slider/${requestScope.listSliderById.image}" alt="Slider Image">
                           </a>
                           <h2 class="slider-title">${requestScope.listSliderById.title}</h2>

                           <ul class="detail-list">
                              <li>
                                 <b>Status:</b> 
                                 <span class="badge ${requestScope.listSliderById.status == 1 ? 'bg-success' : 'bg-secondary'}">
                                    ${requestScope.listSliderById.status == 1 ? 'Active' : 'Inactive'}
                                 </span>
                              </li>
                              <li>
                                 <b>Notes:</b> 
                                 <span>${requestScope.listSliderById.notes}</span>
                              </li>
                           </ul>

                           <div class="text-center mt-4">
                              <a href="edit-slider?id=${requestScope.listSliderById.id}" class="btn btn-primary">
                                 <i class="bi bi-pencil-square me-1"></i> Edit Slider
                              </a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </main>

      <script src="./assets/js/core/popper.min.js"></script>
      <script src="./assets/js/core/bootstrap.min.js"></script>
      <script src="./assets/js/plugins/perfect-scrollbar.min.js"></script>
      <script src="./assets/js/plugins/smooth-scrollbar.min.js"></script>
   </body>
</html>
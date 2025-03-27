<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Edit Slider | EShopee</title>
      <link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicon_io/apple-touch-icon.png">
      <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicon_io/favicon-32x32.png">
      <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicon_io/favicon-16x16.png">
      <link rel="manifest" href="/site.webmanifest">
      <!-- Bootstrap icons-->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
      <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
      <link href="css/nucleo-icons.css" rel="stylesheet" />
      <link href="css/nucleo-svg.css" rel="stylesheet" />
      <link id="pagestyle" href="css/material-kit.css?v=3.0.0" rel="stylesheet" />
      <!-- Font Awesome -->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
      <!-- Google Fonts Roboto -->
      <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
      <%@include file="base-view/baseTag.jsp" %>
      <style>
         :root {
            --teal-light: #e0f2f1;
            --teal-main: #26a69a;
            --teal-dark: #00897b;
            --teal-accent: #80cbc4;
            --teal-card: #f0f9f8;
         }

         .slider-form-container {
            background-color: var(--teal-card);
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
         }

         .form-header {
            color: var(--teal-dark);
            margin-bottom: 25px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--teal-accent);
         }

         .form-label {
            color: var(--teal-dark);
            font-weight: 500;
            margin-bottom: 5px;
         }

         .form-control, .form-select, textarea {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 10px;
         }

         .form-control:focus, .form-select:focus, textarea:focus {
            border-color: var(--teal-accent);
            box-shadow: 0 0 0 0.25rem rgba(38, 166, 154, 0.25);
         }

         .btn-success {
            background-color: var(--teal-main);
            border-color: var(--teal-main);
         }

         .btn-success:hover {
            background-color: var(--teal-dark);
            border-color: var(--teal-dark);
         }

         .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
         }

         .btn-danger:hover {
            background-color: #bb2d3b;
            border-color: #bb2d3b;
         }

         .slider-image {
            max-width: 300px;
            height: auto;
            border: 2px solid var(--teal-accent);
            border-radius: 8px;
            margin-bottom: 15px;
         }

         .radio-group {
            display: flex;
            gap: 15px;
            align-items: center;
         }

         .radio-group label {
            margin-bottom: 0;
            display: flex;
            align-items: center;
            gap: 5px;
         }

         textarea {
            width: 100%;
            min-height: 100px;
            resize: vertical;
         }
      </style>
   </head>
   <body>
      <main class="container pt-4">
         <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="form-header"><i class="bi bi-sliders me-2"></i>Edit Slider</h1>
            <a href="${sessionScope.backlink}" class="btn btn-danger">
               <i class="bi bi-arrow-left me-1"></i> Back
            </a>
         </div>

         <div class="slider-form-container">
            <form action="edit-slider" enctype="multipart/form-data" method="post">
               <div class="row">
                  <div class="col-md-4 text-center">
                     <img src="images/slider/${requestScope.slider.image}" class="slider-image" alt="Slider Image">
                     <div class="mb-3">
                        <label class="form-label">Slider Image</label>
                        <input type="file" class="form-control" name="image" accept="image/*">
                     </div>
                  </div>

                  <div class="col-md-8">
                     <div class="row mb-3">
                        <div class="col-md-2">
                           <label class="form-label">Slider ID</label>
                           <input type="text" class="form-control" name="sliderId" value="${requestScope.slider.id}" readonly>
                        </div>
                        <div class="col-md-3">
                           <label class="form-label">Owner ID</label>
                           <input type="text" class="form-control" name="subId" value="${requestScope.slider.marketingId}">
                        </div>
                        <div class="col-md-7">
                           <label class="form-label">Title</label>
                           <input type="text" class="form-control" name="title" value="${requestScope.slider.title}">
                        </div>
                     </div>

                     <div class="mb-3">
                        <label class="form-label">Status</label>
                        <div class="radio-group">
                           <label>
                              <input type="radio" name="status" value="1" ${requestScope.slider.status == 1?"checked":""}>
                              Active
                           </label>
                           <label>
                              <input type="radio" name="status" value="0" ${requestScope.slider.status == 0?"checked":""}>
                              Inactive
                           </label>
                        </div>
                     </div>

                     <div class="row mb-3">
                        <div class="col-md-6">
                           <label class="form-label">Backlink</label>
                           <textarea name="backlink" placeholder="Slider Content">${requestScope.slider.backlink}</textarea>
                        </div>
                        <div class="col-md-6">
                           <label class="form-label">Notes</label>
                           <textarea name="notes" placeholder="Slider Notes">${requestScope.slider.notes}</textarea>
                        </div>
                     </div>

                     <div class="text-center mt-4">
                        <button type="submit" class="btn btn-success px-4">
                           <i class="bi bi-save me-1"></i> Save Changes
                        </button>
                     </div>
                  </div>
               </div>
            </form>
         </div>
      </main>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
   </body>
</html>
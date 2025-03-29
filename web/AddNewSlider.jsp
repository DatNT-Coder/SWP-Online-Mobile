<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Add Slider | EShopee</title>
      <!-- Bootstrap Icons -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
      <!-- Google Fonts -->
      <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
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
            font-family: 'Roboto', sans-serif;
         }

         .slider-form-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
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
            margin-bottom: 8px;
            display: block;
         }

         .form-control, .form-select, textarea {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 10px;
            width: 100%;
         }

         .form-control:focus, .form-select:focus, textarea:focus {
            border-color: var(--teal-accent);
            box-shadow: 0 0 0 0.25rem rgba(38, 166, 154, 0.25);
         }

         .btn-success {
            background-color: var(--teal-main);
            border-color: var(--teal-main);
            padding: 8px 20px;
         }

         .btn-success:hover {
            background-color: var(--teal-dark);
            border-color: var(--teal-dark);
         }

         .btn-danger {
            padding: 8px 20px;
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
            min-height: 100px;
            resize: vertical;
         }

         .custom-file-input {
            display: block;
            width: 100%;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
         }

         .required-field::after {
            content: " *";
            color: #dc3545;
         }
      </style>
   </head>
   <body class="g-sidenav-show bg-gray-200">
      <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg pt-7">
         <div class="container-fluid px-4 px-lg-5 mb-5">
            <div class="d-flex justify-content-between align-items-center mb-4">
               <h1 class="form-header"><i class="bi bi-plus-circle me-2"></i>Add New Slider</h1>
               <a href="${sessionScope.backlink}" class="btn btn-danger">
                  <i class="bi bi-arrow-left me-1"></i> Back
               </a>
            </div>

            <div class="slider-form-container">
               <form action="add-slider" method="post" enctype="multipart/form-data">
                  <div class="row">
                     <div class="col-md-8">
                        <div class="mb-4">
                           <label for="title" class="form-label required-field">Title</label>
                           <input type="text" class="form-control" id="title" name="title" placeholder="Slider Title" required>
                        </div>

                        <div class="mb-4">
                           <label class="form-label required-field">Status</label>
                           <div class="radio-group">
                              <label>
                                 <input type="radio" name="status" value="1" required> 
                                 Active
                              </label>
                              <label>
                                 <input type="radio" name="status" value="0" required>
                                 Inactive
                              </label>
                           </div>
                        </div>

                        <div class="mb-4">
                           <label for="backlink" class="form-label required-field">Backlink</label>
                           <textarea name="backlink" rows="3" placeholder="Slider Content" required></textarea>
                        </div>
                     </div>

                     <div class="col-md-4">
                        <div class="mb-4">
                           <label for="file-input" class="form-label required-field">Slider Image</label>
                           <input type="file" class="custom-file-input" id="file-input" accept=".png, .jpg, .jpeg" name="image" required>
                           <small class="form-text text-muted">Accepted formats: .png, .jpg, .jpeg</small>
                        </div>

                        <div class="mb-4">
                           <label for="notes" class="form-label">Notes</label>
                           <textarea name="notes" rows="3" placeholder="Slider Notes" required></textarea>
                        </div>
                     </div>
                  </div>

                  <div class="d-flex justify-content-end mt-4">
                     <button type="submit" class="btn btn-success">
                        <i class="bi bi-plus-circle me-1"></i> Add Slider
                     </button>
                  </div>
               </form>
            </div>
         </div>
      </main>

      <script src="./assets/js/core/popper.min.js"></script>
      <script src="./assets/js/core/bootstrap.min.js"></script>
      <script src="./assets/js/plugins/perfect-scrollbar.min.js"></script>
      <script src="./assets/js/plugins/smooth-scrollbar.min.js"></script>
      <script>
         var win = navigator.platform.indexOf('Win') > -1;
         if (win && document.querySelector('#sidenav-scrollbar')) {
            var options = {
               damping: '0.5'
            }
            Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
         }
      </script>
   </body>
</html>
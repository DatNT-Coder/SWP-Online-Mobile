<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Slider List | E-Shopee</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
      <style>
         :root {
            --teal-primary: #26a69a;
            --teal-light: #80cbc4;
            --teal-dark: #00897b;
            --teal-bg: #e0f2f1;
            --teal-text: #004d40;
            --teal-card: #ffffff;
            --teal-accent: #b2dfdb;
         }

         body {
            background-color: var(--teal-bg);
            color: var(--teal-text);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
         }

         .container-fluid {
            padding-left: 0;
            padding-right: 0;
         }

         .row {
            display: flex;
            margin-left: 0;
            margin-right: 0;
         }

         /* Main content styles */
         .col-lg-10.main-content {
            flex-grow: 1;
            padding: 20px;
            background-color: var(--teal-bg);
         }

         /* Header styles */
         h2 {
            color: var(--teal-dark);
            font-weight: 600;
            margin: 20px 0;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--teal-light);
         }

         /* Button styles */
         .add-slider-btn,
         .reset-btn,
         .search-button,
         .btn-primary,
         .btn-secondary {
            background-color: var(--teal-primary);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
         }

         .add-slider-btn:hover,
         .reset-btn:hover,
         .search-button:hover,
         .btn-primary:hover {
            background-color: var(--teal-dark);
         }

         .btn-danger {
            background-color: #dc3545;
         }

         .btn-danger:hover {
            background-color: #bb2d3b;
         }

         .btn-success {
            background-color: #198754;
         }

         .btn-success:hover {
            background-color: #157347;
         }

         .btn-secondary {
            background-color: #6c757d;
         }

         .btn-secondary:hover {
            background-color: #5c636a;
         }

         .btn-sm {
            padding: 5px 10px;
            font-size: 0.875rem;
            margin-right: 5px;
         }

         /* Card styles */
         .card {
            background-color: var(--teal-card);
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border: 1px solid var(--teal-accent);
            margin-bottom: 20px;
         }

         .card-body {
            padding: 20px;
         }

         /* Form styles */
         .search-filter-section {
            background-color: var(--teal-card);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border: 1px solid var(--teal-accent);
            margin-bottom: 20px;
         }

         .filter-header {
            display: flex;
            margin-bottom: 10px;
         }

         .filter-title, .search-title {
            color: var(--teal-dark);
            font-size: 1.1rem;
            margin: 0 0 10px 0;
            display: flex;
            align-items: center;
         }

         .filter-title {
            flex: 2;
         }

         .search-title {
            flex: 1;
         }

         .filter-title::before {
            content: "🗂️";
            margin-right: 10px;
         }

         .search-title::before {
            content: "🔍";
            margin-right: 10px;
         }

         .product-filter-form .filter-search-container {
            display: flex;
            gap: 20px;
         }

         .filter-section {
            display: flex;
            gap: 15px;
            flex: 2;
         }

         .search-section {
            flex: 1;
         }

         .search-input-group {
            display: flex;
            gap: 10px;
         }

         .filter-group {
            flex: 1;
         }

         .search-input-group .form-control {
            flex: 1;
         }

         /* Table styles */
         .table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 0;
         }

         .table thead th {
            background-color: var(--teal-primary);
            color: white;
            padding: 12px 15px;
            font-weight: 500;
         }

         .table tbody tr:nth-child(even) {
            background-color: var(--teal-bg);
         }

         .table tbody tr:hover {
            background-color: var(--teal-accent);
         }

         .table td {
            padding: 12px 15px;
            vertical-align: middle;
            border-bottom: 1px solid var(--teal-light);
         }

         /* Image styles */
         .slider-image {
            max-width: 150px;
            max-height: 80px;
            border-radius: 4px;
         }

         /* Status badges */
         .badge-active {
            background-color: #4CAF50;
            color: white;
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 0.8rem;
         }

         .badge-inactive {
            background-color: #F44336;
            color: white;
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 0.8rem;
         }

         /* Pagination styles */
         .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            list-style: none;
            padding: 0;
         }

         .pagination .page-item {
            margin: 0 4px;
         }

         .pagination .page-link {
            color: var(--teal-dark);
            text-decoration: none;
            padding: 8px 14px;
            border-radius: 4px;
            border: 1px solid var(--teal-light);
            transition: all 0.3s ease;
            background-color: white;
         }

         .pagination .page-item.active .page-link {
            background-color: var(--teal-primary);
            color: white;
            border-color: var(--teal-primary);
         }

         .pagination .page-link:hover:not(.active) {
            background-color: var(--teal-light);
            color: var(--teal-text);
         }

         /* Modal styles */
         .modal-content {
            border-radius: 8px;
            border: 1px solid var(--teal-accent);
         }

         .modal-header {
            background-color: var(--teal-primary);
            color: white;
            border-bottom: 1px solid var(--teal-light);
         }

         .required-field::after {
            content: " *";
            color: #dc3545;
         }

         /* Responsive adjustments */
         @media (max-width: 768px) {
            .row {
               flex-direction: column;
            }

            .col-md-2 {
               width: 100%;
               height: auto;
               position: relative;
            }

            .d-flex.col-md-4 {
               flex-direction: column;
            }

            .reset-btn {
               margin-bottom: 10px;
            }

            .table-responsive {
               overflow-x: auto;
               -webkit-overflow-scrolling: touch;
            }

            .pagination .page-link {
               padding: 6px 10px;
               min-width: 32px;
            }

            .pagination .page-item {
               margin: 0 2px;
            }
         }
      </style>
   </head>
   <body>
      <div class="container-fluid">
         <div class="row">
            <!-- Sidebar -->
            <div class="col-md-2">
               <jsp:include page="sidebar.jsp"></jsp:include>
               </div>
               <!-- Main Content -->
               <div class="col-lg-10 main-content">
                  <div class="container-fluid py-4">
                     <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2>Slider List</h2>
                        <button class="add-slider-btn" data-bs-toggle="modal" data-bs-target="#addSliderModal">
                           Add New Slider
                        </button>
                     </div>

                     <!-- Filters and Search -->
                     <div class="search-filter-section">
                        <div class="row">
                           <div class="col-md-12">
                              <form action="search-slider" method="get" class="form-group product-filter-form">
                              <div class="filter-header">
                                 <h3 class="filter-title">Filter Sliders</h3>
                                 <h3 class="search-title">Search Sliders</h3>
                              </div>

                              <div class="filter-search-container">
                                 <div class="filter-section">
                                    <div class="filter-group">
                                       <select class="form-control" name="status" onchange="this.form.submit()">
                                          <option value="1" <%= (request.getAttribute("status") != null && (int) request.getAttribute("status") == 1) ? "selected" : "" %>>Active</option>
                                          <option value="0" <%= (request.getAttribute("status") != null && (int) request.getAttribute("status") == 0) ? "selected" : "" %>>Inactive</option>
                                       </select>
                                    </div>
                                 </div>

                                 <div class="search-section">
                                    <div class="search-input-group">
                                       <input type="text" name="keyword" placeholder="Search by title..." 
                                              value="<c:out value='${param.keyword}'/>" class="form-control">
                                       <button type="submit" class="btn btn-primary">
                                          Search
                                       </button>
                                       <button type="button" onclick="window.location.href = '/ProjectSWP391/slider-list'" 
                                               class="btn btn-secondary">
                                          Reset
                                       </button>
                                    </div>
                                 </div>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>

                  <!-- Sliders Table -->
                  <div class="card">
                     <div class="card-body">
                        <div class="table-responsive">
                           <table class="table table-hover">
                              <thead>
                                 <tr>
                                    <th>ID</th>
                                    <th>Image</th>
                                    <th>Title</th>
                                    <th>Link</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <c:forEach var="sl" items="${sessionScope.listSlidersByPagging}">
                                    <tr>
                                       <td>${sl.id}</td>
                                       <td>
                                          <img src="images/slider/${sl.image}" class="slider-image" alt="Slider Image">
                                       </td>
                                       <td>${sl.title}</td>
                                       <td>
                                          <a href="${sl.backlink}" target="_blank">${sl.notes}</a>
                                       </td>
                                       <td class="${sl.status == 1 ? 'text-success' : 'text-danger'}">
                                          ${sl.status == 1 ? "<span class='badge badge-active'>Active</span>" : "<span class='badge badge-inactive'>Inactive</span>"}
                                       </td>
                                       <td>
                                          <c:choose>
                                             <c:when test="${sl.status == 1}">
                                                <a href="hide-slider?id=${sl.id}" class="btn btn-danger btn-sm">Hide</a>
                                             </c:when>
                                             <c:otherwise>
                                                <a href="show-slider?id=${sl.id}" class="btn btn-success btn-sm">Show</a>
                                             </c:otherwise>
                                          </c:choose>
                                          <a href="edit-slider?id=${sl.id}" class="btn btn-primary btn-sm">Edit</a>
                                          <a href="slider-detail?id=${sl.id}" class="btn btn-secondary btn-sm">View</a>
                                       </td>
                                    </tr>
                                 </c:forEach>
                              </tbody>
                           </table>
                        </div>

                        <!-- Pagination -->
                        <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                           <ul class="pagination">
                              <c:if test="${page > 1}">
                                 <li class="page-item">
                                    <a class="page-link" href="slider-list?page=${page - 1}"><</a>
                                 </li>
                              </c:if>

                              <c:forEach begin="1" end="${totalPage}" var="i">
                                 <li class="page-item ${i == page ? 'active' : ''}">
                                    <a class="page-link" href="slider-list?page=${i}">${i}</a>
                                 </li>
                              </c:forEach>

                              <c:if test="${page < totalPage}">
                                 <li class="page-item">
                                    <a class="page-link" href="slider-list?page=${page + 1}">></a>
                                 </li>
                              </c:if>
                           </ul>
                        </nav>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <!-- Add Slider Modal -->
      <div class="modal fade" id="addSliderModal" tabindex="-1" aria-labelledby="addSliderModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <form action="add-slider" method="post" enctype="multipart/form-data">
                  <div class="modal-header">
                     <h5 class="modal-title" id="addSliderModalLabel">Add New Slider</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                     <div class="row">
                        <div class="col-md-8">
                           <div class="mb-3">
                              <label for="title" class="form-label required-field">Title</label>
                              <input type="text" class="form-control" id="title" name="title" required>
                           </div>

                           <div class="mb-3">
                              <label class="form-label required-field">Status</label>
                              <div class="d-flex gap-3">
                                 <div class="form-check">
                                    <input class="form-check-input" type="radio" name="status" id="active" value="1" checked>
                                    <label class="form-check-label" for="active">
                                       Active
                                    </label>
                                 </div>
                                 <div class="form-check">
                                    <input class="form-check-input" type="radio" name="status" id="inactive" value="0">
                                    <label class="form-check-label" for="inactive">
                                       Inactive
                                    </label>
                                 </div>
                              </div>
                           </div>

                           <div class="mb-3">
                              <label for="backlink" class="form-label required-field">Backlink</label>
                              <input type="text" class="form-control" id="backlink" name="backlink" required>
                           </div>
                        </div>

                        <div class="col-md-4">
                           <div class="mb-3">
                              <label for="image" class="form-label required-field">Slider Image</label>
                              <input type="file" class="form-control" id="image" name="image" accept="image/*" required>
                           </div>

                           <div class="mb-3">
                              <label for="notes" class="form-label">Notes</label>
                              <textarea class="form-control" id="notes" name="notes" rows="3"></textarea>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                     <button type="submit" class="btn btn-primary">Save Slider</button>
                  </div>
               </form>
            </div>
         </div>
      </div>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   </body>
</html>
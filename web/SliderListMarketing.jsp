<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>Slider List | E-Shopee</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
   </head>
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

      /* Sidebar styles */
      .col-md-2 {
         width: 250px;
         min-width: 250px;
         background-color: white;
         box-shadow: 2px 0 5px rgba(0,0,0,0.1);
         z-index: 100;
         height: 100vh;
         position: sticky;
         top: 0;
         overflow-y: auto;
         border-right: 1px solid var(--teal-light);
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

      /* Button styles */
      .add-slider-btn,
      .reset-btn,
      .search-button {
         background-color: var(--teal-primary);
         color: white;
         border: none;
         padding: 8px 16px;
         border-radius: 4px;
         transition: all 0.3s;
         cursor: pointer;
      }

      .add-slider-btn:hover,
      .reset-btn:hover,
      .search-button:hover {
         background-color: var(--teal-dark);
         transform: translateY(-1px);
      }

      .reset-btn {
         margin-right: 10px;
      }

      .search-filter-section {
         background-color: var(--teal-card);
         padding: 20px;
         border-radius: 8px;
         box-shadow: 0 2px 4px rgba(0,0,0,0.1);
         border: 1px solid var(--teal-accent);
         margin-bottom: 20px;
      }

      .filter-search-container {
         display: flex;
         gap: 20px;
         align-items: flex-end;
      }

      .filter-section, .search-section {
         flex: 1;
      }

      .search-filter-section h3 {
         color: var(--teal-dark);
         font-size: 1.1rem;
         margin-bottom: 10px;
         display: flex;
         align-items: center;
      }

      .filter-section h3::before {
         content: "🗂️";
         margin-right: 10px;
      }

      .search-section h3::before {
         content: "🔍";
         margin-right: 10px;
      }

      .search-input-group {
         display: flex;
         gap: 10px;
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

      /* Action buttons */
      .btn-sm {
         padding: 5px 10px;
         font-size: 0.875rem;
         margin-right: 5px;
      }

      /* Pagination styles */
      .pagination {
         display: flex;
         justify-content: center;
         margin-top: 20px;
      }

      .page-item {
         margin: 0 4px;
      }

      .page-link {
         color: var(--teal-dark);
         text-decoration: none;
         padding: 8px 14px;
         border-radius: 4px;
         border: 1px solid var(--teal-light);
         transition: all 0.3s ease;
      }

      .page-link:hover {
         background-color: var(--teal-light);
         color: var(--teal-text);
      }

      .page-item.active .page-link {
         background-color: var(--teal-primary);
         color: white;
         border-color: var(--teal-primary);
      }

      /* Pagination Styles - Teal Theme */
      .pagination {
         display: flex;
         justify-content: center;
         margin-top: 25px;
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
         display: inline-block;
         min-width: 40px;
         text-align: center;
         background-color: white;
      }

      .pagination .page-item.active .page-link {
         background-color: var(--teal-primary);
         color: white;
         border-color: var(--teal-primary);
         font-weight: 500;
      }

      .pagination .page-link:hover:not(.active) {
         background-color: var(--teal-light);
         color: var(--teal-text);
      }

      .pagination .page-item.disabled .page-link {
         color: #ccc;
         pointer-events: none;
         border-color: #eee;
         background-color: #f9f9f9;
      }

      /* Arrow styles */
      .pagination .page-item:first-child .page-link,
      .pagination .page-item:last-child .page-link {
         font-weight: bold;
         padding: 8px 12px;
      }

      .sidebar h2 {
         color: #26A69A;
         font-size: 1.2rem;
         text-transform: uppercase;
         letter-spacing: 1px;
         padding: 0 20px 15px;
         margin-bottom: 10px;
         border-bottom: 2px solid var(--teal-lighter);
      }

      h2 {
         color: var(--teal-dark);
         margin: 20px 0;
         font-weight: 600;
         text-align: center;
         padding-bottom: 10px;
         border-bottom: 2px solid #80cbc4;
      }

      user agent stylesheet
      h2 {
         display: block;
         font-size: 1.5em;
         margin-block-start: 0.83em;
         margin-block-end: 0.83em;
         margin-inline-start: 0px;
         margin-inline-end: 0px;
         font-weight: bold;
         unicode-bidi: isolate;
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
            margin-right: 0;
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
                        <div class="d-flex justify-content-between align-items-center mb-3">
                           <button class="add-slider-btn" onclick="location.href = 'add-slider';">
                              &nbsp;&nbsp;Add New Slider
                           </button>
                        </div>
                     </div>
                     <!-- Filters and Search -->
                     <div class="search-filter-section">
                        <div class="row">
                           <div class="col-md-8">
                              <form action="search-slider" method="get" class="form-group">
                                 <div class="filter-search-container">
                                    <div class="filter-section">
                                       <h3>Filter Sliders:</h3>
                                       <select class="form-control" name="status" onchange="this.form.submit()">
                                          <option value="1" <%= (request.getAttribute("status") != null && (int) request.getAttribute("status") == 1) ? "selected" : "" %>>Active</option>
                                       <option value="0" <%= (request.getAttribute("status") != null && (int) request.getAttribute("status") == 0) ? "selected" : "" %>>Inactive</option>
                                    </select>
                                 </div>
                                 <div class="search-section">
                                    <h3>Search Sliders:</h3>
                                    <div class="search-input-group">
                                       <input type="text" name="keyword" placeholder="Search by title..." 
                                              value="<c:out value='${param.keyword}'/>" class="form-control">
                                       <button type="submit" class="btn btn-primary">Search</button>
                                       <button type="button" onclick="window.location.href = '/ProjectSWP391/slider-list'" class="btn btn-secondary">
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
                           <table id="sliderTable" class="table table-hover">
                              <thead>
                                 <tr>
                                    <th class="col-id">ID</th>
                                    <th class="col-image">Ảnh</th>
                                    <th class="col-title">Tiêu đề</th>
                                    <th class="col-backlink">Link</th>
                                    <th class="col-status">Trạng Thái</th>
                                    <th class="col-actions">Tác vụ</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <c:forEach var="sl" items="${sessionScope.listSlidersByPagging}">
                                    <tr>
                                       <td class="col-id">${sl.id}</td>
                                       <td class="col-image">
                                          <img src="images/slider/${sl.image}" class="slider-image" alt="Slider Image">
                                       </td>
                                       <td class="col-title">${sl.title}</td>
                                       <td class="col-backlink">
                                          <a href="${sl.backlink}" target="_blank">${sl.notes}</a>
                                       </td>
                                       <td class="col-status ${sl.status == 1 ? 'text-success' : 'text-danger'}">
                                          ${sl.status == 1 ? "<span class='badge badge-active'>Active</span>" : "<span class='badge badge-inactive'>Inactive</span>"}
                                       </td>
                                       <td class="col-actions">
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

                        <div class="d-flex justify-content-center mt-3">
                           <nav>
                              <ul class="pagination">
                                 <c:if test="${page > 1}">
                                    <li class="page-item">
                                       <a class="page-link pagination-btn" href="slider-list?page=${page - 1}"><</a>
                                    </li>
                                 </c:if>

                                 <c:forEach begin="1" end="${totalPage}" var="i">
                                    <li class="page-item">
                                       <a href="${pagination_url}page=${i}" 
                                          class="page-link pagination-btn <c:if test='${page == i}'>active</c:if>">
                                          ${i}
                                       </a>
                                    </li>
                                 </c:forEach>

                                 <c:if test="${page < totalPage}">
                                    <li class="page-item">
                                       <a class="page-link pagination-btn" href="slider-list?page=${page + 1}">></a>
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
      </div>

      <!-- jQuery and DataTables JS -->
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
      <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
      <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
      <script>
                        $('#sliderTable').DataTable({
                           "paging": false,
                           "searching": true,
                           "ordering": true,
                           "info": false,
                           "columnDefs": [
                              {"orderable": false, "targets": [1, 5]}
                           ],
                           "dom": 't' // This removes DataTables' default styling (search bar, pagination, etc.)
                        });
      </script>

   </body>
</html>

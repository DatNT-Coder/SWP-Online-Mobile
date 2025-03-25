<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Slider List | E-Shopee</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<!--      <link rel="stylesheet" href="css/styles.css">
      <link rel="stylesheet" href="css/datatable.css">-->
   </head>
   <style>
      :root {
         --teal-primary: #26a69a;
         --teal-light: #80cbc4;
         --teal-dark: #00897b;
         --teal-bg: #e0f2f1;
         --teal-text: #004d40;
         --teal-card: #ffffff;
      }

      body {
         background-color: #f5f7fa;
         color: var(--teal-text);
         font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      }

      .main-content {
         padding: 20px;
         background-color: #f5f7fa;
      }

      h2 {
         color: var(--teal-dark);
         font-weight: 600;
         margin: 0;
      }

      /* Buttons */
      .add-slider-btn {
         background-color: var(--teal-primary);
         color: white;
         border: none;
         padding: 10px 20px;
         border-radius: 4px;
         font-weight: 500;
         cursor: pointer;
         transition: all 0.3s ease;
         display: flex;
         align-items: center;
      }

      .add-slider-btn:hover {
         background-color: var(--teal-dark);
         transform: translateY(-2px);
         box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      .search-button {
         background-color: var(--teal-primary);
         color: white;
         border: none;
         padding: 8px 16px;
         border-radius: 0 4px 4px 0;
         cursor: pointer;
         transition: background-color 0.3s;
      }

      .search-button:hover {
         background-color: var(--teal-dark);
      }

      .reset-btn {
         background-color: #f5f5f5;
         color: var(--teal-text);
         border: 1px solid #ddd;
         padding: 8px 16px;
         border-radius: 4px;
         margin-right: 10px;
         cursor: pointer;
         transition: all 0.3s;
      }

      .reset-btn:hover {
         background-color: #e0e0e0;
         border-color: #ccc;
      }

      /* Form Elements */
      .search-input {
         padding: 8px 12px;
         border: 1px solid #ddd;
         border-radius: 4px 0 0 4px;
         width: 100%;
         outline: none;
      }

      .search-input:focus {
         border-color: var(--teal-light);
         box-shadow: 0 0 0 2px rgba(38, 166, 154, 0.2);
      }

      .form-select {
         padding: 8px 12px;
         border: 1px solid #ddd;
         border-radius: 4px;
         color: var(--teal-text);
      }

      .form-select:focus {
         border-color: var(--teal-light);
         box-shadow: 0 0 0 2px rgba(38, 166, 154, 0.2);
      }

      /* Cards */
      .card {
         border: none;
         border-radius: 8px;
         box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
         margin-bottom: 20px;
         background-color: var(--teal-card);
      }

      .card-body {
         padding: 20px;
      }

      /* Table Styling */
      .table {
         width: 100%;
         border-collapse: separate;
         border-spacing: 0;
         background-color: white;
      }

      .table thead th {
         background-color: var(--teal-primary);
         color: white;
         padding: 12px 15px;
         border: none;
         font-weight: 500;
      }

      .table tbody tr {
         transition: background-color 0.2s;
      }

      .table tbody tr:hover {
         background-color: rgba(38, 166, 154, 0.1);
      }

      .table td {
         padding: 12px 15px;
         vertical-align: middle;
         border-bottom: 1px solid #f0f0f0;
      }

      /* Image Styling */
      .slider-image {
         width: 150px;
         height: auto;
         border-radius: 4px;
         object-fit: cover;
      }

      /* Status Badges */
      .badge-active {
         background-color: #c8e6c9;
         color: #388e3c;
         padding: 4px 8px;
         border-radius: 12px;
         font-size: 0.8rem;
      }

      .badge-inactive {
         background-color: #ffcdd2;
         color: #d32f2f;
         padding: 4px 8px;
         border-radius: 12px;
         font-size: 0.8rem;
      }

      /* Action Buttons */
      .btn-sm {
         padding: 5px 10px;
         font-size: 0.8rem;
         margin-right: 5px;
      }

      .btn-primary {
         background-color: var(--teal-primary);
         border-color: var(--teal-primary);
      }

      .btn-primary:hover {
         background-color: var(--teal-dark);
         border-color: var(--teal-dark);
      }

      /* Pagination */
      .pagination {
         margin: 0;
      }

      .page-link {
         color: var(--teal-primary);
         border: 1px solid #ddd;
      }

      .page-link:hover {
         color: var(--teal-dark);
         background-color: #f5f5f5;
         border-color: #ddd;
      }

      .page-item.active .page-link {
         background-color: var(--teal-primary);
         border-color: var(--teal-primary);
         color: white;
      }

      /* Responsive Adjustments */
      @media (max-width: 768px) {
         .main-content {
            padding: 15px;
         }

         .slider-image {
            width: 100px;
         }

         .col-actions {
            white-space: nowrap;
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
                     <div class="card mb-4">
                        <div class="card-body">
                           <div class="row g-3">
                              <form action="search-slider" method="get" class="d-flex col-md-4" style="width: 100%; float: right !important">
                                 <button type="button" onclick="window.location.href = '/ProjectSWP391/slider-list'" class="reset-btn">
                                    Reset Filter and Search
                                 </button>
                                 <div class="col-md-4">
                                    <select class="form-select input-group-outline" name="status" onchange="this.form.submit()">
                                       <option value="1" <%= (request.getAttribute("status") != null && (int) request.getAttribute("status") == 1) ? "selected" : "" %>>Active</option>
                                    <option value="0" <%= (request.getAttribute("status") != null && (int) request.getAttribute("status") == 0) ? "selected" : "" %>>Inactive</option>
                                 </select>
                              </div>
                              <div class="d-flex col-md-4">
                                 <input type="text" name="keyword" placeholder="Search by title..." 
                                        value="<c:out value='${param.keyword}'/>" class="search-input">
                                 <button type="submit" class="search-button">Search</button>
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
                                    <th class="col-image">Image</th>
                                    <th class="col-title">Title</th>
                                    <th class="col-backlink">Back link</th>
                                    <th class="col-status">Status</th>
                                    <th class="col-actions">Actions</th>
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

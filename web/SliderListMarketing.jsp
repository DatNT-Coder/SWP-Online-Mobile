<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Slider List | E-Shopee</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="css/styles.css">
      <link rel="stylesheet" href="css/datatable.css">
   </head>
   <style>
      .card-body {
         flex: 1 1 auto;
         padding: 20px;
         color: var(--bs-card-color);
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
                                 <input type="text" name="keyword" placeholder="Search by title..." value="${keyword}" class="search-input">
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

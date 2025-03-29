<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Customer List | E-Shopee</title>
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
         .add-customer-btn,
         .btn-primary,
         .btn-secondary,
         .btn-info,
         .btn-warning {
            background-color: var(--teal-primary);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
         }

         .add-customer-btn:hover,
         .btn-primary:hover {
            background-color: var(--teal-dark);
         }

         .btn-secondary {
            background-color: #6c757d;
         }

         .btn-secondary:hover {
            background-color: #5c636a;
         }

         .btn-info {
            background-color: #0dcaf0;
         }

         .btn-info:hover {
            background-color: #0aa2c0;
         }

         .btn-warning {
            background-color: #ffc107;
            color: #212529;
         }

         .btn-warning:hover {
            background-color: #e0a800;
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

         .customer-filter-form .filter-search-container {
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

         /* Status indicators */
         .status-active {
            color: #4CAF50;
            font-weight: 500;
         }

         .status-inactive {
            color: #F44336;
            font-weight: 500;
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

         /* Error message */
         .text-danger {
            color: #dc3545;
            margin-top: 5px;
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

            .customer-filter-form .filter-search-container {
               flex-direction: column;
            }

            .filter-section {
               flex-direction: column;
               gap: 10px;
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
                        <h2>Customer List</h2>
                        <a href="create-customer" class="add-customer-btn btn btn-primary">Add New Customer</a>
                     </div>

                     <!-- Filters and Search -->
                     <div class="search-filter-section">
                        <div class="row">
                           <div class="col-md-12">
                              <form action="customerList" method="post" class="form-group customer-filter-form">
                                 <div class="filter-header">
                                    <h3 class="filter-title">Filter Customers</h3>
                                    <h3 class="search-title">Search Customers</h3>
                                 </div>

                                 <div class="filter-search-container">
                                    <div class="filter-section">
                                       <div class="filter-group">
                                          <select class="form-control" name="statusFilter">
                                             <option value="">All Statuses</option>
                                             <option value="1" ${statusFilter == '1' ? 'selected' : ''}>Active</option>
                                          <option value="0" ${statusFilter == '0' ? 'selected' : ''}>Inactive</option>
                                       </select>
                                    </div>
                                 </div>

                                 <div class="search-section">
                                    <div class="search-input-group">
                                       <input type="text" class="form-control" name="searchKeyword" 
                                              placeholder="Search by name, email, mobile" value="${searchKeyword}">
                                       <button type="submit" class="btn btn-primary">Search</button>
                                       <button type="button" onclick="window.location.href = 'customerList'" 
                                               class="btn btn-secondary">Reset</button>
                                    </div>
                                    ${err}
                                 </div>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
                  <!-- Customers Table -->
                  <div class="card">
                     <div class="card-body">
                        <div class="table-responsive">
                           <table class="table table-hover">
                              <thead>
                                 <tr>
                                    <th>
                                       ID
                                       <a href="?sortField=id&sortOrder=asc"><i class="bi bi-arrow-up"></i></a>
                                       <a href="?sortField=id&sortOrder=desc"><i class="bi bi-arrow-down"></i></a>
                                    </th>
                                    <th>
                                       Full Name
                                       <a href="?sortField=full_name&sortOrder=asc"><i class="bi bi-arrow-up"></i></a>
                                       <a href="?sortField=full_name&sortOrder=desc"><i class="bi bi-arrow-down"></i></a>
                                    </th>
                                    <th>Gender</th>
                                    <th>
                                       Email
                                       <a href="?sortField=email&sortOrder=asc"><i class="bi bi-arrow-up"></i></a>
                                       <a href="?sortField=email&sortOrder=desc"><i class="bi bi-arrow-down"></i></a>
                                    </th>
                                    <th>
                                       Mobile
                                       <a href="?sortField=phone&sortOrder=asc"><i class="bi bi-arrow-up"></i></a>
                                       <a href="?sortField=phone&sortOrder=desc"><i class="bi bi-arrow-down"></i></a>
                                    </th>
                                    <th>
                                       Status
                                       <a href="?sortField=status&sortOrder=asc"><i class="bi bi-arrow-up"></i></a>
                                       <a href="?sortField=status&sortOrder=desc"><i class="bi bi-arrow-down"></i></a>
                                    </th>
                                    <th>Actions</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <c:forEach var="customer" items="${customers}">
                                    <tr>
                                       <td>${customer.id}</td>
                                       <td>${customer.full_name}</td>
                                       <td>${customer.gender}</td>
                                       <td>${customer.email}</td>
                                       <td>${customer.phone}</td>
                                       <td class="${customer.status == 1 ? 'status-active' : 'status-inactive'}">
                                          ${customer.status == 1 ? 'Active' : 'InActive'}
                                       </td>
                                       <td>
                                          <a href="customerDetail?id=${customer.id}" class="btn btn-info btn-sm">View Detail</a>
                                          <a href="customerDetail?id=${customer.id}" class="btn btn-warning btn-sm">Edit</a>
                                       </td>
                                    </tr>
                                 </c:forEach>
                              </tbody>
                           </table>
                        </div>

                        <!-- Pagination -->
                        <nav aria-label="Page navigation">
                           <ul class="pagination">
                              <c:if test="${currentPage > 1}">
                                 <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage - 1}&sortField=${sortField}&sortOrder=${sortOrder}&searchKeyword=${searchKeyword}&statusFilter=${statusFilter}">Previous</a>
                                 </li>
                              </c:if>

                              <c:forEach var="i" begin="1" end="${totalPages}">
                                 <li class="page-item ${i == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="?page=${i}&sortField=${sortField}&sortOrder=${sortOrder}&searchKeyword=${searchKeyword}&statusFilter=${statusFilter}">${i}</a>
                                 </li>
                              </c:forEach>

                              <c:if test="${currentPage < totalPages}">
                                 <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage + 1}&sortField=${sortField}&sortOrder=${sortOrder}&searchKeyword=${searchKeyword}&statusFilter=${statusFilter}">Next</a>
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

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   </body>
</html>
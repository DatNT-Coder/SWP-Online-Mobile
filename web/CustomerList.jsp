<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Customer List</title>
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

      .container {
         padding: 20px;
         max-width: 100%;
      }

      /* Card styles */
      .card {
         background-color: var(--teal-card);
         border-radius: 8px;
         box-shadow: 0 2px 4px rgba(0,0,0,0.1);
         border: 1px solid var(--teal-accent);
         margin-bottom: 20px;
      }

      .card-header {
         background-color: var(--teal-primary);
         color: white;
         padding: 15px 20px;
         border-bottom: 1px solid var(--teal-light);
      }

      .card-header h5 {
         margin: 0;
         font-weight: 600;
      }

      /* Button styles */
      .btn-primary {
         background-color: var(--teal-primary);
         border-color: var(--teal-primary);
      }

      .btn-primary:hover {
         background-color: var(--teal-dark);
         border-color: var(--teal-dark);
      }

      .btn-secondary {
         background-color: #6c757d;
         border-color: #6c757d;
      }

      .btn-secondary:hover {
         background-color: #5c636a;
         border-color: #5c636a;
      }

      .btn-info {
         background-color: #0dcaf0;
         border-color: #0dcaf0;
      }

      .btn-warning {
         background-color: #ffc107;
         border-color: #ffc107;
         color: #212529;
      }

      .btn-sm {
         padding: 5px 10px;
         font-size: 0.875rem;
      }

      /* Form styles */
      .form-control {
         border: 1px solid var(--teal-light);
         border-radius: 4px;
         padding: 8px 12px;
         transition: all 0.3s;
         background-color: var(--teal-card);
      }

      .form-control:focus {
         border-color: var(--teal-primary);
         box-shadow: 0 0 0 2px rgba(38, 166, 154, 0.2);
         outline: none;
      }

      .input-group .btn {
         border-radius: 0 4px 4px 0;
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
         vertical-align: middle;
      }

      .table thead th a {
         color: white;
         margin-left: 5px;
      }

      .table thead th a:hover {
         color: var(--teal-accent);
      }

      .table tbody tr:nth-child(even) {
         background-color: var(--teal-bg);
      }

      .table tbody tr:hover {
         background-color: var(--teal-accent);
      }

      .table td, .table th {
         padding: 12px 15px;
         vertical-align: middle;
         border-bottom: 1px solid var(--teal-light);
      }

      /* Status indicators */
      .table td:contains('Active') {
         color: #4CAF50;
         font-weight: 500;
      }

      .table td:contains('InActive') {
         color: #F44336;
         font-weight: 500;
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
         border: 1px solid var(--teal-light);
         padding: 8px 14px;
         border-radius: 4px;
         transition: all 0.3s;
      }

      .page-item.active .page-link {
         background-color: var(--teal-primary);
         color: white;
         border-color: var(--teal-primary);
      }

      .page-link:hover {
         background-color: var(--teal-light);
         color: var(--teal-text);
      }

      /* Error message */
      .text-danger {
         color: #dc3545;
         margin-top: 5px;
      }

      .sidebar h2 {
         color: var(--teal-primary);
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
         .card-header {
            flex-direction: column;
            align-items: flex-start;
         }

         .card-header > div {
            margin-top: 10px;
         }

         .input-group {
            flex-direction: column;
         }

         .input-group .form-control,
         .input-group .btn {
            width: 100%;
            border-radius: 4px;
            margin-bottom: 5px;
         }

         .table-responsive {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
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
                     <form action="customerList" method="post">
                        <div class="container">
                           <div class="row">
                              <div class="col-12 mb-3 mb-lg-5">
                                 <div class="card table-nowrap table-card">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                       <h5 class="mb-0">Customer List</h5>

                                       <!-- add -->
                                       <div>
                                          <a href="create-customer" class="btn btn-primary btn-sm">Add New</a>
                                          <!--                                    <a href="#" class="btn btn-info btn-sm">View</a>
                                                                              <a href="#" class="btn btn-warning btn-sm">Edit</a>-->
                                       </div>

                                    </div>

                                    <!-- thanh search -->
                                    <div class="card-body">
                                       <div class="col-md-5">
                                          <div class="input-group">
                                             <input type="text" class="form-control" name="searchKeyword" 
                                                    placeholder="Search by name, email, mobile" value="${searchKeyword}">
                                          <button type="submit" class="btn btn-secondary">Search</button>
                                          ${err}
                                       </div>
                                    </div>
                                    <!-- end -->

                                    <!-- filter -->
                                    <div class="col-md-4">
                                       <div class="input-group">
                                          <select class="form-control" name="statusFilter">
                                             <option value="">All</option>
                                             <option value="1" ${statusFilter == '1' ? 'selected' : ''}>Active</option>
                                             <option value="0" ${statusFilter == '0' ? 'selected' : ''}>Inactive</option>
                                          </select>
                                          <button type="submit" class="btn btn-secondary">Filter by Status</button>
                                       </div>
                                    </div>
                                    <!-- end -->


                                 </div>
                                 <div class="table-responsive">
                                    <table class="table table-bordered">
                                       <thead class="small text-uppercase bg-body text-muted">
                                          <tr>
                                             <th>
                                                ID
                                                <a href="?sortField=id&sortOrder=asc"><i class="fa fa-arrow-up"></i></a>
                                                <a href="?sortField=id&sortOrder=desc"><i class="fa fa-arrow-down"></i></a>
                                             </th>
                                             <th>
                                                Full Name
                                                <a href="?sortField=full_name&sortOrder=asc"><i class="fa fa-arrow-up"></i></a>
                                                <a href="?sortField=full_name&sortOrder=desc"><i class="fa fa-arrow-down"></i></a>
                                             </th>
                                             <th>Gender</th>
                                             <th>
                                                Email
                                                <a href="?sortField=email&sortOrder=asc"><i class="fa fa-arrow-up"></i></a>
                                                <a href="?sortField=email&sortOrder=desc"><i class="fa fa-arrow-down"></i></a>
                                             </th>
                                             <th>
                                                Mobile
                                                <a href="?sortField=phone&sortOrder=asc"><i class="fa fa-arrow-up"></i></a>
                                                <a href="?sortField=phone&sortOrder=desc"><i class="fa fa-arrow-down"></i></a>
                                             </th>
                                             <th>
                                                Status
                                                <a href="?sortField=status&sortOrder=asc"><i class="fa fa-arrow-up"></i></a>
                                                <a href="?sortField=status&sortOrder=desc"><i class="fa fa-arrow-down"></i></a>
                                             </th>
                                             <th></th>
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
                                                <td>${customer.status == 1 ? 'Active' : 'InActive'}</td>
                                                <td>
                                                   <a href="customerDetail?id=${customer.id}" class="btn btn-info btn-sm">View Detail</a>
                                                   <a href="customerDetail?id=${customer.id}" class="btn btn-warning btn-sm">Edit</a>
                                                </td>
                                             </tr>
                                          </c:forEach>
                                       </tbody>
                                    </table>

                                 </div>

                                 <!-- Phân trang --><nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-center mt-3">
                                       <c:if test="${currentPage > 1}">
                                          <li class="page-item">
                                             <a class="page-link" href="?page=${currentPage - 1}&sortField=${sortField}&sortOrder=${sortOrder}">Previous</a>
                                          </li>
                                       </c:if>

                                       <c:forEach var="i" begin="1" end="${totalPages}">
                                          <li class="page-item ${i == currentPage ? 'active' : ''}">
                                             <a class="page-link" href="?page=${i}&sortField=${sortField}&sortOrder=${sortOrder}">${i}</a>
                                          </li>
                                       </c:forEach>

                                       <c:if test="${currentPage < totalPages}">
                                          <li class="page-item">
                                             <a class="page-link" href="?page=${currentPage + 1}&sortField=${sortField}&sortOrder=${sortOrder}">Next</a>
                                          </li>
                                       </c:if>
                                    </ul>
                                 </nav>




                              </div>
                           </div>
                        </div>
                     </div>

                  </form>
               </div>
            </div>
         </div
      </div>


      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   </body>
</html>

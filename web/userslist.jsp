<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Admin UserList</title>

      <!-- Bootstrap & Icons -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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

         .dashboard-container {
            display: flex;
            min-height: 100vh;
         }

         .main-content {
            flex: 1;
            padding: 20px;
            background-color: var(--teal-bg);
         }

         .panel {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            border: 1px solid var(--teal-accent);
         }

         .panel-heading {
            background-color: var(--teal-primary);
            color: white;
            padding: 15px 20px;
            border-radius: 8px 8px 0 0;
            font-weight: 600;
            display: flex;
            justify-content: space-between;
            align-items: center;
         }

         .btn-primary {
            background-color: var(--teal-primary);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
         }

         .btn-primary:hover {
            background-color: var(--teal-dark);
         }

         .btn-secondary {
            background-color: #6c757d;
            color: white;
         }

         .btn-secondary:hover {
            background-color: #5a6268;
            color: white;
         }

         .btn-warning {
            background-color: #ffc107;
            color: #212529;
         }

         .form-control {
            border: 1px solid var(--teal-light);
            border-radius: 4px;
            padding: 8px 12px;
            margin-bottom: 15px;
         }

         .table-responsive {
            overflow-x: auto;
         }

         .table {
            width: 100%;
            border-collapse: collapse;
         }

         .table th {
            background-color: var(--teal-primary);
            color: white;
            padding: 12px;
            text-align: left;
         }

         .table td {
            padding: 12px;
            border-bottom: 1px solid #eee;
         }

         .table tr:nth-child(even) {
            background-color: var(--teal-light);
         }

         .sort-icon {
            color: white;
            margin-left: 5px;
         }

         .pagination .page-item.active .page-link {
            background-color: var(--teal-primary);
            border-color: var(--teal-primary);
         }

         .pagination .page-link {
            color: var(--teal-text);
         }

         .status-active {
            color: #28a745;
            font-weight: 500;
         }

         .status-inactive {
            color: #dc3545;
            font-weight: 500;
         }

         .search-filter-section {
            margin-bottom: 1.5rem;
         }

         .search-box, .filter-box {
            border: none;
            border-radius: 8px;
            transition: all 0.3s ease;
         }

         .card-body{
            height: 120px;

         }

         .search-box:hover, .filter-box:hover {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
         }

         .card-title {
            font-weight: 600;
            font-size: 0.95rem;
            color: var(--teal-dark);
         }

         .input-group-text {
            border-right: none;
         }

         .form-select, .form-control {
            border: 1px solid var(--teal-accent);
         }

         .form-select:focus, .form-control:focus {
            border-color: var(--teal-primary);
            box-shadow: 0 0 0 0.25rem rgba(38, 166, 154, 0.25);
         }

         .text-teal-dark {
            color: var(--teal-dark);
         }

         @media (max-width: 768px) {
            .search-box, .filter-box {
               margin-bottom: 1rem;
            }
         }

         @media (max-width: 768px) {
            .dashboard-container {
               flex-direction: column;
            }

            .search-filter-row {
               flex-direction: column;
            }

            .search-filter-row > div {
               width: 100%;
               margin-bottom: 10px;
            }
         }
      </style>
   </head>
   <body>
      <div class="dashboard-container">
         <!-- Sidebar -->
         <div style="min-width: 250px;">
            <jsp:include page="Admin_sidebar.jsp"></jsp:include>
            </div>

            <!-- Main Content -->
            <div class="main-content">
               <header class="panel-heading">
                  <h5 class="mb-0">Users List</h5>
                  <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addUserModal">
                     <i class="bi bi-plus-lg"></i> Add User
                  </button>
               </header>

               <!-- Add User Modal -->
               <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                     <div class="modal-content">
                        <div class="modal-header">
                           <h5 class="modal-title" id="addUserModalLabel">Add New User</h5>
                           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                           <form action="userlist?action=add" method="post">
                              <div class="mb-3">
                                 <label for="full_name" class="form-label">Full Name</label>
                                 <input type="text" class="form-control" id="full_name" name="full_name" required>
                              </div>
                              <div class="mb-3">
                                 <label for="gender" class="form-label">Gender</label>
                                 <select class="form-control" id="gender" name="gender" required>
                                    <option value="" disabled selected>Select gender</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                 </select>
                              </div>
                              <div class="mb-3">
                                 <label for="email" class="form-label">Email</label>
                                 <input type="email" class="form-control" id="email" name="email" required>
                              </div>
                              <div class="mb-3">
                                 <label for="mobile" class="form-label">Phone Number</label>
                                 <input type="text" class="form-control" id="mobile" name="mobile" 
                                        pattern="[0-9]{10}" title="Please enter a 10-digit phone number" required>
                              </div>
                              <div class="modal-footer">
                                 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                 <button type="submit" class="btn btn-primary">Add User</button>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>

               <div class="panel-body">
                  <!-- Search and Filter -->
                  <div class="search-filter-section mb-4">
                     <div class="row g-3">
                        <!-- Search Section -->
                        <div class="col-md-6">
                           <div class="search-box card shadow-sm">
                              <div class="card-body">
                                 <h6 class="card-title mb-3 text-teal-dark">
                                    <i class="bi bi-search me-2"></i>Search Users
                                 </h6>
                                 <form class="row g-2" action="userlist" method="get">
                                    <div class="col-9">
                                       <div class="input-group">
                                          <input type="text" class="form-control" name="keyword" 
                                                 placeholder="Name, email, or phone" value="${sessionScope.kw}">
                                    </div>
                                 </div>
                                 <div class="col-3">
                                    <button type="submit" class="btn btn-primary w-100">
                                       <i class="bi bi-arrow-right"></i>
                                    </button>
                                 </div>
                              </form>
                           </div>
                        </div>
                     </div>

                     <!-- Filter Section -->
                     <div class="col-md-6">
                        <div class="filter-box card shadow-sm">
                           <div class="card-body">
                              <h6 class="card-title mb-3 text-teal-dark">
                                 <i class="bi bi-funnel me-2"></i>Filter Users
                              </h6>
                              <form class="row g-2" action="userlist" method="get">
                                 <input type="hidden" name="isFiltering" value="true">

                                 <div class="col-md-5">
                                    <select class="form-select" name="filterType" id="filterType" 
                                            onchange="updateFilterOptions()">
                                       <option value="all">All Users</option>
                                       <option value="gender">By Gender</option>
                                       <option value="role">By Role</option>
                                       <option value="status">By Status</option>
                                    </select>
                                 </div>

                                 <div class="col-md-5">
                                    <select class="form-select" name="filterValue" id="filterValue">
                                       <option value="all">All</option>
                                    </select>
                                 </div>

                                 <div class="col-md-2">
                                    <button type="submit" class="btn btn-primary w-100">
                                       <i class="bi bi-filter"></i>
                                    </button>
                                 </div>
                              </form>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>

               <!-- User Table -->
               <div class="table-responsive">
                  <table class="table">
                     <thead>
                        <tr>
                           <th>
                              ID 
                              <a href="?sortField=id&sortOrder=asc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">
                                 <i class="bi bi-arrow-up sort-icon"></i>
                              </a>
                              <a href="?sortField=id&sortOrder=desc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">
                                 <i class="bi bi-arrow-down sort-icon"></i>
                              </a>
                           </th>
                           <th>
                              Full Name 
                              <a href="?sortField=full_name&sortOrder=asc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">
                                 <i class="bi bi-arrow-up sort-icon"></i>
                              </a>
                              <a href="?sortField=full_name&sortOrder=desc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">
                                 <i class="bi bi-arrow-down sort-icon"></i>
                              </a>
                           </th>
                           <th>
                              Gender 
                              <a href="?sortField=gender&sortOrder=asc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">
                                 <i class="bi bi-arrow-up sort-icon"></i>
                              </a>
                              <a href="?sortField=gender&sortOrder=desc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">
                                 <i class="bi bi-arrow-down sort-icon"></i>
                              </a>
                           </th>
                           <th>
                              Email 
                              <a href="?sortField=email&sortOrder=asc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">
                                 <i class="bi bi-arrow-up sort-icon"></i>
                              </a>
                              <a href="?sortField=email&sortOrder=desc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">
                                 <i class="bi bi-arrow-down sort-icon"></i>
                              </a>
                           </th>
                           <th>
                              Mobile 
                              <a href="?sortField=phone&sortOrder=asc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">
                                 <i class="bi bi-arrow-up sort-icon"></i>
                              </a>
                              <a href="?sortField=phone&sortOrder=desc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">
                                 <i class="bi bi-arrow-down sort-icon"></i>
                              </a>
                           </th>
                           <th>
                              Status 
                              <a href="?sortField=status&sortOrder=asc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">
                                 <i class="bi bi-arrow-up sort-icon"></i>
                              </a>
                              <a href="?sortField=status&sortOrder=desc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">
                                 <i class="bi bi-arrow-down sort-icon"></i>
                              </a>
                           </th>
                           <th>
                              Role 
                              <a href="?sortField=role_name&sortOrder=asc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">
                                 <i class="bi bi-arrow-up sort-icon"></i>
                              </a>
                              <a href="?sortField=role_name&sortOrder=desc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">
                                 <i class="bi bi-arrow-down sort-icon"></i>
                              </a>
                           </th>
                           <th>Action</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:choose>
                           <c:when test="${not empty sessionScope.listUserBySearch}">
                              <c:set var="listUser" value="${sessionScope.listUserBySearch}" />
                           </c:when>
                           <c:when test="${not empty sessionScope.listUserByFilter}">
                              <c:set var="listUser" value="${sessionScope.listUserByFilter}" />
                           </c:when>
                           <c:otherwise>
                              <c:set var="listUser" value="${sessionScope.listUserByPage}" />
                           </c:otherwise>
                        </c:choose>
                        <c:forEach var="u" items="${listUser}">
                           <tr>
                              <td>${u.id}</td>
                              <td>${u.full_name}</td>
                              <td>${u.gender}</td>
                              <td>${u.email}</td>
                              <td>${u.phone}</td>
                              <td class="${u.status == 1 ? 'status-active' : 'status-inactive'}">
                                 ${u.status == 1 ? 'Active' : 'Inactive'}
                              </td>
                              <td>${u.role_name}</td>
                              <td>
                                 <a href="${pageContext.request.contextPath}/admin/userdetail?id=${u.id}" class="btn btn-warning btn-sm">
                                    <i class="bi bi-eye"></i> View
                                 </a>
                              </td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>

               <!-- Pagination -->
               <nav aria-label="Page navigation">
                  <ul class="pagination justify-content-center mt-4">
                     <c:if test="${sessionScope.currentPage > 1}">
                        <li class="page-item">
                           <a class="page-link" href="?page=${sessionScope.currentPage - 1}&sortField=${sessionScope.sortField}&sortOrder=${sessionScope.sortOrder}&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">
                              Previous
                           </a>
                        </li>
                     </c:if>
                     <c:forEach var="i" begin="1" end="${sessionScope.totalPage}">
                        <li class="page-item ${i == sessionScope.currentPage ? 'active' : ''}">
                           <a class="page-link" href="?page=${i}&sortField=${sessionScope.sortField}&sortOrder=${sessionScope.sortOrder}&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">
                              ${i}
                           </a>
                        </li>
                     </c:forEach>
                     <c:if test="${sessionScope.currentPage < sessionScope.totalPage}">
                        <li class="page-item">
                           <a class="page-link" href="?page=${sessionScope.currentPage + 1}&sortField=${sessionScope.sortField}&sortOrder=${sessionScope.sortOrder}&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">
                              Next
                           </a>
                        </li>
                     </c:if>
                  </ul>
               </nav>
            </div>
         </div>
      </div>
   </div>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   <script>
                                               function updateFilterOptions() {
                                                  let filterType = document.getElementById("filterType").value;
                                                  let filterValue = document.getElementById("filterValue");
                                                  filterValue.innerHTML = "";

                                                  let defaultOption = document.createElement("option");
                                                  defaultOption.value = "all";
                                                  defaultOption.text = "All";
                                                  filterValue.appendChild(defaultOption);

                                                  let options = [];
                                                  if (filterType === "gender") {
                                                     options = [
                                                        {value: "Male", text: "Male"},
                                                        {value: "Female", text: "Female"}
                                                     ];
                                                  } else if (filterType === "role") {
                                                     options = [
                                                        {value: "user", text: "User"},
                                                        {value: "sale", text: "Sale"},
                                                        {value: "sale manager", text: "Sale Manager"},
                                                        {value: "admin", text: "Admin"},
                                                        {value: "marketing", text: "Marketing"},
                                                        {value: "shipper", text: "Shipper"}
                                                     ];
                                                  } else if (filterType === "status") {
                                                     options = [
                                                        {value: "1", text: "Active"},
                                                        {value: "0", text: "Inactive"}
                                                     ];
                                                  }

                                                  options.forEach(optionData => {
                                                     let option = document.createElement("option");
                                                     option.value = optionData.value;
                                                     option.text = optionData.text;
                                                     filterValue.appendChild(option);
                                                  });

                                                  // Set selected value from session if available
                                                  let sessionFilterValue = "${sessionScope.filterValue}";
                                                  if (sessionFilterValue) {
                                                     filterValue.value = sessionFilterValue;
                                                  }
                                               }

                                               // Call updateFilterOptions on page load to set initial filter values
                                               window.onload = function () {
                                                  updateFilterOptions();
                                               };
   </script>
</body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, model.Order" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
    int totalOrders = (int) request.getAttribute("totalOrders");
    
    // Safely handle page parameter
    int currentPage = 1; // default value
    try {
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.trim().isEmpty()) {
            currentPage = Integer.parseInt(pageParam);
            // Ensure page is within valid range
            if (currentPage < 1) currentPage = 1;
        }
    } catch (NumberFormatException e) {
        currentPage = 1; // fallback to first page if parsing fails
    }
    
    int recordsPerPage = 3;
    int totalPages = (int) Math.ceil((double) totalOrders / recordsPerPage);
    // Ensure currentPage doesn't exceed totalPages
    if (totalPages > 0 && currentPage > totalPages) {
        currentPage = totalPages;
    }
    
    // Store these in request scope for JSTL/EL access
    request.setAttribute("currentPage", currentPage);
    request.setAttribute("totalPages", totalPages);
%>

<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Order List | E-Shopee</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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
         }

         .btn-secondary:hover {
            background-color: #5c636a;
         }

         .btn-sm {
            padding: 5px 10px;
            font-size: 0.875rem;
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

         .filter-title {
            color: var(--teal-dark);
            font-size: 1.1rem;
            margin: 0 0 10px 0;
            display: flex;
            align-items: center;
         }

         .filter-title::before {
            content: "🗂️";
            margin-right: 10px;
         }

         .filter-container {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
         }

         .filter-group {
            flex: 1;
            min-width: 200px;
         }

         .form-control {
            border: 1px solid var(--teal-light);
            border-radius: 4px;
            padding: 8px 12px;
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
         .status-0 {
            color: #4CAF50;
            font-weight: 500;
         }

         .status-1 {
            color: #2196F3;
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

            .filter-container {
               flex-direction: column;
               gap: 10px;
            }

            .filter-group {
               min-width: 100%;
            }

            .table-responsive {
               overflow-x: auto;
               -webkit-overflow-scrolling: touch;
            }

            .table td, .table th {
               padding: 8px;
               font-size: 0.9rem;
            }
         }
      </style>
   </head>
   <body>
      <div class="container-fluid">
         <div class="row">
            <!-- Sidebar -->
            <div class="col-md-2">
               <jsp:include page="Sale_sidebar.jsp"></jsp:include>
               </div>
               <!-- Main Content -->
               <div class="col-lg-10 main-content">
                  <div class="container-fluid py-4">
                     <h2>Order List</h2>

                     <!-- Search, Sort and Filter Section -->
                     <div class="card search-filter-section">
                        <div class="card-body">
                           <form action="ListOrderSale" method="get">
                              <input type="hidden" name="page" value="1">
                              <div class="filter-header">
                                 <h3 class="filter-title">Filter Orders</h3>
                              </div>
                              <div class="filter-container">
                                 <div class="filter-group">
                                    <label>Search Type:</label>
                                    <select class="form-control" name="searchType">
                                       <option value="order_id" ${param.searchType == 'order_id' ? 'selected' : ''}>Order ID</option>
                                    <option value="user_id" ${param.searchType == 'user_id' ? 'selected' : ''}>User ID</option>
                                 </select>
                              </div>
                              <div class="filter-group">
                                 <label>Search Value:</label>
                                 <input type="text" class="form-control" name="searchValue" placeholder="Search..." value="${param.searchValue}">
                              </div>
                              <div class="filter-group">
                                 <label>Sort By:</label>
                                 <select class="form-control" name="sortBy">
                                    <option value="order_date" ${param.sortBy == 'order_date' ? 'selected' : ''}>Order Date</option>
                                    <option value="customer_id" ${param.sortBy == 'customer_id' ? 'selected' : ''}>Customer ID</option>
                                    <option value="total_cost" ${param.sortBy == 'total_cost' ? 'selected' : ''}>Total Cost</option>
                                    <option value="status" ${param.sortBy == 'status' ? 'selected' : ''}>Status</option>
                                 </select>
                              </div>
                              <div class="filter-group">
                                 <label>From Date:</label>
                                 <input type="date" class="form-control" name="fromDate" value="${param.fromDate}">
                              </div>
                              <div class="filter-group">
                                 <label>To Date:</label>
                                 <input type="date" class="form-control" name="toDate" value="${param.toDate}">
                              </div>
                              <div class="filter-group">
                                 <label>Status:</label>
                                 <select class="form-control" name="status">
                                    <option value="">All</option>
                                    <option value="0" ${param.status == '0' ? 'selected' : ''}>Payment successful</option>
                                    <option value="1" ${param.status == '1' ? 'selected' : ''}>Delivery successful</option>
                                 </select>
                              </div>
                              <div class="filter-group d-flex align-items-end">
                                 <button type="submit" class="btn btn-primary w-100">Apply Filters</button>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>

                  <!-- Orders Table -->
                  <div class="card">
                     <div class="card-body">
                        <div class="table-responsive">
                           <table class="table table-hover">
                              <thead>
                                 <tr>
                                    <th>ID</th>
                                    <th>User Name</th>
                                    <th>Order Date</th>
                                    <th>Total</th>
                                    <th>Status</th>
                                    <th>Sale Name</th>
                                    <th>Action</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <% if (orders != null && !orders.isEmpty()) {
                                       for (Order order : orders) { %>
                                 <tr>
                                    <td><%= order.getId() %></td>
                                    <td><%= order.getUserName() %></td>
                                    <td><%= order.getDate() %></td>
                                    <td>$<%= String.format("%.2f", order.getTotalMoney()) %></td>
                                    <td class="status-<%= order.getStatus() %>">
                                       <% switch(order.getStatus()) {
                                             case 0: %>Payment successful<%
                                          break;
                                       case 1: %>Delivery successful<%
                                          break;
                                       default: %>Unknown<%
                                          } %>
                                    </td>
                                    <td><%= order.getSaleName() %></td>
                                    <td>
                                       <form action="SaleOrderDetailController" method="get">
                                          <input type="hidden" name="orderId" value="<%= order.getId() %>">
                                          <button type="submit" class="btn btn-primary btn-sm">View</button>
                                       </form>
                                    </td>
                                 </tr>
                                 <% } 
                                    } else { %>
                                 <tr>
                                    <td colspan="7" style="text-align: center;">No orders found</td>
                                 </tr>
                                 <% } %>
                              </tbody>
                           </table>
                        </div>

                        <!-- Pagination -->
                        <c:if test="${totalPages > 1}">
                           <nav aria-label="Page navigation">
                              <ul class="pagination">
                                 <!-- Previous Page Link -->
                                 <c:choose>
                                    <c:when test="${currentPage <= 1}">
                                       <li class="page-item disabled">
                                          <span class="page-link">&laquo; Previous</span>
                                       </li>
                                    </c:when>
                                    <c:otherwise>
                                       <li class="page-item">
                                          <a class="page-link" 
                                             href="ListOrderSale?page=${currentPage - 1}&searchType=${param.searchType}&searchValue=${param.searchValue}&sortBy=${param.sortBy}&fromDate=${param.fromDate}&toDate=${param.toDate}&status=${param.status}">
                                             &laquo; Previous
                                          </a>
                                       </li>
                                    </c:otherwise>
                                 </c:choose>

                                 <!-- Page Numbers -->
                                 <c:forEach begin="1" end="${totalPages}" var="i">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                       <a class="page-link" 
                                          href="ListOrderSale?page=${i}&searchType=${param.searchType}&searchValue=${param.searchValue}&sortBy=${param.sortBy}&fromDate=${param.fromDate}&toDate=${param.toDate}&status=${param.status}">
                                          ${i}
                                       </a>
                                    </li>
                                 </c:forEach>

                                 <!-- Next Page Link -->
                                 <c:choose>
                                    <c:when test="${currentPage >= totalPages}">
                                       <li class="page-item disabled">
                                          <span class="page-link">Next &raquo;</span>
                                       </li>
                                    </c:when>
                                    <c:otherwise>
                                       <li class="page-item">
                                          <a class="page-link" 
                                             href="ListOrderSale?page=${currentPage + 1}&searchType=${param.searchType}&searchValue=${param.searchValue}&sortBy=${param.sortBy}&fromDate=${param.fromDate}&toDate=${param.toDate}&status=${param.status}">
                                             Next &raquo;
                                          </a>
                                       </li>
                                    </c:otherwise>
                                 </c:choose>
                              </ul>
                           </nav>
                        </c:if>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   </body>
</html>
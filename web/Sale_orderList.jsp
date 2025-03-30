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
<html>
   <head>
      <title>My Assigned Orders</title>
      <link href="${pageContext.request.contextPath}/css/saleDashboard/style.css" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/css/sider.css" rel="stylesheet">
      <style>
         /* Your existing CSS styles remain unchanged */
      </style>
   </head>
   <style>
      :root {
         --teal-primary: #20B2AA;
         --teal-light: #E0F7FA;
         --teal-lighter: #F0FDFF;
         --teal-dark: #008B8B;
         --text-dark: #333333;
         --text-light: #555555;
      }

      body {
         font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
         background-color: #f5f5f5;
         margin: 0;
         padding: 0;
         color: var(--text-dark);
      }

      .col-md-9 {
         padding: 20px;
      }

      .content {
         background-color: white;
         border-radius: 8px;
         box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
         padding: 25px;
      }

      h2 {
         color: var(--teal-dark);
         text-align: center;
         margin-bottom: 25px;
         font-weight: 600;
      }

      form {
         background-color: var(--teal-lighter);
         padding: 15px;
         border-radius: 6px;
         margin-bottom: 20px;
         display: flex;
         flex-wrap: wrap;
         gap: 10px;
         align-items: center;
      }

      form label {
         font-weight: 500;
         color: var(--teal-dark);
         margin-right: 5px;
      }

      input, select {
         padding: 8px 12px;
         border: 1px solid #ccc;
         border-radius: 4px;
         background-color: white;
      }

      input:focus, select:focus {
         outline: none;
         border-color: var(--teal-primary);
         box-shadow: 0 0 0 2px rgba(32, 178, 170, 0.2);
      }

      button {
         background-color: var(--teal-primary);
         color: white;
         border: none;
         padding: 8px 16px;
         border-radius: 4px;
         cursor: pointer;
         transition: background-color 0.3s;
         font-weight: 500;
      }

      button:hover {
         background-color: var(--teal-dark);
      }

      table {
         width: 100%;
         border-collapse: collapse;
         margin-top: 20px;
         box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
      }

      th {
         background-color: var(--teal-primary);
         color: white;
         padding: 12px 15px;
         text-align: left;
         font-weight: 600;
      }

      td {
         padding: 10px 15px;
         border-bottom: 1px solid #e0e0e0;
         color: var(--text-light);
      }

      tr:nth-child(even) {
         background-color: var(--teal-lighter);
      }

      tr:hover {
         background-color: rgba(32, 178, 170, 0.1);
      }

      .action-button {
         background-color: var(--teal-primary);
         color: white;
         border: none;
         padding: 5px 10px;
         border-radius: 3px;
         cursor: pointer;
         transition: all 0.3s;
      }

      .action-button:hover {
         background-color: var(--teal-dark);
         transform: translateY(-1px);
      }

      .pagination {
         display: flex;
         justify-content: center;
         margin-top: 20px;
         gap: 5px;
      }

      .pagination a, .pagination span {
         padding: 8px 16px;
         text-decoration: none;
         border: 1px solid #ddd;
         color: var(--teal-dark);
         border-radius: 4px;
         transition: background-color 0.3s;
      }

      .pagination a:hover {
         background-color: var(--teal-light);
      }

      .pagination .active {
         background-color: var(--teal-primary);
         color: white;
         border: 1px solid var(--teal-primary);
      }

      .pagination .disabled {
         color: #ddd;
         pointer-events: none;
      }

      @media (max-width: 768px) {
         form {
            flex-direction: column;
            align-items: stretch;
         }

         form > * {
            width: 100%;
         }

         table {
            display: block;
            overflow-x: auto;
         }
      }
   </style>
   <body>
      <div class="col-md-3">
         <jsp:include page="Sale_sidebar.jsp"></jsp:include>
         </div>
         <div class="col-md-9">
            <section class="content">
               <h2>Order List</h2>

               <!-- Search Form -->
               <form action="ListOrderSale" method="get">
                  <input type="hidden" name="page" value="1">
                  <select name="searchType">
                     <option value="order_id" ${param.searchType == 'order_id' ? 'selected' : ''}>Order ID</option>
                  <option value="user_id" ${param.searchType == 'user_id' ? 'selected' : ''}>User ID</option>
               </select>
               <input type="text" name="searchValue" placeholder="Search..." value="${param.searchValue}">
               <button type="submit">Search</button>
            </form>

            <!-- Sort Form -->
            <form action="ListOrderSale" method="get">
               <input type="hidden" name="page" value="1">
               <input type="hidden" name="searchType" value="${param.searchType}">
               <input type="hidden" name="searchValue" value="${param.searchValue}">
               <input type="hidden" name="fromDate" value="${param.fromDate}">
               <input type="hidden" name="toDate" value="${param.toDate}">
               <input type="hidden" name="saleId" value="${param.saleId}">
               <input type="hidden" name="status" value="${param.status}">

               <label>Sort By:</label>
               <select name="sortBy">
                  <option value="order_date" ${param.sortBy == 'order_date' ? 'selected' : ''}>Order Date</option>
                  <option value="customer_id" ${param.sortBy == 'customer_id' ? 'selected' : ''}>Customer ID</option>
                  <option value="total_cost" ${param.sortBy == 'total_cost' ? 'selected' : ''}>Total Cost</option>
                  <option value="status" ${param.sortBy == 'status' ? 'selected' : ''}>Status</option>
               </select>
               <button type="submit">Sort</button>
            </form>

            <!-- Filter Form -->
            <form action="ListOrderSale" method="get">
               <input type="hidden" name="page" value="1">
               <input type="hidden" name="searchType" value="${param.searchType}">
               <input type="hidden" name="searchValue" value="${param.searchValue}">
               <input type="hidden" name="sortBy" value="${param.sortBy}">

               <label>From Date:</label> 
               <input type="date" name="fromDate" value="${param.fromDate}">

               <label>To Date:</label> 
               <input type="date" name="toDate" value="${param.toDate}">

               <label>Status:</label>
               <select name="status">
                  <option value="">All</option>
                  <option value="1" ${param.status == '0' ? 'selected' : ''}>Payment successful</option>
                  <option value="3" ${param.status == '1' ? 'selected' : ''}>Delivery successful</option>
               </select>

               <button type="submit">Filter</button>
            </form>

            <!-- Order Table -->
            <table border="1">
               <thead>
                  <tr>
                     <th>ID</th>
                     <th>User Name</th>
                     <th>Order Date</th>
                     <th>Total</th>
                     <th>Address</th>
                     <th>Phone</th>
                     <th>Email</th>
                     <th>Notes</th>
                     <th>Gender</th>
                     <th>Status</th>
                     <th>Sale Name</th>
                     <th>Sale ID</th>
                     <th>Action</th>
                  </tr>
               </thead>
               <tbody>
                  <% if (orders != null && !orders.isEmpty()) {
                     for (Order order : orders) { %>
                  <tr>
                     <td><%= order.getId() %></td>
                     <td>UID:<%= order.getuId() %> <%= order.getUserName() %></td>
                     <td><%= order.getDate() %></td>
                     <td>$<%= String.format("%.2f", order.getTotalMoney()) %></td>
                     <td><%= order.getAddress() %></td>
                     <td><%= order.getPhone() %></td>
                     <td><%= order.getEmail() %></td>
                     <td><%= order.getNote() != null ? order.getNote() : "-" %></td>
                     <td><%= order.getGender() %></td>
                     <td>
                        <% switch(order.getStatus()) {
                           case 1: %>Payment successful<%
                     break;
                  case 3: %>Delivery successful<%
                     break;
                  default: %>Unknown<%
                        } %>
                     </td>
                     <td><%= order.getSaleName() %></td>
                     <td><%= order.getSaleId() %></td>
                     <td>
                        <form action="SaleOrderDetailController" method="get">
                           <input type="hidden" name="orderId" value="<%= order.getId() %>">
                           <button type="submit" class="action-button">View</button>
                        </form>
                     </td>
                  </tr>
                  <% } 
                  } else { %>
                  <tr>
                     <td colspan="13" style="text-align: center;">No orders found</td>
                  </tr>
                  <% } %>
               </tbody>
            </table>

            <!-- Pagination -->
            <c:if test="${totalPages > 1}">
               <div class="pagination">
                  <!-- Previous Page Link -->
                  <c:choose>
                     <c:when test="${currentPage <= 1}">
                        <span class="disabled">&laquo; Previous</span>
                     </c:when>
                     <c:otherwise>
                        <a href="ListOrderSale?page=${currentPage - 1}&searchType=${param.searchType}&searchValue=${param.searchValue}&sortBy=${param.sortBy}&fromDate=${param.fromDate}&toDate=${param.toDate}&saleId=${param.saleId}&status=${param.status}">
                           &laquo; Previous
                        </a>
                     </c:otherwise>
                  </c:choose>

                  <!-- Page Numbers -->
                  <c:forEach begin="1" end="${totalPages}" var="i">
                     <c:choose>
                        <c:when test="${i == currentPage}">
                           <span class="active">${i}</span>
                        </c:when>
                        <c:otherwise>
                           <a href="ListOrderSale?page=${i}&searchType=${param.searchType}&searchValue=${param.searchValue}&sortBy=${param.sortBy}&fromDate=${param.fromDate}&toDate=${param.toDate}&saleId=${param.saleId}&status=${param.status}">${i}</a>
                        </c:otherwise>
                     </c:choose>
                  </c:forEach>

                  <!-- Next Page Link -->
                  <c:choose>
                     <c:when test="${currentPage >= totalPages}">
                        <span class="disabled">Next &raquo;</span>
                     </c:when>
                     <c:otherwise>
                        <a href="ListOrderSale?page=${currentPage + 1}&searchType=${param.searchType}&searchValue=${param.searchValue}&sortBy=${param.sortBy}&fromDate=${param.fromDate}&toDate=${param.toDate}&saleId=${param.saleId}&status=${param.status}">
                           Next &raquo;
                        </a>
                     </c:otherwise>
                  </c:choose>
               </div>
            </c:if>
         </section>
      </div>          
   </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, model.Order" %>
<%
    ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
%>

<link href="${pageContext.request.contextPath}/css/saleDashboard/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/sider.css" rel="stylesheet">
<!DOCTYPE html>
<html>
   <head>
      <title>My Assigned Orders</title>
   </head>
   <body>
      <div class="col-md-3">
         <jsp:include page="Sale_sidebar.jsp"></jsp:include>
         </div>
         <div class="col-md-9">
            <section class="content">
               <h2>Order List</h2>

               <!-- Search Form -->
               <form action="orderList" method="get">
                  <select name="searchType">
                     <option value="order_id">Order ID</option>
                     <option value="user_id">User ID</option>
                  </select>
                  <input type="text" name="searchValue" placeholder="Search...">
                  <button type="submit">Search</button>
               </form>

               <!-- Sort Form -->
               <form action="orderList" method="get">
                  <label>Sort By:</label>
                  <select name="sortBy">
                     <option value="order_date">Order Date</option>
                     <option value="customer_id">Customer ID</option>
                     <option value="total_cost">Total Cost</option>
                     <option value="status">Status</option>
                  </select>
                  <button type="submit">Sort</button>
               </form>

               <!-- Filter Form -->
               <form action="orderList" method="get">
                  <label>From Date:</label> <input type="date" name="fromDate">
                  <label>To Date:</label> <input type="date" name="toDate">

                  <label>Sale ID:</label> <input type="number" name="saleId">

                  <label>Status:</label>
                  <select name="status">
                     <option value="">All</option>
                     <option value="0">Pending</option>
                     <option value="1">Completed</option>
                     <option value="2">Cancelled</option>
                  </select>

                  <button type="submit">Filter</button>
               </form>

               <!-- Order Table -->
<table border="1">
                  <thead>
                     <tr>
                        <th>ID</th>
                        <th>User ID</th>
                        <th>Order Date</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Discount</th>
                        <th>Address</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Notes</th>
                        <th>Gender</th>
                        <th>Sale ID</th>
                     </tr>
                  </thead>
                  <tbody>
                  <% if (orders != null) {
                for (Order order : orders) { %>
                  <tr>
                     <td><%= order.getId() %></td>
                     <td><%= order.getuId() %></td>
                     <td><%= order.getDate() %></td>
                     <td><%= order.getTotalMoney() %></td>
                     <td><%= order.getStatus() %></td>
                     <td><%= order.getDiscount() %></td>
                     <td><%= order.getAddress() %></td>
                     <td><%= order.getPhone() %></td>
                     <td><%= order.getEmail() %></td>
                     <td><%= order.getNote() %></td>
                     <td><%= order.getGender() %></td>
                     <td><%= order.getSaleId() %></td>
                  </tr>
                  <% } } %>
               </tbody>
            </table>
         </section>
      </div>          
   </body>
</html>

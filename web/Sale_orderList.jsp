<%-- 
    Document   : Sale_orderlist.jsp
    Created on : Mar 23, 2025, 8:21:37 PM
    Author     : naokh
--%>

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
   <style>
      /* General Styling */
      body {
         font-family: Arial, sans-serif;
         background-color: #f4f4f4;
         margin: 0;
         padding: 20px;
      }

      /* Container */
      .content {
         background: #fff;
         padding: 20px;
         border-radius: 8px;
         box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }

      /* Headings */
      h2 {
         text-align: center;
         color: #333;
      }

      /* Forms */
      form {
         display: flex;
         justify-content: center;
         gap: 10px;
         flex-wrap: wrap;
         margin-bottom: 20px;
      }

      input, select, button {
         padding: 8px;
         border: 1px solid #ccc;
         border-radius: 5px;
      }

      button {
         background-color: #007bff;
         color: white;
         border: none;
         cursor: pointer;
         transition: 0.3s;
      }

      button:hover {
         background-color: #0056b3;
      }

      /* Table Styling */
      table {
         width: 100%;
         border-collapse: collapse;
         background: white;
         box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }

      th, td {
         padding: 12px;
         text-align: left;
         border-bottom: 1px solid #ddd;
      }

      th {
         background: #007bff;
         color: white;
      }

      tr:nth-child(even) {
         background: #f9f9f9;
      }

      tr:hover {
         background: #f1f1f1;
      }

      /* Responsive Design */
      @media (max-width: 768px) {
         form {
            flex-direction: column;
            align-items: center;
         }

         table {
            font-size: 14px;
         }

         th, td {
            padding: 8px;
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
               <form action="listOrderSale" method="get">
                  <select name="searchType">
                     <option value="order_id">Order ID</option>
                     <option value="user_id">User ID</option>
                  </select>
                  <input type="text" name="searchValue" placeholder="Search...">
                  <button type="submit">Search</button>
               </form>

               <!-- Sort Form -->
               <form action="listOrderSale" method="get">
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
               <form action="listOrderSale" method="get">
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
                        <th>User Name</th>
                        <th>Order Date</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Discount</th>
                        <th>Address</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Notes</th>
                        <th>Gender</th>
                        <th>Sale Name</th>
                     </tr>
                  </thead>
                  <tbody>
                  <% if (orders != null) {
                for (Order order : orders) { %>
                  <tr>
                     <td><%= order.getId() %></td>
                     <td><%= order.getUserName() %></td>
                     <td><%= order.getDate() %></td>
                     <td><%= order.getTotalMoney() %></td>
                     <td><%= order.getStatus() %></td>
                     <td><%= order.getDiscount() %></td>
                     <td><%= order.getAddress() %></td>
                     <td><%= order.getPhone() %></td>
                     <td><%= order.getEmail() %></td>
                     <td><%= order.getNote() %></td>
                     <td><%= order.getGender() %></td>
                     <td><%= order.getSaleName() %></td>
                  </tr>
                  <% } } %>
               </tbody>
            </table>
         </section>
      </div>          
   </body>
</html>

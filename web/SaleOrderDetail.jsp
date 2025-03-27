<%--
    Document   : SaleOrderDetail
    Created on : Mar 25, 2025, 6:33:45 PM
    Author     : naokh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Order" %>
<%@page import="java.util.List"%>
<%@page import="model.OrderDetail"%>
<%@page import="model.Product"%>
<%@page import="dao.OrderDAO"%>
<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>
<%
    Order order = (Order) request.getAttribute("order");
    List<User> salesList = (ArrayList<User>) request.getAttribute("salesList");
%>

<!DOCTYPE html>
<html>
   <head>
      <title>Order Details</title>
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
            padding: 20px;
            color: var(--text-dark);
            line-height: 1.6;
         }

         .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
         }

         h1 {
            color: var(--teal-dark);
            margin-top: 0;
            padding-bottom: 15px;
            border-bottom: 2px solid var(--teal-light);
         }

         h2 {
            color: var(--teal-dark);
            margin-top: 25px;
            font-size: 1.4em;
         }

         .section {
            margin-bottom: 30px;
            padding: 20px;
            background-color: var(--teal-lighter);
            border-radius: 6px;
            border-left: 4px solid var(--teal-primary);
         }

         .info-row {
            display: flex;
            margin-bottom: 10px;
            padding: 8px 0;
            border-bottom: 1px dashed #e0e0e0;
         }

         .info-row:last-child {
            border-bottom: none;
         }

         .info-label {
            width: 150px;
            font-weight: 500;
            color: var(--teal-dark);
         }

         .info-value {
            flex: 1;
            color: var(--text-light);
         }

         table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
         }

         th {
            background-color: var(--teal-primary);
            color: white;
            padding: 12px 15px;
            text-align: left;
         }

         td {
            padding: 10px 15px;
            border-bottom: 1px solid #e0e0e0;
            color: var(--text-light);
         }

         tr:nth-child(even) {
            background-color: var(--teal-lighter);
         }

         .thumbnail {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 4px;
            border: 1px solid #ddd;
         }

         .status-form {
            margin-top: 30px;
            padding: 20px;
            background-color: var(--teal-lighter);
            border-radius: 6px;
         }

         .assign-form {
            margin-top: 20px;
            padding: 20px;
            background-color: #fff8e1;
            border-radius: 6px;
            border-left: 4px solid #ffc107;
         }

         select, textarea {
            padding: 8px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
            max-width: 500px;
            margin-bottom: 15px;
            font-family: inherit;
         }

         textarea {
            min-height: 100px;
         }

         select:focus, textarea:focus {
            outline: none;
            border-color: var(--teal-primary);
            box-shadow: 0 0 0 2px rgba(32, 178, 170, 0.2);
         }

         button {
            background-color: var(--teal-primary);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            transition: background-color 0.3s;
         }

         .assign-button {
            background-color: #ffc107;
            color: #333;
         }

         .assign-button:hover {
            background-color: #ffab00;
         }

         button:hover {
            background-color: var(--teal-dark);
         }

         .back-button {
            display: inline-block;
            padding: 8px 15px;
            background-color: var(--teal-primary);
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-bottom: 20px;
            transition: background-color 0.3s;
         }

         .back-button:hover {
            background-color: var(--teal-dark);
         }

         @media (max-width: 768px) {
            .info-row {
               flex-direction: column;
            }

            .info-label {
               width: 100%;
               margin-bottom: 5px;
            }

            table {
               display: block;
               overflow-x: auto;
            }
         }
      </style>
   </head>
   <body>
      <%
    System.out.println("Order object exists: " + (order != null));
    if (order != null) {
        System.out.println("Order ID: " + order.getId());
    }
    System.out.println("OrderDetails attribute exists: " + 
        (request.getAttribute("orderDetails") != null));
      %>
      <div class="container">
         <a href="${pageContext.request.contextPath}/sale/ListOrderSale" class="back-button">
            ← Back to Order List
         </a>

         <h1>Order Details</h1>

         <% if (order != null) { %>
         <!-- Basic Order Information -->
         <div class="section">
            <h2>Order Information</h2>
            <div class="info-row">
               <div class="info-label">Order ID:</div>
               <div class="info-value"><%= order.getId() %></div>
            </div>
            <div class="info-row">
               <div class="info-label">Customer Name:</div>
               <div class="info-value"><%= order.getUserName() %></div>
            </div>
            <div class="info-row">
               <div class="info-label">Order Date:</div>
               <div class="info-value"><%= order.getDate() %></div>
            </div>
            <div class="info-row">
               <div class="info-label">Total Cost:</div>
               <div class="info-value">$<%= String.format("%.2f", order.getTotalMoney()) %></div>
            </div>
            <div class="info-row">
               <div class="info-label">Sale Name:</div>
               <div class="info-value"><%= order.getSaleName() %></div>
            </div>
            <div class="info-row">
               <div class="info-label">Status:</div>
               <div class="info-value">
                  <% 
                      String statusText = "";
                      switch(order.getStatus()) {
                          case 0: statusText = "Pending"; break;
                          case 1: statusText = "Completed"; break;
                          case 2: statusText = "Cancelled"; break;
                          default: statusText = "Unknown";
                      }
                  %>
                  <%= statusText %>
               </div>
            </div>
         </div>

         <!-- Receiver Information -->
         <div class="section">
            <h2>Receiver Information</h2>
            <div class="info-row">
               <div class="info-label">Full Name:</div>
               <div class="info-value"><%= order.getUserName() %></div>
            </div>
            <div class="info-row">
               <div class="info-label">Gender:</div>
               <div class="info-value"><%= order.getGender() %></div>
            </div>
            <div class="info-row">
               <div class="info-label">Email:</div>
               <div class="info-value"><%= order.getEmail() %></div>
            </div>
            <div class="info-row">
               <div class="info-label">Mobile:</div>
               <div class="info-value"><%= order.getPhone() %></div>
            </div>
            <div class="info-row">
               <div class="info-label">Address:</div>
               <div class="info-value"><%= order.getAddress() %></div>
            </div>
         </div>

         <!-- Ordered Products -->
         <div class="section">
            <h2>Ordered Products</h2>
            <table>
               <thead>
                  <tr>
                     <th>Thumbnail</th>
                     <th>Name</th>
                     <th>Category</th>
                     <th>Unit Price</th>
                     <th>Quantity</th>
                     <th>Total</th>
                  </tr>
               </thead>
               <tbody>
                  <%
                      List<OrderDetail> orderDetails = (List<OrderDetail>) request.getAttribute("orderDetails");
                      if (orderDetails == null || orderDetails.isEmpty()) {
                  %>
                  <tr>
                     <td colspan="6" style="text-align: center; color: red;">
                        No products found for this order
                     </td>
                  </tr>
                  <%
                      } else {
                          OrderDAO orderDAO = new OrderDAO();
                          for (OrderDetail detail : orderDetails) {
                              Product product = orderDAO.getProductById(detail.getProductId());
                              if (product == null) continue;
                              double totalPrice = detail.getPrice() * detail.getQuantity();
                  %>
                  <tr>
                     <td>
                        <img src="${pageContext.request.contextPath}/images/products/<%= product.getImage() != null ? product.getImage() : "placeholder-product.jpg" %>" 
                             alt="<%= product.getName() %>" class="thumbnail">
                     </td>
                     <td><%= product.getName() %></td>
                     <td><%= orderDAO.getCategoryNameById(product.getProductCategory_ID()) %></td>
                     <td>$<%= String.format("%.2f", detail.getPrice()) %></td>
                     <td><%= detail.getQuantity() %></td>
                     <td>$<%= String.format("%.2f", totalPrice) %></td>
                  </tr>
                  <%
                          }
                      }
                  %>
               </tbody>
            </table>
         </div>

         <!-- Status Update Form -->
         <form class="status-form" action="SaleOrderDetailController" method="POST">
            <input type="hidden" name="orderId" value="<%= order.getId() %>">

            <label for="status">Update Status:</label>
            <select name="status" id="status">
               <option value="0" <%= order.getStatus() == 0 ? "selected" : "" %>>Pending</option>
               <option value="1" <%= order.getStatus() == 1 ? "selected" : "" %>>Completed</option>
            </select> <br>
            <section>
               <label for="note">Sale Notes:</label>
               <textarea name="note" id="note"><%= order.getNote() != null ? order.getNote() : "" %></textarea>
            </section>
            <button type="submit">Update Order</button>
         </form>
         <% } else { %>
         <p style="color: #dc3545; padding: 20px; background-color: #f8d7da; border-radius: 4px;">Order not found.</p>
         <% } %>
      </div>
   </body>
</html>
<%-- 
    Document   : Sale_orderlist.jsp
    Created on : Mar 23, 2025, 8:21:37 PM
    Author     : naokh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Order"%>
<!DOCTYPE html>
<html>
   <head>
      <title>View Orders</title>
   </head>
   <body>
      <h2>Order List</h2>
      <table border="1">
         <tr>
            <th>ID</th>
            <th>User ID</th>
            <th>Date</th>
            <th>Total Money</th>
            <th>Status</th>
            <th>Discount</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Note</th>
            <th>Gender</th>
            <th>Sale ID</th>
            <th>Setting ID</th>
         </tr>
         <%
             List<Order> orders = (List<Order>) request.getAttribute("orders");
             if (orders != null) {
                 for (Order order : orders) {
         %>
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
            <td><%= order.getSettingId() %></td>
         </tr>
         <%
                 }
             }
         %>
      </table>
   </body>
</html>


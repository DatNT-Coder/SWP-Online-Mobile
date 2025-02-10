<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Customer Contact Management</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 20px;
            }
            .container {
                width: 80%;
                margin: auto;
                background: white;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }
            h2 {
                color: #333;
            }
            input, select {
                width: 100%;
                padding: 8px;
                margin: 5px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            button {
                background-color: #28a745;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-top: 10px;
            }
            button:hover {
                background-color: #218838;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #007bff;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Customer/Contact Information</h2>
            <form action="customerDetail" method="post">
                Full Name: <input type="text" name="fullName" required><br>
                Gender: 
                <select name="gender">
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select><br>
                Email: <input type="email" name="email" required><br>
                Mobile: <input type="text" name="mobile" required><br>
                Address: <input type="text" name="address" required><br>
                Status: <input type="text" name="status" value="Generated Automatically" readonly><br>
                <button type="submit" name="save">Save</button>
            </form>

            <h2>Change History</h2>
            <table>
                <tr>
                    <th>Email</th>
                    <th>Full Name</th>
                    <th>Gender</th>
                    <th>Mobile</th>
                    <th>Address</th>
                    <th>Updated By</th>
                    <th>Updated Date</th>
                </tr>
                <!-- Sample row -->
                <tr>

                    <c:forEach var="customer" items="${customers}">
                    <tr>
                        <td>${customer.email}</td>
                        <td>${customer.full_name}</td>
                        <td>${customer.gender}</td>
                        <td>${customer.phone}</td>
                        <td>${customer.UserAddress.userAddress}</td>
                        <td>${customer.updateBy}</td>
                        <td>${customer.updateDate}</td>
                    </tr>
                </c:forEach>

                </tr>
            </table>
        </div>
    </body>
</html>

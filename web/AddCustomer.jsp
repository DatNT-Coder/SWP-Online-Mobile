<%-- 
    Document   : AddCustomer
    Created on : Feb 8, 2025, 4:49:00 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="addCustomer" method="POST">
            <label>Id</label>
            <input type="text" name="id">
            <label>Full Name:</label>
            <input type="text" name="full_name" required>

            <label>Gender:</label>
            <select name="gender">
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select>

            <label>Email:</label>
            <input type="email" name="email" required>

            <label>Phone:</label>
            <input type="text" name="phone" required>

            <label>Status:</label>
            <select name="status">
                <option value="1">Active</option>
                <option value="0">Inactive</option>
            </select>

            <button type="submit">Add Customer</button>
        </form>

    </body>
</html>

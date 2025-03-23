<%-- 
    Document   : user-detail
    Created on : Mar 23, 2025, 10:11:49 PM
    Author     : vuduc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.User" %>
<%
    // Lấy thông tin user từ request (nếu đã truyền từ Servlet)
    User user = (User) request.getAttribute("userDetailInfo");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Detail</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            width: 400px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        label {
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin: 5px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h2>User Detail</h2>
 
</body>
</html>

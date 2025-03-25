<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Detail</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f4f4f4;
            }
            .container {
                width: 400px;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                text-align: center;
            }
            .info {
                margin-bottom: 10px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .label {
                font-weight: bold;
            }
            select {
                padding: 5px;
                border-radius: 4px;
                border: 1px solid #ccc;
            }
            .button-container {
                margin-top: 20px;
                display: flex;
                justify-content: space-between;
            }
            button {
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                flex: 1; /* Đảm bảo hai nút có cùng kích thước */
                margin: 0 5px;
            }
            .save-btn {
                background-color: #28a745;
                color: white;
            }
            .save-btn:hover {
                background-color: #218838;
            }
            .home-btn {
                background-color: #007bff;
                color: white;
            }
            .home-btn:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Sale ID</h2>
            <form action="smdetail" method="post">
                <div class="info">
                    <input type="hidden" name="orderId" value="${orderDetailInfo.getId()}"
                    <label class="label" for="saleId">Sale ID:</label>
                    <input type="number" id="saleId" name="saleId" value="${orderDetailInfo.getSaleId()}" required>
                </div>
                <div class="button-container">
                    <button type="submit" class="save-btn">Save</button> 
                    <button type="button" class="home-btn" onclick="location.href = 'salemanageDashboard'">Home</button> 
                </div>
                <h5 style="color: green">${isUpdated}</h5> <h5 style="color: red">${Wrong}</h5>
            </form>
        </div>
    </body>
</html>

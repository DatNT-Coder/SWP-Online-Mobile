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
        <h2>User Detail</h2>
        <form action="userdetail" method="post">
            <div class="info">
                <span class="label">ID:</span> <span>${userDetailInfo.id}</span>
            </div>
            <div class="info">
                <span class="label">Full Name:</span> <span>${userDetailInfo.full_name}</span>
            </div>
            <div class="info">
                <span class="label">Gender:</span> <span>${userDetailInfo.gender}</span>
            </div>
            <div class="info">
                <span class="label">Email:</span> <span>${userDetailInfo.email}</span>
            </div>
            <div class="info">
                <span class="label">Mobile:</span> <span>${userDetailInfo.phone}</span>
            </div>
            <!-- Dropdown for Status -->
            <div class="info">
                <span class="label">Status:</span> 
                <select id="status" name="status">
                    <option value="1" ${userDetailInfo.status == 1 ? 'selected' : ''}>Active</option>
                    <option value="0" ${userDetailInfo.status == 0 ? 'selected' : ''}>Inactive</option>
                </select>
            </div>
            <!-- Dropdown for Role -->
            <div class="info">
                <span class="label">Role:</span> 
                <select id="role" name="role">
                    <option value="user" ${userDetailInfo.role_name == 'user' ? 'selected' : ''}>user</option>
                    <option value="sale" ${userDetailInfo.role_name == 'sale' ? 'selected' : ''}>sale</option>
                    <option value="sale manager" ${userDetailInfo.role_name == 'sale manager' ? 'selected' : ''}>sale manager</option>
                    <option value="admin" ${userDetailInfo.role_name == 'admin' ? 'selected' : ''}>admin</option>
                    <option value="marketing" ${userDetailInfo.role_name == 'marketing' ? 'selected' : ''}>marketing</option>
                    <option value="shipper" ${userDetailInfo.role_name == 'shipper' ? 'selected' : ''}>shipper</option>
                </select>
            </div>

            <!-- Buttons (Ngang hàng) -->
            <div class="button-container">
                <button type="submit" class="save-btn">Save</button> 
      <!-- Khi bấm vào nút, trình duyệt sẽ chuyển hướng (redirect) đến URL userlist -->
                <button type="button" class="home-btn" onclick="location.href='userlist'">Home</button> 
            </div>
            <h5 style="color: green">${isTrue}</h5>
        </form>
    </div>
</body>
</html>

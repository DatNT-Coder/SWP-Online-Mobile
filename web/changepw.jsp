<%-- 
    Document   : changepw
    Created on : Feb 9, 2025, 8:04:29 PM
    Author     : vuduc
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex items-center justify-center min-h-screen bg-gray-100">
    <div class="w-full max-w-xs">
        <form action="authen?action=change" method="post" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
            <div class="mb-4 text-center">
                <h2 class="text-lg font-bold">CHANGE PASSWORD</h2>
            </div>
            <div class="mb-4">
                <input name="email" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="email" type="email" placeholder="EMAIL">
            </div>
            <div class="mb-4">
                <input name="oldPassword" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="old-password" type="password" placeholder="OLD PASSWORD">
            </div>
            <div class="mb-4">
                <input name="newPassword" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="new-password" type="password" placeholder="NEW PASSWORD">
            </div>
            <div class="mb-4">
                <input name="newPasswordAgain" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="confirm-password" type="password" placeholder="ENTER NEW PASSWORD AGAIN">
            </div>
            <div class="flex items-center justify-center">
                <button class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit"> Change </button> <h5 style="color: red"> ${errorMessage} </h5>
            </div>
        </form>
    </div>
</body>
</html>
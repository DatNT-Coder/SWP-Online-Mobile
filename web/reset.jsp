<%-- 
    Document   : reset
    Created on : Feb 24, 2025, 6:01:52 PM
    Author     : vuduc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>
            Verification Page
        </title>
        <script src="https://cdn.tailwindcss.com">
        </script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    </head>
    <body class="flex items-center justify-center min-h-screen bg-gray-100">
        <div class="bg-white p-8 rounded shadow-md w-full max-w-md">
            <div class="flex items-center justify-center mb-6">
                <img alt="Company logo with placeholder dimensions 250x200" class="mr-2" height="200" src="images/home/logo.png" width="250"/>
            </div>
            <p class="mb-4 text-lg font-medium text-gray-700">
                We already sent a code to your email. Please input your verification code below.
            </p>
            <form action="resetpw" method="post">
                <%
                    String email = (String) session.getAttribute("resetUserMail");
                %>
                <input type="hidden" name="e" value="<%= email %>" />
                <div class="mb-4">
                    <input class="w-full px-4 py-2 border border-gray-400 rounded" name="pw1" placeholder="Enter New Password" required="" type="password"/>
                </div>
                <div class="mb-4">
                    <input class="w-full px-4 py-2 border border-gray-400 rounded" name="pw2" placeholder="Enter New Password Again" required="" type="password"/>
                </div>
                <div class="mb-4">
                    <input class="w-full px-4 py-2 border border-gray-400 rounded" name="vCode" placeholder="Input Verification Code" required="" type="text"/>
                </div>
                <button class="w-full px-6 py-2 text-white bg-orange-500 rounded hover:bg-orange-600" type="submit">
                    Confirm
                </button>
                <h1 class="mt-4 text-red-500">
                    ${erPass} ${errorMessage}
                </h1>
            </form>
        </div>
    </body>
</html>

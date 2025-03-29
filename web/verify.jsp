<%-- 
    Document   : verify
    Created on : Feb 2, 2025, 6:38:21 PM
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
        <div>
            <div class="flex items-center justify-center mb-6">
                <img src="images/home/logo.png" class="mr-2" height="200" width="250"/>
            </div>
            <p class="mb-4 text-lg font-medium text-gray-700">
                We already sent a code to your email. Please input your verification code below.
            </p>
            <form action="verifyemail" method="post">
                <%
                    String email = (String) session.getAttribute("registerUserMail");
                %>
                <input type="hidden" name="e" value="<%= email %>" />
                <input type="text" name="vCode" placeholder="Input Verification Code" class="w-full max-w-md px-4 py-2 mb-4 border border-gray-400 rounded" required />
                <button style="margin-left: 10px; background-color: #009981; color:white;"  type="submit" class="px-6 py-2 text-white bg-orange-500 rounded hover:bg-orange-600">
                    Verify
                </button>  <h1 style="color: red"> ${errorMessage} </h1>
            </form>
            <div style="display: flex; justify-content: flex-start; align-items: center;">
                <form action="authen?action=resend" method="post">
                    <input type="hidden" name="type" value="regis">
                    <button style="margin-left: 10px; background-color: #009981; color:white;" type="submit" class="px-6 py-2 text-white bg-orange-500 rounded hover:bg-orange-600">
                        Resend
                    </button>
                </form>
                <form action="HomePage">
                    <button style="margin-left: 10px; background-color: #009981; color:white;" type="submit" class="px-6 py-2 text-white bg-orange-500 rounded hover:bg-orange-600">
                        Home
                    </button>
                </form>
            </div>
        </div>
    </body>
</html>

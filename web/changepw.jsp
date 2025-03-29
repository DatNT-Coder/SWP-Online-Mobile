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
      <style>
         /* Center the form perfectly */
         body.flex {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #f0f9f8;
            font-family: 'Arial', sans-serif;
         }
         
         /* Form container styling */
         .w-full.max-w-xs {
            width: 100%;
            max-width: 320px;
            padding: 0 15px;
            box-sizing: border-box;
         }
         
         /* Form card styling */
         .bg-white.shadow-md.rounded.px-8.pt-6.pb-8.mb-4 {
            width: 100%;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 150, 136, 0.15);
            padding: 2rem;
         }
         
         /* Title styling */
         .text-lg.font-bold {
            color: #008080;
            text-align: center;
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
         }
         
         /* Input field styling */
         .shadow.appearance-none.border.rounded.w-full.py-2.px-3.text-gray-700 {
            width: 100%;
            padding: 0.875rem 1rem;
            margin-bottom: 1rem;
            border: 1px solid #b2dfdb;
            border-radius: 6px;
            font-size: 0.9375rem;
            color: #4a4a4a;
            box-sizing: border-box;
            transition: all 0.3s;
         }
         
         /* Input focus state */
         .focus\:outline-none:focus, 
         .focus\:shadow-outline:focus {
            outline: none;
            border-color: #008080;
            box-shadow: 0 0 0 3px rgba(0, 128, 128, 0.1);
         }
         
         /* Button styling */
         .bg-gray-500.text-white.font-bold.py-2.px-4.rounded {
            background-color: #26a69a;
            color: white;
            width: 100%;
            padding: 0.875rem;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
         }
         
         /* Button hover state */
         .hover\:bg-gray-700:hover {
            background-color: #008080;
         }
         
         /* Error message styling */
         h5[style*="color: red"] {
            color: #e53935 !important;
            text-align: center;
            margin-top: 1rem;
            font-size: 0.875rem;
         }
         
         /* Placeholder text */
         ::placeholder {
            color: #90a4ae;
         }
      </style>
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
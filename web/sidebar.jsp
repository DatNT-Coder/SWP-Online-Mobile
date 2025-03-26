<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
String fullName = (String) session.getAttribute("full_name");
%>

<div class="sidebar">
   <div class="user-avatar">
      <div class="user-logo">
         <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="#4a6ea9" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
            <circle cx="12" cy="7" r="4"></circle>
         </svg>
      </div>
      <p style="font-weight: bold; margin-top: 10px;">Welcome, <%= fullName != null ? fullName : "Guest" %></p>
      <p style="margin-top: 5px;"><a href="/ProjectSWP391/HomePage" style="text-decoration: none; color: #4a6ea9;">Back to home</a></p>
   </div>

   <style>
      .user-avatar {
         height: 205px;
         display: flex;
         flex-direction: column;
         align-items: center;
         padding: 20px;
         background-color: #f5f7fa;
         border-radius: 8px;
         box-shadow: 0 2px 4px rgba(0,0,0,0.1);
         text-align: center;
      }

      .user-logo {
         width: 60px;
         height: 60px;
         background-color: #e1e8f0;
         border-radius: 50%;
         display: flex;
         align-items: center;
         justify-content: center;
         margin-bottom: 10px;
      }

      .user-logo svg {
         width: 32px;
         height: 32px;
      }
   </style>
   <h2>Marketing</h2>
   <ul>
      <li><a href="/ProjectSWP391/marketing/MKTDashboardController">Bảng điều khiển tiếp thị</a></li>
      <li><a href="/ProjectSWP391/marketing/listFeedbackMarketing">Danh sách phản hồi</a></li>
      <li><a href="/ProjectSWP391/slider-list">Danh sách slider</a></li>
      <li><a href="/ProjectSWP391/product-listAdmin">Danh sách sản phẩm</a></li>
      <li><a href="/ProjectSWP391/blog-list">Danh sách bài đăng</a></li>
      <li><a href="/ProjectSWP391/customerList">Danh sách người dùng</a></li>
   </ul>
</div>
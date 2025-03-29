<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
String fullName = (String) session.getAttribute("full_name");
%>

<div class="sidebar">
   <div class="user-avatar">
      <div class="user-logo">
         <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
            <circle cx="12" cy="7" r="4"></circle>
         </svg>
      </div>
      <p class="user-name">Welcome</p>
      <p class="home-link"><a href="/ProjectSWP391/HomePage">Back to home</a></p>
   </div>

   <h2 class="sidebar-title">Marketing</h2>
   <ul class="sidebar-menu">
      <li><a href="/ProjectSWP391/marketing/MarketingDashboardController"><i class="bi bi-speedometer2"></i> Bảng điều khiển tiếp thị</a></li>
      <li><a href="/ProjectSWP391/marketing/listFeedbackMarketing"><i class="bi bi-chat-square-text"></i> Danh sách phản hồi</a></li>
      <li><a href="/ProjectSWP391/slider-list"><i class="bi bi-images"></i> Danh sách slider</a></li>
      <li><a href="/ProjectSWP391/product-listAdmin"><i class="bi bi-box-seam"></i> Danh sách sản phẩm</a></li>
      <li><a href="/ProjectSWP391/blog-list"><i class="bi bi-newspaper"></i> Danh sách bài đăng</a></li>
      <li><a href="/ProjectSWP391/customerList"><i class="bi bi-people"></i> Danh sách người dùng</a></li>
   </ul>
</div>

<style>
   .sidebar {
      width: 250px;
      background-color: #e0f2f1; /* Light teal background */
      padding: 20px;
      height: 100vh;
      box-shadow: 2px 0 5px rgba(0,0,0,0.1);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
   }

   .user-avatar {
      height: 205px;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 20px;
      background-color: #26a69a; /* Teal background */
      border-radius: 8px;
      color: white;
      margin-bottom: 20px;
      text-align: center;
   }

   .user-logo {
      width: 60px;
      height: 60px;
      background-color: #00897b; /* Darker teal */
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 15px;
   }

   .user-name {
      font-weight: 600;
      margin: 10px 0 5px 0;
      font-size: 16px;
   }

   .home-link a {
      text-decoration: none;
      color: #e0f7fa; /* Light teal text */
      font-size: 14px;
      transition: color 0.3s;
   }

   .home-link a:hover {
      color: white;
      text-decoration: underline;
   }

   .sidebar-title {
      color: #00796b; /* Dark teal */
      font-size: 18px;
      margin-bottom: 15px;
      padding-bottom: 10px;
      border-bottom: 1px solid #b2dfdb; /* Light teal border */
   }

   .sidebar-menu {
      list-style: none;
      padding: 0;
      margin: 0;
   }

   .sidebar-menu li {
      margin-bottom: 8px;
   }

   .sidebar-menu a {
      display: flex;
      align-items: center;
      padding: 10px 15px;
      color: #00695c; /* Dark teal */
      text-decoration: none;
      border-radius: 5px;
      transition: all 0.3s;
   }

   .sidebar-menu a:hover {
      background-color: #b2dfdb; /* Light teal */
      color: #004d40; /* Darker teal */
      transform: translateX(5px);
   }

   .sidebar-menu a i {
      margin-right: 10px;
      font-size: 16px;
   }

   .sidebar-menu a.active {
      background-color: #26a69a; /* Teal */
      color: white;
   }
</style>

<!-- Add Bootstrap Icons CDN if not already included -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
String fullName = (String) session.getAttribute("full_name");
%>

<style>
   /* Light Teal Theme */
   :root {
      --teal-primary: #26a69a;
      --teal-light: #80cbc4;
      --teal-lighter: #b2dfdb;
      --teal-dark: #00897b;
      --teal-darker: #00695c;
      --sidebar-bg: #ffffff;
      --sidebar-text: #455a64;
      --sidebar-hover: #e0f2f1;
   }

   .sidebar {
      width: 250px;
      height: 100vh;
      background-color: var(--sidebar-bg);
      position: fixed;
      left: 0;
      top: 0;
      box-shadow: 2px 0 10px rgba(0,0,0,0.1);
      z-index: 1000;
      overflow-y: auto;
      transition: all 0.3s ease;
   }

   .sidebar h2 {
      color: var(--teal-primary);
      font-size: 1.2rem;
      text-transform: uppercase;
      letter-spacing: 1px;
      padding: 0 20px 15px;
      margin-bottom: 10px;
      border-bottom: 2px solid var(--teal-lighter);
   }

   .sidebar ul {
      list-style: none;
      padding: 0;
      margin: 0;
   }

   .sidebar ul li {
      margin-bottom: 5px;
   }

   .sidebar ul li a {
      display: block;
      padding: 12px 20px;
      color: var(--sidebar-text);
      text-decoration: none;
      transition: all 0.3s ease;
      font-size: 0.95rem;
      border-left: 3px solid transparent;
   }

   .sidebar ul li a:hover,
   .sidebar ul li a:focus {
      background-color: var(--sidebar-hover);
      color: var(--teal-darker);
      border-left: 3px solid var(--teal-primary);
   }

   .sidebar ul li a.active {
      background-color: var(--sidebar-hover);
      color: var(--teal-darker);
      border-left: 3px solid var(--teal-primary);
      font-weight: 500;
   }

   /* Highlight current page */
   .sidebar ul li a[href*="<%= request.getServletPath() %>"] {
      background-color: var(--sidebar-hover);
      color: var(--teal-darker);
      border-left: 3px solid var(--teal-primary);
      font-weight: 500;
   }

   /* Scrollbar styling */
   .sidebar::-webkit-scrollbar {
      width: 6px;
   }

   .sidebar::-webkit-scrollbar-track {
      background: #f1f1f1;
   }

   .sidebar::-webkit-scrollbar-thumb {
      background: var(--teal-light);
      border-radius: 3px;
   }

   .sidebar::-webkit-scrollbar-thumb:hover {
      background: var(--teal-primary);
   }

   /* Mobile responsive */
   @media (max-width: 992px) {
      .sidebar {
         transform: translateX(-100%);
      }

      .sidebar.active {
         transform: translateX(0);
      }
   }
</style>

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
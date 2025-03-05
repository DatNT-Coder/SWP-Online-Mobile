<%-- 
    Document   : account
    Created on : Feb 8, 2025, 4:16:55 PM
    Author     : naokh
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>User Profile</title>
      <link rel="stylesheet" href="styles.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
   </head>
   <style>
      * {
         margin: 0;
         padding: 0;
         box-sizing: border-box;
         font-family: 'Roboto', sans-serif;
      }
      body {
         background-color: #f5f5f5;
         color: #333;
         line-height: 1.6;
      }
      .container {
         max-width: 1000px;
         margin: 30px auto;
         padding: 0 20px;
      } /* Profile Header */
      .profile-header {
         display: flex;
         align-items: center;
         background-color: white;
         border-radius: 10px;
         padding: 20px;
         box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
         margin-bottom: 20px;
      }
      .profile-img {
         margin-right: 30px;
      }
      .profile-img img {
         width: 120px;
         height: 120px;
         border-radius: 50%;
         object-fit: cover;
         border: 4px solid #f0f0f0;
      }
      .profile-nav h1 {
         font-size: 24px;
         margin-bottom: 5px;
         color: #2c3e50;
      }
      .status {
         display: flex;
         align-items: center;
         font-size: 14px;
         color: #7f8c8d;
      }
      .status-indicator {
         display: inline-block;
         width: 10px;
         height: 10px;
         border-radius: 50%;
         margin-right: 5px;
      }
      .status-indicator.active {
         background-color: #2ecc71;
      }
      .status-indicator.inactive {
         background-color: #e74c3c;
      } /* Profile Cards */
      .profile-card {
         background-color: white;
         border-radius: 10px;
         padding: 25px;
         box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
         margin-bottom: 20px;
      }
      .profile-card h2 {
         font-size: 18px;
         margin-bottom: 20px;
         color: #2c3e50;
         border-bottom: 1px solid #ecf0f1;
         padding-bottom: 10px;
      }
      .info-group {
         display: grid;
         grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
         gap: 20px;
      }
      .info-item {
         display: flex;
         flex-direction: column;
      }
      .label {
         font-size: 12px;
         color: #7f8c8d;
         margin-bottom: 5px;
         text-transform: uppercase;
         letter-spacing: 0.5px;
      }
      .value {
         font-size: 16px;
         color: #2c3e50;
         font-weight: 500;
      } /* Buttons */
      .actions {
         grid-column: 1 / -1;
         display: flex;
         gap: 10px;
         margin-top: 10px;
      }
      .btn {
         padding: 10px 20px;
         border: none;
         border-radius: 5px;
         cursor: pointer;
         font-size: 14px;
         font-weight: 500;
         transition: all 0.3s ease;
      }
      .btn.primary {
         background-color: #3498db;
         color: white;
      }
      .btn.primary:hover {
         background-color: #2980b9;
      }
      .btn.secondary {
         background-color: #ecf0f1;
         color: #2c3e50;
      }
      .btn.secondary:hover {
         background-color: #bdc3c7;
      } /* Responsive Design */
      @media (max-width: 768px) {
         .profile-header {
            flex-direction: column;
            text-align: center;
         }
         .profile-img {
            margin-right: 0;
            margin-bottom: 20px;
         }
         .info-group {
            grid-template-columns: 1fr;
         }
         .actions {
            flex-direction: column;
         }
      }
   </style>
   <body>
      <section>
         <div class="container">
            <div class="col-sm-8">
               <div class="shop-menu pull-right">
                  <ul class="nav navbar-nav">
                     <li><a href="uerprofile.jsp"><i class="fa fa-user"></i> Tài khoản</a></li>
                     <li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Đơn Mua</a></li>
                     <li><a href="CartViewController"><i class="fa fa-shopping-cart"></i> Giỏ Hàng</a></li>
                        <c:if test="${account != null}">
                        <li><a href="authen?action=logout"><i class="fa fa-lock"></i> Đăng Xuất</a></li>
                        </c:if>
                        <c:if test="${account == null}">
                        <li><a href="authen?action=login"><i class="fa fa-lock"></i> Đăng Nhập</a></li>
                        </c:if> 
                        <c:if test="${account != null}">
                        <li><a href="authen?action=change"><i class="fa fa-lock"></i> Đổi mật khẩu</a></li>
                        </c:if>
                     <li><a href="authen?action=regis"><i class="fa fa-shopping-cart"></i> Đăng kí</a></li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
</div><!--/header-middle-->

<div class="header-bottom"><!--header-bottom-->
   <div class="container">
      <div class="row">
         <div class="col-sm-9">
            <div class="navbar-header">
               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
               </button>
            </div>
            <div class="mainmenu pull-left">
               <ul class="nav navbar-nav collapse navbar-collapse">
                  <li><a href="HomePage" class="active">Trang Chủ</a></li>
                  <li><a href="ProductList">Cửa Hàng</a></li> 
                  <li class="dropdown"><a href="#">Bài Đăng<i class="fa fa-angle-down"></i></a>
                     <ul role="menu" class="sub-menu">
                        <li><a href="BlogPostList">Danh sách Bài Đăng</a></li>
                        <li><a href="PostList"> Quản lý bài đăng</a></li>
                     </ul>
                  </li>

                  <c:if test="${account != null}">
                     <li class="dropdown"><a href="customerList">Danh sách khách hàng</a>
                     </li>
                  </c:if>

                  <%-- popup khi đúng role --%>  
                  <%--  <c:if test="${account.getRole_id() == 4 || account.getRole_id() == 5}">
                          <li class="dropdown"><a href="customerList">Customer List</a>
                          </li>
                      </c:if> --%>

               </ul>
            </div>
         </div>
         <div class="col-sm-3">
            <div class=" pull-right">
               <form action="searchProduct">
                  <input type="hidden" name="action" value="searchByWord"/>
                  <input name="searchBox" type="text" placeholder="Mô tả, tên sản phẩm..." required=""/>
                  <button type="submit" value="search">Tìm kiếm</button>
               </form> 
            </div>
         </div>
      </div>
   </div>
</div><!--/header-bottom-->
</header><!--/header-->
<div class="container">
   <div class="profile-header">
      <div class="profile-img">
         <img src="/placeholder.svg?height=150&width=150" alt="Profile Image">
      </div>
      <div class="profile-nav">
         <h1 id="user-name">John Doe</h1>
         <p class="status"><span class="status-indicator active"></span> Active</p>
      </div>
   </div>

   <div class="main-content">
      <div class="profile-card">
         <h2>Personal Information</h2>
         <div class="info-group">
            <div class="info-item">
               <span class="label">Full Name</span>
               <span class="value" id="full-name">John Doe</span>
            </div>
            <div class="info-item">
               <span class="label">Email</span>
               <span class="value" id="email">john.doe@example.com</span>
            </div>
            <div class="info-item">
               <span class="label">Phone</span>
               <span class="value" id="phone">+1 234 567 890</span>
            </div>
            <div class="info-item">
               <span class="label">Gender</span>
               <span class="value" id="gender">Male</span>
            </div>
         </div>
      </div>

      <div class="profile-card">
         <h2>Account Details</h2>
         <div class="info-group">
            <div class="info-item">
               <span class="label">User ID</span>
               <span class="value" id="user-id">12345</span>
            </div>
            <div class="info-item">
               <span class="label">Registration Date</span>
               <span class="value" id="reg-date">January 15, 2023</span>
            </div>
            <div class="info-item">
               <span class="label">Last Updated</span>
               <span class="value" id="updated-date">March 20, 2023</span>
            </div>
            <div class="info-item">
               <span class="label">Updated By</span>
               <span class="value" id="updated-by">Admin</span>
            </div>
         </div>
      </div>

      <div class="profile-card">
         <h2>Settings</h2>
         <div class="info-group">
            <div class="info-item">
               <span class="label">Settings ID</span>
               <span class="value" id="settings-id">S-789</span>
            </div>
            <div class="actions">
               <button class="btn primary">Edit Profile</button>
               <button class="btn secondary">Change Password</button>
            </div>
         </div>
      </div>
   </div>
</div>
</body>
</html>

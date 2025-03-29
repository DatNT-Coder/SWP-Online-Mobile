<%-- 
    Document   : user-order-manager
    Created on : Mar 7, 2025, 10:45:19 PM
    Author     : Asus
--%>
<%@ page import="model.User"%>
<%@ page import="constant.CommonConst"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>Cart | E-Shopper</title>
      <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/prettyPhoto.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/price-range.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet">
      <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <![endif]-->       
      <link rel="shortcut icon" href="images/ico/favicon.ico">
      <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-144-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-72-precomposed.png">
      <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-57-precomposed.png">
      <link rel="stylesheet" href="http://cdn.datatables.net/2.0.0/css/dataTables.dataTables.min.css"/><link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/lelinh014756/fui-toast-js@master/assets/css/toast@1.0.1/fuiToast.min.css">
      <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/lelinh014756/fui-toast-js@master/assets/css/toast@1.0.1/fuiToast.min.css">
      <style>
         /* Order Management Section */
         #cart_items {
            padding: 40px 0;
            background: #f5faf9;
         }

         .cart_info {
            border: 1px solid #e0f2f1;
            border-radius: 8px;
            background: #fff;
            padding: 20px;
            box-shadow: 0 3px 10px rgba(0, 77, 64, 0.1);
         }

         /* Table Styling */
         #orderTable {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin: 20px 0;
         }

         #orderTable thead {
            background: #e0f2f1;
         }

         #orderTable th {
            color: #00796b;
            font-family: "Francois one", sans-serif;
            text-transform: uppercase;
            font-size: 14px;
            padding: 15px;
            text-align: center;
            border-bottom: 2px solid #b2dfdb;
         }

         #orderTable td {
            padding: 12px 15px;
            border-bottom: 1px solid #e0f2f1;
            color: #00695c;
            text-align: center;
            vertical-align: middle;
         }

         #orderTable tr:hover {
            background-color: #f5faf9;
         }

         /* Status Badges */
         #orderTable td:nth-child(8) {
            font-weight: 600;
         }

         #orderTable tr td:nth-child(8):contains("Đã đặt hàng") {
            color: #26a69a;
         }

         #orderTable tr td:nth-child(8):contains("Đang xử lí") {
            color: #ffb300;
         }

         #orderTable tr td:nth-child(8):contains("Đã giao") {
            color: #43a047;
         }

         #orderTable tr td:nth-child(8):contains("Đã hủy đơn hàng") {
            color: #e53935;
         }

         /* Button Styling */
         .btn-primary {
            background: #26a69a;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 4px;
            font-weight: 600;
            transition: all 0.3s;
            white-space: nowrap;
         }

         .btn-primary:hover {
            background: #00897b;
            transform: translateY(-2px);
            box-shadow: 0 3px 10px rgba(0, 121, 107, 0.2);
         }

         /* Pagination Styling */
         .dataTables_wrapper .dataTables_paginate .paginate_button {
            color: #00796b !important;
            border: 1px solid #b2dfdb !important;
            margin: 0 3px;
            border-radius: 4px !important;
            padding: 6px 12px !important;
         }

         .dataTables_wrapper .dataTables_paginate .paginate_button.current,
         .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
            background: #26a69a !important;
            color: white !important;
            border-color: #26a69a !important;
         }

         .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
            background: #e0f2f1 !important;
            color: #004d40 !important;
         }

         /* Search Box Styling */
         .dataTables_wrapper .dataTables_filter input {
            border: 1px solid #b2dfdb;
            border-radius: 4px;
            padding: 6px 12px;
            color: #00796b;
            margin-bottom: 15px;
         }

         .dataTables_wrapper .dataTables_filter input:focus {
            border-color: #26a69a;
            box-shadow: 0 0 5px rgba(38, 166, 154, 0.3);
         }

         /* Responsive Adjustments */
         @media (max-width: 767px) {
            #orderTable thead {
               display: none;
            }

            #orderTable tr {
               display: block;
               margin-bottom: 20px;
               border-bottom: 2px solid #b2dfdb;
            }

            #orderTable td {
               display: block;
               text-align: right;
               padding: 10px 15px;
               position: relative;
            }

            #orderTable td:before {
               content: attr(data-label);
               position: absolute;
               left: 15px;
               width: 45%;
               padding-right: 10px;
               font-weight: bold;
               text-align: left;
               color: #00796b;
            }

            .btn-primary {
               width: 100%;
               padding: 10px;
            }
         }
      </style>
   </head><!--/head-->

   <body>
      <!--header-->
      <header id="header">
         <div class="header_top"><!--header_top-->
            <div class="container">
               <div class="row">
                  <div class="col-sm-12">
                     <div class="contactinfo">
                        <ul class="nav nav-pills">
                           <li><a href="#"><i class="fa fa-phone"></i> +8486 933 35322</a></li>
                           <li><a href="#"><i class="fa fa-envelope"></i> ProjectSWP391@fpt.edu.vn</a></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <section>
            <div class="container">
               <!--header-middle-->
               <div class="header-middle">
                  <div class="container">
                     <div class="row">
                        <div class="col-sm-4">
                           <div class="logo pull-left">
                              <a href="index.html"><img src="images/home/logo.png" alt="" /></a>
                           </div>
                        </div>
                        <div class="col-sm-8">
                           <div class="shop-menu pull-right">
                              <ul class="nav navbar-nav">
                                 <li><a data-toggle="modal" data-target="#editProfileModal"><i class="fa fa-user"></i> Tài khoản</a></li>
                                 <li><a href="CartViewController"><i class="fa fa-shopping-cart"></i> Giỏ Hàng</a></li>
                                    <c:if test="${sessionScope.user != null}">
                                    <li><a href="${pageContext.request.contextPath}/customer/orders"><i class="fa fa-star"></i> Đơn Mua</a></li>
                                    </c:if>
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
         <!--header-bottom-->
         <div class="header-bottom">
            <div class="container">
               <div class="row">
                  <div class="col-sm-8">
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
                           <li class="dropdown">
                              <a href="#" class="dropdown-toggle" aria-haspopup="true" aria-expanded="false">
                                 Bài Đăng <i class="fa fa-angle-down"></i>
                              </a>
                              <ul role="menu" class="sub-menu">
                                 <li><a href="BlogPostList">Danh sách Bài Đăng</a></li>
                              </ul>
                           </li>
                           <li>
                              <% 
                              User loggedInUser = (User) session.getAttribute(CommonConst.SESSION_ACCOUNT);
                              if (loggedInUser != null && loggedInUser.getRole_id() == 5) { 
                              %>
                              <a href="/ProjectSWP391/marketing/MarketingDashboardController">Bảng Điều Khiển Marketing</a>
                              <% 
                              } else if (loggedInUser != null && loggedInUser.getRole_id() == 2) { 
                              %>
                              <a href="/ProjectSWP391/sale/saleDashboard">Bảng Điều Khiển Sale</a>
                              <% 
                              } else if (loggedInUser != null && loggedInUser.getRole_id() == 4) { 
                              %>
                              <a href="/ProjectSWP391/admin/adminDashBoard">Bảng Điều Khiển Admin</a>
                              <% 
                              }
                              %>
                           </li>
                           <%-- popup khi đúng role --%>  
                           <%--  <c:if test="${account.getRole_id() == 4 || account.getRole_id() == 5}">
                                   <li class="dropdown"><a href="customerList">Customer List</a>
                                   </li>
                               </c:if> --%>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-4">
                     <div class="pull-right">
                        <form action="searchProduct" class="search-form">
                           <input type="hidden" name="action" value="searchByWord"/>
                           <input name="searchBox" type="text" placeholder="Mô tả, tên sản phẩm..." required aria-label="Search products"/>
                           <button type="submit" value="search">
                              <i class="fa fa-search"></i> Tìm kiếm
                           </button>
                        </form> 
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </header>

      <!--Edit Profile-->
      <div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="editProfileModalLabel">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="editProfileModalLabel">Edit Profile</h4>
               </div>
               <div class="modal-body">
                  <form class="edit-form" action="user-profile" enctype="multipart/form-data" method="post">
                     <div class="form-group">
                        <label for="edit-full-name">Full Name</label>
                        <input type="text" name="fullName" class="form-control" id="edit-full-name" value="${sessionScope.profileUser.full_name}">
                     </div>
                     <div class="form-group">
                        <label for="edit-email">Email</label>
                        <input type="email" name="email" class="form-control" disabled="true"id="edit-email" value="${sessionScope.profileUser.email}">
                     </div>
                     <div class="form-group">
                        <label for="edit-phone">Phone</label>
                        <input type="tel" name="phone" class="form-control" id="edit-phone" value="${sessionScope.profileUser.phone}">
                     </div>
                     <div class="form-group">
                        <label for="edit-gender">Gender</label>
                        <select class="form-control" id="edit-gender" name="gender">
                           <option value="Male" ${sessionScope.profileUser.gender == "Male" ?"selected" : ""}>Male</option>
                           <option value="Female" ${sessionScope.profileUser.gender == "Female" ?"selected" : ""}>Female</option>
                           <option value="Other"${sessionScope.profileUser.gender == "Other" ?"selected" : ""}>Other</option>
                        </select>
                     </div>
                     <div class="form-group">
                        <label for="profile-image">Profile Image</label>
                        <input type="file" id="profile-image" accept="image/*">
                        <p class="help-block">Choose a new profile image</p>
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn primary">Save Changes</button>
                     </div>
                  </form>
               </div>

            </div>
         </div>
      </div>

      <section id="cart_items">
         <div class="container">
            <div class="table-responsive cart_info" style="padding: 1rem;">
               <table id="orderTable" class="table table-hover table-striped">
                  <thead>
                     <tr>
                        <th>#</th>
                        <th>Mã dơn hàng</th>
                        <th>Tổng tiền</th>
                        <th>Ngày đặt hàng</th>
                        <th>Địa chỉ</th>
                        <th>Số điện thoại</th>
                        <th>Ghi chú</th>
                        <th>Trạng thái</th>
                        <th></th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="item" varStatus="status" items="${orders}">
                        <tr>
                           <td>${status.count}</td>
                           <td>${item.id}</td>
                           <td>${item.totalMoney}</td>
                           <td>${item.date}</td>
                           <td>${item.address}</td>
                           <td>${item.phone}</td>
                           <td>${item.note}</td>
                           <c:if test="${item.status==1}">
                              <td>Đã đặt hàng</td>
                           </c:if>
                           <c:if test="${item.status==2}">
                              <td>Đang xử lí</td>
                           </c:if>
                           <c:if test="${item.status==3}">
                              <td>Đã giao</td>
                           </c:if>
                           <c:if test="${item.status==4}">
                              <td>Đã hủy đơn hàng</td>
                           </c:if>
                           <td>
                              <a class="btn btn-primary" style="margin-top: 0px;"
                                 href="${pageContext.request.contextPath}/customer/orders/detail?id=${item.id}">Chi tiết đơn hàng</a>
                           </td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
         </div>
      </section> <!--/#cart_items-->

      <!--Footer-->               
      <footer id="footer">
         <div class="footer-widget">
            <div class="container">
               <div class="row">
                  <div class="col-sm-3">
                     <div class="single-widget">
                        <h2>Support - service</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <li><a href="/mua-hang-tra-gop">Policy and instructions for installment purchases</a></li>
                           <li><a href="/huong-dan-dat-hang">Purchase instructions and shipping policy</a></li>
                           <li><a href="/order/check">Order Tracking</a></li>
                           <li><a href="/chinh-sach-bao-hanh">Exchange and warranty policy</a></li>
                           <li><a href="/tin-tuc/dat-hang/dich-vu-bao-hanh-mo-rong-hoang-ha-mobile/">Extended warranty service</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-3">
                     <div class="single-widget">
                        <h2>Contact information</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <li><a href="/cham-soc-khach-hang">Customer care</a></li>
                           <li><a href="/trung-tam-bao-hanh">Warranty lookup</a></li>
                           <li><a href="contact-us.html">Contact us</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-3">
                     <div class="single-widget">
                        <h2>Payment methods</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <img src="images/home/visa.png" />
                           <img src="images/home/mastercard.png" />
                           <img src="images/home/jcb.png" />
                           <img src="images/home/samsungpay.png" />
                           <img src="images/home/vnpay.png" />
                           <img src="images/home/zalopay.png" />
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-3">
                     <div class="single-widget">
                        <h2>Shipping method</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <img src="images/home/vnpost.png">
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="footer-bottom">
            <div class="container">
               <div class="row">
               </div>
            </div>
         </div>
      </footer>

      <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
      <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
      <script src="${pageContext.request.contextPath}/js/jquery.scrollUp.min.js"></script>
      <script src="${pageContext.request.contextPath}/js/jquery.prettyPhoto.js"></script>
      <script src="${pageContext.request.contextPath}/js/main.js"></script>
      <script src="https://cdn.datatables.net/2.0.0/js/dataTables.min.js"></script>
      <script type="text/javascript" src="https://cdn.jsdelivr.net/gh/lelinh014756/fui-toast-js@master/assets/js/toast@1.0.1/fuiToast.min.js"></script>
      <script>
         let table = new DataTable('#orderTable');
      </script>
      <script>
         document.addEventListener('DOMContentLoaded', function () {
            // Get all dropdown elements
            const dropdowns = document.querySelectorAll('.dropdown');

            // Close when clicking outside
            document.addEventListener('click', function (e) {
               if (!e.target.closest('.dropdown')) {
                  dropdowns.forEach(dropdown => {
                     dropdown.classList.remove('active');
                     dropdown.querySelector('.sub-menu').classList.remove('show');
                  });
               }
            });

            // Toggle dropdown on click
            dropdowns.forEach(dropdown => {
               const toggle = dropdown.querySelector('.dropdown-toggle');
               const menu = dropdown.querySelector('.sub-menu');

               toggle.addEventListener('click', function (e) {
                  e.preventDefault();

                  // Close other open dropdowns
                  dropdowns.forEach(otherDropdown => {
                     if (otherDropdown !== dropdown) {
                        otherDropdown.classList.remove('active');
                        otherDropdown.querySelector('.sub-menu').classList.remove('show');
                     }
                  });

                  // Toggle current dropdown
                  dropdown.classList.toggle('active');
                  menu.classList.toggle('show');

                  // Update ARIA attributes
                  const isExpanded = dropdown.classList.contains('active');
                  toggle.setAttribute('aria-expanded', isExpanded);
               });
            });
         });
      </script>
   </body>
</html>

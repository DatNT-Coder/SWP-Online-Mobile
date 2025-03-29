<%-- 
    Document   : login
    Created on : Jan 26, 2025, 12:38:27 AM
    Author     : vuduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>Login | E-Shopper</title>
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <link href="css/font-awesome.min.css" rel="stylesheet">
      <link href="css/prettyPhoto.css" rel="stylesheet">
      <link href="css/price-range.css" rel="stylesheet">
      <link href="css/animate.css" rel="stylesheet">
      <link href="css/main.css" rel="stylesheet">
      <link href="css/responsive.css" rel="stylesheet">
      <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <![endif]-->       
      <link rel="shortcut icon" href="images/ico/favicon.ico">
      <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
      <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
      <style>
         /* Login Form Styling */
         #form {/* Very light teal background */
            padding: 50px 0;
         }

         #form .container {
            max-width: 500px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 15px rgba(0, 150, 136, 0.1);
            padding: 30px;
         }

         .login-form h2 {
            color: #008080; /* Teal color */
            margin-bottom: 20px;
            text-align: center;
            font-size: 24px;
         }

         .login-form input[type="email"],
         .login-form input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 15px;
            border: 1px solid #b2dfdb;
            border-radius: 4px;
            font-size: 16px;
            transition: all 0.3s;
         }

         .login-form input[type="email"]:focus,
         .login-form input[type="password"]:focus {
            border-color: #008080;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 128, 128, 0.2);
         }

         .login-form span {
            display: flex;
            align-items: center;
            margin: 15px 0;
            color: #008080;
         }

         .login-form .checkbox {
            margin-right: 8px;
         }

         .login-form .btn-default {
            background-color: #008080;
            color: white;
            border: none;
            padding: 12px 0;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
         }

         .login-form .btn-default:hover {
            background-color: #006666;
         }

         .login-form h5[style*="color: red"] {
            margin: 10px 0;
            text-align: center;
            font-size: 14px;
         }

         .login-form form:last-child {
            border-top: 1px solid #e0f2f1;
            padding-top: 30px;
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
                           <%-- popup khi đúng role --%>  
                           <%--  <c:if test="${account.getRole_id() == 4 || account.getRole_id() == 5}">
                                   <li class="dropdown"><a href="customerList">Customer List</a>
                                   </li>
                               </c:if> --%>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div><!--/header-bottom-->
      </header><!--/header-->

      <section id="form"><!--form-->
         <div class="container">
            <div style="display: flex; justify-content: center; align-items: center;">
               <div class="login-form"><!--login form-->
                  <h2><strong>Login to your account</strong></h2>
                  <form action="authen?action=login" method="post">
                     <input name="email" type="email" placeholder="Your Email" />
                     <input name="password" type="password" placeholder="Your password" />
                     <h5 style="color: red"> ${error} </h5>
                     <h5 style="color: red"> ${emp} </h5>
                     <span>
                        <input type="checkbox" class="checkbox"> 
                        <strong>Keep me signed in</strong>
                     </span>
                     <button type="submit" class="btn btn-default">Login</button>
                  </form>
                  <form style="padding-top: 50px" action="authen?action=reset" method="post">
                     <h2><strong>Input Email to reset your password</strong></h2>
                     <input name="email" type="email" placeholder="Your Email" />
                     <button type="submit" class="btn btn-default">Reset</button>
                     <h5 style="color: red"> ${erEmailNotExist} </h5>
                  </form>
               </div><!--/login form & reset form-->


            </div>
         </div>
      </section><!--/form-->


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

      <script src="js/jquery.js"></script>
      <script src="js/price-range.js"></script>
      <script src="js/jquery.scrollUp.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/jquery.prettyPhoto.js"></script>
      <script src="js/main.js"></script>
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

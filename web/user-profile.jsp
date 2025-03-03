<%-- 
    Document   : account
    Created on : Feb 8, 2025, 4:16:55 PM
    Author     : naokh
--%>

<!-- account.jsp -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

   <head>

      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">
      <title> User Profile</title>
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <link href="css/font-awesome.min.css" rel="stylesheet">
      <link href="css/prettyPhoto.css" rel="stylesheet">
      <link href="css/price-range.css" rel="stylesheet">
      <link href="css/animate.css" rel="stylesheet">
      <link href="css/main.css" rel="stylesheet">
      <link href="css/responsive.css" rel="stylesheet">
      <!--                [if lt IE 9]>
                      <script src="js/html5shiv.js"></script>
                      <script src="js/respond.min.js"></script>
                      <![endif]       -->
      <link rel="shortcut icon" href="images/ico/favicon.ico">
      <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
      <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />

      <style>
         .button-gender{
            padding-bottom: 20px;
            padding-left: 170px;
         }
         .form-group{
            /*            padding-top: 20px;*/
            padding-bottom: 20px;
         }


      </style>
   </head>
   <body style="margin: 0;">
      <!-- Header 
      <header id="header"><!--header-->
      <header id="header"><!--header-->
         <div class="header_top"><!--header_top-->
            <div class="container">
               <div class="row">
                  <div class="col-sm-6 ">
                     <div class="contactinfo">
                        <ul class="nav nav-pills">
                           <li><a href=""><i class="fa fa-phone"></i> +84 985 350 491</a></li>
                           <li><a href=""><i class="fa fa-envelope"></i> group6_shopmobile@gmail.com</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-6">
                     <div class="social-icons pull-right">
                        <ul class="nav navbar-nav">
                           <li><a href=""><i class="fa fa-facebook"></i></a></li>
                           <li><a href=""><i class="fa fa-twitter"></i></a></li>
                           <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                           <li><a href=""><i class="fa fa-dribbble"></i></a></li>
                           <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div><!--/header_top-->

         <div class="header-middle"><!--header-middle-->
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
                           <li class="dropdown">
                              <a href="user-profile">
                                 <i class="fa fa-user"></i>
                                 ${empty sessionScope.user.email ? "Tài khoản" : sessionScope.user.full_name}</a>
                              <ul class="sub-menu" style=" background-color: #ffffff;padding-top: 0.8rem;max-width: 180px;" >
                                 <li  style="color: #696763; font-size: 20px; text-align: center;padding:1rem;">
                                    <a class="dropdown-hover" href="changepassword" style="color: #696763">Đổi mật khẩu</a>
                                 </li>
                                 <li  style="color: #696763; font-size: 20px; text-align: center;padding: 1rem;">
                                    <a class="dropdown-hover" href="user-profile" style="color: #696763;">Thông tin người dùng</a>
                                 </li>
                              </ul>
                           </li>
                           <li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Thanh Toán</a></li>
                           <li><a href="cart"><i class="fa fa-shopping-cart"></i> Giỏ Hàng</a></li>
                              <c:choose>
                                 <c:when test="${sessionScope.email == null || sessionScope.pass == null}">
                                 <li><a href="signIn.jsp"><i class="fa fa-lock"></i> Đăng Nhập</a></li>
                                 </c:when>
                                 <c:otherwise>
                                 <li><a href="logOut.jsp"><i class="fa-solid fa-right-from-bracket"></i> Đăng Xuất</a></li>
                                 </c:otherwise>
                              </c:choose>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
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
                           <li><a href="Home">Trang chủ</a></li>
                           <li class="dropdown"><a href="Home" class="">Cửa hàng<i class="fa fa-angle-down"></i></a>
                              <ul role="menu" class="sub-menu">
                                 <li><a href="/mobileshop/listProduct" class="active">Sản phẩm</a></li>
                                 <li><a href="cart">Giỏ Hàng</a></li> 
                              </ul>
                           </li> 
                           <li class="dropdown"><a href="#">Bài Đăng<i class="fa fa-angle-down"></i></a>
                              <ul role="menu" class="sub-menu">
                                 <li><a href="blog.html">Danh sách Bài Đăng</a></li>
                                 <li><a href="blog-single.html">Bài đăng đơn</a></li>
                              </ul>
                           </li> 
                           <li><a href="contact-us.html">Liên hệ</a></li>
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
         </div>
      </header>

      <div class="container">
         <!-- This element is added by Laravel -->
         <form action="user-profile" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
            <h1>Thông tin người dùng</h1>
            <hr>
            <div class="row">
               <!-- left column -->
               <div class="col-md-3">
                  <div class="text-center">
                     <img class="avatar img-circle" id="previewImage" src="./assets/img/ProfilePicture/${userProfile.image}" style="border-radius: 50%;
                          object-fit: cover;
                          width: 100px;
                          height: 100px;">
                     <h6>Tải ảnh của bạn ở đây...</h6>
                     <input id="imageInput" type="file" accept="image/*" name="imageProfile" alt="image">
                     <input type="hidden" name="_token" value="{{ csrf_token() }}">
                  </div>
               </div>
               <!-- edit form column -->
               <div class="col-md-7 personal-info">
                  <!-- Change this to a <form> to reproduce your original issue -->
                  <div class="form-horizontal" role="form">
                     <div class="form-group">
                        <label class="col-lg-3 control-label">Họ và tên:</label>
                        <div class="col-lg-8">
                           <input class="form-control" name="full_name" type="text" value="${userProfile.full_name}" pattern="^[^\d]+$" title="Họ và tên không được chứa số. Vui lòng nhập nhập lại Họ và tên." required="">
                        </div>
                     </div>
                     <div class="button-gender">
                        <input <c:if test="${userProfile.gender == 'Male'}">checked</c:if> required="" type="radio" id="html" name="gender" value="Male" required="">
                           <label class="form-label">Nam</label>
                           <input <c:if test="${userProfile.gender == 'Female'}">checked</c:if> required="" type="radio" id="html" name="gender" value="Female" required="">
                           <label class="form-label">Nữ</label>
                        </div>
                        <div class="form-group">
                           <label class="col-lg-3 control-label">Số điện thoại:</label>
                           <div class="col-lg-8">
                              <input class="form-control" name="phone" type="text" value="${userProfile.phone}" pattern="[0-9]{10}" title="Số điện thoại chỉ được nhập 10 kí tự số." required="">
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="col-lg-3 control-label">Email:</label>
                        <div class="col-lg-8">
                           <input class="form-control" name="" type="text" value="${userProfile.email}" readonly>
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="col-md-3 control-label"></label>
                        <div class="col-md-8">
                           <input type="submit" class="btn btn-primary" value="Lưu và thay đổi">
                           <span></span>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <hr>
         </form>
      </div>
      <footer id="footer"><!--Footer-->
         <div class="footer-top">
            <div class="container">
               <div class="row">
                  <div class="col-sm-2">
                     <div class="companyinfo">
                        <h2><span style="color: #FE0F9E;">Pink</span>-Mobile</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor</p>
                     </div>
                  </div>
                  <div class="col-sm-7">
                     <div class="col-sm-3">
                        <div class="video-gallery text-center">
                           <a href="#">
                              <div class="iframe-img">
                                 <img src="images/home/iframe1.png" alt="" />
                              </div>
                              <div class="overlay-icon">
                                 <i class="fa fa-play-circle-o"></i>
                              </div>
                           </a>
                           <p>Circle of Hands</p>
                           <h2>24 DEC 2014</h2>
                        </div>
                     </div>

                     <div class="col-sm-3">
                        <div class="video-gallery text-center">
                           <a href="#">
                              <div class="iframe-img">
                                 <img src="images/home/iframe2.png" alt="" />
                              </div>
                              <div class="overlay-icon">
                                 <i class="fa fa-play-circle-o"></i>
                              </div>
                           </a>
                           <p>Circle of Hands</p>
                           <h2>24 DEC 2014</h2>
                        </div>
                     </div>

                     <div class="col-sm-3">
                        <div class="video-gallery text-center">
                           <a href="#">
                              <div class="iframe-img">
                                 <img src="images/home/iframe3.png" alt="" />
                              </div>
                              <div class="overlay-icon">
                                 <i class="fa fa-play-circle-o"></i>
                              </div>
                           </a>
                           <p>Circle of Hands</p>
                           <h2>24 DEC 2014</h2>
                        </div>
                     </div>

                     <div class="col-sm-3">
                        <div class="video-gallery text-center">
                           <a href="#">
                              <div class="iframe-img">
                                 <img src="images/home/iframe4.png" alt="" />
                              </div>
                              <div class="overlay-icon">
                                 <i class="fa fa-play-circle-o"></i>
                              </div>
                           </a>
                           <p>Circle of Hands</p>
                           <h2>24 DEC 2014</h2>
                        </div>
                     </div>
                  </div>
                  <div class="col-sm-3">
                     <div class="address">
                        <img src="images/home/map.png" alt="" />
                        <p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="footer-widget">
            <div class="container">
               <div class="row">
                  <div class="col-sm-2">
                     <div class="single-widget">
                        <h2>Dịch vụ</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <li><a href="">Hỗ trợ online</a></li>
                           <li><a href="">Liên hệ</a></li>
                           <li><a href="">Trạng thái đơn hàng</a></li>
                           <li><a href="">Thay đổi địa chỉ</a></li>
                           <li><a href="">FAQ’s</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-2">
                     <div class="single-widget">
                        <h2>Mua nhanh</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <li><a href="">T-Shirt</a></li>
                           <li><a href="">Mens</a></li>
                           <li><a href="">Womens</a></li>
                           <li><a href="">Gift Cards</a></li>
                           <li><a href="">Shoes</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-2">
                     <div class="single-widget">
                        <h2>Chính sách</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <li><a href="">Điều khoản sử dụng</a></li>
                           <li><a href="">Quyền riêng tư</a></li>
                           <li><a href="">Chính sách đổi trả</a></li>
                           <li><a href="">Hệ thống hóa đơn</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-2">
                     <div class="single-widget">
                        <h2>Về người bán hàng</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <li><a href="">Thông tin công ty</a></li>
                           <li><a href="">Địa chỉ cửa hàng</a></li>
                           <li><a href="">Tiếp thị liên kết</a></li>
                           <li><a href="">Bản quyền</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-3 col-sm-offset-1">
                     <div class="single-widget">
                        <h2>Về người bán hàng</h2>
                        <form action="#" class="searchform">
                           <input type="text" placeholder="Địa chỉ email..." />
                           <button style="background-color: #FE0F9E" type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
                           <p>Nhận được thông tin cập nhật mới nhất <br />từ website</p>
                        </form>
                     </div>
                  </div>

               </div>
            </div>
         </div>

         <div class="footer-bottom">
            <div class="container">
               <div class="row">
                  <p class="pull-left">Copyright © 2024 PinkMobile. All rights reserved.</p>
                  <p class="pull-right">Designed by <span><a target="_blank" href=""></a></span></p>
               </div>
            </div>
         </div>

      </footer><!--/Footer-->
      <script data-cfasync="false"
      src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
      <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/jquery.scrollUp.min.js"></script>
      <script src="js/price-range.js"></script>
      <script src="js/jquery.prettyPhoto.js"></script>
      <script src="js/main.js"></script>
      <script src="https://kit.fontawesome.com/8922b65fb8.js" crossorigin="anonymous"></script>
      <script>
            document.getElementById('imageInput').addEventListener('change', function (e) {
               var file = e.target.files[0];
               var reader = new FileReader();

               reader.onloadend = function () {
                  document.getElementById('previewImage').src = reader.result;
               }

               if (file) {
                  reader.readAsDataURL(file);
               } else {
                  document.getElementById('previewImage').src = "";
               }
            });

      </script>
   </body>
</html>
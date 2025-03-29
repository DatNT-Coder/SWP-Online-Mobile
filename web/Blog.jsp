<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>Bài Viết | E-Shopper</title>
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

         <div class="header-bottom"><!--header-bottom-->
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
                        </ul>
                     </div>
                  </div>
                  <div class=" pull-right">
                     <form action="BlogPostList">

                        <input name="keyword" type="text" placeholder="Tìm kiếm..." required=""/>
                        <button type="submit" value="search">Tìm kiếm</button>
                     </form> 
                  </div>
               </div>
            </div>
         </div><!--/header-bottom-->
      </header><!--/header-->

      <section>
         <div class="container">
            <div class="row">
               <div class="col-sm-3">
                  <div class="left-sidebar">
                     <h2>Category</h2>
                     <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                        <c:forEach items="${listPC}" var="c">
                           <div class="panel panel-default">
                              <div class="panel-heading">
                                 <h4 class="panel-title"><a href="Postcategory?categoryId=${c.id}">${c.name}</a></h4>
                              </div>
                           </div>
                        </c:forEach>
                     </div><!--/category-products-->



                     <div class="shipping text-center"><!--shipping-->
                        <img src="images/home/shipping.png" alt="" />
                     </div><!--/shipping-->
                  </div>
               </div>
               <div class="col-sm-9">
                  <div class="blog-post-area">
                     <h2 class="title text-center">Latest From our Blog</h2>
                     <c:forEach items="${list}" var="b">
                        <div class="single-blog-post">
                           <h3>${b.title}</h3>
                           <div class="post-meta">
                              <ul>
                                 <li><i class="fa fa-user"></i> ${b.getFull_name()}</li>
                                 <li><i class="fa fa-bars"></i> ${b.getName()}</li>
                                 <li><i class="fa fa-calendar"></i> ${b.updatedDate}</li>


                              </ul>

                           </div>
                           <a href="">
                              <img src="assets/img/blogImage/${b.thumbnail}" alt="">
                           </a>
                           <p>${b.brief_info}</p>
                           <a class="btn btn-primary" href="BlogDetail?pid=${b.id}">Read More</a>

                        </div>
                     </c:forEach>


                     <ul class="pagination justify-content-center">
                        <c:if test="${pageIndex > 1}">
                           <li class="page-item">
                              <a class="page-link" href="BlogPostList?index=${pageIndex-1}">Trước</a>
                           </li>
                        </c:if>

                        <c:forEach var="i" begin="1" end="${endPage}">
                           <li class="page-item ${pageIndex == i?"active":""}"><a class="page-link" href="BlogPostList?index=${i}">${i}</a></li>                              
                           </c:forEach>

                        <c:if test="${pageIndex < endPage}">
                           <li class="page-item">
                              <a class="page-link" href="BlogPostList?index=${pageIndex+1}">Sau</a>
                           </li>
                        </c:if>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </section>

      <footer id="footer"><!--Footer-->
         <div class="footer-top">
            <div class="container">
               <div class="row">
                  <div class="col-sm-2">
                     <div class="companyinfo">
                        <h2><span>e</span>-shopper</h2>
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
                        <h2>Service</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <li><a href="">Online Help</a></li>
                           <li><a href="">Contact Us</a></li>
                           <li><a href="">Order Status</a></li>
                           <li><a href="">Change Location</a></li>
                           <li><a href="">FAQ’s</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-2">
                     <div class="single-widget">
                        <h2>Quock Shop</h2>
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
                        <h2>Policies</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <li><a href="">Terms of Use</a></li>
                           <li><a href="">Privecy Policy</a></li>
                           <li><a href="">Refund Policy</a></li>
                           <li><a href="">Billing System</a></li>
                           <li><a href="">Ticket System</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-2">
                     <div class="single-widget">
                        <h2>About Shopper</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <li><a href="">Company Information</a></li>
                           <li><a href="">Careers</a></li>
                           <li><a href="">Store Location</a></li>
                           <li><a href="">Affillate Program</a></li>
                           <li><a href="">Copyright</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-3 col-sm-offset-1">
                     <div class="single-widget">
                        <h2>About Shopper</h2>
                        <form action="#" class="searchform">
                           <input type="text" placeholder="Your email address" />
                           <button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
                           <p>Get the most recent updates from <br />our site and be updated your self...</p>
                        </form>
                     </div>
                  </div>

               </div>
            </div>
         </div>

         <div class="footer-bottom">
            <div class="container">
               <div class="row">
                  <p class="pull-left">Copyright © 2013 E-SHOPPER Inc. All rights reserved.</p>
                  <p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
               </div>
            </div>
         </div>

      </footer><!--/Footer-->



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
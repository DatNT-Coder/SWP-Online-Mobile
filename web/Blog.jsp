<%@ page import="model.User"%>
<%@ page import="constant.CommonConst"%>
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
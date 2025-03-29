<%-- 
    Document   : home
    Created on : Feb 9, 2025, 1:16:53 AM
    Author     : naokh
--%>
<%@page import="java.util.List"%>
<%@page import="model.BlogPost"%>
<%@ page import="model.User"%>
<%@ page import="constant.CommonConst"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>Trang chủ | E-Shopper</title>
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <link href="css/font-awesome.min.css" rel="stylesheet">
      <link href="css/prettyPhoto.css" rel="stylesheet">
      <link href="css/price-range.css" rel="stylesheet">
      <link href="css/animate.css" rel="stylesheet">
      <link href="css/main.css" rel="stylesheet">
      <link href="css/responsive.css" rel="stylesheet">
      <link href="css/slider.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/lelinh014756/fui-toast-js@master/assets/css/toast@1.0.1/fuiToast.min.css">
      <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <![endif]-->       
      <link rel="shortcut icon" href="images/ico/favicon.ico">
      <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
      <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
   </head>

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

      <!--Slider-->
      <section id="slider">
         <div class="container">
            <div class="row">
               <div class="col-sm-12">
                  <div id="slider-carousel" class="carousel slide" data-ride="carousel">

                     <ol class="carousel-indicators">
                        <c:forEach items="${requestScope.sliders}" var="s" varStatus="loop">
                           <c:if test="${loop.index == 0}">
                              <li data-target="#slider-carousel" data-slide-to="${loop.index}" class="active"></li>
                              </c:if>
                              <c:if test="${loop.index != 0}">
                              <li data-target="#slider-carousel" data-slide-to="${loop.index}"></li>
                              </c:if>
                           </c:forEach>
                     </ol>  
                     <div class="carousel-inner">
                        <c:forEach items="${requestScope.sliders}" var="s" varStatus="loop">
                           <c:if test="${loop.index == 0}">
                              <div class="item active">
                              </c:if>
                              <c:if test="${loop.index != 0}">
                                 <div class="item">
                                 </c:if>
                                 <div class="col-sm-6">
                                    <h1><span>E</span>-Shoper</h1>
                                    <h2>${s.title}</h2>
                                    <p>${s.notes} </p>
                                    <a href="${s.backlink}">
                                       <button type="button" class="btn btn-default get">Xem thông tin</button>
                                    </a>
                                 </div>
                                 <div class="col-sm-6">
                                    <img src="images/slider/${s.image}" class="girl img-responsive" alt="Test Debug" />

                                 </div>
                              </div>
                           </c:forEach>
                        </div>
                     </div>
                     <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                     </a>
                     <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                     </a>
                  </div>

               </div>
            </div>
         </div>
      </section>

      <!--Main section-->
      <section>
         <div class="container">
            <div class="row">
               <div class="col-sm-2">
                  <div class="left-sidebar">

                     <!--category-product-->
                     <h2>Danh mục</h2>
                     <div class="panel-group category-products" id="accordian">
                        <div class="panel panel-default">
                           <div class="panel-heading">
                              <h4 class="panel-title">
                              </h4>
                           </div>
                        </div>
                        <c:forEach items="${requestScope.listPC}" var="listPC">
                           <div class="panel panel-default">
                              <div class="panel-heading ">
                                 <h4 class="panel-title">
                                    <c:if test="${listPC.id == sessionScope.pickedCategory}">
                                       <a style="color: #009981;"  href="searchProduct?action=pickCategory&cid=${listPC.id}">
                                          <span class="badge pull-right"></span>
                                          ${listPC.categoryName}
                                       </a>
                                    </c:if>
                                    <c:if test="${listPC.id != sessionScope.pickedCategory}">
                                       <a href="searchProduct?action=pickCategory&cid=${listPC.id}">
                                          <span class="badge pull-right"></span>
                                          ${listPC.categoryName}
                                       </a>
                                    </c:if>
                                 </h4>
                              </div>
                           </div>
                        </c:forEach>
                     </div>

                     <!--brands_products-->
                     <div class="brands_products">
                        <h2>Thương hiệu</h2>
                        <div class="brands-name">
                           <ul class="nav nav-pills nav-stacked">
                              <c:forEach items="${requestScope.listBrand}" var="listBrand">
                                 <c:if test="${listBrand.brandID == sessionScope.pickedBrand}">
                                    <li><a style="color: #009981;" href="searchProduct?action=pickBrand&brandId=${listBrand.brandID}"> <span class="pull-right"></span>${listBrand.brandName}</a></li>
                                       </c:if>
                                       <c:if test="${listBrand.brandID != sessionScope.pickedBrand}">
                                    <li><a href="searchProduct?action=pickBrand&brandId=${listBrand.brandID}"> <span class="pull-right"></span>${listBrand.brandName}</a></li>
                                       </c:if> 
                                    </c:forEach>
                           </ul>
                        </div>
                     </div>

                     <!--price-range-->
                     <div class="price-range">
                        <h2>Khoảng giá</h2>
                        <form action="searchProduct">
                           <div style="width: 100%">
                              <input type="hidden" name="action" value="searchByPrice"/>
                              <input style="padding:0.5rem;width:100%" placeholder="Từ..."  type="text" name="fromPrice" class="span2" value="${sessionScope.fromP}" pattern="^\d+(\.\d+)?$" title="vui lòng nhập số" ><br />
                              <input style="padding:0.5rem;width:100%;margin-top:6px;" placeholder="Đến..." type="text" name="toPrice" class="span2" value="${sessionScope.toP}"  pattern="^\d+(\.\d+)?$" title="vui lòng nhập số"  ><br />
                              <button style="background-color: #26a69a;color:white;border: none;width:100%;padding:.5rem; border-radius: 10px" type="submit">Tìm kiếm</button>
                           </div>
                        </form>
                     </div>

                  </div>
               </div>

               <!--Products-->
               <div class="col-sm-8 padding-right">
                  <div class="features_items">
                     <h2>Sản phẩm</h2>
                     <h3>${requestScope.searchResult}</h3>

                     <div style="min-height: 800px;" class="col-md-12 product-list">
                        <!-- JavaScript will insert product elements here -->
                     </div>
                     <ul class="pagination">
                        <li class="${currentPage == 1 ? 'disabled' : ''}">
                           <a href="?page=${currentPage - 1}">&laquo;</a>
                        </li>
                        <c:forEach begin="1" end="${totalPages}" var="i">
                           <li class="${i == currentPage ? 'active' : ''}">
                              <a href="?page=${i}">${i}</a>
                           </li>
                        </c:forEach>
                        <li class="${currentPage == totalPages ? 'disabled' : ''}">
                           <a href="?page=${currentPage + 1}">&raquo;</a>
                        </li>
                     </ul>
                  </div>
               </div>

               <!--hot_post-->
               <div class="col-sm-2"> 
                  <h2 class="title text-center">Hot Posts</h2>
                  <div class="hot_post_container">
                     <div class="hot_post_warpper">
                        <ul class="blog_list">
                           <c:forEach items="${list}" var="b" varStatus="status">
                              <div class="single-blog-post" onclick="redirectToBlogDetail(${b.id})" style="cursor: pointer;">
                                 <li class="blog_item">
                                    <a href="BlogDetail?pid=${b.id}" class="blog_link">
                                       <p class="badge">${b.getFull_name()}</p>
                                       <img src="assets/img/blogImage/${b.thumbnail}" alt="Blog_image" class="blog_image">
                                       <h5>${b.title}</h5>
                                    </a>
                                 </li>
                              </div>
                           </c:forEach>
                           <a href="BlogPostList" class="btn btn-primary">Xem thêm</a>
                        </ul>
                     </div>
                  </div>
               </div><!--hot_post-->
            </div>
         </div>
         <script>
            function redirectToBlogDetail(id) {
               window.location.href = "BlogDetail?id=" + id;
            }
         </script>

         <script>
            function redirectToBlogDetail(id) {
               window.location.href = "BlogDetail?id=" + id;
            }
         </script>

      </section>

      <!--Lastest Product & Latest Post -->               
      <section>
         <div class="container">
            <div class="row">
               <div class="col-sm-12">
                  <!--recommended_items-->
                  <div class="recommended_items">
                     <h2 class="title text-center">Sản phẩm mới nhất</h2>
                     <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                           <div class="item active">
                              <c:forEach begin="0" end="2" items="${requestScope.latestP}" var="latestP">
                                 <div class="col-sm-4">
                                    <a href="productDetail?pid=${latestP.ID}">
                                       <div class="product-image-wrapper">
                                          <div class="single-products">
                                             <div class="productinfo text-center">
                                                <img style="width: 200px;height: 200px;object-fit: contain;" src="./assets/img/productImage/${latestP.image}" alt="" />
                                                <h2>${latestP.originalPrice}</h2>
                                                <p>${latestP.name}</p>
                                                <c:if test="${sessionScope.user != null}">
                                                   <a  onclick="addToCart(${latestP.ID})" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
                                                </c:if>
                                                <c:if test="${sessionScope.user == null}">
                                                   <a href="login.jsp"  class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
                                                </c:if>
                                             </div>
                                          </div>
                                       </div>
                                    </a>
                                 </div>
                              </c:forEach>
                           </div>

                           <div class="item">	
                              <c:forEach begin="2" items="${requestScope.latestP}" var="latestP">
                                 <div class="col-sm-4">
                                    <a href="productDetail?pid=${latestP.ID}">
                                       <div class="product-image-wrapper">
                                          <div class="single-products">
                                             <div class="productinfo text-center">
                                                <img style="width: 200px;height: 200px;object-fit: contain;" src="./assets/img/productImage/${latestP.image}" alt="" />
                                                <h2>${latestP.originalPrice}</h2>
                                                <p>${latestP.name}</p>
                                                <c:if test="${sessionScope.user != null}">
                                                   <a onclick="addToCart(${latestP.ID})" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
                                                </c:if>
                                                <c:if test="${sessionScope.user == null}">
                                                   <a href="login.jsp"  class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
                                                </c:if>
                                             </div>
                                          </div>
                                       </div>
                                    </a>
                                 </div>  
                              </c:forEach>
                           </div>
                        </div>
                        <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                           <i class="fa fa-angle-left"></i>
                        </a>
                        <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                           <i class="fa fa-angle-right"></i>
                        </a>			
                     </div>
                  </div>

                  <!--Latest Post-->
                  <div class="recommended_items">
                     <h2 class="title text-center">Latest Post</h2>
                     <div id="recommended-item-carousel2" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                           <div class="item active">
                              <c:forEach begin="0" end="2" items="${requestScope.list}" var="b">
                                 <div class="col-sm-4">
                                    <div class="multiple-blog-post" onclick="redirectToBlogDetail(${b.id})" style="cursor: pointer;">
                                       <div class="blog_item">
                                          <a href="BlogDetail?pid=${b.id}" class="blog_link">
                                             <p class="badge">${b.getFull_name()}</p>
                                             <img style="height: 200px;" src="assets/img/blogImage/${b.thumbnail}" alt="Blog_image" class="blog_image img-responsive">
                                             <h3>${b.title}</h3>
                                          </a>
                                       </div>
                                    </div>
                                 </div>  
                              </c:forEach>
                           </div>
                           <div class="item">	
                              <c:forEach begin="3" items="${requestScope.list}" var="b">
                                 <div class="col-sm-4">
                                    <div class="multiple-blog-post" onclick="redirectToBlogDetail(${b.id})" style="cursor: pointer;">
                                       <div class="blog_item">
                                          <a href="BlogDetail?pid=${b.id}" class="blog_link">
                                             <p class="badge">${b.getFull_name()}</p>
                                             <img style="height: 200px;" src="assets/img/blogImage/${b.thumbnail}" alt="Blog_image" class="blog_image img-responsive">
                                             <h3>${b.title}</h3>
                                          </a>
                                       </div>
                                    </div>
                                 </div>  
                              </c:forEach>
                           </div>
                        </div>
                        <a class="left recommended-item-control" href="#recommended-item-carousel2" data-slide="prev">
                           <i class="fa fa-angle-left"></i>
                        </a>
                        <a class="right recommended-item-control" href="#recommended-item-carousel2" data-slide="next">
                           <i class="fa fa-angle-right"></i>
                        </a>			
                     </div>
                  </div>
               </div>
            </div>
         </div><!--Latest Post-->
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
      <script src="js/bootstrap.min.js"></script>
      <script src="js/jquery.scrollUp.min.js"></script>
      <script src="js/price-range.js"></script>
      <script src="js/jquery.prettyPhoto.js"></script>
      <script src="js/main.js"></script>
      <script type="text/javascript" src="https://cdn.jsdelivr.net/gh/lelinh014756/fui-toast-js@master/assets/js/toast@1.0.1/fuiToast.min.js"></script>

      <script>
                                       function redirectToBlogDetail(id) {
                                          window.location.href = "http://localhost:8080/ProjectSWP391/BlogDetail?pid=" + id;
                                       }
      </script>
      <script>
         async function addToCart(id) {
            const postData = new URLSearchParams();
            postData.append("productId", id);
            const response = await fetch('${pageContext.request.contextPath}/CartAddItemController', {
               method: "POST",
               body: postData
            });
            const data = await response.json();
            const status = data.status;
            console.log(data.status);
            if (status === 'successed') {
               FuiToast.success('Đã thêm sản phẩm vào giỏ hàng!');
            } else {
               FuiToast.error('Add product to cart failed!');
            }
            return false;
         }
      </script>
      <script>
         // Convert the list of products from Java to JavaScript
         var products = JSON.parse('${listProduct}');
         var productRatingsJSON = '${productRatingsJSON}';
         var productRatings = JSON.parse(productRatingsJSON.trim());
         var currentPage = 1; // Current page
         var itemsPerPage = 6; // Number of items per page

         // Display products for the current page
         function displayProducts() {
            var start = (currentPage - 1) * itemsPerPage;
            var end = start + itemsPerPage;
            var productsToDisplay = products.slice(start, end);

            // Clear the current products
            $('.product-list').empty();

            // Add each product
            //Cart ở đây
            //Product Detail ở đây.
            productsToDisplay.forEach(function (product) {
               var productHtml =
                       '<div class="col-md-4">' +
                       '<a href="ProductDetails?bid=' + product.brandId + '&cid=' + product.ProductCategory_ID + '&pid=' + product.ID + '">' +
                       '<div class="product-image-wrapper">' +
                       '<div class="single-products">' +
                       '<div class="productinfo text-center">' +
                       '<img style="width: 200px;height: 200px;object-fit: contain;" src="./assets/img/productImage/' + product.image + '" alt="" />' +
                       '<h2>$' + product.salePrice + '</h2>' +
                       '<h5 style="color:black;text-decoration: line-through;opacity:0.8;">$' + product.originalPrice + '</h5>' +
                       '<p>' + product.name + '</p>';
               
               productHtml += '<div style="display: flex; align-items: center;">' +
                       '<a onclick="addToCart(' + product.ID + ')" class="btn btn-default add-to-cart">' +
                       '<i class="fa fa-shopping-cart"></i> Thêm vào giỏ' +
                       '</a>' +
                       (productRatings[product.ID] != null && productRatings[product.ID] != '0'
                               ? '<a class="btn btn-default add-to-cart" style="cursor: default;">'
                               + productRatings[product.ID] + ' ★</a>'
                               : '') +
                       '</div>';

               //                    } 
               //                    else {
               //                        // User is not logged in, add a link to the sign-in page
               //                        productHtml += '<a href="signIn.jsp" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>';
               //                    }
               productHtml += '</div></div></div></a></div>';
               $('.product-list').append(productHtml);
            });
         }

         // Update the pagination links
         function updatePagination() {
            var totalPages = Math.ceil(products.length / itemsPerPage);

            // Clear the current pagination links
            $('.pagination').empty();

            // Add "Previous" button
            var prevClass = currentPage === 1 ? 'disabled' : '';
            var prevHtml = '<li class="' + prevClass + '"><a href="#">Trước</a></li>';
            $('.pagination').append(prevHtml);

            // Add each pagination link
            for (var i = 1; i <= totalPages; i++) {
               var liClass = i === currentPage ? 'active' : '';
               var liHtml = '<li class="' + liClass + '"><a href="#">' + i + '</a></li>';
               $('.pagination').append(liHtml);
            }

            // Add "Next" button
            var nextClass = currentPage === totalPages ? 'disabled' : '';
            var nextHtml = '<li class="' + nextClass + '"><a href="#">Sau</a></li>';
            $('.pagination').append(nextHtml);

            // Add event handlers to the pagination links
            $('.pagination a').click(function (e) {
               e.preventDefault();

               var pageText = $(this).text();

               if (pageText === 'Trước' && currentPage !== 1) {
                  currentPage--;
               } else if (pageText === 'Sau' && currentPage !== totalPages) {
                  currentPage++;
               } else if (pageText !== 'Trước' && pageText !== 'Sau') {
                  currentPage = parseInt(pageText);
               }

               displayProducts();
               updatePagination();
            });
         }

         // Display the initial products and pagination
         displayProducts();
         updatePagination();
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
                     return false;
                  }
               </script>
               <script>
                  // Convert the list of products from Java to JavaScript
                  var products = JSON.parse('${listProduct}');
                  var productRatingsJSON = '${productRatingsJSON}';
                  var productRatings = JSON.parse(productRatingsJSON.trim());
                  var currentPage = 1; // Current page
                  var itemsPerPage = 6; // Number of items per page
                  var isLoggedIn = ${sessionScope.user != null ? 'true' : 'false'};

                  // Toggle current dropdown
                  dropdown.classList.toggle('active');
                  menu.classList.toggle('show');

                     // Clear the current products
                     $('.product-list').empty();

                     // Add each product
                     //Cart ở đây
                     //Product Detail ở đây.
                     productsToDisplay.forEach(function (product) {
                        var productHtml = '<div class="col-md-4">' +
                                '<a href="ProductDetails?bid=' + product.brandId + '&cid=' + product.ProductCategory_ID + '&pid=' + product.ID + '">' +
                                '<div class="product-image-wrapper">' +
                                '<div class="single-products">' +
                                '<div class="productinfo text-center">' +
                                '<img style="width: 200px;height: 200px;object-fit: contain;" src="./assets/img/productImage/' + product.image + '" alt="" />' +
                                '<h2>$' + product.salePrice + '</h2>' +
                                '<h5 style="color:black;text-decoration: line-through;opacity:0.8;">$' + product.originalPrice + '</h5>' +
                                '<p>' + product.name + '</p>';
                        //không dùng $\{product.ID} mà dùng + product.ID +
                        // if (sessionStorage.getItem('user') !== null) {
                        // User is logged in, add "Add to cart" button with onclick attribute
                            productHtml += '<div style="display: flex; align-items: center;">' + 
                                '<a onclick="' + (isLoggedIn ? 'addToCart(' + product.ID + ')' : 'redirectToLogin()') + '" class="btn btn-default add-to-cart">' +
                                    '<i class="fa fa-shopping-cart"></i> Thêm vào giỏ' +
                                '</a>' +
                                (productRatings[product.ID] != null && productRatings[product.ID] != '0'
                                    ? '<a class="btn btn-default add-to-cart" style="cursor: default;">' 
                                      + productRatings[product.ID] + ' ★</a>'
                                    : '') +
                            '</div>';


                        //                    } 
                        //                    else {
                        //                        // User is not logged in, add a link to the sign-in page
                        //                        productHtml += '<a href="signIn.jsp" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>';
                        //                    }
                        productHtml += '</div></div></div></a></div>';
                        $('.product-list').append(productHtml);
                     });
                  }

                function redirectToLogin() {
                    window.location.href = 'login.jsp';
                }

                  // Update the pagination links
                  function updatePagination() {
                     var totalPages = Math.ceil(products.length / itemsPerPage);

                     // Clear the current pagination links
                     $('.pagination').empty();

                     // Add "Previous" button
                     var prevClass = currentPage === 1 ? 'disabled' : '';
                     var prevHtml = '<li class="' + prevClass + '"><a href="#">Trước</a></li>';
                     $('.pagination').append(prevHtml);

                     // Add each pagination link
                     for (var i = 1; i <= totalPages; i++) {
                        var liClass = i === currentPage ? 'active' : '';
                        var liHtml = '<li class="' + liClass + '"><a href="#">' + i + '</a></li>';
                        $('.pagination').append(liHtml);
                     }

                     // Add "Next" button
                     var nextClass = currentPage === totalPages ? 'disabled' : '';
                     var nextHtml = '<li class="' + nextClass + '"><a href="#">Sau</a></li>';
                     $('.pagination').append(nextHtml);

                     // Add event handlers to the pagination links
                     $('.pagination a').click(function (e) {
                        e.preventDefault();

                        var pageText = $(this).text();

                        if (pageText === 'Trước' && currentPage !== 1) {
                           currentPage--;
                        } else if (pageText === 'Sau' && currentPage !== totalPages) {
                           currentPage++;
                        } else if (pageText !== 'Trước' && pageText !== 'Sau') {
                           currentPage = parseInt(pageText);
                        }

                        displayProducts();
                        updatePagination();
                     });
                  }

                  // Display the initial products and pagination
                  displayProducts();
                  updatePagination();
               </script>
               </body>
               </html>

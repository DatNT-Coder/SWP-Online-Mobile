<%-- 
    Document   : ProductDetail
    Created on : Feb 21, 2025, 9:41:16 AM
    Author     : tiend
--%>
<%@ page import="model.User"%>
<%@ page import="constant.CommonConst"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>Product Details | E-Shopper</title>
      <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/prettyPhoto.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/price-range.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet">
      <!--[if lt IE 9]>
      <script src="${pageContext.request.contextPath}/js/html5shiv.js"></script>
      <script src="${pageContext.request.contextPath}/js/respond.min.js"></script>
      <![endif]-->       
      <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ico/favicon.ico">
      <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-144-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-72-precomposed.png">
      <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-57-precomposed.png">
      <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/lelinh014756/fui-toast-js@master/assets/css/toast@1.0.1/fuiToast.min.css">
      <style>
         /* Main Container Styles */
         .product-details-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
         }

         /* Product Details Section */
         .product-details {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            margin-bottom: 20px;
         }

         /* Image Section */
         .product-image-section {
            flex: 1;
            min-width: 300px;
            max-width: 500px;
            text-align: center;
         }

         .view-product img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
         }

         /* Info Section */
         .product-info-section {
            flex: 1;
            min-width: 300px;
            max-width: 500px;
            text-align: center;
         }

         .product-info-section h2 {
            color: #00796b;
            font-size: 28px;
            margin-bottom: 15px;
         }

         .product-info-section p {
            color: #455a64;
            margin-bottom: 10px;
         }

         /* Price Styles */
         .price-container {
            margin: 20px 0;
         }

         .original-price {
            color: #78909c;
            font-size: 18px;
            text-decoration: line-through;
         }

         .sale-price {
            color: #00796b;
            font-size: 24px;
            font-weight: bold;
         }

         /* Quantity Input */
         .quantity-container {
            margin: 20px 0;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
         }

         #quantityInput {
            width: 70px;
            padding: 8px;
            border: 1px solid #b2dfdb;
            border-radius: 4px;
            text-align: center;
         }

         /* Rating Styles */
         .rating-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin: 20px 0;
         }

         .rating-stars {
            color: #ffc107;
            font-size: 20px;
         }

         /* Add to Cart Button */
         .add-to-cart-btn {
            background-color: #26a69a;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 4px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin: 20px 0;
            display: inline-block;
         }

         .add-to-cart-btn:hover {
            background-color: #00897b;
            transform: translateY(-2px);
         }

         /* Tabs Section */
         .tabs-section {
            width: 100%;
            max-width: 1000px;
            margin: 0 auto;
         }

         .nav-tabs {
            display: flex;
            justify-content: left;
            border-bottom: 1px solid #26a69a;
            margin-bottom: 20px;
            margin-top: 20px;
         }

         .nav-tabs li {
            margin: 0 10px;
         }

         .nav-tabs li a {
            color: #455a64;
            font-weight: 600;
            padding: 10px 20px;
            border-radius: 4px 4px 0 0;
            border: 1px solid #fff;
            transition: all 0.3s;
            color: black;
         }

         .nav-tabs li.active a
         
         
         .nav-tabs li a:hover {
            color: white;
            background-color: #e0f2f1;
         }

         /* Tab Content */
         .tab-content {
            min-height: 200px;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
         }

         /* Review Form */
         .review-form {
            max-width: 600px;
            margin: 0 auto;
         }

         .form-group {
            margin-bottom: 20px;
            text-align: left;
         }

         .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #00796b;
            font-weight: 600;
         }

         .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #b2dfdb;
            border-radius: 4px;
         }

         .rating-input {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin: 15px 0;
         }

         .rating-input .star {
            font-size: 24px;
            color: #cfd8dc;
            cursor: pointer;
            transition: color 0.2s;
         }

         .rating-input .star:hover,
         .rating-input .star.active {
            color: #ffc107;
         }

         /* Feedback Items */
         .feedback-header {
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin-bottom: 15px;
         }

         .feedback-header i {
            color: #26a69a;
         }

         .feedback-rating {
            color: #ffc107;
            font-size: 18px;
            margin: 10px 0;
         }

         .feedback-image {
            max-width: 100%;
            height: auto;
            border-radius: 4px;
            margin: 15px 0;
         }

         /* Responsive Adjustments */
         @media (max-width: 768px) {
            .product-details {
               flex-direction: column;
            }

            .nav-tabs {
               flex-direction: column;
               align-items: center;
            }

            .nav-tabs li {
               margin: 5px 0;
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

      <section>
         <div class="container">
            <div class="row">
               <div class="col-sm-3">
                  <div class="left-sidebar">
                     <h2>Danh mục</h2>
                     <ul class="panel-group category-products" id="accordian"><!--category-product-->
                        <!-- lựa chọn tất cả, reset lại cái brand cho tất cả -->
                        <div class="panel panel-default">
                           <div class="panel-heading">
                              <h4 class="panel-title" >
                                 <a href="ProductList">
                                    <span class="badge pull-right"></span>
                                    Tất cả
                                 </a>
                              </h4>
                           </div>
                        </div>
                        <c:forEach items="${requestScope.listPC}" var="listPC">
                           <div class="panel panel-default">
                              <div class="panel-heading ">
                                 <h4 class="panel-title">
                                    <c:if test="${listPC.id == sessionScope.pickedCategory}">
                                       <a style="color: #009981;"  href="searchProduct?action=pickCategory&cid=${listPC.id}" >
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
                     </ul><!--/category-products-->

                     <div class="brands_products"><!--brands_products-->
                        <h2>Thương hiệu</h2>
                        <div class="brands-name">
                           <ul class="nav nav-pills nav-stacked">
                              <c:forEach items="${requestScope.listBrand}" var="listBrand">
                                 <c:if test="${listBrand.brandID == sessionScope.pickedBrand}">
                                    <li><a style="color: #009981;" href="searchProduct?action=pickBrand&brandId=${listBrand.brandID}"> <span class="pull-right active"></span>${listBrand.brandName}</a></li>
                                       </c:if>
                                       <c:if test="${listBrand.brandID != sessionScope.pickedBrand}">
                                    <li><a href="searchProduct?action=pickBrand&brandId=${listBrand.brandID}"> <span class="pull-right"></span>${listBrand.brandName}</a></li>
                                       </c:if> 
                                    </c:forEach>

                           </ul>
                        </div>
                     </div><!--/brands_products-->

                     <div class="price-range"><!--price-range-->
                        <h2>Khoảng giá</h2>
                        <form action="searchProduct">
                           <div style="width: 100%">
                              <input type="hidden" name="action" value="searchByPrice"/>
                              <input style="padding:0.5rem;width:100%" placeholder="Từ..."  type="text" name="fromPrice" class="span2" value="${sessionScope.fromP}" pattern="^\d+(\.\d+)?$" title="vui lòng nhập số" ><br />
                              <input style="padding:0.5rem;width:100%;margin-top:6px;" placeholder="Đến..." type="text" name="toPrice" class="span2" value="${sessionScope.toP}"  pattern="^\d+(\.\d+)?$" title="vui lòng nhập số"  ><br />
                              <button style="background-color: #009981;color:white;border: none;width:100%;padding:.5rem; border-radius: 10px" type="submit">Tìm kiếm</button>
                           </div>
                        </form>

                     </div><!--/price-range-->

                     <div class="shipping text-center"><!--shipping-->
                        <img src="${pageContext.request.contextPath}/images/home/shipping.png" alt="" />
                     </div><!--/shipping-->

                  </div>
               </div>

               <div class="col-sm-9 padding-right">
                  <div class="product-details-container">
                     <div class="product-details">
                        <div class="product-image-section">
                           <div class="view-product">
                              <img src="${pageContext.request.contextPath}/assets/img/productImage/${productDetail.image}" alt="${productDetail.name}" />
                           </div>
                        </div>

                        <div class="product-info-section">
                           <h2>${productDetail.name}</h2>
                           <p>ID: ${productDetail.ID}</p>
                           <p><b>Loại sản phẩm:</b> ${productDetail.categoryName}</p>

                           <div class="price-container">
                              <h5 class="original-price"><s>US $${productDetail.originalPrice}</s></h5>
                              <h4 class="sale-price" id="salePrice">US $${productDetail.salePrice}</h4>
                           </div>

                           <div class="quantity-container">
                              <label for="quantityInput">Số lượng:</label>
                              <input type="number" id="quantityInput" name="quantity" value="1" min="1">
                           </div>

                           <div class="rating-container">
                              <label>Đánh giá:</label>
                              <span>
                                 <fmt:formatNumber value="${avgRating}" type="number" minFractionDigits="2" maxFractionDigits="2"/>
                                 <span class="rating-stars">
                                    <c:forEach var="i" begin="1" end="${avgRating}">
                                       <i class="fa fa-star"></i>
                                    </c:forEach>
                                    <c:if test="${avgRating % 1 != 0}">
                                       <i class="fa fa-star-half-alt"></i>
                                    </c:if>
                                 </span>
                              </span>
                           </div>

                           <a onclick="addToCart(${productDetail.ID})" class="add-to-cart-btn">
                              <i class="fa fa-shopping-cart"></i> Add to cart
                           </a>
                        </div>
                     </div>

                     <div class="tabs-section">
                        <div class="col-sm-12">
                           <ul class="nav nav-tabs">
                              <li><a href="#details" data-toggle="tab">Chi tiết</a></li>
                              <li class="active"><a href="#reviews" data-toggle="tab">Đánh giá</a></li>
                           </ul>
                        </div>

                        <div class="tab-content">
                           <div class="tab-pane fade" id="details">
                              <div class="col-sm-12">
                                 <p>${productDetail.details}</p>
                              </div>
                           </div>

                           <c:if test="${sessionScope.profileUser.role_id == 1 and hasPurchased}">
                              <div class="col-sm-12">
                                 <p><b>Viết đánh giá của bạn</b></p>
                                 <form class="review-form" action="ProductDetails" method="POST" enctype="multipart/form-data">
                                    <input type="hidden" name="pickedProduct" value="${productDetail.ID}">

                                    <div class="form-group">
                                       <label for="name">Họ và tên</label>
                                       <input name="full_name" type="text" class="form-control" id="name" 
                                              value="${sessionScope.profileUser.full_name}" readonly required>
                                    </div>

                                    <div class="form-group">
                                       <label for="email">Email</label>
                                       <input name="email" type="text" class="form-control" id="email" 
                                              value="${sessionScope.profileUser.email}" readonly required>
                                    </div>

                                    <div class="form-group">
                                       <label for="phone">Số điện thoại</label>
                                       <input name="phone" type="tel" class="form-control" id="phone" 
                                              value="${sessionScope.profileUser.phone}" readonly required>
                                    </div>

                                    <div class="form-group">
                                       <label>Giới Tính</label>
                                       <div>
                                          <input <c:if test="${sessionScope.profileUser.gender == 'Male'}">checked</c:if> 
                                                                                                           type="radio" id="male" name="gender" value="Male" required>
                                             <label for="male">Nam</label>

                                             <input <c:if test="${sessionScope.profileUser.gender == 'Female'}">checked</c:if> 
                                                                                                                type="radio" id="female" name="gender" value="Female" required>
                                             <label for="female">Nữ</label>
                                          </div>
                                       </div>

                                       <div class="form-group">
                                          <label>Đánh giá:</label>
                                          <div class="rating-input">
                                             <span class="star" data-value="5">☆</span>
                                             <span class="star" data-value="4">☆</span>
                                             <span class="star" data-value="3">☆</span>
                                             <span class="star" data-value="2">☆</span>
                                             <span class="star" data-value="1">☆</span>
                                          </div>
                                          <input type="hidden" id="rating" name="rating" value="0">
                                       </div>

                                       <div class="form-group">
                                          <label for="feedback">Phản hồi của bạn</label>
                                          <textarea name="comment" class="form-control" id="feedback" rows="5" required></textarea>
                                       </div>

                                       <div class="form-group">
                                          <label>Ảnh phản hồi:</label>
                                          <div class="image-preview">
                                             <img id="preview" src="" alt="Preview" class="feedback-image" style="display: none;">
                                          </div>
                                          <input type="file" id="imageInput" name="feedbackImage" accept="image/*" required>
                                       </div>

                                       <input type="hidden" name="product_id" value="${sessionScope.pickedProduct}">
                                    <button type="submit" class="add-to-cart-btn">Gửi Đánh Giá</button>
                                 </form>
                              </div>
                           </c:if>

                           <c:if test="${sessionScope.profileUser.role_id == 1 and not hasPurchased}">
                              <p class="text-center">Bạn cần mua hàng trước khi viết đánh giá.</p>
                           </c:if>

                           <div class="tab-pane fade active in" id="reviews">
                              <div class="feedback-list">
                                 <c:forEach items="${requestScope.listFeedback}" var="listFeedback" varStatus="loop">
                                    <c:if test="${listFeedback.status == 1}">
                                       <div class="feedback-item">
                                          <c:if test="${listFeedback.imageStatus == 1}">
                                             <div class="feedback-header">
                                                <i class="fa fa-user"></i>
                                                <span>${listFeedback.full_name}</span>
                                             </div>
                                             <div class="feedback-image-container">
                                                <label>Ảnh phản hồi:</label>
                                                <img src="./assets/img/feedbackImage/${listFeedback.image}" 
                                                     alt="Ảnh phản hồi" class="feedback-image">
                                             </div>
                                          </c:if>

                                          <c:if test="${listFeedback.imageStatus == 0}">
                                             <div class="feedback-header">
                                                <i class="fa fa-user"></i>
                                                <span>${listFeedback.full_name}</span>
                                             </div>
                                          </c:if>

                                          <div class="feedback-rating">
                                             <c:forEach begin="1" end="${listFeedback.rating}">
                                                <i class="fa fa-star"></i>
                                             </c:forEach>
                                          </div>

                                          <div class="feedback-content">
                                             <label>Phản hồi của khách hàng:</label>
                                             <p>${listFeedback.comment}</p>
                                          </div>
                                       </div>
                                    </c:if>
                                 </c:forEach>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>

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
                                       <c:forEach begin="3" items="${requestScope.latestP}" var="latestP">
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
                        </div>
                     </div>
                  </div><!--Latest Post-->
               </section>
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

      <script type="text/javascript" src="https://cdn.jsdelivr.net/gh/lelinh014756/fui-toast-js@master/assets/js/toast@1.0.1/fuiToast.min.js"></script>
      <script>
                                                               function increaseQuantity() {
                                                                  var input = document.getElementById('quantityInput');
                                                                  input.value = parseInt(input.value, 10) + 1;
                                                               }

                                                               function decreaseQuantity() {
                                                                  var input = document.getElementById('quantityInput');
                                                                  var currentValue = parseInt(input.value, 10);
                                                                  input.value = currentValue > 1 ? currentValue - 1 : 1;
                                                               }
                                                               // Lấy giá ban đầu của sản phẩm
                                                               var salePrice = parseFloat(document.querySelector('#salePrice').textContent.trim().slice(4));
                                                               // Lắng nghe sự kiện thay đổi của trường số lượng
                                                               document.querySelector('#quantityInput').addEventListener('input', function (e) {
                                                                  // Lấy số lượng mới từ trường số lượng
                                                                  var quantity = parseInt(this.value);
                                                                  // Cập nhật giá tiền tương ứng
                                                                  document.querySelector('#salePrice').textContent = 'US $' + (salePrice * quantity).toFixed(2);
                                                               });
      </script>
      <script>
         async function addToCart(id) {
            const postData = new URLSearchParams();
            postData.append("productId", id);
            const response = await fetch('${pageContext.request.contextPath}/cart/add', {
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
         // Lắng nghe sự kiện click trên mỗi ngôi sao
         document.querySelectorAll('.star').forEach(function (star) {
            star.addEventListener('click', function () {
               // Cập nhật giá trị của input ẩn
               document.getElementById('rating').value = this.getAttribute('data-value');

               // Thay đổi màu của các ngôi sao
               let value = parseInt(this.getAttribute('data-value'));
               document.querySelectorAll('.star').forEach(function (star) {
                  let starValue = parseInt(star.getAttribute('data-value'));
                  if (starValue <= value) {
                     star.style.color = '#009981';
                  } else {
                     star.style.color = 'black';
                  }
               });
            });
         });
      </script>
      <script>
         // Lắng nghe sự kiện "change" của input file
         document.getElementById('imageInput').addEventListener('change', function (event) {
            var input = event.target;

            if (input.files && input.files[0]) {
               var reader = new FileReader();

               // Đọc tệp ảnh được chọn
               reader.onload = function (e) {
                  var previewImage = document.getElementById('preview');

                  // Hiển thị ảnh trước khi tải lên
                  previewImage.src = e.target.result;
               }

               // Đọc dữ liệu ảnh dưới dạng URL
               reader.readAsDataURL(input.files[0]);
            }
         });
      </script>

      <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
      <script src="${pageContext.request.contextPath}/js/price-range.js"></script>
      <script src="${pageContext.request.contextPath}/js/jquery.scrollUp.min.js"></script>
      <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
      <script src="${pageContext.request.contextPath}/js/jquery.prettyPhoto.js"></script>
      <script src="${pageContext.request.contextPath}/js/main.js"></script>
      <script src="https://kit.fontawesome.com/8922b65fb8.js" crossorigin="anonymous"></script>
   </body>
</html>


<%-- 
    Document   : home
    Created on : Feb 9, 2025, 1:16:53 AM
    Author     : naokh
--%>
<%@page import="java.util.List"%>
<%@page import="model.BlogPost"%>
<%@page import="model.BlogPost"%>
<%@page import="java.util.List, model.Slider"%>
<%
    List<Slider> sliders = (List<Slider>) request.getAttribute("sliders");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>Home | E-Shopper</title>
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
      <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/lelinh014756/fui-toast-js@master/assets/css/toast@1.0.1/fuiToast.min.css">
   </head><!--/head-->

   <body>
      <header id="header"><!--header-->
         <div class="header_top"><!--header_top-->
            <div class="container">
               <div class="row">
                  <div class="col-sm-6 ">
                     <div class="contactinfo">
                        <ul class="nav nav-pills">
                           <li><a href=""><i class="fa fa-phone"></i> +84 985 350 491</a></li>
                           <li><a href=""><i class="fa fa-envelope"></i> group3_shopmobile@gmail.com</a></li>
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

         <section>
            <div class="container">
               <div class="header-middle"><!--header-middle-->
                  <div class="container">
                     <div class="row">
                        <div class="col-sm-4">
                           <div class="logo pull-left">
                              <a href="HomePage"><img src="images/home/logo.png" alt="" /></a>
                           </div>
                           <div class="btn-group pull-right">
                              <div class="btn-group">
                                 <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                    USA
                                    <span class="caret"></span>
                                 </button>
                                 <ul class="dropdown-menu">
                                    <li><a href="#">Canada</a></li>
                                    <li><a href="#">UK</a></li>
                                 </ul>
                              </div>

                              <div class="btn-group">
                                 <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                    DOLLAR
                                    <span class="caret"></span>
                                 </button>
                                 <ul class="dropdown-menu">
                                    <li><a href="#">Canadian Dollar</a></li>
                                    <li><a href="#">Pound</a></li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                        <div class="col-sm-8">
                           <div class="shop-menu pull-right">
                              <ul class="nav navbar-nav">
                                 <li><a href="UserProfile.jsp"><i class="fa fa-user"></i> Account</a></li>
                                 <li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                                 <li><a href="CartViewController"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                    <c:if test="${account != null}">
                                    <li><a href="authen?action=logout"><i class="fa fa-lock"></i> Logout</a></li>
                                    </c:if>
                                    <c:if test="${account == null}">
                                    <li><a href="login.jsp"><i class="fa fa-lock"></i> Login</a></li>
                                    </c:if>
                                 <li><a href="regis.jsp"><i class="fa fa-shopping-cart"></i> Register</a></li>
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
                                 <li><a href="HomePage" class="active">Home</a></li>
                                 <li><a href="ProductList">Shop</a></li> 
                                 <li class="dropdown"><a href="#">Blog<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                       <li><a href="BlogPostList">Blog List</a></li>
                                    </ul>
                                 </li> 
                                 <li class="dropdown"><a href="customerList">Customer List</a>
                                 </li> 
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

               <section id="slider">
                  <div class="container">
                     <div class="row">
                        <div class="col-sm-12">
                           <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                              <div class="carousel-inner">
                                 <% for (int i = 0; i < sliders.size(); i++) { %>
                                 <div class="item <%= (i == 0) ? "active" : "" %>">
                                    <a href="Slider?sliderId=<%= sliders.get(i).getId() %>">
                                       <img src="<%= sliders.get(i).getImage() %>" class="img-responsive" alt="Slider Image" style="width:100%; height:auto;" />
                                    </a>
                                 </div>
                                 <% } %>
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


               <section>
                  <div class="container">
                     <div class="row">
                        <div class="col-sm-2">
                           <div class="left-sidebar">
                              <h2>Danh mục</h2>
                              <div class="panel-group category-products" id="accordian"><!--category-product-->
                                 <!-- lựa chọn tất cả, reset lại cái brand cho tất cả -->
                                 <div class="panel panel-default">
                                    <div class="panel-heading">
                                       <h4 class="panel-title">
                                          <a href="listProduct">
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
                              </div><!--/category-productsr-->
                              <div class="brands_products"><!--brands_products-->
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
                              </div><!--/brands_products-->

                              <div class="price-range"><!--price-range-->
                                 <h2>Khoảng giá</h2>
                                 <form action="searchProduct">
                                    <div style="width: 100%">
                                       <input type="hidden" name="action" value="searchByPrice"/>
                                       <input style="padding:0.5rem;width:100%" placeholder="Từ..."  type="text" name="fromPrice" class="span2" value="${sessionScope.fromP}" pattern="^\d+(\.\d+)?$" title="vui lòng nhập số" ><br />
                                       <input style="padding:0.5rem;width:100%;margin-top:6px;" placeholder="Đến..." type="text" name="toPrice" class="span2" value="${sessionScope.toP}"  pattern="^\d+(\.\d+)?$" title="vui lòng nhập số"  ><br />
                                       <button style="background-color: #009981;color:white;border: none;width:100%;padding:.5rem;" type="submit">Tìm kiếm</button>
                                    </div>
                                 </form>
                              </div><!--/price-range-->
                           </div>
                        </div>

                        <div class="col-sm-8 padding-right">
                           <div class="features_items"><!--features_items-->
                              <h2 class="title text-center">Sản phẩm</h2>
                              <h3>${requestScope.searchResult}</h3>

                              <div style="min-height: 800px;" class="col-md-12 product-list">
                                 <!-- JavaScript will insert product elements here -->
                              </div>
                              <ul class="pagination">
                                 <li class="active"><a href="">1</a></li>
                                 <li><a href="">2</a></li>
                                 <li><a href="">3</a></li>
                                 <li><a href="">&raquo;</a></li>
                              </ul>
                           </div><!--features_items-->
                        </div>
                        <div class="col-sm-2"> <!--hot_post-->
                           <div class="blog-post-area">
                              <h2 class="title text-center">Hot Blog</h2>
                              <c:forEach items="${list}" var="b">
                                 <div class="single-blog-post">
                                    <h3>${b.title}</h3>
                                    <div class="post-meta">
                                       <ul>
                                          <li><i class="fa fa-user"></i> ${b.getFull_name()}</li>
                                          <li><i class="fa fa-user"></i> ${b.getName()}</li>
                                          <li><i class="fa fa-calendar"></i> ${b.updatedDate}</li>                                    
                                       </ul>

                                    </div>
                                    <a href="">
                                       <img src="assets/img/blogImage/${b.thumbnail}" alt="">
                                    </a>
                                    <p>${b.brief_info}</p>

                                 </div>
                              </c:forEach>


                              <ul class="pagination justify-content-center">
                                 <c:if test="${pageIndex > 1}">
                                    <li class="page-item">
                                       <a class="page-link" href="BlogPostList?index=${pageIndex-1}">Previous</a>
                                    </li>
                                 </c:if>

                                 <c:forEach var="i" begin="1" end="${endPage}">
                                    <li class="page-item ${pageIndex == i?"active":""}"><a class="page-link" href="BlogPostList?index=${i}">${i}</a></li>                              
                                    </c:forEach>

                                 <c:if test="${pageIndex < endPage}">
                                    <li class="page-item">
                                       <a class="page-link" href="BlogPostList?index=${pageIndex+1}">Next</a>
                                    </li>
                                 </c:if>
                              </ul>
                           </div>
                        </div><!--hot_post-->

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
                        <section>
                           <div class="container">
                              <div class="row">
                                 <div class="col-sm-12">
                                    <div class="recommended_items"><!--recommended_items-->
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
                                                                     <a  onclick="addToCart(${latestP.ID})" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Mua ngay</a>
                                                                  </c:if>
                                                                  <c:if test="${sessionScope.user == null}">
                                                                     <a href="login.jsp"  class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Mua ngay</a>
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
                                                                     <a onclick="addToCart(${latestP.ID})" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Mua ngay</a>
                                                                  </c:if>
                                                                  <c:if test="${sessionScope.user == null}">
                                                                     <a href="login.jsp"  class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Mua ngay</a>
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

                                    <div class="col-sm-12">
                                       <div class="blog-post-area">
                                          <h2 class="title text-center">Latest Blog</h2>
                                          <c:forEach items="${list}" var="b">
                                             <div class="single-blog-post">
                                                <h3>${b.title}</h3>
                                                <div class="post-meta">
                                                   <ul>
                                                      <li><i class="fa fa-user"></i> ${b.getFull_name()}</li>
                                                      <li><i class="fa fa-user"></i> ${b.getName()}</li>
                                                      <li><i class="fa fa-calendar"></i> ${b.updatedDate}</li>                                    
                                                   </ul>

                                                </div>
                                                <a href="">
                                                   <img src="assets/img/blogImage/${b.thumbnail}" alt="">
                                                </a>
                                                <p>${b.brief_info}</p>
                                                <a class="btn btn-primary" href="BlogDetail?pid=${b.id}">Đọc Thêm</a>

                                             </div>
                                          </c:forEach>


                                          <ul class="pagination justify-content-center">
                                             <c:if test="${pageIndex > 1}">
                                                <li class="page-item">
                                                   <a class="page-link" href="BlogPostList?index=${pageIndex-1}">Previous</a>
                                                </li>
                                             </c:if>

                                             <c:forEach var="i" begin="1" end="${endPage}">
                                                <li class="page-item ${pageIndex == i?"active":""}"><a class="page-link" href="BlogPostList?index=${i}">${i}</a></li>                              
                                                </c:forEach>

                                             <c:if test="${pageIndex < endPage}">
                                                <li class="page-item">
                                                   <a class="page-link" href="BlogPostList?index=${pageIndex+1}">Next</a>
                                                </li>
                                             </c:if>
                                          </ul>
                                       </div>
                                    </div>
                                 </div>
                              </div><!--/recommended_items-->
                        </section>
                        <footer id="footer"><!--Footer-->
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
                                    <p class="pull-left">Copyright © 2013 E-SHOPPER Inc. All rights reserved.</p>
                                    <p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
                                 </div>
                              </div>
                           </div>

                        </footer><!--/Footer-->



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
                                 var productHtml = '<div class="col-md-4">' +
                                         '<a href="productDetail?bid=' + product.brandId + '&cid=' + product.ProductCategory_ID + '&pid=' + product.ID + '">' +
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
                                 productHtml += '<a onclick="addToCart(' + product.ID + ')" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Mua ngay</a>';
                                 productHtml += '<a onclick="addToCart(' + product.ID + ')" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Đánh giá</a>';

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
                        </body>
                        </html>

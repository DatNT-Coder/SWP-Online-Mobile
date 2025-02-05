<%-- 
    Document   : shop
    Created on : Feb 5, 2025, 12:51:19 PM
    Author     : tiend
--%>

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
    </head><!--/head-->

    <body>
        <header id="header"><!--header-->
            <div class="header_top"><!--header_top-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="contactinfo">
                                <ul class="nav nav-pills">
                                    <li><a href="#"><i class="fa fa-phone"></i> +2 95 01 88 821</a></li>
                                    <li><a href="#"><i class="fa fa-envelope"></i> info@domain.com</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="social-icons pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
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
                                    <li><a href="#"><i class="fa fa-user"></i> Account</a></li>
                                    <li><a href="#"><i class="fa fa-star"></i> Wishlist</a></li>
                                    <li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                                    <li><a href="cart.html"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                    <c:if test="${account != null}">
                                        <li><a href="authen?action=logout"><i class="fa fa-lock"></i> Logout</a></li>
                                    </c:if>
                                    <c:if test="${account == null}">
                                        <li><a href="login.jsp"><i class="fa fa-lock"></i> Login</a></li>
                                    </c:if>
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
                                    <li><a href="index.html" class="active">Home</a></li>
                                    <li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="shop.html">Products</a></li>
                                            <li><a href="product-details.html">Product Details</a></li> 
                                            <li><a href="checkout.html">Checkout</a></li> 
                                            <li><a href="cart.html">Cart</a></li> 
                                            <li><a href="login.html">Login</a></li> 
                                        </ul>
                                    </li> 
                                    <li class="dropdown"><a href="#">Blog<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="blog.html">Blog List</a></li>
                                            <li><a href="blog-single.html">Blog Single</a></li>
                                        </ul>
                                    </li> 
                                    <li><a href="404.html">404</a></li>
                                    <li><a href="contact-us.html">Contact</a></li>
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

      <section id="advertisement">
            <div class="container">
                <img src="images/shop/advertisement.png" alt="" />
            </div>
        </section>
       <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
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
                            
                            <div class="shipping text-center"><!--shipping-->
                                <img src="images/home/shipping.jpg" alt="" />
                            </div><!--/shipping-->

                        </div>
                    </div>
                   
                    <div class="col-sm-9 padding-right">
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
                                                                <h2>$${latestP.originalPrice}</h2>
                                                                <p>${latestP.name}</p>
                                                                <c:if test="${sessionScope.user != null}">

                                                                    <a  onclick="addToCart(${latestP.ID})" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Mua ngay</a>

                                                                </c:if>
                                                                <c:if test="${sessionScope.user == null}">
                                                                    <a href="signIn.jsp"  class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Mua ngay</a>

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
                                                                    <a href="signIn.jsp"  class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Mua ngay</a>


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
                        </div><!--/recommended_items-->
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
                                    <li><a href="#">Online Help</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                    <li><a href="#">Order Status</a></li>
                                    <li><a href="#">Change Location</a></li>
                                    <li><a href="#">FAQ’s</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Quock Shop</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">T-Shirt</a></li>
                                    <li><a href="#">Mens</a></li>
                                    <li><a href="#">Womens</a></li>
                                    <li><a href="#">Gift Cards</a></li>
                                    <li><a href="#">Shoes</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Policies</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Terms of Use</a></li>
                                    <li><a href="#">Privecy Policy</a></li>
                                    <li><a href="#">Refund Policy</a></li>
                                    <li><a href="#">Billing System</a></li>
                                    <li><a href="#">Ticket System</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>About Shopper</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Company Information</a></li>
                                    <li><a href="#">Careers</a></li>
                                    <li><a href="#">Store Location</a></li>
                                    <li><a href="#">Affillate Program</a></li>
                                    <li><a href="#">Copyright</a></li>
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
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        
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


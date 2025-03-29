

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Sản phẩm</title>
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
    </head>
    <body>
        <div id="fui-toast"></div>
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

            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left">
                                <a href="Home "><img src="images/home/logo.png" alt="" /></a>
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
                                    <c:if test="${sessionScope.user != null}">
                                    <li><a href="${pageContext.request.contextPath}/user/orders"><i class="fa fa-star"></i> Đơn Mua</a></li>
                                    </c:if>
                                    <li><a href="CartViewController"><i class="fa fa-shopping-cart"></i> Giỏ Hàng</a></li>
                                    
                                        <c:choose>
                                           <c:when test="${sessionScope.user == null}">
                                            <li><a href="login.jsp"><i class="fa fa-lock"></i> Đăng Nhập</a></li>
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
                                    <li><a href="HomePage" class="active">Trang Chủ</a></li>
                                    
                                    <li class="dropdown"><a href="#">Bài Đăng<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="BlogPostList">Danh sách Bài Đăng</a></li>

                                        </ul>
                                    </li> 


                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class=" pull-right" style="margin-bottom: 10px;">
                                <form action="searchProduct">
                                    <input type="hidden" name="action" value="searchByWord"/>
                                    <input name="searchBox" type="text" placeholder="Mô tả, tên sản phẩm..." required=""/>
                                    <button type="submit" value="search">Tìm kiếm</button>
                                </form> 
                            </div>
                        </div>
                        <div class="pull-right" style="white-space: nowrap;">
    <label for="sortPrice" style="display: inline; font-weight: bold;">Sắp xếp theo giá:</label>
    <select id="sortPrice" onchange="sortProducts()" style="display: inline; width: auto; padding: 5px;">
        <option value="default">Mặc định</option>
        <option value="asc">Giá tăng dần</option>
        <option value="desc">Giá giảm dần</option>
    </select>
</div>

                        <div class="col-sm-3">
    
</div>

                    </div>
                </div>
            </div>
        </header>

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
                                <img src="images/home/shipping.png" alt="" />
                            </div><!--/shipping-->

                        </div>
                    </div>
                    <!-- Add to cart thì xuống phần script ở dưới nhé -->
                    <!-- Product detail thì xuống phần script ở dưới nhé -->
                    <!-- check script below to check how to pagination with Jquery -->
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

                                                                    <a  onclick="addToCart(${latestP.ID})" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>

                                                                </c:if>
                                                                <c:if test="${sessionScope.user == null}">
                                                                    <a href="login.jsp"  class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>

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

                                                                    <a onclick="addToCart(${latestP.ID})" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>

                                                                </c:if>
                                                                <c:if test="${sessionScope.user == null}">
                                                                    <a href="login.jsp"  class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>


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
                                    <button style="background-color: " type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
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
                        <p class="pull-left">Copyright © 2024. All rights reserved.</p>
                        <p class="pull-right">Designed by <span><a target="_blank" href=""></a></span></p>
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
        <script type="text/javascript" src="https://cdn.jsdelivr.net/gh/lelinh014756/fui-toast-js@master/assets/js/toast@1.0.1/fuiToast.min.js"></script>
        <!-- script for pagination,nhét vào cuối cùng sau tất cả các script.-->



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
    var productRatings = {};

    try {
        productRatings = JSON.parse(productRatingsJSON.trim());
        console.log("Product Ratings:", productRatings);
    } catch (e) {
        console.error("Lỗi khi parse productRatingsJSON:", e.message);
    }

    var currentPage = 1; // Current page
    var itemsPerPage = 6; // Number of items per page
    var isLoggedIn = ${sessionScope.user != null ? 'true' : 'false'};

    // Display products for the current page
    function displayProducts() {
        var start = (currentPage - 1) * itemsPerPage;
        var end = start + itemsPerPage;
        var productsToDisplay = products.slice(start, end);

        // Clear the current products
        $('.product-list').empty();

        // Add each product
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

           productHtml += '<div style="display: flex; align-items: center; width: 100%;">' + 
    '<a onclick="' + (isLoggedIn ? 'addToCart(' + product.ID + ')' : 'redirectToLogin()') + '" class="btn btn-default add-to-cart" style="flex: 1; text-align: center; margin-right: 0px;">' +
        '<i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng' +
    '</a>' +
    (productRatings[product.ID] != null && productRatings[product.ID] != '0'
        ? '<a class="btn btn-default add-to-cart" style="cursor: default; flex: 0 0 auto; text-align: center; margin-left: 0px;">' 
          + productRatings[product.ID] + ' ★</a>'
        : '') +
'</div>';



productHtml += '</div></div></div></a></div>';
$('.product-list').append(productHtml);

        });
    }
function redirectToLogin() {
                    window.location.href="authen?action=login";
                }
    // Update the pagination links
    function updatePagination() {
        var totalPages = Math.ceil(products.length / itemsPerPage);

        $('.pagination').empty();

        var prevClass = currentPage === 1 ? 'disabled' : '';
        $('.pagination').append('<li class="' + prevClass + '"><a href="#">Trước</a></li>');

        for (var i = 1; i <= totalPages; i++) {
            var liClass = i === currentPage ? 'active' : '';
            $('.pagination').append('<li class="' + liClass + '"><a href="#">' + i + '</a></li>');
        }

        var nextClass = currentPage === totalPages ? 'disabled' : '';
        $('.pagination').append('<li class="' + nextClass + '"><a href="#">Sau</a></li>');

        $('.pagination a').click(function (e) {
            e.preventDefault();

            var pageText = $(this).text();

            if (pageText === 'Trước' && currentPage !== 1) currentPage--;
            else if (pageText === 'Sau' && currentPage !== totalPages) currentPage++;
            else if (!isNaN(pageText)) currentPage = parseInt(pageText);

            displayProducts();
            updatePagination();
        });
    }

    function sortProducts() {
        var sortBy = $('#sortPrice').val();

        if (sortBy === 'asc') {
            products.sort(function (a, b) {
                return a.salePrice - b.salePrice;
            });
        } else if (sortBy === 'desc') {
            products.sort(function (a, b) {
                return b.salePrice - a.salePrice;
            });
        } else {
            products = JSON.parse('${listProduct}');
        }

        displayProducts();
        updatePagination();
    }

    function searchProducts() {
        var searchText = $('#searchInput').val().toLowerCase();
        
        // Lọc sản phẩm theo tên sản phẩm
        products = products.filter(function (product) {
            return product.name.toLowerCase().includes(searchText);
        });

        currentPage = 1;
        displayProducts();
        updatePagination();
    }

    $('#searchButton').click(searchProducts);

    displayProducts();
    updatePagination();
</script>


    </body>
</html>

<%-- 
    Document   : ProductDetail
    Created on : Feb 21, 2025, 9:41:16 AM
    Author     : tiend
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head><!--/head-->
    <style>
        .product-information h4,
        .product-information h5 {

            margin: 0;
            padding-right: 20px;
            padding-bottom: 5px;
            display: inline-block; /* hoặc sử dụng display: inline; tùy thuộc vào yêu cầu của bạn */
        }

        .product-information h5 s {
            text-decoration: line-through;
        }
    </style>
    <style>
        .rating {
            unicode-bidi: bidi-override;
            direction: rtl;
            font-size: 24px;
        }
        .rating > span {
            display: inline-block;
            position: relative;
            cursor: pointer;
        }
        .rating > span:hover,
        .rating > span:hover ~ span {
            color: gold;
        }
    </style>
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
                                <a href="HomePage"><img src="images/home/logo.png" alt="" /></a>
                            </div>              
                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    
                                    <li><a href="checkout.html"><i class="fa fa-crosshairs"></i> Thanh Toán</a></li>
                                    <li><a href="CartViewController"><i class="fa fa-shopping-cart"></i> Giỏ Hàng</a></li>
                                        <c:choose>
                                           <c:when test="${sessionScope.user == null}">
                                            <li><a href="login.jsp"><i class="fa fa-lock"></i> Đăng Nhập</a></li>
                                            </c:when>
                                            <c:otherwise>
                                            <li><a href="authen?action=logout"><i class="fa-solid fa-right-from-bracket"></i> Đăng Xuất</a></li>
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
                                    <li class="dropdown"><a href="ProductList">Cửa Hàng<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="ProductList">Sản Phẩm</a></li>
                                                
                                        </ul>
                                    </li> 
                                    <li class="dropdown"><a href="#">Bài Đăng<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="BlogPostList">Danh sách Bài Đăng</a></li>

                                        </ul>
                                    </li> 

                                    <li><a href="contact-us.html">Liên Hệ</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class=" pull-right">
                                <form action="HomeCategory">
                                    <input type="hidden" name="action" value="searchByWord"/>
                                    <input name="searchBox" type="text" placeholder="Tìm kiếm..." required=""/>
                                    <button type="submit" value="search">Tìm kiếm</button>
                                </form> 
                            </div>
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
                                        <button style="background-color: #009981;color:white;border: none;width:100%;padding:.5rem;" type="submit">Tìm kiếm</button>
                                    </div>
                                </form>

                            </div><!--/price-range-->

                            <div class="shipping text-center"><!--shipping-->
                                <img src="${pageContext.request.contextPath}/images/home/shipping.png" alt="" />
                            </div><!--/shipping-->

                        </div>
                    </div>

                    <div class="col-sm-9 padding-right">
                        <div class="product-details"><!--product-details-->
                            <div class="col-sm-5">
                                <div class="view-product">
                                    <img src="${pageContext.request.contextPath}/assets/img/productImage/${productDetail.image}" alt="" style="object-fit: contain;" />
                                </div>
                                <div id="similar-product" class="carousel slide" data-ride="carousel">
                                </div>
                            </div>
                            <div class="col-sm-7">
                                <div class="product-information"><!--/product-information-->
                                    <h2>${productDetail.name}</h2>
                                    <p>ID: ${productDetail.ID}</p>
                                    <p><b>Loại sản phẩm:</b>${productDetail.categoryName}</p>
                                    <span>
                                        <h5><s> US $${productDetail.originalPrice}</s></h5>
                                        <h4 id="salePrice"> US $${productDetail.salePrice}</h4>
                                        <div>
                                            <label for="quantityInput">Số lượng: </label>
                                            <input type="number" id="quantityInput" name="quantity" value="1" min="1">
                                        </div>

                                        <a  onclick="addToCart(${productDetail.ID})" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                    </span>

                                    <a href=""><img src="${pageContext.request.contextPath}/images/product-details/share.png" class="share img-responsive"  alt="" /></a>
                                </div><!--/product-information-->
                            </div>
                        </div><!--/product-details-->

                        <div class="category-tab shop-details-tab"><!--category-tab-->
                            <div class="col-sm-12">
                                <ul class="nav nav-tabs">
                                    <li><a href="#details" data-toggle="tab">Chi tiết</a></li>
                                    <li class="active"><a href="#reviews"  data-toggle="tab">Đánh giá</a></li>
                                </ul>
                            </div>
                            
                            <div class="tab-content">
                                <div class="tab-pane fade" id="details" >
                                    <div class="col-sm-12">
                                        <p>${productDetail.details}</p>

                                    </div>
                                </div>


                                <c:if test="${sessionScope.profileUser.role_id == 1}">
                                    <div class="col-sm-12">
                                        <p><b>Viết đánh giá của bạn</b></p>
                                        <form action="ProductDetails" method="POST" enctype="multipart/form-data">
                                            <input type="hidden" name="pickedProduct" value="${productDetail.ID}">
                                            <div class="form-group" style="display: flex; justify-content: space-between;">
                                                <div style="width: 48%;">
                                                    <label for="name">Họ và tên</label>
                                                    <input name="full_name" style="width: 100%;" type="text" class="form-control" id="name" value="${sessionScope.user.full_name}" readonly required="">
                                                </div>
                                                <div style="width: 48%;">
                                                    <label for="address">Email</label>
                                                    <input name="email" style="width: 100%;" type="text" class="form-control" id="address" value="${sessionScope.user.email}" readonly required="">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="phone">Số điện thoại</label>
                                                <input style="width: 48%;"  name="phone" style="width: 50%;" type="tel" class="form-control" id="phone" value="${sessionScope.user.phone}" readonly required="">
                                            </div>
                                            <div class="form-group">
                                                <label>Giới Tính</label>
                                                <div>
                                                    <input <c:if test="${sessionScope.user.gender == 'Male'}">checked</c:if> required="" type="radio" id="html" name="gender" value="Male" required="">
                                                        <label class="form-label">Nam</label>
                                                        <input <c:if test="${sessionScope.user.gender == 'Female'}">checked</c:if> required="" type="radio" id="html" name="gender" value="Female" required="">
                                                        <label class="form-label">Nữ</label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Đánh giá:  </label>
                                                    <div name="rating" class="rating" style="
                                                         position: absolute;
                                                         display: flex;
                                                         top: 237px;
                                                         left: 66px;
                                                         ">
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
                                                    <textarea name="comment"   style="width: 80%;"  class="form-control" id="feedback" rows="3" required=""></textarea>
                                                    <h5 class="mt-3">Ảnh phản hồi:</h5>
                                                    <div class="d-flex justify-content-center align-items-center">
                                                        <img style="width: 400px;" id="preview" alt="ảnh phản phản hồi" src="" class="img-thumbnail"/>
                                                    </div>
                                                    <div class="d-flex justify-content-center align-items-center mt-3">
                                                        <input required type="file" id="imageInput" name="feedbackImage" accept="image/*">
                                                    </div>
                                                </div>
                                                <input type="hidden" name="product_id" value="${sessionScope.pickedProduct}">
                                            <button style="background-color: #009981; margin-bottom: 20px;" type="submit" class="btn btn-primary">Gửi Đánh Giá</button>
                                        </form>
                                    </div>
                                </c:if>
                                <div class="tab-pane fade active in" id="reviews" >

                                    <div>

                                    </div>      
                                    <div class="listFeedback" style="position: relative;"></div>

                                    <c:forEach items="${requestScope.listFeedback}" var="listFeedback" varStatus="loop">
                                        <c:if test="${listFeedback.status == 1 && listFeedback.imageStatus == 1}">
                                            <hr>
                                            <div>
                                                <div>
                                                    <ul>
                                                        <li><a href=""><i style="color: #009981;" class="fa fa-user"></i>${listFeedback.full_name}</a></li>
                                                    </ul>
                                                    <label>Ảnh phản hồi:</label>
                                                    <div class="d-flex justify-content-center align-items-center">
                                                        <img style="width: 220px; height: 130px;" id="preview" src="./assets/img/feedbackImage/${listFeedback.image}" alt="ảnh phản hồi" class="img-thumbnail"/>
                                                    </div>
                                                    <div name="rating">
                                                        <c:forEach begin="1" end="${listFeedback.rating}">
                                                            <span class="star" style="color: #009981;">☆</span>
                                                        </c:forEach>
                                                    </div>
                                                    <label>Phản hồi của khách hàng:</label>
                                                    <p>${listFeedback.comment}</p>
                                                </div> 
                                            </div>
                                            <hr>

                                        </c:if>
                                        <c:if test="${listFeedback.status == 1 && listFeedback.imageStatus == 0}">
                                            <hr>
                                            <div>
                                                <div>
                                                    <ul>
                                                        <li><a href=""><i style="color: #009981;" class="fa fa-user"></i>${listFeedback.full_name}</a></li>
                                                    </ul>

                                                    <div name="rating">
                                                        <c:forEach begin="1" end="${listFeedback.rating}">
                                                            <span class="star" style="color: #009981;">☆</span>
                                                        </c:forEach>
                                                    </div>
                                                    <label>Phản hồi của khách hàng:</label>
                                                    <p>${listFeedback.comment}</p>
                                                </div> 
                                            </div>
                                            <hr>

                                        </c:if>
                                    </c:forEach>

                                </div>
                            </div>
                        </div><!--/category-tab-->
                        <div class="recommended_items"><!--recommended_items-->
                            <h2 style="margin-top: 5px;" class="title text-center">Sản phẩm mới nhất</h2>

                            <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <c:forEach begin="0" end="2" items="${requestScope.latestP}" var="latestP">
                                            <div class="col-sm-4">
                                                <a href="ProductDetails?pid=${latestP.ID}">
                                                    <div class="product-image-wrapper">
                                                        <div class="single-products">

                                                            <div class="productinfo text-center">
                                                                <img style="width: 200px;height: 200px;object-fit: contain;" src="${pageContext.request.contextPath}/assets/img/productImage/${latestP.image}" alt="" />
                                                                <h2>$${latestP.originalPrice}</h2>
                                                                <p>${latestP.name}</p>
                                                                <a href="CartViewController" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
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
                                                <a href="ProductDetails?pid=${latestP.ID}">
                                                    <div class="product-image-wrapper">
                                                        <div class="single-products">

                                                            <div class="productinfo text-center">

                                                                <img style="width: 200px;height: 200px;object-fit: contain;" src="${pageContext.request.contextPath}/assets/img/productImage/${latestP.image}" alt="" />
                                                                <h2>${latestP.originalPrice}</h2>
                                                                <p>${latestP.name}</p>
                                                                <a href="CartViewController" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
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
                                            <img src="${pageContext.request.contextPath}/images/home/iframe1.png" alt="" />
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
                                            <img src="${pageContext.request.contextPath}/images/home/iframe2.png" alt="" />
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
                                            <img src="${pageContext.request.contextPath}/images/home/iframe3.png" alt="" />
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
                                            <img src="${pageContext.request.contextPath}/images/home/iframe4.png" alt="" />
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
                                <img src="${pageContext.request.contextPath}/images/home/map.png" alt="" />
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
                                    <button style="background-color: #009981" type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
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


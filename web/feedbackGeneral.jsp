<%-- 
    Document   : feedbackGeneral
    Created on : Feb 21, 2025, 9:02:30 PM
    Author     : tiend
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Đánh giá chung</title>
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
        <!--        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">-->
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
    </head>
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
                                    <li><a href="user-profile"><i class="fa fa-user"></i> Tài Khoản</a></li>
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
                                    <li><a href="HomePage" class="active">Trang Chủ</a></li>
                                    <li class="dropdown"><a href="listProduct">Cửa Hàng<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="listProduct">Sản Phẩm</a></li>
                                                <c:choose>
                                                    <c:when test="${sessionScope.email == null || sessionScope.pass == null}">
                                                    <li><a href="signIn.jsp">Đăng Nhập</a></li> 
                                                    </c:when>
                                                    <c:otherwise>
                                                    <li><a href="logOut.jsp">Đăng Xuất</a></li>

                                                </c:otherwise>
                                            </c:choose>
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
                            <h2>Danh Mục</h2>
                            <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                <!-- lựa chọn tất cả, reset lại cái brand cho tất cả -->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a href="HomePage">
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
                                                    <a style="color: #FE0F9E;"  href="HomeCategory?action=pickCategory&cid=${listPC.id}">
                                                        <span class="badge pull-right"></span>
                                                        ${listPC.categoryName}
                                                    </a>
                                                </c:if>
                                                <c:if test="${listPC.id != sessionScope.pickedCategory}">
                                                    <a href="HomeCategory?action=pickCategory&cid=${listPC.id}">
                                                        <span class="badge pull-right"></span>
                                                        ${listPC.categoryName}
                                                    </a>
                                                </c:if>

                                            </h4>
                                        </div>
                                    </div>
                                </c:forEach>


                            </div><!--/category-products-->

                            <div class="brands_products"><!--brands_products-->
                                <h2>Thương hiệu</h2>
                                <div class="brands-name">
                                    <ul class="nav nav-pills nav-stacked">
                                        <c:forEach items="${requestScope.listBrand}" var="listBrand">
                                            <c:if test="${listBrand.brandID == sessionScope.pickedBrand}">
                                                <li><a style="color: #FE0F9E;" href="HomeCategory?action=pickBrand&brandId=${listBrand.brandID}"> <span class="pull-right"></span>${listBrand.brandName}</a></li>
                                                    </c:if>
                                                    <c:if test="${listBrand.brandID != sessionScope.pickedBrand}">
                                                <li><a href="HomeCategory?action=pickBrand&brandId=${listBrand.brandID}"> <span class="pull-right"></span>${listBrand.brandName}</a></li>
                                                    </c:if> 
                                                </c:forEach>

                                    </ul>
                                </div>
                            </div><!--/brands_products-->

                            <div class="price-range"><!--price-range-->
                                <h2>Khoảng giá</h2>
                                <form action="HomeCategory">
                                    <div style="width: 100%">
                                        <input type="hidden" name="action" value="searchByPrice"/>
                                        <input style="padding:0.5rem;width:100%" placeholder="Từ..."  type="text" name="fromPrice" class="span2" value="${sessionScope.fromP}" pattern="^\d+(\.\d+)?$" title="vui lòng nhập số" ><br />
                                        <input style="padding:0.5rem;width:100%;margin-top:6px;" placeholder="Đến..." type="text" name="toPrice" class="span2" value="${sessionScope.toP}"  pattern="^\d+(\.\d+)?$" title="vui lòng nhập số"  ><br />
                                        <button style="background-color: #FE0F9E;color:white;border: none;width:100%;padding:.5rem;" type="submit">Tìm kiếm</button>
                                    </div>
                                </form>

                            </div><!--/price-range-->

                            <div class="shipping text-center"><!--shipping-->
                                <img src="images/home/shipping.jpg" alt="" />
                            </div><!--/shipping-->

                        </div>
                    </div>

                    <div class="col-sm-9 padding-right">
                        <div class="container mt-5">
                            <h2 style="color: #fe0f9e">ĐÁNH GIÁ CHUNG</h2>
                            <form action="feedback" method="POST">
                                <div class="form-group">
                                    <label for="name">Họ và tên</label>
                                    <input name="full_name" style="width: 50%;" type="text" class="form-control" id="name" value="${sessionScope.user.full_name}" readonly required="">
                                </div>
                                <div class="form-group">
                                    <label for="address">Email</label>
                                    <input name="email" style="width: 50%;" type="text" class="form-control" id="address" value="${sessionScope.user.email}" readonly required="">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Số điện thoại</label>
                                    <input name="phone" style="width: 50%;" type="tel" class="form-control" id="phone" value="${sessionScope.user.phone}" readonly required="">
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
                                         display: block;
                                         top: 344px;
                                         left: 99px;
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
                                    <textarea name="comment"   style="width: 50%;"  class="form-control" id="feedback" rows="3" required=""></textarea>
                                </div>
                                <button style="background-color: #009981;" type="submit" class="btn btn-primary">Gửi Đánh Giá</button>
                            </form>
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


        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <script src="https://kit.fontawesome.com/8922b65fb8.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/8922b65fb8.js" crossorigin="anonymous"></script>
        <script>
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
                            star.style.color = 'orange';
                        } else {
                            star.style.color = 'black';
                        }
                    });
                });
            });
        </script>
    </body>
</html>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Cart | E-Shopper</title>
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
        <link rel="stylesheet" href="http://cdn.datatables.net/2.0.0/css/dataTables.dataTables.min.css"/><link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/lelinh014756/fui-toast-js@master/assets/css/toast@1.0.1/fuiToast.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/lelinh014756/fui-toast-js@master/assets/css/toast@1.0.1/fuiToast.min.css">
    </head><!--/head-->

    <body>
        <div id="fui-toast"></div>
        <header id="header"><!--header-->
            <div class="header_top"><!--header_top-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 ">
                            <div class="contactinfo">
                                <ul class="nav nav-pills">
                                    <li><a href=""><i class="fa fa-phone"></i> </a></li>
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
                                <a href="index.html"><img src="images/home/logo.png" alt="" /></a>
                            </div>

                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <li class="dropdown">
                                        <a href="${pageContext.request.contextPath}/user-profile">
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
                                    <li><a href="/ProjectSWP391/customer/cart/contact"><i class="fa fa-crosshairs"></i> Thanh Toán</a></li>
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
                                    <li><a href="HomePage">Trang chủ</a></li>
                                    <li class="dropdown"><a href="/ProjectSWP391/HomePage" class="active">Cửa hàng<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="/ProjectSWP391/ProductList" class="active">Sản phẩm</a></li>

                                        </ul>
                                    </li> 
                                    <li class="dropdown"><a href="/ProjectSWP391/BlogPostList">Bài Đăng<i class="fa fa-angle-down"></i></a>

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

        <section id="cart_items">
            <div class="container">
                <div class="breadcrumbs">
                    <ol style="color: #009981;" class="breadcrumb">

                    </ol>
                </div>
                <div style="color: #009981;" class="table-responsive cart_info">
                    <form id="cart-form" action="${pageContext.request.contextPath}/customer/cart/contact" method="POST">
                        <table class="table table-condensed">
                            <thead>
                                <tr class="cart_menu">
                                    <td></td> <!-- Cột mới cho checkbox -->
                                    <td class="image">Sản phẩm</td>
                                    <td class="description"></td>
                                    <td class="price">Giá tiền</td>
                                    <td class="quantity">Số Lượng</td>
                                    <td class="total">Tổng Giá</td>
                                    <td></td>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach var="item" items="${cart}">
                                    <tr id="item-${item.productId}">
                                        <td class="cart_select">
                                            <input type="checkbox" name="selectedProducts" value="${item.productId}">
                                        </td>

                                        <td class="cart_product">
                                            <a href=""><img style="max-height: 100px;" src="${pageContext.request.contextPath}/assets/img/productImage/${item.image}" alt=""></a>
                                        </td>
                                        <td class="cart_description">
                                            <h4><a href="">${item.name}</a></h4>
                                        </td>
                                        <td class="cart_price">
                                            <p id="item-price-${item.productId}">$${item.price}</p>
                                        </td>
                                        <td class="cart_quantity">
                                            <div class="cart_quantity_button">
                                                <a onclick="updateQuantity('${item.productId}', -1)" class="cart_quantity_down"> - </a>
                                                <input readOnly id="item-quantity-${item.productId}" class="cart_quantity_input" type="text" name="quantity" value="${item.quantity}" autocomplete="off" size="2">
                                                <a onclick="updateQuantity('${item.productId}', 1)" class="cart_quantity_up"> + </a>
                                            </div>
                                        </td>
                                        <td class="cart_total">
                                            <p id="item-total-${item.productId}" class="cart_total_price">$${item.total}</p>
                                        </td>
                                        <td class="cart_delete">
                                            <a onclick="updateQuantity('${item.productId}', 0)" class="cart_quantity_delete"><i class="fa fa-times"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    <script>
                        async function updateQuantity(productId, amount) {
                            const quantityDiv = document.getElementById('item-quantity-' + productId);

                            if (!document.querySelector('.cart_info table tbody tr')) {
                                await FuiToast.error('Your cart is empty. Add items to your cart before updating quantities.');
                                return false;
                            }
                            const postData = new URLSearchParams();
                            postData.append("productId", productId);
                            if (amount === 0) {
                                const confirmDelete = confirm('Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng không?');
                                if (!confirmDelete) {
                                    return false; // Người dùng không xác nhận xóa
                                }
                                postData.append("amount", -quantityDiv.value);
                            } else {
                                postData.append("amount", amount);
                            }
                            const response = await fetch('${pageContext.request.contextPath}/customer/cart/update', {
                                method: "POST",
                                body: postData
                            });
                            const data = await response.json();
                            const status = data.status;

                            console.log(data);
                            if (status === 'successed') {
                                const newQuantity = data.quantity;
                                if (+newQuantity === 0) {
                                    document.getElementById('item-' + productId).remove();
                                    await FuiToast.success('Đã xóa sản phẩm!');
                                    return false;
                                }
                                const price = data.price;
                                const total = data.total;
                                const priceDiv = document.getElementById('item-price-' + productId);
                                const totalDiv = document.getElementById('item-total-' + productId);
                                quantityDiv.value = newQuantity;
                                priceDiv.innerHTML = '$' + price;
                                totalDiv.innerHTML = '$' + total;
//                                await FuiToast.success('Vượt quá số lượng sản phẩm trong kho!');
                            } else {
                                await FuiToast.error('Update product quantity failed!');
                            }
                            return false;
                        }
                    </script>

                </div>
                <div  class="row">
                    <div class="col" style="color: #FE0F9E; display: flex; justify-content: center; margin-top: -20px; margin-bottom: 30px;">

                        <a  href="${pageContext.request.contextPath}/customer/cart/contact" class="btn btn-default add-to-cart" href="">Đi đến thanh toán</a>
                    </div>
                </div>
            </div>
        </section> <!--/#cart_items-->


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
                        <p class="pull-left">Copyright © 2025 . All rights reserved.</p>
                        <p class="pull-right">Designed by <span><a target="_blank" href=""></a></span></p>
                    </div>
                </div>
            </div>

        </footer><!--/Footer-->



        <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.scrollUp.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.prettyPhoto.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
        <script src="https://cdn.datatables.net/2.0.0/js/dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/gh/lelinh014756/fui-toast-js@master/assets/js/toast@1.0.1/fuiToast.min.js"></script>
        <script>

        </script>
    </body>
</html>

<%-- 
    Document   : user-order-detail
    Created on : Mar 11, 2025, 4:20:55 PM
    Author     : Asus
--%>

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
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
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
                                <a href="Home"><img src="images/home/logo.png" alt="" /></a>
                            </div>              
                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href="${pageContext.request.contextPath}/user-profile"><i class="fa fa-user"></i> Tài Khoản</a></li>
                                    <c:if test="${sessionScope.user != null}">
                                    <li><a href="${pageContext.request.contextPath}/user/orders"><i class="fa fa-star"></i> Đơn Mua</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.user == null}">
                                    
                                    </c:if>
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
                                    <li><a href="Home" class="active">Trang Chủ</a></li>
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

<%--
    Document   : sidebar
    Created on : Mar 2, 2025, 9:03:14 PM
    Author     : tiend
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="sidebar">
    <div class="user-avatar">
        <img src="${pageContext.request.contextPath}/img/${sessionScope.user.image}" alt="User Avatar">
        
                
        <p style="color: white">Welcome, ${sessionScope.user.full_name}</p>

        <p style="color: white"><a href="/ProjectSWP391/HomePage">Back to home</a></p>

    </div>
    <h2>Marketing</h2>
    <ul>
        <!--        <li><a href="/ProjectSWP391/marketing/MKTDashboardController">Thống kê</a></li>
                <li><a href="/ProjectSWP391/marketing/listPostMarketing">Danh sách bài đăng</a></li>
                <li><a href="/ProjectSWP391/marketing/listProductMarketing">Danh sách sản phẩm</a></li>
                <li><a href="/ProjectSWP391/marketing/listSliderMarketing">Danh sách Slider</a></li>
                <li><a href="/ProjectSWP391/marketing/listCustomerMarketing">Danh sách khách hàng</a></li>-->
        <li><a href="/ProjectSWP391/marketing/listFeedbackMarketing">Danh sách phản hồi</a></li>
        <li><a href="/ProjectSWP391/slider-list">Danh sách slider</a></li>
        <li><a href="/ProjectSWP391/product-listAdmin">Danh sách sản phẩm</a></li>
        <li><a href="/ProjectSWP391/blog-list">Danh sách bài đăng</a></li>
        <li><a href="/ProjectSWP391/customerList">Danh sách người dùng</a></li>
    </ul>
</div>
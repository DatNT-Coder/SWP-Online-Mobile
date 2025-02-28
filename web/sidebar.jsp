<%-- 
    Document   : sidebar
    Created on : 22 Feb, 2024, 8:07:22 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="sidebar">
    <div class="user-avatar">
        <img src="${pageContext.request.contextPath}/img/${sessionScope.user.image}" alt="User Avatar">
        <c:choose>
            <c:when test="${sessionScope.email == null || sessionScope.pass == null}">
                <li><a href="signIn.jsp"><i class="fa fa-lock"></i> Đăng Nhập</a></li>
                </c:when>
                <c:otherwise>
                <li><a href="/mobileshop/logOut.jsp"><i class="fa-solid fa-right-from-bracket"></i> Đăng Xuất</a></li>
                </c:otherwise>
            </c:choose>
        <p style="color: white">Welcome, ${sessionScope.user.full_name}</p>

        <p style="color: white"><a href="/mobileshop/Home">Back to home</a></p>

    </div>
    <h2>Marketing</h2>
    <ul>
        <li><a href="/mobileshop/marketing/MKTDashboardController">Thống kê</a></li>
        <li><a href="/mobileshop/marketing/listPostMarketing">Danh sách bài đăng</a></li>
        <li><a href="/mobileshop/marketing/listProductMarketing">Danh sách sản phẩm</a></li>
        <li><a href="/mobileshop/marketing/listSliderMarketing">Danh sách Slider</a></li>
        <li><a href="/mobileshop/marketing/listCustomerMarketing">Danh sách khách hàng</a></li>
        <li><a href="/mobileshop/marketing/listFeedbackMarketing">Danh sách phản hồi</a></li>

    </ul>
</div>

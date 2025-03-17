<%-- 
    Document   : Admin_sidebar
    Created on : Mar 15, 2025, 11:17:58 PM
    Author     : tiend
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="sidebar">
    <div class="user-avatar">
        <img src="${pageContext.request.contextPath}/assets/img/ProfilePicture/${sessionScope.user.image}" alt="User Avatar">
        <c:choose>
            <c:when test="${sessionScope.email == null || sessionScope.pass == null}">
                <li><a href="signIn.jsp"><i class="fa fa-lock"></i> Đăng Nhập</a></li>
                </c:when>
                <c:otherwise>
                <li><a href="/mobileshop/logOut.jsp"><i class="fa-solid fa-right-from-bracket"></i> Đăng Xuất</a></li>
                </c:otherwise>
            </c:choose>
        <p style="color: white">Welcome, ${sessionScope.user.full_name}</p>

        <p style="color: white"><a href="HomePage">Back to home</a></p>

    </div>
    <h2>Admin</h2>
    <ul>
        <li><a href="/mobileshop/admin/adminDashBoard">Thống kê</a></li>
        <li><a href="/mobileshop/admin/listSettingAdmin">Danh sách cài đặt</a></li>
        <li><a href="admin/udashboard">Danh sách người dùng</a></li>
    </ul>
</div>


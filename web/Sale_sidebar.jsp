<%-- 
    Document   : Sale_sidebar
    Created on : Mar 16, 2025, 2:57:31 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="sidebar">
    <div class="user-avatar">
        <img src="${pageContext.request.contextPath}/img/${sessionScope.user.image}" alt="User Avatar">
        <c:choose>
            <c:when test="${sessionScope.user == null}">
                <li><a href="login.jsp"><i class="fa fa-lock"></i> Đăng Nhập</a></li>
                </c:when>
                <c:otherwise>
                <li><a href="logOut.jsp"><i class="fa-solid fa-right-from-bracket"></i> Đăng Xuất</a></li>
                </c:otherwise>
            </c:choose>
        <p style="color: white">Welcome, ${sessionScope.user.full_name}</p>

        <p style="color: white"><a href="/ProjectSWP391/HomePage">Back to home</a></p>

    </div>

    <c:set var="role" value="${sessionScope.account.getRole_id()}" />
    <c:if test="${role == 2}">
        <h2>Sale</h2>
    </c:if>
    <c:if test="${role == 3 || role == 4}">
        <h2>Sale Manager</h2>
    </c:if>

    <ul>
        <li><a href="/ProjectSWP391/sale/saleDashboard">Thống kê</a></li>
        <li><a href="/ProjectSWP391/sale/ListOrderSale">Danh sách đơn hàng</a></li>
    </ul>
</div>

<%-- 
    Document   : Admin_addSetting
    Created on : Mar 19, 2025, 4:10:41 PM
    Author     : tiend
--%>

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
        <title>Admin | Thêm cài đặt</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/sider.css" rel="stylesheet">
        <style>
            .w-100{
                width: 100%;
            }
            .mt-4{
                margin-top: 16px;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3"><jsp:include page="Admin_sidebar.jsp"></jsp:include></div>
                    <div class="col-md-9">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/ProjectSWP391/admin/listSettingAdmin">Danh sách sản phẩm</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Thêm sản phẩm</li>
                            </ol>
                        </nav>
                        <div class="header col-md-12">
                            <h1>Thêm cài đặt</h1>
                        </div>
                        <form id="myForm" action="/ProjectSWP391/admin/manageSettingAdmin" method="post">
                            <input type="hidden" name="msg" value="addSetting"/>
                            <div class="col-md-5 mb-3">
                                <label>
                                    <h4>Kiểu cài đặt:</h4>

                                </label>
                                <select required="" class="form-control" id="id" name="type">

                                <c:forEach items="${requestScope.listType}" var="listType">
                                    <option value="${listType.type}" <c:if test="${'all'.equals(listType.type)}">disabled</c:if>>${listType.type}</option>
                                </c:forEach>

                            </select>

                        </div>
                        <div class="col-md-7 mb-3">
                            <label>
                                <h4>Tên cài đặt:</h4>

                            </label>
                            <input value="" required="" type="text" name="sName" class="form-control w-100">
                        </div>

                        <div class="col-md-5 mb-3">
                            <label>
                                <h4>Thứ tự</h4>

                            </label>
                            <input value="" required="" type="text" name="order" class="form-control w-100" pattern="^\d+(\.\d+)?$" title="vui lòng nhập số" >
                        </div>
                        <div class="col-md-7 mb-3">
                            <label>
                                <h4>Trạng thái hoạt động:</h4>

                            </label>
                            <select required="" class="form-control" id="id" name="status">


                                <option value="1" >Hoạt động</option>
                                <option value="0" >Không hoạt động</option>

                            </select>
                        </div>

                        <div class="col-md-12 mb-3">
                            <label>
                                <h4>Mô tả cài đặt </h4>

                            </label>
                            <textarea required="" id="id" name="description" rows="5" cols="10" class="form-control w-100"></textarea>
                        </div>
                        <div class="mt-4"></div>
                        <div class="col-md-12">
                            <div class="text-left col-md-3 mt-4">
                                <button id="confirmButton" class="btn btn-primary" type="submit">Thêm cài đặt</button>
                                <a class="btn" href="/ProjectSWP391/admin/listSettingAdmin">Hủy bỏ</a>
                            </div>
                        </div>
                    </form>




                </div>

            </div>
        </div>
        <script>
            document.getElementById("confirmButton").addEventListener("click", function (event) {
                const isConfirmed = confirm("Bạn có chắc muốn thêm cài đặt này?");
                if (isConfirmed) {
                    // Nếu người dùng xác nhận, gửi form
                    document.getElementById("myForm").submit();
                } else {
                    // Nếu người dùng hủy bỏ, không làm gì cả
                    event.preventDefault();
                }
            });

        </script>
    </body>
</html>
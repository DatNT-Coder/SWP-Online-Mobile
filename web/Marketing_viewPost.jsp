<%-- 
    Document   : Marketing_viewProduct
    Created on : Feb 8, 2024, 10:05:43 AM
    Author     : alexf
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
        <title>Marketing | Chi tiết Bài Đăng</title>
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
                <div class="col-md-3"><jsp:include page="sidebar.jsp"></jsp:include></div>
                    <div class="col-md-9">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="listPostMarketing">Danh sách Bài Đăng</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Chi tiết Bài Đăng</li>
                            </ol>
                        </nav>
                        <div class="header col-md-12">
                            <h1>Chi tiết Bài Đăng</h1>
                        </div>
                        <div>
                            <h4 style="margin-left: 14px;">${requestScope.message}</h4>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label>
                            <h4>ID/Mã Bài Đăng</h4>

                        </label>
                        <input readonly="" type="text" name="pid" class="form-control w-100" value="${postDetails.post.id}" />
                    </div>
                    <div class="col-md-5 mb-3">
                        <label>
                            <h4>Tựa đề</h4>

                        </label>
                        <input readonly="" type="text" name="title" class="form-control w-100" value="${postDetails.post.title}"/>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>
                            <h4>Loại bài đăng</h4>

                        </label>
                        <input readonly="" type="text" name="pid" class="form-control w-100" value="${postDetails.name}" />
                    </div>
                    <div class="col-md-12 mb-3">
                        <label>
                            <h4>Tóm tắt</h4>

                        </label>
                        <textarea readonly="" id="id" name="name" rows="3" cols="5" class="form-control w-100">${postDetails.post.brief_info}</textarea>
                    </div>

                    <div class="col-md-12 mb-3">
                        <label>
                            <h4>Chi tiết</h4>

                        </label>
                        <textarea readonly="" id="id" name="name" rows="5" cols="10" class="form-control w-100">${postDetails.post.details}</textarea>
                    </div>
                    <div class="col-md-6 mb-3">
                        <h3>Ảnh Bài Đăng:</h3>
                        <img src="${pageContext.request.contextPath}/assets/img/blogImage/${postDetails.post.thumbnail}" alt="alt" class="img-thumbnail"/>
                    </div>
                    <div class="mt-4"></div>
                    <div class="text-left col-md-12 mt-4">
                        <a class="btn btn-primary" href="managePostMarketing?msg=loadEditPost&pid=${postDetails.post.id}">Chỉnh sửa Bài Đăng</a>
                    </div>



                </div>

            </div>
        </div>
    </body>
</html>

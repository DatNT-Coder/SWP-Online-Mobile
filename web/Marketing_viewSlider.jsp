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
        <title>Marketing | Chi tiết slider</title>
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
                                <li class="breadcrumb-item"><a href="/mobileshop/marketing/listSliderMarketing">Danh sách Slider</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Chi tiết Slider</li>
                            </ol>
                        </nav>
                        <div class="header col-md-12">
                            <h1>Chi tiết slider</h1>
                        </div>
                        <div>
                            <h4 style="margin-left: 14px;">${requestScope.message}</h4>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label>
                            <h4>ID/Mã slider</h4>

                        </label>
                        <input readonly="" type="text" name="pid" class="form-control w-100" value="${productDetails.product.id}" />
                    </div>
                    <div class="col-md-5 mb-3">
                        <label>
                            <h4>Tựa đề</h4>

                        </label>
                        <input readonly="" type="text" name="pid" class="form-control w-100" value="${productDetails.product.title}"/>
                    </div>
                    <div class="col-md-5 mb-3">
                        <label>
                            <h4>Back Link</h4>

                        </label>
                        <input readonly="" type="text" name="pid" class="form-control w-100" value="${productDetails.product.backlink}"/>
                    </div>
                    <div class="col-md-5 mb-3">
                        <label>
                            <h4>Chi tiết</h4>

                        </label>
                        <input readonly="" type="text" name="pid" class="form-control w-100" value="${productDetails.product.notes}"/>
                    </div>

                    <div class="col-md-6 mb-3">
                        <h3>Ảnh sản phẩm:</h3>
                        <img src="${pageContext.request.contextPath}/assets/img/slider/${productDetails.product.image}" alt="alt" class="img-thumbnail" accept="image/*"/>
                    </div>
                    <div class="mt-4"></div>
                    <div class="text-left col-md-12 mt-4">
                        <a class="btn btn-primary" href="/mobileshop/marketing/manageSliderMarketing?msg=loadEditSlider&pid=${productDetails.product.id}">Chỉnh sửa slider</a>
                    </div>



                </div>

            </div>
        </div>
    </body>
</html>

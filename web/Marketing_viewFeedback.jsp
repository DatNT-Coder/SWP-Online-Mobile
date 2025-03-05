<%-- 
    Document   : Marketing_viewFeedback
    Created on : Mar 5, 2025, 8:35:56 PM
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
        <title>Marketing | Chi tiết Phản hồi</title>
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
                                <li class="breadcrumb-item"><a href="/ProjectSWP391/marketing/listFeedbackMarketing">Danh sách Phản hồi</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Chi tiết Phản hồi</li>
                            </ol>
                        </nav>
                        <div class="header col-md-12">
                            <h1>Chi tiết Phản hồi</h1>
                        </div>
                        <div>
                            <h4 style="margin-left: 14px;">${requestScope.message}</h4>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label>
                            <h4>ID/Mã Phản hồi</h4>

                        </label>
                        <input readonly="" type="text" name="pid" class="form-control w-100" value="${feedDetails.feed.id}" />
                    </div>
                    <div class="col-md-5 mb-3">
                        <label>
                            <h4>Tên Người Dùng</h4>

                        </label>
                        <input readonly="" type="text" name="title" class="form-control w-100" value="${feedDetails.feed.full_name}"/>
                    </div>
                    <div class="col-md-5 mb-3">
                        <label>
                            <h4>Email</h4>

                        </label>
                        <input readonly="" type="text" name="title" class="form-control w-100" value="${feedDetails.feed.email}"/>
                    </div>
                    <div class="col-md-5 mb-3">
                        <label>
                            <h4>Số Điện Thoại</h4>

                        </label>
                        <input readonly="" type="text" name="title" class="form-control w-100" value="${feedDetails.feed.phone}"/>
                    </div>
                    <div class="col-md-5 mb-3">
                        <label>
                            <h4>Sản Phẩm</h4>

                        </label>
                        <input readonly="" type="text" name="title" class="form-control w-100" value="${feedDetails.name}"/>
                    </div>
                    <div class="col-md-5 mb-3">
                        <label>
                            <h4>Đánh Giá</h4>

                        </label>
                        <input readonly="" type="text" name="title" class="form-control w-100" value="${feedDetails.feed.rating}"/>
                    </div>
                    <div class="col-md-12 mb-3">
                        <label>
                            <h4>Phản Hồi</h4>

                        </label>
                        <textarea readonly="" id="id" name="name" rows="3" cols="5" class="form-control w-100">${feedDetails.feed.comment}</textarea>
                    </div>
                    <div class="col-md-5 mb-3">
                        <label>
                            <h4>Trạng Thái Ảnh</h4>
                        </label>
                        <input readonly="" type="text" name="title" id="imageStatus" class="form-control w-100" />
                    </div>



                    <div class="col-md-6 mb-3">
                        <h3>Ảnh Phản Hồi:</h3>
                        <img src="${pageContext.request.contextPath}/assets/img/feedbackImage/${feedDetails.feed.image}" alt="alt" class="img-thumbnail"/>
                    </div>
                    <div class="mt-4"></div>
                    <div class="text-left col-md-12 mt-4">

                        <a id="toggleStatusBtn" class="btn btn-primary mt-2" href="/ProjectSWP391/marketing/viewFeedbackMarketing?pid=${feedDetails.feed.id}&msg=toggleStatus&status=${feedDetails.feed.imageStatus}">Chuyển Trạng Thái Ảnh</a>
                    </div>



                </div>

            </div>
        </div>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var imageStatusElement = document.getElementById("imageStatus");
                var imageStatusValue = ${feedDetails.feed.imageStatus};

                if (imageStatusValue === 0) {
                    imageStatusElement.value = "Không khả dụng";
                } else {
                    imageStatusElement.value = "Khả dụng";
                }

                // Thêm sự kiện click vào nút "Chuyển Trạng Thái Ảnh"
                document.getElementById("toggleStatusBtn").addEventListener("click", function () {
                    // Bổ sung mã xử lý khi thay đổi trạng thái ảnh thành công ở đây

                    // Reload trang khi nút được nhấp
                    location.reload();
                });
            });
        </script>
    </body>
</html>

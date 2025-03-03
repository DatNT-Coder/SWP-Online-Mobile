<%-- 
    Document   : Marketing_editProduct
    Created on : Feb 8, 2024, 10:06:00 AM
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
        <title>Marketing | Sửa Bài Đăng</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/sider.css" rel="stylesheet">
        <style>
            .w-100{
                width: 100%;
            }
            .mt-4{
                margin-top: 16px;
            }
            .mb-2{
                margin-bottom: 8px;
            }
            *{
                box-sizing: border-box;
                margin: 0;
                padding: 0;
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
                                <li class="breadcrumb-item active" aria-current="page">Sửa Bài Đăng</li>
                            </ol>
                        </nav>
                        <div class="header col-md-12">
                            <h1>Sửa Bài Đăng</h1>
                        </div>
                        <form id="myForm" action="managePostMarketing" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="msg" value="editPost"/>
                            <input type="hidden" name="oldImage" value="${post.thumbnail}"/>
                        <div class="col-md-12 mb-2">
                            <label>
                                <h4>Mã Bài Đăng</h4>

                            </label>
                            <input value="${post.id}" readonly="" required="" type="text" name="pid" class="form-control w-100">
                        </div>
                        <div class="col-md-5 mb-3">
                            <label>
                                <h4>Loại bài đăng</h4>

                            </label>
                            <select required="" class="form-control" id="id" name="category">

                                <c:forEach items="${requestScope.listPC}" var="listPC">
                                    <option value="${listPC.id}" <c:if test="${post.getPostCategories_id() == listPC.id}">selected</c:if>>${listPC.name}</option>
                                </c:forEach>

                            </select>

                        </div>
                        <div class="col-md-7 mb-3">
                            <label>
                                <h4>Tựa Đề</h4>

                            </label>
                            <input value="${post.title}" required="" type="text" name="title" class="form-control w-100">
                        </div>
                        <div class="col-md-12 mb-3">
                            <label>
                                <h4>Tóm tắt</h4>

                            </label>
                            <textarea required="" id="id" name="brief_info" rows="3" cols="5" class="form-control w-100">${post.brief_info}</textarea>

                        </div>

                        <div class="col-md-12 mb-3">
                            <label>
                                <h4>Chi tiết</h4>

                            </label>
                            <textarea required="" id="id" name="details" rows="5" cols="10" class="form-control w-100">${post.details}</textarea>

                        </div>


                        <div class="col-md-6 mb-3">
                            <h3 class="mt-3">Ảnh Bài Đăng:</h3>
                            <div class="d-flex justify-content-center align-items-center">
                                <img id="preview" src="${pageContext.request.contextPath}/assets/img/blogImage/${post.thumbnail}" alt="alt" class="img-thumbnail"/>
                            </div>
                            <div class="d-flex justify-content-center align-items-center mt-3">
                                <input type="file" id="id" name="productImage" accept="image/png,image/jpeg">
                            </div>

                        </div>
                        <div class="mt-4"></div>
                        <div class="col-md-12">
                            <div class="text-left col-md-3 mt-4">
                                <button id="confirmButton" class="btn btn-primary" type="submit">Sửa Bài Đăng</button>
                                <a class="btn" href="listPostMarketing">Hủy bỏ</a>
                            </div>
                        </div>
                    </form>




                </div>

            </div>
        </div>
        <script>
            //Xử lý priview ảnh.
            function uploadFile(file, callback) {
                var reader = new FileReader();
                reader.onload = function (event) {
                    var result = event.target.result;
                    // Lưu tệp vào máy chủ ở đây
                    callback(result);
                };
                reader.readAsDataURL(file);
            }

            var fileInput = document.querySelector('input[type=file]');
            fileInput.addEventListener('change', function (event) {
                var file = event.target.files[0];
                uploadFile(file, function (result) {
                    // Các câu lệnh tiếp theo của bạn ở đây
                    document.querySelector('#preview').src = result;
                });
            });

        </script>
        <script>
            document.getElementById("confirmButton").addEventListener("click", function (event) {
                const isConfirmed = confirm("Bạn có chắc muốn sửa bài đăng này?");
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

<%-- 
    Document   : UpdateCustomer
    Created on : Feb 12, 2025, 4:01:20 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Customer</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                margin-top:20px;
                background:#eee;
            }
            .card {
                box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
            }
            .table-nowrap .table td, .table-nowrap .table th {
                white-space: nowrap;
            }
            .table>:not(caption)>*>* {
                padding: 0.75rem 1.25rem;
                border-bottom-width: 1px;
            }
            table th {
                font-weight: 600;
                background-color: #eeecfd !important;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="container mt-4">
            <h2>Edit Customer</h2>
            <form action="customerDetail" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control" id="id" name="id" hidden="" readonly value="${u.id}">
                </div>
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" required value="${u.full_name}">
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" readonly="" disabled="" value="${u.email}">
                </div>
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone" required value="${u.phone}">
                </div>
                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select class="form-control" id="gender" name="gender" value="${u.gender}">
                        <option value="Male" <c:if test="${u.gender eq 'Male'}">selected</c:if>>Male</option>
                        <option value="Female" <c:if test="${u.gender eq 'Female'}">selected</c:if>>Female</option>
                        <option value="Other" <c:if test="${u.gender eq 'Other'}">selected</c:if>>Other</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="status">Status</label>
                        <select class="form-control" id="status" name="status" value="${u.status}">
                        <option value="1" <c:if test="${u.status == 1}">selected</c:if>>Active</option>
                        <option value="0" <c:if test="${u.status == 0}">selected</c:if>>Inactive</option>
                        </select>
                    </div>

                    <div class="form-group" >
                        <label for="image">Profile Image</label>
                        <input type="file" class="form-control" id="image" name="image"
                               onchange="previewImage(this)"/>
                        <img src="${u.image}" alt="Ảnh dịch vụ" class="img-preview" id="img-preview-id"
                         style="width: 200px; border: 1px solid #ddd; border-radius: 5px;" />
                    <input type="text" hidden="" name="oldImage" value="${u.image}">
                </div>
                <div class="form-group" style="margin-bottom: 25px">
                    <label for="address">Address</label>
                    <textarea type="text" class="form-control" id="address" name="address" required>${u.userAddress.userAddress}</textarea>
                </div>
                <input type="submit" name="edit" value="Edit" class="btn btn-primary"/>
                <a href="customerList" class="btn btn-secondary">Back</a>
            </form>
        </div>    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">
                               function previewImage(input) {
                                   const preview = document.getElementById('img-preview-id');

                                   // Kiểm tra xem có file được chọn hay không
                                   if (input.files && input.files[0]) {
                                       // Hiển thị preview của hình ảnh
                                       preview.src = window.URL.createObjectURL(input.files[0]);
                                       preview.style.display = "block"; // Hiển thị ảnh
                                   } else {
                                       preview.style.display = "none"; // Ẩn ảnh nếu không có file nào
                                   }
                               }
        </script></body>
</html>

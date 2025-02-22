<%-- 
    Document   : UpdateCustomer
    Created on : Feb 12, 2025, 4:01:20 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Customer</title>
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
            <h2>Create Customer</h2>
            <form action="create-customer" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone" required>
                </div>
                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select class="form-control" id="gender" name="gender">
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="image">Profile Image</label>
                    <input type="file" class="form-control" id="image" name="image"
                           onchange="previewImage(this)"/>
                    <img src="" alt="Ảnh dịch vụ" class="img-preview" id="img-preview-id"
                         style="width: 200px; border: 1px solid #ddd; border-radius: 5px;" />
                </div>
                <div class="form-group" style="margin-bottom: 25px">
                    <label for="address">Address</label>
                    <textarea type="text" class="form-control" id="address" name="address" required></textarea>
                </div>
                <input type="submit" name="Add" value="Add" class="btn btn-primary"/>
                 <a href="customerList" class="btn btn-secondary">Back</a>
            </form>
        </div>   
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">
                                                              document.addEventListener('DOMContentLoaded', function () {
                                                                  const preview = document.getElementById('img-preview-id');
                                                                  preview.style.display = "none";
                                                              });
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
        </script>
    </body>
</html>

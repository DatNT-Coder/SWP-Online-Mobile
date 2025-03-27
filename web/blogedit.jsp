<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Chỉnh sửa bài viết - Quản lý blog</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
      <style>
         :root {
            --teal-light: #e0f2f1;
            --teal-main: #26a69a;
            --teal-dark: #00897b;
            --teal-accent: #80cbc4;
            --teal-card: #f0f9f8;
         }

         body {
            background-color: #f5f5f5;
         }

         .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
         }

         .card-header {
            background-color: var(--teal-main);
            color: white;
            border-radius: 10px 10px 0 0 !important;
            padding: 15px 20px;
         }

         .btn-success {
            background-color: var(--teal-main);
            border-color: var(--teal-main);
         }

         .btn-success:hover {
            background-color: var(--teal-dark);
            border-color: var(--teal-dark);
         }

         .btn-outline-secondary {
            color: var(--teal-main);
            border-color: var(--teal-main);
         }

         .btn-outline-secondary:hover {
            background-color: var(--teal-light);
            color: var(--teal-dark);
         }

         .form-control, .form-select {
            border-radius: 5px;
            border: 1px solid #ced4da;
         }

         .form-control:focus, .form-select:focus {
            border-color: var(--teal-accent);
            box-shadow: 0 0 0 0.25rem rgba(38, 166, 154, 0.25);
         }

         .thumbnail-preview {
            max-width: 100%;
            height: auto;
            border: 2px solid var(--teal-accent);
         }

         .radio-group {
            display: flex;
            gap: 15px;
         }

         .radio-group label {
            display: flex;
            align-items: center;
            gap: 5px;
         }

         .required-field::after {
            content: " *";
            color: #dc3545;
         }
      </style>
   </head>
   <body>
      <div class="container-fluid">
         <div class="row">
            <div class="col-lg-12">
               <nav aria-label="breadcrumb" class="mt-3">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item"><a href="blog-list"><i class="bi bi-newspaper me-1"></i>Bài viết</a></li>
                     <li class="breadcrumb-item active" aria-current="page"><i class="bi bi-pencil-square me-1"></i>Chỉnh sửa</li>
                  </ol>
               </nav>

               <div class="card mb-4">
                  <div class="card-header d-flex justify-content-between align-items-center">
                     <h4 class="mb-0"><i class="bi bi-pencil-square me-2"></i>Chỉnh sửa bài viết</h4>
                     <a href="blog-list" class="btn btn-outline-light btn-sm">
                        <i class="bi bi-arrow-left me-1"></i> Quay lại
                     </a>
                  </div>

                  <div class="card-body">
                     <form action="edit-post" method="post" enctype="multipart/form-data">
                        <div class="row mb-4">
                           <!-- Left Column - Content -->
                           <div class="col-md-8">
                              <div class="mb-3">
                                 <label for="postTitle" class="form-label required-field">Tiêu đề</label>
                                 <input name="postTitle" type="text" class="form-control" id="postTitle" value="${requestScope.blog.title}" required>
                              </div>

                              <div class="mb-3">
                                 <label for="postBrief" class="form-label">Mô tả ngắn</label>
                                 <textarea name="postBrief" class="form-control" id="postBrief" rows="2">${requestScope.blog.getBrief_info()}</textarea>
                              </div>

                              <div class="mb-3">
                                 <label for="postContent" class="form-label required-field">Nội dung chi tiết</label>
                                 <textarea name="postContent" class="form-control" id="postContent" rows="12" required>${requestScope.blog.getDetails()}</textarea>
                              </div>
                           </div>

                           <!-- Right Column - Metadata -->
                           <div class="col-md-4">
                              <div class="card mb-3">
                                 <div class="card-header"><i class="bi bi-gear me-2"></i>Thông tin xuất bản</div>
                                 <div class="card-body">
                                    <div class="mb-3">
                                       <label class="form-label">Trạng thái</label>
                                       <div class="radio-group">
                                          <label>
                                             <input type="radio" name="postStatus" value="1" ${requestScope.blog.status == 1 ? "checked" : ""}>
                                             Đã đăng
                                          </label>
                                          <label>
                                             <input type="radio" name="postStatus" value="0" ${requestScope.blog.status == 0 ? "checked" : ""}>
                                             Nháp
                                          </label>
                                       </div>
                                    </div>

                                    <div class="mb-3">
                                       <label for="postCategory" class="form-label">Danh mục</label>
                                       <select name="postCategory" class="form-select" id="postCategory">
                                          <c:forEach var="category" items="${requestScope.listCategory}">
                                             <option ${requestScope.blog.getPostCategories_id() == category.id ? "selected" : ""} value="${category.id}">${category.name}</option>
                                          </c:forEach>
                                       </select>
                                    </div>

                                    <div class="mb-3">
                                       <label for="updateDate" class="form-label">Ngày cập nhật</label>
                                       <input type="text" class="form-control" id="updateDate" value="${requestScope.blog.updatedDate}" readonly>
                                    </div>

                                    <div class="form-check mb-3">
                                       <input name="featuredPost" class="form-check-input" type="checkbox" id="featuredPost" ${requestScope.blog.isFlag_feature() ? "checked" : ""}>
                                       <label class="form-check-label" for="featuredPost">
                                          Bài viết nổi bật
                                       </label>
                                    </div>
                                 </div>
                              </div>

                              <div class="card mb-3">
                                 <div class="card-header"><i class="bi bi-image me-2"></i>Ảnh đại diện</div>
                                 <div class="card-body">
                                    <div class="mb-3">
                                       <div class="mb-2 text-center">
                                          <img src="images/post/${requestScope.blog.thumbnail}" class="img-thumbnail thumbnail-preview" alt="Ảnh đại diện hiện tại">
                                       </div>
                                       <label for="postThumbnail" class="form-label">Thay đổi ảnh</label>
                                       <input name="postThumbnail" type="file" class="form-control" id="postThumbnail" accept="image/*">
                                       <div class="form-text">Kích thước đề xuất: 1200x800px</div>
                                    </div>
                                 </div>
                              </div>

                              <input type="hidden" value="${requestScope.blog.id}" name="postID">

                              <div class="card">
                                 <div class="card-header"><i class="bi bi-person me-2"></i>Tác giả</div>
                                 <div class="card-body">
                                    <input type="text" class="form-control" value="${requestScope.blog.full_name}" readonly>
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="d-flex justify-content-between">
                           <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteConfirmModal">
                              <i class="bi bi-trash me-1"></i> Xóa
                           </button>
                           <div>
                              <a href="blog-list" class="btn btn-outline-secondary me-2">
                                 <i class="bi bi-x-circle me-1"></i> Hủy
                              </a>
                              <button type="submit" class="btn btn-success">
                                 <i class="bi bi-save me-1"></i> Lưu thay đổi
                              </button>
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <!-- Delete Confirmation Modal -->
      <div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header bg-danger text-white">
                  <h5 class="modal-title" id="deleteConfirmModalLabel"><i class="bi bi-exclamation-triangle me-2"></i>Xác nhận xóa</h5>
                  <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                  <p>Bạn có chắc chắn muốn xóa bài viết "<strong>${requestScope.blog.title}</strong>"?</p>
                  <p class="text-danger"><i class="bi bi-exclamation-circle me-1"></i>Lưu ý: Thao tác này không thể hoàn tác!</p>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                  <a href="delete-post?id=${requestScope.blog.id}" class="btn btn-danger">
                     <i class="bi bi-trash me-1"></i> Xác nhận xóa
                  </a>
               </div>
            </div>
         </div>
      </div>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
      <script>
         // Preview thumbnail image when selected
         document.getElementById('postThumbnail').addEventListener('change', function (event) {
            const file = event.target.files[0];
            if (file) {
               const reader = new FileReader();
               reader.onload = function (e) {
                  document.querySelector('.thumbnail-preview').src = e.target.result;
               }
               reader.readAsDataURL(file);
            }
         });
      </script>
   </body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Quản lý bài viết blog</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <link rel="stylesheet" href="https://cdn.datatables.net/2.2.2/css/dataTables.dataTables.css" />
<!--      <link rel="stylesheet" href="css/styles.css">
      <link rel="stylesheet" href="css/datatable.css">-->
   </head>
   <style>
      :root {
         --teal-primary: #26a69a;
         --teal-light: #80cbc4;
         --teal-dark: #00897b;
         --teal-bg: #e0f2f1;
         --teal-text: #004d40;
         --teal-card: #ffffff;
      }

      body {
         background-color: #f5f7fa;
         color: var(--teal-text);
         font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      }

      .main-content {
         padding: 20px;
         background-color: #f5f7fa;
      }

      h2 {
         color: var(--teal-dark);
         font-weight: 600;
         margin: 0;
      }

      /* Buttons */
      .add-slider-btn {
         background-color: var(--teal-primary);
         color: white;
         border: none;
         padding: 10px 20px;
         border-radius: 4px;
         font-weight: 500;
         cursor: pointer;
         transition: all 0.3s ease;
         display: flex;
         align-items: center;
      }

      .add-slider-btn:hover {
         background-color: var(--teal-dark);
         transform: translateY(-2px);
         box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      .search-button {
         background-color: var(--teal-primary);
         color: white;
         border: none;
         padding: 8px 16px;
         border-radius: 0 4px 4px 0;
         cursor: pointer;
         transition: background-color 0.3s;
      }

      .search-button:hover {
         background-color: var(--teal-dark);
      }

      .reset-btn {
         background-color: #f5f5f5;
         color: var(--teal-text);
         border: 1px solid #ddd;
         padding: 8px 16px;
         border-radius: 4px;
         margin-right: 10px;
         cursor: pointer;
         transition: all 0.3s;
      }

      .reset-btn:hover {
         background-color: #e0e0e0;
         border-color: #ccc;
      }

      /* Form Elements */
      .search-input {
         padding: 8px 12px;
         border: 1px solid #ddd;
         border-radius: 4px 0 0 4px;
         width: 100%;
         outline: none;
      }

      .search-input:focus {
         border-color: var(--teal-light);
         box-shadow: 0 0 0 2px rgba(38, 166, 154, 0.2);
      }

      .form-select {
         padding: 8px 12px;
         border: 1px solid #ddd;
         border-radius: 4px;
         color: var(--teal-text);
      }

      .form-select:focus {
         border-color: var(--teal-light);
         box-shadow: 0 0 0 2px rgba(38, 166, 154, 0.2);
      }

      /* Cards */
      .card {
         border: none;
         border-radius: 8px;
         box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
         margin-bottom: 20px;
         background-color: var(--teal-card);
      }

      .card-body {
         padding: 20px;
      }

      /* Table Styling */
      .table {
         width: 100%;
         border-collapse: separate;
         border-spacing: 0;
         background-color: white;
      }

      .table thead th {
         background-color: var(--teal-primary);
         color: white;
         padding: 12px 15px;
         border: none;
         font-weight: 500;
      }

      .table tbody tr {
         transition: background-color 0.2s;
      }

      .table tbody tr:hover {
         background-color: rgba(38, 166, 154, 0.1);
      }

      .table td {
         padding: 12px 15px;
         vertical-align: middle;
         border-bottom: 1px solid #f0f0f0;
      }

      /* Image Styling */
      .slider-image {
         width: 150px;
         height: auto;
         border-radius: 4px;
         object-fit: cover;
      }

      /* Status Badges */
      .badge-active {
         background-color: #c8e6c9;
         color: #388e3c;
         padding: 4px 8px;
         border-radius: 12px;
         font-size: 0.8rem;
      }

      .badge-inactive {
         background-color: #ffcdd2;
         color: #d32f2f;
         padding: 4px 8px;
         border-radius: 12px;
         font-size: 0.8rem;
      }

      /* Action Buttons */
      .btn-sm {
         padding: 5px 10px;
         font-size: 0.8rem;
         margin-right: 5px;
      }

      .btn-primary {
         background-color: var(--teal-primary);
         border-color: var(--teal-primary);
      }

      .btn-primary:hover {
         background-color: var(--teal-dark);
         border-color: var(--teal-dark);
      }

      /* Pagination */
      .pagination {
         margin: 0;
      }

      .page-link {
         color: var(--teal-primary);
         border: 1px solid #ddd;
      }

      .page-link:hover {
         color: var(--teal-dark);
         background-color: #f5f5f5;
         border-color: #ddd;
      }

      .page-item.active .page-link {
         background-color: var(--teal-primary);
         border-color: var(--teal-primary);
         color: white;
      }

      /* Responsive Adjustments */
      @media (max-width: 768px) {
         .main-content {
            padding: 15px;
         }

         .slider-image {
            width: 100px;
         }

         .col-actions {
            white-space: nowrap;
         }
      }
   </style>
   <body>
      <div class="container-fluid">
         <div class="row">        
            <!-- Sidebar -->
            <div class="col-md-2">
               <jsp:include page="sidebar.jsp"></jsp:include>
               </div>
               <!-- Main Content -->
               <div class="col-lg-10 main-content">
                  <div class="container-fluid py-4">
                     <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2>Danh sách bài viết</h2>
                        <button class="add-slider-btn" data-bs-toggle="modal" data-bs-target="#addPostModal">
                           Thêm bài viết
                        </button>
                     </div>

                     <!-- Search and Filter -->
                     <div class="card mb-4">
                        <div class="card-body">
                           <form class="p d-flex col-md-4" style="width: 100%; float: right !important" action="blog-list?page=${requestScope.page}" method="get">
                           <button type="button" onclick="window.location.href = '/ProjectSWP391/blog-list'" class="reset-btn">
                              Xóa lọc & tìm kiếm
                           </button>            
                           <div class="col-md-4 d-flex align-items-center">
                              <select name="category" name="" class="form-select me-2" style="max-width: 150px;">
                                 <option value="" ${empty requestScope.category ? "selected" : ""}>Tất cả danh mục</option>
                                 <c:forEach var="category" items="${requestScope.listCategory}">
                                    <option ${requestScope.category == category.id ? "selected" : ""} value="${category.id}">${category.name}</option>
                                 </c:forEach>
                              </select>
                           </div>

                           <div class="col-md-4">
                              <select name="status" class="form-select" style="max-width: 150px;">
                                 <option value="" ${ (requestScope.statusA == "" || empty requestScope.statusA) ? "selected" : ""}>Tất cả trạng thái</option>
                                 <option value="1" ${ requestScope.statusA == "1" ? "selected" : ""}>Đã đăng</option>
                                 <option value="0" ${ requestScope.statusA == "0" ? "selected" : ""}>Nháp</option>
                              </select>
                           </div>
                           <div class="col-md-4">
                              <div class="input-group">
                                 <input name="search" type="text" class="form-control" placeholder="Tìm kiếm bài viết...">
                              </div>
                           </div>
                           <div class="col-md-2">
                              <button type="submit" class="search-button">Search</button>
                           </div>

                        </form>
                     </div>
                  </div>  

                  <!-- Posts Table -->
                  <div class="card">
                     <div class="card-body">
                        <div class="table-responsive">
                           <table id="sliderTable" class="table table-hover">
                              <thead>
                                 <tr>
                                    <th class="col-id">ID</th>
                                    <th class="col-thumb">Thumbnail</th>
                                    <th class="col-title">Thông tin</th>
                                    <th scope="col-cate">Danh mục</th>
                                    <th scope="col-update">Ngày cập nhật</th>
                                    <th class="col-status">Trạng thái</th>
                                    <th class="col-actions">Thao tác</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <c:forEach var="post" items="${requestScope.listBlog}">
                                    <tr>
                                       <th class="col-id" scope="row">${post.id}</th>
                                       <td class="col-thumb"><img style="width: 100px" src="images/blog/${post.thumbnail}" class="me-2" alt="Thumbnail"></td>
                                       <td class="col-title">
                                          <div class="d-flex align-items-center">
                                             <div>
                                                <div class="fw-bold">${post.title}</div>
                                                <small class="text-muted">${post.brief_info}</small>
                                                <c:if test="${post.flag_feature}">
                                                   <span class="badge feature-badge ms-1">Nổi bật</span>
                                                </c:if>
                                             </div>
                                          </div>
                                       </td>
                                       <td scope="col-cate">${post.getPostCategories_id()}</td>
                                       <td scope="col-update">${post.updatedDate}</td>
                                       <td class="col-status ${post.status == 1 ? 'text-success' : 'text-danger'}">
                                          ${post.status == 1 ? "<span class='badge badge-active'>Active</span>" : "<span class='badge badge-inactive'>Inactive</span>"}
                                       </td>
                                       <td class="col-actions">
         <!--                                        <a href="view-post?id=${post.id}" class="btn btn-sm btn-outline-primary">
                                               <i class="bi bi-eye"></i>
                                           </a>-->
                                          <a href="edit-post?id=${post.id}" class="btn btn-sm btn-outline-secondary">
                                             <i class="bi bi-pencil"></i>
                                          </a>
                                          <!--                                        <button class="btn btn-sm btn-outline-danger">
                                                                                      <i class="bi bi-trash"></i>
                                                                                  </button>-->
                                       </td>
                                    </tr>
                                 </c:forEach>
                              </tbody>
                           </table>
                        </div>
                        <!-- Pagination -->
                        <c:choose>
                           <c:when test="${requestScope.listBlog==null || requestScope.listBlog.size()==0}">
                              Not founds
                           </c:when>
                           <c:when test="${totalPage < 2}">
                              <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                 <ul class="pagination">
                                    <c:forEach begin="1" end="${totalPage}" var="i">
                                       <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}&category=${category}&status=${statusA}&search=${search}">${i}</a></li>
                                       </c:forEach>
                                 </ul>
                              </nav>
                           </c:when>
                           <c:when test="${page < 2}">
                              <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                 <ul class="pagination">
                                    <c:forEach begin="1" end="${totalPage}" var="i">
                                       <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}&category=${category}&status=${statusA}&search=${search}">${i}</a></li>
                                       </c:forEach>
                                    <li class="page-item"><a class="page-link" href="${pagination_url}page=${page+1}">>></a></li>
                                 </ul>
                              </nav>
                           </c:when>
                           <c:when test="${page+1 > totalPage}">
                              <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                 <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="${pagination_url}page=${page-1}"><<</a></li>
                                       <c:forEach begin="1" end="${totalPage}" var="i">
                                       <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}&category=${category}&status=${statusA}&search=${search}">${i}</a></li>
                                       </c:forEach>
                                 </ul>
                              </nav>
                           </c:when>
                           <c:otherwise>
                              <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                 <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="${pagination_url}page=${page-1}&category=${category}&status=${status}&search=${search}"><<</a></li>
                                       <c:forEach begin="1" end="${totalPage}" var="i">
                                       <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}&category=${category}&status=${status}&search=${search}">${i}</a></li>
                                       </c:forEach>
                                    <li class="page-item"><a class="page-link" href="${pagination_url}page=${page+1}&category=${category}&status=${status}&search=${search}">>></a></li>
                                 </ul>
                              </nav>
                           </c:otherwise>
                        </c:choose>
                     </div>
                  </div>
               </div>
               <!-- Add Post Modal -->
               <div class="modal fade" id="addPostModal" tabindex="-1" aria-labelledby="addPostModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg">
                     <div class="modal-content">
                        <div class="modal-header">
                           <h5 class="modal-title" id="addPostModalLabel">Thêm bài viết mới</h5>
                           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                           <form action="blog-list" method="post" enctype="multipart/form-data">
                              <div class="mb-3">
                                 <label for="postTitle" class="form-label">Tiêu đề</label>
                                 <input name="postTitle" type="text" class="form-control" id="postTitle" placeholder="Nhập tiêu đề bài viết">
                              </div>
                              <div class="row mb-3">
                                 <div class="col-md-6">
                                    <label for="postCategory" class="form-label">Danh mục</label>
                                    <select name="postCategory" class="form-select" id="postCategory">
                                       <option ${empty requestScope.category ? "selected" : ""}>Tất cả danh mục</option>
                                       <c:forEach var="category" items="${requestScope.listCategory}">
                                          <option ${requestScope.category == category.id ? "selected" : ""} value="${category.id}">${category.name}</option>
                                       </c:forEach>
                                    </select>
                                 </div>
                                 <div class="col-md-6">
                                    <label for="postStatus" class="form-label">Trạng thái</label>
                                    <select name = "postStatus" class="form-select" id="postStatus">
                                       <option value="1">Active</option>
                                       <option value="0">InActive</option>
                                    </select>
                                 </div>
                              </div>
                              <div class="mb-3">
                                 <label for="postBrief" class="form-label">Mô tả ngắn</label>
                                 <textarea name="postBrief" class="form-control" id="postBrief" rows="2" placeholder="Nhập mô tả ngắn"></textarea>
                              </div>
                              <div class="mb-3">
                                 <label for="postContent" class="form-label">Nội dung chi tiết</label>
                                 <textarea name="postContent" class="form-control" id="postContent" rows="6" placeholder="Nhập nội dung chi tiết"></textarea>
                              </div>
                              <div class="mb-3">
                                 <label for="postThumbnail" class="form-label">Ảnh đại diện</label>
                                 <input name="postThumbnail" type="file" class="form-control" id="postThumbnail">
                              </div>
                              <div class="form-check mb-3">
                                 <input class="form-check-input" type="checkbox" id="featuredPost">
                                 <label name="featuredPost" class="form-check-label" for="featuredPost">
                                    Đánh dấu là bài viết nổi bật
                                 </label>
                              </div>
                              <div class="modal-footer">
                                 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                 <button type="submit" class="btn btn-primary">Lưu bài viết</button>
                              </div>
                           </form>

                        </div>
                     </div>
                  </div>
               </div>
               <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
               <script src="https://cdn.datatables.net/2.2.2/js/dataTables.js"></script>
               <script>
                              $(document).ready(function () {
                                 $('#myTable').DataTable(
//                    {
//                "paging": false,       
//                "searching": false,    
//                "info": false,    
//                "ordering": true       
//            }
                                         );
                              });
            </<script>
                    </body>
      </html>


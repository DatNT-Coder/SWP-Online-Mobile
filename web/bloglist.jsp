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
         --teal-accent: #b2dfdb;
      }

      body {
         background-color: var(--teal-bg);
         color: var(--teal-text);
         font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      }

      .container-fluid {
         padding-left: 0;
         padding-right: 0;
      }

      .row {
         display: flex;
         margin-left: 0;
         margin-right: 0;
      }

      /* Sidebar styles */

      /* Main content styles */
      .col-lg-10.main-content {
         flex-grow: 1;
         padding: 20px;
         background-color: var(--teal-bg);
      }

      /* Header styles */
      h2 {
         color: var(--teal-dark);
         font-weight: 600;
         margin: 20px 0;
         padding-bottom: 10px;
         border-bottom: 2px solid var(--teal-light);
      }

      /* Button styles */
      .add-slider-btn,
      .reset-btn,
      .search-button,
      .btn-primary,
      .btn-secondary {
         background-color: var(--teal-primary);
         color: white;
         border: none;
         padding: 8px 16px;
         border-radius: 4px;
         transition: all 0.3s;
         cursor: pointer;
      }

      .add-slider-btn:hover,
      .reset-btn:hover,
      .search-button:hover,
      .btn-primary:hover {
         background-color: var(--teal-dark);
         transform: translateY(-1px);
      }

      .btn-outline-secondary {
         color: var(--teal-primary);
         border-color: var(--teal-primary);
      }

      .btn-outline-secondary:hover {
         background-color: var(--teal-primary);
         color: white;
      }

      /* Card styles */
      .card {
         background-color: var(--teal-card);
         border-radius: 8px;
         box-shadow: 0 2px 4px rgba(0,0,0,0.1);
         border: 1px solid var(--teal-accent);
         margin-bottom: 20px;
      }

      .card-body {
         padding: 20px;
      }

      /* Form styles */
      .search-filter-section {
         background-color: var(--teal-card);
         padding: 20px;
         border-radius: 8px;
         box-shadow: 0 2px 4px rgba(0,0,0,0.1);
         border: 1px solid var(--teal-accent);
         margin-bottom: 20px;
      }

      .filter-header {
         display: flex;
         margin-bottom: 10px;
      }

      .filter-title, .search-title {
         color: var(--teal-dark);
         font-size: 1.1rem;
         margin: 0 0 10px 0;
         display: flex;
         align-items: center;
      }

      .filter-title {
         flex: 2;
      }

      .search-title {
         flex: 1;
      }

      .filter-title::before {
         content: "🗂️";
         margin-right: 10px;
      }

      .search-title::before {
         content: "🔍";
         margin-right: 10px;
      }

      .blog-filter-form .filter-search-container {
         display: flex;
         gap: 15px;
      }

      .filter-section {
         display: flex;
         gap: 15px;
         flex: 2;
      }

      .search-section {
         flex: 1;
      }

      .search-input-group {
         display: flex;
         gap: 10px;
      }

      .filter-group {
         flex: 1;
      }

      .search-input-group .form-control {
         flex: 1;
      }

      @media (max-width: 992px) {
         .filter-header {
            flex-direction: column;
         }

         .blog-filter-form .filter-search-container {
            flex-direction: column;
         }

         .filter-section {
            flex-direction: column;
            gap: 10px;
         }
      }

      /* Table styles */
      .table {
         width: 100%;
         border-collapse: separate;
         border-spacing: 0;
         margin-bottom: 0;
      }

      .table thead th {
         background-color: var(--teal-primary);
         color: white;
         padding: 12px 15px;
         font-weight: 500;
      }

      .table tbody tr:nth-child(even) {
         background-color: var(--teal-bg);
      }

      .table tbody tr:hover {
         background-color: var(--teal-accent);
      }

      .table td, .table th {
         padding: 12px 15px;
         vertical-align: middle;
         border-bottom: 1px solid var(--teal-light);
      }

      /* Image styles */
      .col-thumb img {
         max-width: 100px;
         height: auto;
         border-radius: 4px;
      }

      /* Status badges */
      .badge-active {
         background-color: #4CAF50;
         color: white;
         padding: 4px 8px;
         border-radius: 12px;
         font-size: 0.8rem;
      }

      .badge-inactive {
         background-color: #F44336;
         color: white;
         padding: 4px 8px;
         border-radius: 12px;
         font-size: 0.8rem;
      }

      .feature-badge {
         background-color: #FFC107;
         color: #212529;
         padding: 3px 6px;
         border-radius: 12px;
         font-size: 0.75rem;
      }

      /* Pagination styles */
      .pagination {
         display: flex;
         justify-content: center;
         margin-top: 20px;
         list-style: none;
         padding: 0;
      }

      .pagination .page-item {
         margin: 0 4px;
      }

      .pagination .page-link {
         color: var(--teal-dark);
         text-decoration: none;
         padding: 8px 14px;
         border-radius: 4px;
         border: 1px solid var(--teal-light);
         transition: all 0.3s ease;
         background-color: white;
      }

      .pagination .page-item.active .page-link {
         background-color: var(--teal-primary);
         color: white;
         border-color: var(--teal-primary);
      }

      .pagination .page-link:hover:not(.active) {
         background-color: var(--teal-light);
         color: var(--teal-text);
      }

      /* Modal styles */
      .modal-content {
         border-radius: 8px;
         border: 1px solid var(--teal-accent);
      }

      .modal-header {
         background-color: var(--teal-primary);
         color: white;
         border-bottom: 1px solid var(--teal-light);
      }

      .sidebar h2 {
         color: #26A69A;
         font-size: 1.2rem;
         text-transform: uppercase;
         letter-spacing: 1px;
         padding: 0 20px 15px;
         margin-bottom: 10px;
         border-bottom: 2px solid var(--teal-lighter);
      }

      h2 {
         color: var(--teal-dark);
         margin: 20px 0;
         font-weight: 600;
         text-align: center;
         padding-bottom: 10px;
         border-bottom: 2px solid #80cbc4;
      }

      user agent stylesheet
      h2 {
         display: block;
         font-size: 1.5em;
         margin-block-start: 0.83em;
         margin-block-end: 0.83em;
         margin-inline-start: 0px;
         margin-inline-end: 0px;
         font-weight: bold;
         unicode-bidi: isolate;
      }

      /* Responsive adjustments */
      @media (max-width: 768px) {
         .row {
            flex-direction: column;
         }

         .col-md-2 {
            width: 100%;
            height: auto;
            position: relative;
         }

         .d-flex.col-md-4 {
            flex-direction: column;
         }

         .reset-btn {
            margin-bottom: 10px;
         }

         .table-responsive {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
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
                     <div class="search-filter-section">
                        <div class="row">
                           <div class="col-md-12">
                              <form action="blog-list?page=${requestScope.page}" method="get" class="form-group blog-filter-form">
                              <div class="filter-header">
                                 <h3 class="filter-title">Lọc bài viết</h3>
                                 <h3 class="search-title">Tìm kiếm bài viết</h3>
                              </div>

                              <div class="filter-search-container">
                                 <div class="filter-section">
                                    <div class="filter-group">
                                       <select name="category" class="form-control">
                                          <option value="" ${empty requestScope.category ? "selected" : ""}>Tất cả danh mục</option>
                                          <c:forEach var="category" items="${requestScope.listCategory}">
                                             <option ${requestScope.category == category.id ? "selected" : ""} value="${category.id}">${category.name}</option>
                                          </c:forEach>
                                       </select>
                                    </div>

                                    <div class="filter-group">
                                       <select name="status" class="form-control">
                                          <option value="" ${ (requestScope.statusA == "" || empty requestScope.statusA) ? "selected" : ""}>Tất cả trạng thái</option>
                                          <option value="1" ${ requestScope.statusA == "1" ? "selected" : ""}>Đã đăng</option>
                                          <option value="0" ${ requestScope.statusA == "0" ? "selected" : ""}>Nháp</option>
                                       </select>
                                    </div>
                                 </div>

                                 <div class="search-section">
                                    <div class="search-input-group">
                                       <input name="search" type="text" class="form-control" placeholder="Tìm kiếm bài viết...">
                                       <button type="submit" class="btn btn-primary">
                                          Tìm kiếm
                                       </button>
                                       <button type="button" onclick="window.location.href = '/ProjectSWP391/blog-list'" 
                                               class="btn btn-secondary">
                                          Xóa lọc
                                       </button>
                                    </div>
                                 </div>
                              </div>
                           </form>
                        </div>
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


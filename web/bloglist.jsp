
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
      <style>
         *{
            box-sizing: border-box;
            margin:0;
            padding:0;
         }
         .header{
            padding: 0.4rem .2rem;
            margin-bottom: 1rem;
         }
         .add-product-btn{
            text-align: center;
            display: block;
            border:none;
            color: black;
            text-decoration: none;
            padding:.7rem .2rem;
            margin-top: 10px;
            width: 100%;
         }
         .add-product-btn:hover{
            color: black;
            text-decoration: none;
         }
         .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #009981; /* Bright green */
            padding: 20px;
            position: fixed;
            top: 0;
            left: 0;
            overflow-y: auto;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
         }

         .user-avatar {
            text-align: center;
            margin-bottom: 20px;
         }

         .user-avatar img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            border: 2px solid white;
         }

         .user-avatar p {
            margin-top: 10px;
            font-size: 14px;
            color: white;
         }

         .user-avatar a {
            color: #154734; /* Dark green for contrast */
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
         }

         h2 {
            color: white;
            font-size: 18px;
            margin-bottom: 15px;
            border-bottom: 2px solid #219150; /* Slightly darker shade */
            padding-bottom: 5px;
         }

         ul {
            list-style: none;
            padding: 0;
            margin: 0;
         }

         ul li {
            padding: 12px;
            margin: 5px 0;
            border-radius: 5px;
            background: white; /* Lighter green for contrast */
            transition: all 0.3s;
         }

         ul li a {
            text-decoration: none;
            color: black;
            font-size: 16px;
            font-weight: bold;
            display: block;
            transition: background 0.3s, padding-left 0.3s;
         }

         ul li:hover {
            background: white; /* Darker green for hover effect */
            padding-left: 10px;
         }

         .text-success {
            color: black;
         }

         /* Responsive */
         @media screen and (max-width: 768px) {
            .sidebar {
               width: 200px;
            }
         }
      </style>
   </head>
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
                     <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addPostModal">
                        <i class="bi bi-plus-circle me-1"></i> Thêm bài viết
                     </button>
                  </div>

                  <!-- Search and Filter -->
                  <div class="row mb-4">
                     <form class="d-flex just-content-between" action="blog-list?page=${requestScope.page}" method="get">
                     <div class="col-md-6">
                        <div class="input-group">
                           <input type="text" class="form-control" placeholder="Tìm kiếm bài viết...">

                        </div>
                     </div>
                     <div class="col-md-6">
                        <div class="d-flex justify-content-md-end">
                           <select class="form-select me-2" style="max-width: 150px;">
                              <option ${empty requestScope.category ? "selected" : ""}>Tất cả danh mục</option>
                              <c:forEach var="category" items="${requestScope.listCategory}">
                                 <option ${requestScope.category == category.id ? "selected" : ""} value="${category.id}">${category.name}</option>
                              </c:forEach>
                           </select>
                           <select class="form-select" style="max-width: 150px;">
                              <option ${empty requestScope.status ? "selected" : ""}>Tất cả trạng thái</option>
                              <option ${ requestScope.status == 1 ? "selected" : ""}>Đã đăng</option>
                              <option ${ requestScope.status == 0 ? "selected" : ""}>Nháp</option>
                           </select>
                           <button type="submit" class="btn btn-outline-secondary" >
                              <i class="bi bi-search"></i>
                           </button>
                        </div>
                     </div>
                  </form>
               </div>

               <!-- Posts Table -->
               <div class="table-responsive">
                  <table class="table table-hover">
                     <thead class="table-light">
                        <tr>
                           <th scope="col" width="50px">ID</th>
                           <th scope="col">Tiêu đề</th>
                           <th scope="col">Danh mục</th>
                           <th scope="col">Ngày cập nhật</th>
                           <th scope="col">Trạng thái</th>
                           <th scope="col" width="130px">Thao tác</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var="post" items="${requestScope.listBlog}">
                           <tr>
                              <th scope="row">${post.id}</th>
                              <td>
                                 <div class="d-flex align-items-center">
                                    <img style="width: 100px" src="images/blog/${post.thumbnail}" class="me-2" alt="Thumbnail">
                                    <div>
                                       <div class="fw-bold">${post.title}</div>
                                       <small class="text-muted">${post.brief_info}</small>
                                       <c:if test="${post.flag_feature}">
                                          <span class="badge feature-badge ms-1">Nổi bật</span>
                                       </c:if>
                                    </div>
                                 </div>
                              </td>
                              <td>${post.getPostCategories_id()}</td>
                              <td>${post.updatedDate}</td>
                              <td>
                                 <c:choose>
                                    <c:when test="${post.status == 1}">
                                       <span class="badge status-active">Đã đăng</span>
                                    </c:when>
                                    <c:otherwise>
                                       <span class="badge status-inactive">Nháp</span>
                                    </c:otherwise>
                                 </c:choose>
                              </td>
                              <td>
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
                              <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                              </c:forEach>
                        </ul>
                     </nav>
                  </c:when>
                  <c:when test="${page < 2}">
                     <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                        <ul class="pagination">
                           <c:forEach begin="1" end="${totalPage}" var="i">
                              <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
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
                              <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                              </c:forEach>
                        </ul>
                     </nav>
                  </c:when>
                  <c:otherwise>
                     <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                        <ul class="pagination">
                           <li class="page-item"><a class="page-link" href="${pagination_url}page=${page-1}"><<</a></li>
                              <c:forEach begin="1" end="${totalPage}" var="i">
                              <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                              </c:forEach>
                           <li class="page-item"><a class="page-link" href="${pagination_url}page=${page+1}">>></a></li>
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
                              <option value="1">Đăng</option>
                              <option value="0">Nháp</option>
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
   </body>
</html>



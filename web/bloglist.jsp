
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
      <link rel="stylesheet" href="css/styles.css">
      <link rel="stylesheet" href="css/datatable.css">
   </head>
   <style>
      .card-body {
         flex: 1 1 auto;
         padding: 20px;
         color: var(--bs-card-color);
      }
      .col-id{
         width: 50px;
         text-align: center;
      }
      .col-title{
         width: 600px;
         text-align: center;
      }
      .col-cate{
         width: 100px;
         text-align: center;
      }
      .col-update{
         width: 100px;
         text-align: center;
      }
      .col-status{
         width: 100px;
         text-align: center;
      }
      .col-actions{
         width: 100px;
         text-align: center;
      }
      .col-thumb{
         width: 100px;
         text-align: center;
      }
      .ms-1{
         color: red;
      }
   </style>
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
                  <div class="row mb-4">
                     <div class="card-body">
                        <div class="row g-3">
                           <form class="d-flex col-md-4" style="width: 100%; float: right !important" action="blog-list?page=${requestScope.page}" method="get">
                           <button type="button" onclick="window.location.href = '/ProjectSWP391/blog-list'" class="reset-btn">
                              Xóa lọc & tìm kiếm
                           </button>            
                           <div class="d-flex col-md-8">
                              <div class="d-flex justify-content-md-end">
                                 <select name="category" name="" class="form-select me-2" style="max-width: 150px;">
                                    <option value="" ${empty requestScope.category ? "selected" : ""}>Tất cả danh mục</option>
                                    <c:forEach var="category" items="${requestScope.listCategory}">
                                       <option ${requestScope.category == category.id ? "selected" : ""} value="${category.id}">${category.name}</option>
                                    </c:forEach>
                                 </select>
                                 <select name="status" class="form-select" style="max-width: 150px;">
                                    <option value="" ${ (requestScope.statusA == "" || empty requestScope.statusA) ? "selected" : ""}>Tất cả trạng thái</option>
                                    <option value="1" ${ requestScope.statusA == "1" ? "selected" : ""}>Đã đăng</option>
                                    <option value="0" ${ requestScope.statusA == "0" ? "selected" : ""}>Nháp</option>
                                 </select>
                                 <div class="col-md-4">
                                    <div class="input-group">
                                       <input name="search" type="text" class="form-control" placeholder="Tìm kiếm bài viết...">

                                    </div>
                                 </div>
                                 <button type="submit" class="search-button">Search</button>
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



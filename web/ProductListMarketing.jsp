<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Product List | E-Shopee</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

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
                        <h2>Danh sách sản phẩm</h2>
                        <button class="add-slider-btn" data-bs-toggle="modal" data-bs-target="#addProductModal">
                           Thêm sản phẩm
                        </button>
                     </div>

                     <!-- Filters and Search -->
                     <div class="card mb-4">
                        <div class="card-body">
                           <form class="p d-flex col-md-4" style="width: 100%; float: right !important" action="product-listAdmin?page=${requestScope.page}" method="get">
                           <button type="button" onclick="window.location.href = '/ProjectSWP391/product-listAdmin'" class="reset-btn">
                              Xóa lọc & tìm kiếm
                           </button>
                           <div class="col-md-4 d-flex align-items-center">
                              <select class="form-select custom-select" id="categoryFilter" name="category">
                                 <option value="">All Categories</option>
                                 <c:forEach var="category" items="${requestScope.listCategory}">
                                    <option value="${category.id}">${category.categoryName}</option>
                                 </c:forEach>
                              </select>
                           </div>

                           <div class="col-md-4">
                              <select class="form-select custom-select" id="statusFilter" name="brand">
                                 <option value="">Brand</option>
                                 <c:forEach var="brand" items="${requestScope.brandList}">
                                    <option value="${brand.brandID}">${brand.brandName}</option>
                                 </c:forEach>
                              </select>
                           </div>
                           <div class="col-md-4">
                              <input name="search" type="text" class="search-input" id="searchInput" placeholder="Search by title" value="${param.search}">
                           </div>
                           <div class="col-md-2">
                              <button type="submit" class="search-button">
                                 Search
                              </button>
                           </div>
                        </form>
                     </div>
                  </div>

                  <!-- Products Table -->
                  <div class="card">
                     <div class="card-body">
                        <div class="table-responsive">
                           <table class="table table-hover">
                              <thead>
                                 <tr>
                                    <th class="col-id">ID <i class="bi bi-arrow-down-up"></i></th>
                                    <th class="col-image">Image</th>
                                    <th class="col-title">Title <i class="bi bi-arrow-down-up"></i></th>
                                    <th class="col-cate">Category <i class="bi bi-arrow-down-up"></i></th>
                                    <th class="col-list">List Price <i class="bi bi-arrow-down-up"></i></th>
                                    <th class="col-sale">Sale Price <i class="bi bi-arrow-down-up"></i></th>
                                    <th class="col-status">Status <i class="bi bi-arrow-down-up"></i></th>
                                    <th class="col-actions">Actions</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <!-- Sample Product 1 -->
                                 <c:forEach var="product" items="${requestScope.list}">
                                    <tr>
                                       <td>${product.ID}</td>
                                       <td><img src="images/shop/${product.image}" alt="${product.name}" class="product-thumbnail"></td>
                                       <td>${product.name}</td>
                                       <td>${product.getProductCategory_ID()}</td>
                                       <td>${product.originalPrice}</td>
                                       <td>${product.salePrice}</td>
                                       <td>
                                          ${product.status == 1?"<span class=\"badge badge-active\">Active</span>":"<span class=\"badge badge-inactive\">Inactive</span>"}
                                       </td>
                                       <td>
                                          <c:choose>
                                             <c:when test="${product.status == 1}">
                                                <a href="productaction?action=hide&id=${product.ID}" class="btn btn-danger btn-sm">
                                                   <i class="bi bi-eye-slash"></i> Hide
                                                </a>
                                             </c:when>
                                             <c:otherwise>
                                                <a href="productaction?action=show&id=${product.ID}" class="btn btn-success btn-sm">
                                                   <i class="bi bi-eye"></i> Show
                                                </a>
                                             </c:otherwise>
                                          </c:choose>
                                          <a href="edit-product?id=${product.ID}" class="btn btn-primary btn-sm">
                                             <i class="bi bi-pencil"></i> Edit
                                          </a>
                                       </td>
                                    </tr>
                                 </c:forEach>

                              </tbody>
                           </table>
                        </div>

                        <!-- Pagination -->
                        <c:choose>
                           <c:when test="${requestScope.list==null || requestScope.list.size()==0}">
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
                                    <li class="page-item"><a class="page-link" href="${pagination_url}page=${page+1}">></a></li>
                                 </ul>
                              </nav>
                           </c:when>
                           <c:when test="${page+1 > totalPage}">
                              <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                 <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="${pagination_url}page=${page-1}"><</a></li>
                                       <c:forEach begin="1" end="${totalPage}" var="i">
                                       <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                                       </c:forEach>
                                 </ul>
                              </nav>
                           </c:when>
                           <c:otherwise>
                              <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                 <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="${pagination_url}page=${page-1}"><</a></li>
                                       <c:forEach begin="1" end="${totalPage}" var="i">
                                       <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                                       </c:forEach>
                                    <li class="page-item"><a class="page-link" href="${pagination_url}page=${page+1}">></a></li>
                                 </ul>
                              </nav>
                           </c:otherwise>
                        </c:choose>
                     </div>
                  </div>
               </div>
               <c:if test="${requestScope.success != null}">
                  <div class="alert alert-success alert-dismissible fade show" role="alert">
                     ${requestScope.success}
                     <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                  </div>
               </c:if>
               <c:if test="${requestScope.error != null}">
                  <div class="alert alert-danger alert-dismissible fade show" role="alert">
                     ${requestScope.error}
                     <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                  </div>
               </c:if>
            </div>
         </div>
      </div>

      <!-- Add Product Modal -->
      <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="addProductModalLabel">Add New Product</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                  <form enctype="multipart/form-data" id="addProductForm" action="product-listAdmin" method="post">
                     <div class="row mb-3">
                        <div class="col-md-6">
                           <label for="productName" class="form-label">Product Name</label>
                           <input type="text" class="form-control" id="productName" name="productName" required>
                        </div>
                        <div class="col-md-6">
                           <label for="productCategory" class="form-label">Category</label>
                           <select class="form-select" id="productCategory" name="categoryId" required>
                              <c:forEach var="category" items="${requestScope.listCategory}">
                                 <option value="${category.id}">${category.categoryName}</option>
                              </c:forEach>
                           </select>
                        </div>
                     </div>
                     <div class="row mb-3">
                        <div class="col-md-4">
                           <label for="originalPrice" class="form-label">Original Price</label>
                           <div class="input-group">
                              <span class="input-group-text">$</span>
                              <input type="number" class="form-control" name="originPrice" id="originalPrice" step="0.01" required>
                           </div>
                        </div>
                        <div class="col-md-4">
                           <label for="salePrice" class="form-label" >Sale Price</label>
                           <div class="input-group">
                              <span class="input-group-text">$</span>
                              <input type="number" class="form-control" name="salePrice" id="salePrice" step="0.01" required>
                           </div>
                        </div>
                        <div class="col-md-4">
                           <label for="costPrice" class="form-label">Cost Price</label>
                           <div class="input-group">
                              <span class="input-group-text">$</span>
                              <input type="number" class="form-control" name="costPrice" id="costPrice" step="0.01" required>
                           </div>
                        </div>
                     </div>
                     <div class="row mb-3">
                        <div class="col-md-6">
                           <label for="stock" class="form-label">Stock</label>
                           <input type="number" class="form-control" id="stock" name="stock" required>
                        </div>
                        <div class="col-md-6">
                           <label for="brand" class="form-label">Brand</label>
                           <select name="productBrand" class="form-select" id="brand">
                              <c:forEach var="brand" items="${requestScope.brandList}">
                                 <option value="${brand.brandID}">${brand.brandName}</option>
                              </c:forEach>
                           </select>
                        </div>
                     </div>
                     <div class="mb-3">
                        <label for="productDetails" class="form-label">Product Details</label>
                        <textarea class="form-control" id="productDetails" rows="3" name="description" required></textarea>
                     </div>
                     <div class="mb-3">
                        <label for="productImage" class="form-label">Product Image</label>
                        <input type="file" name="productImage" class="form-control" id="productImage" accept="image/*">
                     </div>
                     <div class="row mb-3">
                        <div class="col-md-6">
                           <label for="productStatus" class="form-label">Status</label>
                           <select class="form-select" name="status" id="productStatus" required>
                              <option value="1">Active</option>
                              <option value="0">Inactive</option>
                           </select>
                        </div>

                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <input type="submit" class="btn btn-primary" value="Save Product">
                     </div>
                  </form>

               </div>

            </div>
         </div>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   </body>
</html>


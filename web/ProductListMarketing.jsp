<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Product List | E-Shopee</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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

      .btn-danger {
         background-color: #dc3545;
      }

      .btn-danger:hover {
         background-color: #bb2d3b;
      }

      .btn-success {
         background-color: #198754;
      }

      .btn-success:hover {
         background-color: #157347;
      }

      .btn-secondary {
         background-color: #6c757d;
      }

      .btn-secondary:hover {
         background-color: #5c636a;
      }

      .btn-sm {
         padding: 5px 10px;
         font-size: 0.875rem;
         margin-right: 5px;
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

      .product-filter-form .filter-search-container {
         display: flex;
         gap: 20px;
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

         .product-filter-form .filter-search-container {
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

      .table td {
         padding: 12px 15px;
         vertical-align: middle;
         border-bottom: 1px solid var(--teal-light);
      }

      /* Image styles */
      .product-thumbnail {
         max-width: 80px;
         max-height: 60px;
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

      /* Alert styles */
      .alert {
         border-radius: 4px;
         padding: 12px 20px;
         margin-bottom: 20px;
      }

      .alert-success {
         background-color: #d4edda;
         color: #155724;
         border-color: #c3e6cb;
      }

      .alert-danger {
         background-color: #f8d7da;
         color: #721c24;
         border-color: #f5c6cb;
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
      .page-link:hover {
         background-color: var(--teal-light);
         color: var(--teal-text);
      }

      .page-item.active .page-link {
         background-color: var(--teal-primary);
         color: white;
         border-color: var(--teal-primary);
      }

      /* Pagination Styles - Teal Theme */
      .pagination {
         display: flex;
         justify-content: center;
         margin-top: 25px;
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
         display: inline-block;
         min-width: 40px;
         text-align: center;
         background-color: white;
      }

      .pagination .page-item.active .page-link {
         background-color: var(--teal-primary);
         color: white;
         border-color: var(--teal-primary);
         font-weight: 500;
      }

      .pagination .page-link:hover:not(.active) {
         background-color: var(--teal-light);
         color: var(--teal-text);
      }

      .pagination .page-item.disabled .page-link {
         color: #ccc;
         pointer-events: none;
         border-color: #eee;
         background-color: #f9f9f9;
      }

      /* Arrow styles */
      .pagination .page-item:first-child .page-link,
      .pagination .page-item:last-child .page-link {
         font-weight: bold;
         padding: 8px 12px;
      }

      .sidebar h2 {
         color: #00796b;
         font-size: 18px;
         margin-bottom: 15px;
         padding-bottom: 10px;
         border-bottom: 1px solid #b2dfdb;
      }

      h2 {
         color: var(--teal-dark);
         margin: 20px 0;
         font-weight: 600;
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

         .pagination .page-link {
            padding: 6px 10px;
            min-width: 32px;
         }

         .pagination .page-item {
            margin: 0 2px;
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
                     <div class="search-filter-section">
                        <div class="row">
                           <div class="col-md-12">
                              <form action="product-listAdmin?page=${requestScope.page}" method="get" class="form-group product-filter-form">
                              <div class="filter-header">
                                 <h3 class="filter-title">Lọc sản phẩm</h3>
                                 <h3 class="search-title">Tìm kiếm sản phẩm</h3>
                              </div>

                              <div class="filter-search-container">
                                 <div class="filter-section">
                                    <div class="filter-group">
                                       <select class="form-control" id="categoryFilter" name="category">
                                          <option value="">Tất cả danh mục</option>
                                          <c:forEach var="category" items="${requestScope.listCategory}">
                                             <option value="${category.id}">${category.categoryName}</option>
                                          </c:forEach>
                                       </select>
                                    </div>

                                    <div class="filter-group">
                                       <select class="form-control" id="statusFilter" name="brand">
                                          <option value="">Thương hiệu</option>
                                          <c:forEach var="brand" items="${requestScope.brandList}">
                                             <option value="${brand.brandID}">${brand.brandName}</option>
                                          </c:forEach>
                                       </select>
                                    </div>
                                 </div>

                                 <div class="search-section">
                                    <div class="search-input-group">
                                       <input name="search" type="text" class="form-control" id="searchInput" 
                                              placeholder="Tìm theo tên" value="${param.search}">
                                       <button type="submit" class="btn btn-primary">
                                          Tìm kiếm
                                       </button>
                                       <button type="button" onclick="window.location.href = '/ProjectSWP391/product-listAdmin'" 
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


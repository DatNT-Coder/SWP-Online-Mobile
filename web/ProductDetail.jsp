<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Edit Product - Product Management</title>
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

         .main-content {
            background-color: white;
            min-height: 100vh;
         }

         .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
            background-color: var(--teal-card);
         }

         .card-header {
            background-color: var(--teal-main);
            color: white;
            border-radius: 10px 10px 0 0 !important;
            padding: 15px 20px;
         }

         .btn-primary {
            background-color: var(--teal-main);
            border-color: var(--teal-main);
         }

         .btn-primary:hover {
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

         .breadcrumb {
            background-color: transparent;
            padding: 0;
         }

         .breadcrumb-item.active {
            color: var(--teal-dark);
            font-weight: 500;
         }

         a {
            color: var(--teal-main);
         }

         a:hover {
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

         .input-group-text {
            background-color: var(--teal-light);
            color: var(--teal-dark);
            border-color: #ced4da;
         }

         h2, h5.card-title {
            color: var(--teal-dark);
         }

         .nav-tabs .nav-link.active {
            color: var(--teal-dark);
            border-bottom: 2px solid var(--teal-main);
         }

         .img-thumbnail {
            border: 2px solid var(--teal-accent);
            background-color: white;
         }
      </style>
   </head>
   <body>
      <div class="container-fluid">
         <div class="row">
            <!-- Main Content -->
            <div class="col-lg-12 main-content">
               <div class="container-fluid py-4">
                  <div class="d-flex justify-content-between align-items-center mb-4">
                     <div>
                        <h2><i class="bi bi-pencil-square me-2"></i>Edit Product</h2>
                        <nav aria-label="breadcrumb">
                           <ol class="breadcrumb">
                              <li class="breadcrumb-item"><a href="product-listAdmin"><i class="bi bi-box-seam me-1"></i>Products</a></li>
                              <li class="breadcrumb-item active" aria-current="page">Edit Product</li>
                           </ol>
                        </nav>
                     </div>
                     <div>
                        <a href="product-listAdmin" class="btn btn-outline-secondary me-2">
                           <i class="bi bi-arrow-left"></i> Back to Products
                        </a>
                        <button type="submit" form="editProductForm" class="btn btn-primary">
                           <i class="bi bi-save"></i> Save Changes
                        </button>
                     </div>
                  </div>

                  <!-- Product Edit Form -->
                  <div class="card">
                     <div class="card-body">
                        <form id="editProductForm" action="edit-product" enctype="multipart/form-data" method="post">
                           <div class="row">
                              <!-- Left Column - Basic Info -->
                              <div class="col-md-8">
                                 <h5 class="card-title mb-4"><i class="bi bi-info-circle me-2"></i>Basic Information</h5>

                                 <div class="mb-3">
                                    <label for="productName" class="form-label">Product Name</label>
                                    <input name="productName" type="text" class="form-control" id="productName" value="${requestScope.product.name}" required>
                                 </div>

                                 <div class="mb-3">
                                    <label for="productDetails" class="form-label">Product Details</label>
                                    <textarea name="description" class="form-control" id="productDetails" rows="5" required>${requestScope.product.details}</textarea>
                                 </div>

                                 <div class="row mb-3">
                                    <div class="col-md-6">
                                       <label for="productCategory" class="form-label">Category</label>
                                       <select name="productCategory" class="form-select" id="productCategory" required>
                                          <c:forEach items="${listCategory}" var="category">
                                             <option value="${category.id}" ${category.id == requestScope.product.getProductCategory_ID() ?"selected":""}>${category.categoryName}</option>
                                          </c:forEach>
                                       </select>
                                    </div>
                                    <div class="col-md-6">
                                       <label for="brand" class="form-label">Brand</label>
                                       <select name="brand" class="form-select" id="brand">
                                          <c:forEach items="${brandList}" var="brand">
                                             <option value="${brand.brandID}" ${brand.brandID == requestScope.product.brandId?"selected":""}>${brand.brandName}</option>
                                          </c:forEach>
                                       </select>
                                    </div>
                                 </div>

                                 <h5 class="card-title mb-4 mt-5"><i class="bi bi-tag me-2"></i>Pricing Information</h5>

                                 <div class="row mb-3">
                                    <div class="col-md-4">
                                       <label for="originalPrice" class="form-label">Original Price</label>
                                       <div class="input-group">
                                          <span class="input-group-text">$</span>
                                          <input name="originalPrice" type="number" class="form-control" id="originalPrice" value="${requestScope.product.originalPrice}" step="0.01" required>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <label for="salePrice" class="form-label">Sale Price</label>
                                       <div class="input-group">
                                          <span class="input-group-text">$</span>
                                          <input name="salePrice" type="number" class="form-control" id="salePrice" value="${requestScope.product.salePrice}" step="0.01" required>
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <label for="costPrice" class="form-label">Cost Price</label>
                                       <div class="input-group">
                                          <span class="input-group-text">$</span>
                                          <input name="costPrice" type="number" class="form-control" id="costPrice" value="${requestScope.product.cost_price}" step="0.01" required>
                                       </div>
                                    </div>
                                 </div>

                                 <h5 class="card-title mb-4 mt-5"><i class="bi bi-box-seam me-2"></i>Inventory</h5>

                                 <div class="row mb-3">
                                    <div class="col-md-6">
                                       <label for="stock" class="form-label">Stock Quantity</label>
                                       <input name="stock" type="number" class="form-control" id="stock" value="${requestScope.product.getStock()}" required>
                                    </div>
                                 </div>
                              </div>

                              <!-- Right Column - Image and Status -->
                              <div class="col-md-4">
                                 <div class="card mb-4">
                                    <div class="card-header">
                                       <h5 class="card-title mb-0"><i class="bi bi-image me-2"></i>Product Image</h5>
                                    </div>
                                    <div class="card-body">
                                       <div class="text-center mb-3">
                                          <img src="images/shop/${requestScope.product.image}" class="img-thumbnail" style="max-height: 200px;" alt="Product Image">
                                       </div>
                                       <div class="mb-3">
                                          <label for="productImage" class="form-label">Upload New Image</label>
                                          <input name="productImage" type="file" class="form-control" id="productImage" accept="image/*">
                                       </div>
                                    </div>
                                 </div>

                                 <div class="card">
                                    <div class="card-header">
                                       <h5 class="card-title mb-0"><i class="bi bi-gear me-2"></i>Product Status</h5>
                                    </div>
                                    <div class="card-body">
                                       <div class="mb-3">
                                          <label for="productStatus" class="form-label">Status</label>
                                          <select name="status" class="form-select" id="productStatus" required>
                                             <c:choose>
                                                <c:when test="${requestScope.product.status == 1}">
                                                   <option value="1" selected>Active</option>
                                                   <option value="0">Inactive</option>
                                                </c:when>
                                                <c:otherwise>
                                                   <option value="1">Active</option>
                                                   <option value="0" selected>Inactive</option>
                                                </c:otherwise>
                                             </c:choose>
                                          </select>
                                       </div>
                                       <div class="mb-3">
                                          <label for="updatedDate" class="form-label">Last Updated</label>
                                          <input type="text" class="form-control" id="updatedDate" value="2023-05-15" readonly>
                                       </div>

                                       <div class="mb-3">
                                          <label for="productID" class="form-label">Product ID</label>
                                          <input name="productID" type="text" class="form-control" id="productID" value="${requestScope.product.ID}" readonly>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   </body>
</html>
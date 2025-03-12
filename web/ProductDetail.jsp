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
   </head>
   <style>
      body {
         background-color: #f8f9fa;
         font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      }

      .sidebar {
         min-height: 100vh;
         position: sticky;
         top: 0;
      }

      .main-content {
         padding: 0;
      }

      .card {
         border-radius: 8px;
         box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
         border: none;
      }

      .table th {
         font-weight: 600;
         color: #495057;
      }

      .sortable {
         cursor: pointer;
      }

      .sortable i {
         font-size: 0.8rem;
         margin-left: 5px;
      }

      .product-thumbnail {
         width: 50px;
         height: 50px;
         object-fit: cover;
         border-radius: 4px;
      }

      .badge-featured {
         background-color: #ffc107;
         color: #212529;
      }

      .badge-active {
         background-color: #28a745;
      }

      .badge-inactive {
         background-color: #dc3545;
      }

      .action-btn {
         padding: 0.25rem 0.5rem;
         font-size: 0.875rem;
      }

      .action-btn + .action-btn {
         margin-left: 5px;
      }

      .pagination {
         margin-top: 20px;
         margin-bottom: 0;
      }

      @media (max-width: 992px) {
         .sidebar {
            min-height: auto;
            position: static;
         }
      }


   </style>
   <body>
      <div class="container-fluid">
         <div class="row">
            <!-- Sidebar -->


            <!-- Main Content -->
            <div class="col-lg-12 main-content">
               <div class="container-fluid py-4">
                  <div class="d-flex justify-content-between align-items-center mb-4">
                     <div>
                        <h2>Edit Product</h2>
                        <nav aria-label="breadcrumb">
                           <ol class="breadcrumb">
                              <li class="breadcrumb-item"><a href="product-listAdmin">Products</a></li>
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
                                 <h5 class="card-title mb-4">Basic Information</h5>

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

                                 <h5 class="card-title mb-4 mt-5">Pricing Information</h5>

                                 <div class="row mb-3">
                                    <div class="col-md-4">
                                       <label for="originalPrice" class="form-label">Original Price</label>
                                       <div  class="input-group">
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

                                 <h5 class="card-title mb-4 mt-5">Inventory</h5>

                                 <div class="row mb-3">
                                    <div class="col-md-6">
                                       <label for="stock" class="form-label">Stock Quantity</label>
                                       <input name="stock" ${requestScope.product.getStock()} type="number" class="form-control" id="stock" value="50" required>
                                    </div>

                                 </div>
                              </div>

                              <!-- Right Column - Image and Status -->
                              <div class="col-md-4">
                                 <div class="card mb-4">
                                    <div class="card-header">
                                       <h5 class="card-title mb-0">Product Image</h5>
                                    </div>
                                    <div class="card-body">
                                       <div class="text-center mb-3">
                                          <img src="images/shop/${requestScope.product.image}" class="img-fluid rounded" style="max-height: 200px;" alt="Product Image">
                                       </div>
                                       <div class="mb-3">
                                          <label for="productImage" class="form-label">Upload New Image</label>
                                          <input type="file" class="form-control" id="productImage" accept="image/*">
                                       </div>
                                    </div>
                                 </div>

                                 <div class="card">
                                    <div class="card-header">
                                       <h5 class="card-title mb-0">Product Status</h5>
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



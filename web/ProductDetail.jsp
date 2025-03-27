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

         /* Add this to your existing style section */
         #previewModal .modal-content {
            border-radius: 10px;
            overflow: hidden;
         }

         #previewModal .modal-header {
            background-color: white;
            border-bottom: none;
            padding: 20px;
         }

         #previewModal .modal-title {
            font-weight: bold;
            color: #333;
         }

         #previewModal .modal-body {
            padding: 0;
         }

         #previewModal .img-fluid {
            width: 100%;
            max-height: 300px;
            object-fit: contain;
            border-bottom: 1px solid #eee;
            padding: 15px;
         }

         #previewModal h4 {
            font-size: 1.5rem;
            font-weight: bold;
            margin: 15px;
            color: #333;
         }

         #previewModal .text-danger {
            color: #d32f2f !important;
            font-size: 1.5rem;
            font-weight: bold;
         }

         #previewModal .text-decoration-line-through {
            font-size: 1.2rem;
            color: #999 !important;
         }

         #previewModal p {
            margin: 15px;
            color: #555;
            line-height: 1.6;
         }

         #previewModal .card {
            border: none;
            border-radius: 0;
            box-shadow: none;
         }

         #previewModal .card-header {
            background-color: white;
            border-bottom: 1px solid #eee;
            padding: 15px;
            font-weight: bold;
         }

         #previewModal .card-body {
            padding: 0;
         }

         #previewModal .list-group-item {
            border-left: none;
            border-right: none;
            padding: 12px 15px;
         }

         #previewModal .list-group-item:first-child {
            border-top: none;
         }

         #previewModal .list-group-item strong {
            color: #555;
            min-width: 100px;
            display: inline-block;
         }

         #previewModal .modal-footer {
            border-top: none;
            background-color: #f9f9f9;
            padding: 15px;
         }

         /* Product rating style */
         #previewModal .product-rating {
            margin: 15px;
            color: #ffc107;
            font-size: 1.2rem;
         }

         /* Add to cart button style */
         #previewModal .add-to-cart-btn {
            background-color: #d32f2f;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 15px;
            border-radius: 5px;
            font-weight: bold;
            display: inline-block;
         }

         /* Product ID style */
         #previewModal .product-id {
            margin: 15px;
            color: #777;
            font-size: 0.9rem;
         }

         /* Details tabs style */
         #previewModal .details-tabs {
            margin: 15px;
            border-bottom: 1px solid #eee;
         }

         #previewModal .details-tabs span {
            display: inline-block;
            padding: 8px 15px;
            margin-right: 5px;
            font-weight: bold;
            color: #555;
            cursor: pointer;
         }

         #previewModal .details-tabs span.active {
            border-bottom: 2px solid #d32f2f;
            color: #d32f2f;
         }

         /* Responsive adjustments */
         @media (max-width: 768px) {
            #previewModal .modal-dialog {
               margin: 10px;
            }

            #previewModal .row {
               flex-direction: column;
            }

            #previewModal .col-md-6 {
               width: 100%;
            }
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
                        <button type="button" class="btn btn-info me-2" data-bs-toggle="modal" data-bs-target="#previewModal">
                           <i class="bi bi-eye"></i> Preview
                        </button>
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
                                    <!-- Original Price -->
                                    <div class="col-md-4">
                                       <label for="originalPrice" class="form-label">Original Price</label>
                                       <div class="input-group">
                                          <span class="input-group-text">$</span>
                                          <input name="originalPrice" type="number" class="form-control" id="originalPrice" 
                                                 value="${requestScope.product.originalPrice}" step="0.01" min="1" required
                                                 onkeydown="return event.keyCode !== 69 && event.keyCode !== 189 && event.keyCode !== 109"
                                                 oninput="this.value = Math.max(1, parseFloat(this.value)) || 1">
                                       </div>
                                    </div>

                                    <!-- Sale Price -->
                                    <div class="col-md-4">
                                       <label for="salePrice" class="form-label">Sale Price</label>
                                       <div class="input-group">
                                          <span class="input-group-text">$</span>
                                          <input name="salePrice" type="number" class="form-control" id="salePrice" 
                                                 value="${requestScope.product.salePrice}" step="0.01" min="1" required
                                                 onkeydown="return event.keyCode !== 69 && event.keyCode !== 189 && event.keyCode !== 109"
                                                 oninput="this.value = Math.max(1, parseFloat(this.value)) || 1">
                                       </div>
                                    </div>

                                    <!-- Cost Price -->
                                    <div class="col-md-4">
                                       <label for="costPrice" class="form-label">Cost Price</label>
                                       <div class="input-group">
                                          <span class="input-group-text">$</span>
                                          <input name="costPrice" type="number" class="form-control" id="costPrice" 
                                                 value="${requestScope.product.cost_price}" step="0.01" min="1" required
                                                 onkeydown="return event.keyCode !== 69 && event.keyCode !== 189 && event.keyCode !== 109"
                                                 oninput="this.value = Math.max(1, parseFloat(this.value)) || 1">
                                       </div>
                                    </div>
                                 </div>

                                 <h5 class="card-title mb-4 mt-5"><i class="bi bi-box-seam me-2"></i>Inventory</h5>

                                 <div class="row mb-3">
                                    <div class="col-md-6">
                                       <label for="stock" class="form-label">Stock Quantity</label>
                                       <input name="stock" type="number" class="form-control" id="stock" 
                                              value="${requestScope.product.getStock()}" min="1" required 
                                              onkeydown="return event.keyCode !== 69 && event.keyCode !== 189 && event.keyCode !== 109"
                                              oninput="this.value = Math.max(1, parseInt(this.value) || 1">
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
      <!-- Preview Modal -->
      <div class="modal fade" id="previewModal" tabindex="-1" aria-labelledby="previewModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="previewModalLabel">Bản xem trước</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                  <div class="row">
                     <div class="col-md-6">
                        <img id="previewImage" src="images/shop/${requestScope.product.image}" class="img-fluid rounded mb-3" alt="Product Preview">
                     </div>
                     <div class="col-md-6">
                        <div class="card bg-white">
                           <div class="card-header">
                              <h6>Product Information</h6>
                           </div>
                           <div class="card-body">
                              <ul class="list-group list-group-flush">
                                 <li class="list-group-item fw-bold" id="previewName">${requestScope.product.name}</li>
                                 <li class="list-group-item">ID: <span id="previewProductId">${requestScope.product.ID}</span></li>
                                 <li class="list-group-item"><strong>Loại sản phẩm:</strong> <span id="previewCategory"></span></li>
                                 <li class="list-group-item" id="previewSalePrice">$${requestScope.product.salePrice}</li>
                                 <li class="list-group-item text-decoration-line-through text-muted" id="previewOriginalPrice">$${requestScope.product.originalPrice}</li>
                              </ul>
                           </div>
                           <div>
                              <label for="quantityInput">Số lượng: </label>
                              <input type="number" id="quantityInput" name="quantity" value="1" min="1">
                           </div>
                           <div class="product-rating">0.00 ★</div>
                           <div>
                              <a onclick="addToCart(${productDetail.ID})" class="btn btn-default add-to-cart" style="
                                 background-color: #26a69a;
                                 color: white;
                                 border: none;
                                 padding: 10px 20px;
                                 border-radius: 4px;
                                 font-weight: 600;
                                 text-transform: uppercase;
                                 letter-spacing: 0.5px;
                                 transition: all 0.3s ease;
                                 display: inline-flex;
                                 align-items: center;
                                 justify-content: center;
                                 gap: 8px;
                                 box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                                 text-decoration: none;
                                 "
                                 onmouseover="this.style.backgroundColor = '#00897b'; this.style.transform = 'translateY(-2px)'; this.style.boxShadow = '0 4px 8px rgba(0,0,0,0.15)'"
                                 onmouseout="this.style.backgroundColor = '#26a69a'; this.style.transform = ''; this.style.boxShadow = '0 2px 5px rgba(0,0,0,0.1)'"
                                 onmousedown="this.style.transform = 'translateY(0)'; this.style.boxShadow = '0 2px 3px rgba(0,0,0,0.1)'">
                                 <i class="fa fa-shopping-cart"></i> Add to cart
                              </a>
                           </div>

                           <a href=""><img src="${pageContext.request.contextPath}/images/product-details/share.png" class="share img-responsive"  alt="" /></a>
                        </div>
                     </div>
                     <div class="col-sm-12 bg-black">
                        <ul class="nav nav-tabs">
                           <li class="col-sm-1">
                              <span href="#" class="active" style="background-color: #26a69a; color: white; display: block; text-align: center;">Chi tiết</span>
                           </li>
                           <li class="col-sm-1">
                              <span href="#" style="color: graytext; display: block; text-align: center;">Đánh giá</span>
                           </li>
                        </ul>
                     </div>
                     <div class="col-sm-12">
                        <p id="previewDetails">${requestScope.product.details}</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
         <script>

                                    document.addEventListener('DOMContentLoaded', function () {
                                       // When preview button is clicked, update modal with current form values
                                       document.querySelector('[data-bs-target="#previewModal"]').addEventListener('click', function () {
                                          // Update basic info
                                          document.getElementById('previewName').textContent = document.getElementById('productName').value;
                                          document.getElementById('previewDetails').textContent = document.getElementById('productDetails').value;

                                          // Update pricing
                                          document.getElementById('previewOriginalPrice').textContent = '$' + document.getElementById('originalPrice').value;
                                          document.getElementById('previewSalePrice').textContent = '$' + document.getElementById('salePrice').value;

                                          // Update category and brand (text of selected option)
                                          const categorySelect = document.getElementById('productCategory');
                                          document.getElementById('previewCategory').textContent = categorySelect.options[categorySelect.selectedIndex].text;

                                          const brandSelect = document.getElementById('brand');
                                          document.getElementById('previewBrand').textContent = brandSelect.options[brandSelect.selectedIndex].text;

                                          // Update stock
                                          document.getElementById('previewStock').textContent = document.getElementById('stock').value;

                                          // Update status
                                          const statusSelect = document.getElementById('productStatus');
                                          document.getElementById('previewStatus').textContent = statusSelect.options[statusSelect.selectedIndex].text;

                                          // Update image preview if a new image was selected
                                          const fileInput = document.getElementById('productImage');
                                          if (fileInput.files && fileInput.files[0]) {
                                             const reader = new FileReader();
                                             reader.onload = function (e) {
                                                document.getElementById('previewImage').src = e.target.result;
                                             };
                                             reader.readAsDataURL(fileInput.files[0]);
                                          }
                                       });
                                    });
         </script>
   </body>
</html>
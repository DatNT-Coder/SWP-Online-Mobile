
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Product Management</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
      <link rel="stylesheet" href="css/styles.css">
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
                        <h2>Product Management</h2>
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">
                           <i class="bi bi-plus-lg"></i> Add New Product
                        </button>
                     </div>
                     <!-- Filters and Search -->
                     <div class="card mb-4">
                        <div class="card-body">
                           <div class="row g-3">
                              <form class="d-flex justify-content-between" action="product-listAdmin?page=${requestScope.page}" method="get">
                              <div class="col-md-4">
                                 <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-search"></i></span>
                                    <input  name="search" type="text" class="form-control" id="searchInput" placeholder="Search by title">
                                 </div>
                              </div>
                              <div class="col-md-3">
                                 <select class="form-select" id="categoryFilter" name="category">
                                    <option value="">All Categories</option>
                                    <c:forEach var="category" items="${requestScope.listCategory}">
                                       <option value="${category.id}">${category.categoryName}</option>
                                    </c:forEach>
                                 </select>
                              </div>
                              <div class="col-md-3">
                                 <select class="form-select" id="statusFilter" name="brand">
                                    <option value="">Brand</option>
                                    <c:forEach var="brand" items="${requestScope.brandList}">
                                       <option value="${brand.brandID}">${brand.brandName}</option>
                                    </c:forEach>
                                 </select>
                              </div>
                              <div class="col-md-2">
                                 <button type="submit" class="btn btn-primary w-100" id="resetFilters">
                                    Search
                                 </button>
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
                                    <th scope="col" class="sortable" data-sort="id">ID <i class="bi bi-arrow-down-up"></i></th>
                                    <th scope="col">Image</th>
                                    <th scope="col" class="sortable" data-sort="name">Title <i class="bi bi-arrow-down-up"></i></th>
                                    <th scope="col" class="sortable" data-sort="category">Category <i class="bi bi-arrow-down-up"></i></th>
                                    <th scope="col" class="sortable" data-sort="originalPrice">List Price <i class="bi bi-arrow-down-up"></i></th>
                                    <th scope="col" class="sortable" data-sort="salePrice">Sale Price <i class="bi bi-arrow-down-up"></i></th>
                                    <th scope="col" class="sortable" data-sort="status">Status <i class="bi bi-arrow-down-up"></i></th>
                                    <th scope="col">Actions</th>
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
                                                <a href="productaction?action=hide&id=${product.ID}" class="btn btn-sm btn-outline-secondary action-btn">
                                                   <i class="bi bi-eye-slash"></i> Hide
                                                </a>
                                             </c:when>
                                             <c:otherwise>
                                                <a href="productaction?action=show&id=${product.ID}" class="btn btn-sm btn-outline-secondary action-btn">
                                                   <i class="bi bi-eye"></i> Show
                                                </a>
                                             </c:otherwise>
                                          </c:choose>

<!--                                                        <button class="btn btn-sm btn-outline-info action-btn" data-bs-toggle="modal" data-bs-target="#viewProductModal${product.ID}">
                                                            <i class="bi bi-eye"></i> View
                                                        </button>-->
                                          <a href="edit-product?id=${product.ID}" class="btn btn-sm btn-outline-primary action-btn">
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


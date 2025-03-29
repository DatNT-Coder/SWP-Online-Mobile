<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Feedback List | Marketing</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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
                        <h2>Danh sách phản hồi</h2>
                     </div>

                     <!-- Filters and Search -->
                     <div class="search-filter-section">
                        <div class="row">
                           <div class="col-md-12">
                              <form action="listFeedbackMarketing" method="get" class="form-group product-filter-form">
                                 <div class="filter-header">
                                    <h3 class="filter-title">Lọc phản hồi</h3>
                                    <h3 class="search-title">Tìm kiếm phản hồi</h3>
                                 </div>

                                 <div class="filter-search-container">
                                    <div class="filter-section">
                                       <div class="filter-group">
                                          <select class="form-control" id="listFilter" name="filterType">
                                             <option selected disabled>Chọn theo...</option>
                                             <option value="status">Trạng thái</option>
                                          </select>
                                       </div>
                                       <div class="filter-group">
                                          <select class="form-control" id="filterDetail" name="filterValue" style="margin-top: 10px;">
                                             <option selected disabled>Lựa chọn</option>
                                          </select>
                                       </div>
                                    </div>

                                    <div class="search-section">
                                       <div class="search-input-group">
                                          <input type="hidden" name="msg" value="searchFeedback"/>
                                          <input type="text" name="fSearch" class="form-control" placeholder="Tên khách hàng, nội dung..."/>
                                          <button type="submit" class="btn btn-primary">
                                             Tìm kiếm
                                          </button>
                                          <button type="button" onclick="window.location.href = '/ProjectSWP391/marketing/listFeedbackMarketing'" 
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

                     <div>
                        <h4>${requestScope.message}</h4>
                  </div>

                  <!-- Feedback Table -->
                  <div class="card">
                     <div class="card-body">
                        <div class="table-responsive">
                           <table class="table table-hover">
                              <thead>
                                 <tr>
                                    <th><a href="/ProjectSWP391/marketing/listFeedbackMarketing?msg=sortFeedback&sortBy=id">ID</a></th>
                                    <th><a href="/ProjectSWP391/marketing/listFeedbackMarketing?msg=sortFeedback&sortBy=full_name">Tên khách hàng</a></th>
                                    <th><a href="/ProjectSWP391/marketing/listFeedbackMarketing?msg=sortFeedback&sortBy=name">Tên sản phẩm</a></th>
                                    <th><a href="/ProjectSWP391/marketing/listFeedbackMarketing?msg=sortFeedback&sortBy=rating">Đánh giá</a></th>
                                    <th><a href="/ProjectSWP391/marketing/listFeedbackMarketing?msg=sortFeedback&sortBy=comment">Nội dung</a></th>
                                    <th><a href="/ProjectSWP391/marketing/listFeedbackMarketing?msg=sortFeedback&sortBy=status">Trạng thái</a></th>
                                    <th>Chức Năng</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <!-- Feedback will be inserted here by JavaScript -->
                              </tbody>
                           </table>
                        </div>

                        <!-- Pagination -->
                        <ul class="pagination">
                           <li class="page-item"><a class="page-link" href="#">Trước</a></li>
                           <li class="page-item active"><a class="page-link" href="#">1</a></li>
                           <li class="page-item"><a class="page-link" href="#">2</a></li>
                           <li class="page-item"><a class="page-link" href="#">3</a></li>
                           <li class="page-item"><a class="page-link" href="#">Sau</a></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <!-- icon -->
         <script src="https://kit.fontawesome.com/8922b65fb8.js" crossorigin="anonymous"></script>
         <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
         <script src="${pageContext.request.contextPath}/js/price-range.js"></script>
         <script src="${pageContext.request.contextPath}/js/jquery.scrollUp.min.js"></script>
         <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
         <script src="${pageContext.request.contextPath}/js/jquery.prettyPhoto.js"></script>
         <script src="${pageContext.request.contextPath}/js/main.js"></script>
         <script>
                                             // Convert the product details from Java to JavaScript
                                             var feedbackList = JSON.parse('${listFeedback}');

                                             var currentPage = 1; // Current page
                                             var itemsPerPage = 8; // Number of items per page

                                             // Display products for the current page
                                             function displayProducts() {
                                                var start = (currentPage - 1) * itemsPerPage;
                                                var end = start + itemsPerPage;
                                                // Tạo một mảng để lưu trữ các key
                                                var keys = [];
                                                for (var key in feedbackList) {
                                                   if (feedbackList.hasOwnProperty(key)) {
                                                      keys.push(key);
                                                   }
                                                }
                                                var feedbackToDisplay = keys.slice(start, end);

                                                // Clear the current products
                                                $('tbody').empty();

                                                // Add each product
                                                feedbackToDisplay.forEach(function (feedbackId) {
                                                   var feedback = feedbackList[feedbackId].feedback;
                                                   // Kiểm tra product.status và chọn icon tương ứng
                                                   var statusIcon = feedback.status === 0 ? 'fa-eye-slash' : 'fa-eye';
                                                   var isFeed = feedback.status === 1 ? 'Khả dụng' : 'Không khả dụng';

                                                   var productHtml = '<tr>' +
                                                           '<td><a href="/ProjectSWP391/marketing/viewFeedbackMarketing?msg=loadpage&pid=' + feedback.id + '" style="color: black; text-decoration: none;">' + feedback.id + '</a></td>' +
                                                           '<td>' + feedback.full_name + '</td>' +
                                                           '<td>' + feedbackList[feedbackId].productname + '</td>' +
                                                           ' <td>' + feedback.rating + '</td>' +
                                                           '<td>' + feedback.comment + '</td>' +
                                                           '<td>' + isFeed + '</td>' +
                                                           ' <td> <a href="/ProjectSWP391/marketing/listFeedbackMarketing?fid=' + feedback.id + '&msg=toggleStatus&status=' + feedback.status + '"><i class="fa-solid ' + statusIcon + ' fa-lg"></i></a> </td>' +
                                                           ' </tr>';
                                                   $('tbody').append(productHtml);
                                                });
                                             }

                                             // Update the pagination links
                                             function updatePagination() {
                                                var totalPages = Math.ceil(Object.keys(feedbackList).length / itemsPerPage);

                                                // Clear the current pagination links
                                                $('.pagination').empty();
                                                // Add "Previous" button
                                                var prevClass = currentPage === 1 ? 'disabled' : '';
                                                var prevHtml = '<li class="page-item ' + prevClass + '"><a class="page-link" href="#">Trước</a></li>';
                                                $('.pagination').append(prevHtml);

                                                // Add each pagination link
                                                for (var i = 1; i <= totalPages; i++) {
                                                   var liClass = i === currentPage ? 'active' : '';
                                                   var liHtml = '<li class="page-item ' + liClass + '"><a class="page-link" href="#">' + i + '</a></li>';
                                                   $('.pagination').append(liHtml);
                                                }

                                                // Add "Next" button
                                                var nextClass = currentPage === totalPages ? 'disabled' : '';
                                                var nextHtml = '<li class="page-item ' + nextClass + '"><a class="page-link" href="#">Sau</a></li>';
                                                $('.pagination').append(nextHtml);

                                                // Add event handlers to the pagination links
                                                $('.pagination a').click(function (e) {
                                                   e.preventDefault();

                                                   var pageText = $(this).text();

                                                   if (pageText === 'Trước' && currentPage !== 1) {
                                                      currentPage--;
                                                   } else if (pageText === 'Sau' && currentPage !== totalPages) {
                                                      currentPage++;
                                                   } else if (pageText !== 'Sau' && pageText !== 'Trước') {
                                                      currentPage = parseInt(pageText);
                                                   }

                                                   displayProducts();
                                                   updatePagination();
                                                });
                                             }
                                             //Xử lý với filter.
                                             let selectedOption;
                                             $('#listFilter').change(function () {
                                                selectedOption = $(this).val();

                                                if (selectedOption === 'status') {
                                                   var filterDetail = $('#filterDetail');
                                                   filterDetail.empty();
                                                   filterDetail.append('<option selected disabled>Lựa chọn</option>');
                                                   filterDetail.append('<option value="0">Không khả dụng</option>');
                                                   filterDetail.append('<option value="1">Khả dụng</option>');
                                                }

                                             });
                                             $('#filterDetail').change(function () {
                                                var filterDetail = $(this).val();
                                                window.location.href = '/ProjectSWP391/marketing/listFeedbackMarketing?msg=feedbackFilter&selected=' + selectedOption + '&value=' + filterDetail;
                                             });
                                             // Display the initial products and pagination
                                             displayProducts();
                                             updatePagination();


         </script>
         <script>

            var sortState = JSON.parse(sessionStorage.getItem('sortState')) || {
               id: false,
               full_name: false,
               name: false,
               rating: false,
               comment: false,
               status: false

            };


            document.querySelectorAll('th a').forEach(function (link) {
               var column = link.getAttribute('href').split('=')[2];
               link.addEventListener('click', function (e) {
                  e.preventDefault();

                  // Đảo ngược trạng thái sắp xếp
                  sortState[column] = !sortState[column];
                  sessionStorage.setItem('sortState', JSON.stringify(sortState));
                  // Xác định thứ tự sắp xếp dựa trên trạng thái
                  var order = sortState[column] ? 'ASC' : 'DESC';

                  // Cập nhật href của liên kết với thứ tự sắp xếp mới
                  link.setAttribute('href', 'listFeedbackMarketing?msg=sortFeedback&sortBy=' + column + '&order=' + order);

                  // Kích hoạt liên kết
                  window.location.href = link.getAttribute('href');
               });
            });

         </script>
   </body>
</html>
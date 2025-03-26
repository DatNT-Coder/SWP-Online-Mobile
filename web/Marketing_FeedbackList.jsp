<%-- 
    Document   : marketing-feedbackList
    Created on : Mar 2, 2025, 8:51:20 PM
    Author     : tiend
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>Marketing | Quản lý Phản hồi</title>
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

      /* Sidebar styles */
      .col-md-2.sidebar {
         width: 250px;
         min-width: 250px;
         background-color: var(--teal-card);
         box-shadow: 2px 0 5px rgba(0,0,0,0.1);
         z-index: 100;
         height: 100vh;
         position: sticky;
         top: 0;
         overflow-y: auto;
         border-right: 1px solid var(--teal-light);
      }

      /* Main content styles */
      .col-md-10.main-content {
         flex-grow: 1;
         padding: 20px;
         background-color: var(--teal-bg);
      }

      /* Header styles */
      .header h2 {
         color: var(--teal-dark);
         font-weight: 600;
         margin: 20px 0;
         padding-bottom: 10px;
         border-bottom: 2px solid var(--teal-light);
      }

      /* Search and Filter Section - Redesigned */
      .search-filter-section {
         display: grid;
         grid-template-columns: 1fr 1fr;
         gap: 20px;
         background: transparent;
         padding: 0;
         margin-bottom: 20px;
      }

      .search-filter-section > .row {
         display: contents;
      }

      /* Filter section (left) */
      .search-filter-section > .row > .col-md-7 {
         background-color: var(--teal-card);
         padding: 20px;
         border-radius: 8px;
         box-shadow: 0 2px 4px rgba(0,0,0,0.1);
         border: 1px solid var(--teal-accent);
      }

      /* Search section (right) */
      .search-filter-section > .row > .col-md-5 {
         background-color: var(--teal-card);
         padding: 20px;
         border-radius: 8px;
         box-shadow: 0 2px 4px rgba(0,0,0,0.1);
         border: 1px solid var(--teal-accent);
      }

      /* Section headers */
      .search-filter-section h3 {
         color: var(--teal-dark);
         font-size: 1.1rem;
         margin-top: 0;
         margin-bottom: 15px;
         padding-bottom: 8px;
         border-bottom: 1px solid var(--teal-light);
         display: flex;
         align-items: center;
      }

      /* Filter icon */
      .search-filter-section > .row > .col-md-7 h3::before {
         content: "🗂️";
         margin-right: 10px;
      }

      /* Search icon */
      .search-filter-section > .row > .col-md-5 h3::before {
         content: "🔍";
         margin-right: 10px;
      }

      /* Form elements */
      .form-control {
         border: 1px solid var(--teal-light);
         border-radius: 4px;
         padding: 8px 12px;
         transition: all 0.3s;
         background-color: var(--teal-card);
         width: 100%;
         box-sizing: border-box;
         margin-bottom: 10px;
      }

      .form-control:focus {
         border-color: var(--teal-primary);
         box-shadow: 0 0 0 2px rgba(38, 166, 154, 0.2);
         outline: none;
      }

      .add-product-btn {
         background-color: var(--teal-primary);
         color: white;
         border: none;
         padding: 8px 16px;
         border-radius: 4px;
         transition: all 0.3s;
         cursor: pointer;
         width: 100%;
      }

      .add-product-btn:hover {
         background-color: var(--teal-dark);
         transform: translateY(-1px);
      }

      /* Table styles */
      .product-table {
         background-color: var(--teal-card);
         border-radius: 8px;
         box-shadow: 0 2px 4px rgba(0,0,0,0.1);
         padding: 20px;
         overflow-x: auto;
         border: 1px solid var(--teal-accent);
      }

      .table {
         width: 100%;
         border-collapse: separate;
         border-spacing: 0;
         table-layout: fixed;
      }

      .table thead th {
         background-color: var(--teal-primary);
         color: white;
         padding: 12px 15px;
         font-weight: 500;
         text-align: left;
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
         overflow: hidden;
         text-overflow: ellipsis;
         white-space: nowrap;
      }

      /* Column widths */
      .product-table th:nth-child(1),
      .product-table td:nth-child(1) {
         width: 80px;
      }
      .product-table th:nth-child(2),
      .product-table td:nth-child(2) {
         width: 150px;
      }
      .product-table th:nth-child(3),
      .product-table td:nth-child(3) {
         width: 150px;
      }
      .product-table th:nth-child(4),
      .product-table td:nth-child(4) {
         width: 100px;
      }
      .product-table th:nth-child(5),
      .product-table td:nth-child(5) {
         width: 300px;
         white-space: normal;
      }
      .product-table th:nth-child(6),
      .product-table td:nth-child(6) {
         width: 120px;
      }
      .product-table th:nth-child(7),
      .product-table td:nth-child(7) {
         width: 100px;
      }

      /* Pagination Styles */
      .pagination {
         display: flex;
         justify-content: center;
         margin-top: 25px;
         list-style: none;
         padding: 0;
      }

      .pagination li {
         margin: 0 4px;
      }

      .pagination li a {
         color: var(--teal-dark);
         text-decoration: none;
         padding: 8px 14px;
         border-radius: 4px;
         border: 1px solid var(--teal-light);
         transition: all 0.3s ease;
         display: inline-block;
         min-width: 40px;
         text-align: center;
      }

      .pagination li.active a {
         background-color: var(--teal-primary);
         color: white;
         border-color: var(--teal-primary);
         font-weight: 500;
      }

      .pagination li a:hover:not(.active) {
         background-color: var(--teal-light);
         color: var(--teal-text);
      }

      .pagination li.disabled a {
         color: #ccc;
         pointer-events: none;
         border-color: #eee;
      }

      /* Pagination arrows */
      .pagination li:first-child a,
      .pagination li:last-child a {
         font-weight: bold;
      }

      .sidebar h2 {
         color: var(--teal-primary);
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

         .col-md-2.sidebar {
            width: 100%;
            height: auto;
            position: relative;
         }

         .search-filter-section {
            grid-template-columns: 1fr;
         }

         .product-table table {
            min-width: 700px;
         }
         .pagination li a {
            padding: 6px 10px;
            min-width: 32px;
         }
      }
   </style>
   <body>
      <div class="container-fluid">
         <div class="row">
            <!-- Side Bar (Left Column) - Fixed position -->
            <div class="col-md-2">
               <jsp:include page="sidebar.jsp"></jsp:include>
               </div>

               <!-- Main Content (Right Column) -->
               <div class="col-md-10 main-content" style="padding: 20px;">
                  <div class="container-fluid py-4">
                     <!-- Your existing content here -->
                     <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2>Danh sách phản hồi</h2>
                     </div>
                     <div class="search-filter-section">
                        <div class="row">
                           <div class="col-md-7">
                              <div class="form-group select-filter">
                                 <label for="filter">
                                    <h3>Lọc phản hồi:</h3>
                                 </label>
                                 <select class="form-control" id="listFilter">
                                    <option selected="" disabled="">Chọn theo...</option>
                                    <option value="status">Trạng thái</option>
                                 </select>
                                 <select class="form-control" id="filterDetail" style="margin-top: 10px;">
                                    <option selected="" disabled="">Lựa chọn</option>
                                    <!-- lựa chọn ở đây. -->
                                 </select>
                              </div>
                           </div>
                           <form action="listFeedbackMarketing">
                              <input type="hidden" name="msg" value="searchFeedback"/>
                              <div class="col-md-5">
                                 <div class="form-group">
                                    <label for="fSearch">
                                       <h3>Tìm kiếm:</h3>
                                    </label>
                                    <input type="text" name="fSearch" class="form-control" placeholder="Tên khách hàng, nội dung..."/>
                                    <button class="add-product-btn btn btn-primary" type="submit">Tìm kiếm</button>
                                 </div>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
                  <div>
                     <h4>${requestScope.message}</h4>
               </div>
               <div class="product-table">
                  <table class="table table-striped" style="width: 100%;border: 1px solid #DDDDDD;border-radius: 6px;">
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
                        <!-- Sản phẩm sẽ được chèn vào đây -->
                     </tbody>
                  </table>
                  <ul class="pagination">
                     <li class="active"><a href="">1</a></li>
                     <li><a href="">2</a></li>
                     <li><a href="">3</a></li>
                     <li><a href="">&raquo;</a></li>
                  </ul>
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
            var prevHtml = '<li class="' + prevClass + '"><a href="#">Trước</a></li>';
            $('.pagination').append(prevHtml);

            // Add each pagination link
            for (var i = 1; i <= totalPages; i++) {
               var liClass = i === currentPage ? 'active' : '';
               var liHtml = '<li class="' + liClass + '"><a href="#">' + i + '</a></li>';
               $('.pagination').append(liHtml);
            }

            // Add "Next" button
            var nextClass = currentPage === totalPages ? 'disabled' : '';
            var nextHtml = '<li class="' + nextClass + '"><a href="#">Sau</a></li>';
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


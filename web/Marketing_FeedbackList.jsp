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
      <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/sider.css" rel="stylesheet">
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

         .header h1 {
            color: var(--teal-dark);
            font-weight: 600;
            margin: 20px 0;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--teal-light);
         }

         /* Search and Filter Section */
         .search-filter-section {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
         }

         .search-filter-section h3 {
            color: var(--teal-dark);
            font-size: 1.1rem;
            margin-bottom: 10px;
         }

         .form-control {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 8px 12px;
            transition: all 0.3s;
         }

         .form-control:focus {
            border-color: var(--teal-light);
            box-shadow: 0 0 0 2px rgba(38, 166, 154, 0.2);
            outline: none;
         }

         .add-product-btn {
            background-color: var(--teal-primary);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            margin-top: 10px;
            transition: all 0.3s;
         }

         .add-product-btn:hover {
            background-color: var(--teal-dark);
         }

         /* Table Styling */
         .product-table {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            padding: 20px;
            overflow-x: auto;
         }

         .table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 20px;
         }

         .table thead th {
            background-color: var(--teal-primary);
            color: white;
            padding: 12px 15px;
            border: none;
            font-weight: 500;
         }

         .table thead th a {
            color: white;
            text-decoration: none;
         }

         .table thead th a:hover {
            text-decoration: underline;
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

         /* Status Indicators */
         .fa-eye {
            color: #388e3c;
         }

         .fa-eye-slash {
            color: #d32f2f;
         }

         /* Pagination */
         .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
         }

         .pagination li {
            margin: 0 5px;
         }

         .pagination li a {
            color: var(--teal-primary);
            border: 1px solid #ddd;
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
            transition: all 0.3s;
         }

         .pagination li.active a {
            background-color: var(--teal-primary);
            color: white;
            border-color: var(--teal-primary);
         }

         .pagination li a:hover:not(.active) {
            background-color: #f5f5f5;
         }

         /* Message Styling */
         h4 {
            color: #d32f2f;
            margin: 10px 0;
            padding: 10px;
            background-color: #ffebee;
            border-radius: 4px;
            border-left: 4px solid #d32f2f;
         }

         /* Responsive Adjustments */
         @media (max-width: 768px) {
            .search-filter-section .row > div {
               margin-bottom: 15px;
            }

            .table {
               font-size: 0.9rem;
            }

            .table td, .table th {
               padding: 8px 10px;
            }
         }

         /* Sort Indicator */
         th[data-sort]::after {
            content: " \25B4";
            opacity: 0.5;
         }

         th[data-sort="desc"]::after {
            content: " \25BE";
         }

         th[data-sort="asc"]::after {
            content: " \25B4";
            opacity: 1;
         }
      </style>
   </head>
   <body>
      <div class="container-fluid">
         <div class="row">
            <!-- Side Bar (Left Column) -->
            <div class="col-md-2" style="padding: 0;">
               <jsp:include page="sidebar.jsp"></jsp:include>
               </div>
               <!-- Main Content -->
               <div class="col-md-10" style="padding: 20px;">
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


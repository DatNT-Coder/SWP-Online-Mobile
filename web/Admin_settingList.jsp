<%-- 
    Document   : Admin_settingList
    Created on : Mar 18, 2025, 4:10:05 PM
    Author     : tiend
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Admin | Quản lý cài đặt</title>

      <!-- Bootstrap & Icons -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
      <link href="https://kit.fontawesome.com/8922b65fb8.js" rel="stylesheet">

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

         .dashboard-container {
            display: flex;
            min-height: 100vh;
         }

         .main-content {
            flex: 1;
            padding: 20px;
            background-color: var(--teal-bg);
         }

         .panel {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            border: 1px solid var(--teal-accent);
         }

         .panel-heading {
            background-color: var(--teal-primary);
            color: white;
            padding: 15px 20px;
            border-radius: 8px 8px 0 0;
            font-weight: 600;
         }

         .panel-body {
            padding: 20px;
         }

         .btn-primary {
            background-color: var(--teal-primary);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
         }

         .btn-primary:hover {
            background-color: var(--teal-dark);
         }

         table {
            width: 100%;
            border-collapse: collapse;
         }

         th {
            background-color: var(--teal-primary);
            color: white;
            padding: 12px;
            text-align: left;
         }

         td {
            padding: 12px;
            border-bottom: 1px solid #eee;
         }

         tr:nth-child(even) {
            background-color: var(--teal-light);
         }

         .sortable {
            cursor: pointer;
            color: white;
         }

         .sortable:hover {
            background-color: var(--teal-dark);
         }

         .status-active {
            color: #63E6BE;
         }

         .status-inactive {
            color: #ff0000;
         }

         .action-icon {
            margin: 0 5px;
            cursor: pointer;
         }

         .action-icon:hover {
            opacity: 0.8;
         }

         .form-control {
            border: 1px solid var(--teal-light);
            border-radius: 4px;
            padding: 8px 12px;
         }
         
         .pagination .page-item.active .page-link {
            background-color: var(--teal-primary);
            border-color: var(--teal-primary);
         }

         .pagination .page-link {
            color: var(--teal-text);
         }


         @media (max-width: 768px) {
            .dashboard-container {
               flex-direction: column;
            }

            .search-filter-section .row > div {
               margin-bottom: 15px;
            }
         }
      </style>
   </head>
   <body>
      <div class="dashboard-container">
         <!-- Sidebar -->
         <div style="min-width: 250px;">
            <jsp:include page="Admin_sidebar.jsp"></jsp:include>
            </div>

            <!-- Main Content -->
            <div class="main-content">
               <div class="panel">
                  <header class="panel-heading">Danh sách cài đặt</header>
                  <div class="panel-body">
                     <div class="text-center mb-4">
                        <a class="btn btn-primary" href="/ProjectSWP391/admin/manageSettingAdmin?msg=loadAddSetting">
                           <i class="bi bi-plus-lg"></i> Cài đặt mới
                        </a>
                     </div>

                     <!-- Search and Filter Section -->
                     <div class="search-filter-section mb-4">
                        <div class="row">
                           <div class="col-md-7">
                              <div class="form-group">
                                 <label for="listFilter" class="form-label"><strong>Lọc cài đặt:</strong></label>
                                 <select class="form-control" id="listFilter">
                                    <option selected disabled>Chọn theo...</option>
                                    <option value="type">Kiểu cài đặt</option>
                                    <option value="status">Trạng thái cài đặt</option>
                                 </select>
                                 <select class="form-control mt-2" id="filterDetail">
                                    <option selected disabled>Lựa chọn</option>
                                 </select>
                              </div>
                           </div>
                           <div class="col-md-5">
                              <form action="/ProjectSWP391/admin/listSettingAdmin">
                                 <input type="hidden" name="msg" value="searchSetting"/>
                                 <div class="form-group">
                                    <label for="pSearch" class="form-label"><strong>Tìm kiếm:</strong></label>
                                    <div class="input-group">
                                       <input type="text" name="pSearch" class="form-control" placeholder="Tên cài đặt, giá trị..."/>
                                       <button class="btn btn-primary" type="submit">
                                          <i class="bi bi-search"></i>
                                       </button>
                                    </div>
                                 </div>
                              </form>
                           </div>
                        </div>
                     </div>

                     <!-- Message Display -->
                     <div class="alert alert-info" style="display: ${empty requestScope.message ? 'none' : 'block'}">
                     ${requestScope.message}
                  </div>

                  <!-- Settings Table -->
                  <div class="table-responsive">
                     <table class="table">
                        <thead>
                           <tr>
                              <th><a class="sortable" href="/ProjectSWP391/admin/listSettingAdmin?msg=sortSetting&sortBy=id">ID</a></th>
                              <th><a class="sortable" href="/ProjectSWP391/admin/listSettingAdmin?msg=sortSetting&sortBy=type">Kiểu cài đặt</a></th>
                              <th><a class="sortable" href="/ProjectSWP391/admin/listSettingAdmin?msg=sortSetting&sortBy=name">Tên</a></th>
                              <th><a class="sortable" href="/ProjectSWP391/admin/listSettingAdmin?msg=sortSetting&sortBy=value">Giá trị</a></th>
                              <th><a class="sortable" href="/ProjectSWP391/admin/listSettingAdmin?msg=sortSetting&sortBy='order'">Thứ tự</a></th>
                              <th><a class="sortable" href="/ProjectSWP391/admin/listSettingAdmin?msg=sortSetting&sortBy=isActive">Trạng thái</a></th>
                              <th>Chức năng</th>
                           </tr>
                        </thead>
                        <tbody>
                           <!-- Settings will be inserted here by JavaScript -->
                        </tbody>
                     </table>
                  </div>

                  <!-- Pagination -->
                  <nav aria-label="Page navigation" class="mt-4">
                     <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                           <a class="page-link" href="#" tabindex="-1">Trước</a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                           <a class="page-link" href="#">Tiếp</a>
                        </li>
                     </ul>
                  </nav>
               </div>
            </div>
         </div>
      </div>

      <!-- Scripts -->
      <script src="https://kit.fontawesome.com/8922b65fb8.js" crossorigin="anonymous"></script>
      <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
      <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
      <script>
         // Convert the settings details from Java to JavaScript
         var productDetails = JSON.parse('${listSetting}');

         var currentPage = 1; // Current page
         var itemsPerPage = 8; // Number of items per page

         // Display settings for the current page
         function displayProducts() {
            var start = (currentPage - 1) * itemsPerPage;
            var end = start + itemsPerPage;
            var productsToDisplay = productDetails.slice(start, end);

            // Clear the current settings
            $('tbody').empty();

            // Add each setting
            productsToDisplay.forEach(function (product) {
               var statusIcon = product.isActive === 0 ?
                       '<i class="bi bi-toggle-off status-icon status-inactive"></i>' :
                       '<i class="bi bi-toggle-on status-icon status-active"></i>';
               var isActivate = product.isActive === 1 ? 'Hoạt động' : 'Không hoạt động';
               var productHtml = '<tr>' +
                       '<td>' + product.id + '</td>' +
                       '<td>' + product.type + '</td>' +
                       '<td><a href="viewSettingAdmin?sid=' + product.id + '" style="color: var(--teal-text); text-decoration: none;">' + product.name + '</a></td>' +
                       '<td>' + product.value + '</td>' +
                       '<td>' + product.order + '</td>' +
                       '<td>' + isActivate + '</td>' +
                       '<td>' +
                       '  <a href="/ProjectSWP391/admin/listSettingAdmin?sid=' + product.id + '&msg=toggleStatus&status=' + product.isActive + '">' + statusIcon + '</a>' +
                       '  <a href="/ProjectSWP391/admin/manageSettingAdmin?msg=loadEditSetting&sid=' + product.id + '"><i class="bi bi-pencil-square action-icon"></i></a>' +
                       '</td>' +
                       '</tr>';
               $('tbody').append(productHtml);
            });
         }

         // Update the pagination links
         function updatePagination() {
            var totalPages = Math.ceil(Object.keys(productDetails).length / itemsPerPage);

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
            var nextHtml = '<li class="page-item ' + nextClass + '"><a class="page-link" href="#">Tiếp</a></li>';
            $('.pagination').append(nextHtml);

            // Add event handlers to the pagination links
            $('.pagination a').click(function (e) {
               e.preventDefault();

               var pageText = $(this).text();

               if (pageText === 'Trước' && currentPage !== 1) {
                  currentPage--;
               } else if (pageText === 'Tiếp' && currentPage !== totalPages) {
                  currentPage++;
               } else if (pageText !== 'Trước' && pageText !== 'Tiếp') {
                  currentPage = parseInt(pageText);
               }

               displayProducts();
               updatePagination();
            });
         }

         // Filter handling
         let selectedOption;
         $('#listFilter').change(function () {
            selectedOption = $(this).val();
            if (selectedOption === 'type') {
               $.ajax({
                  url: "/ProjectSWP391/admin/listSettingAdmin",
                  type: 'GET',
                  data: {
                     msg: 'selectFilter',
                     selected: selectedOption
                  },
                  success: function (data) {
                     var filterDetail = $('#filterDetail');
                     filterDetail.empty();
                     filterDetail.append('<option selected disabled>Lựa chọn</option>');
                     $.each(data, function (index, value) {
                        filterDetail.append('<option value="' + value.type + '">' + value.type + '</option>');
                     });
                  }
               });
            }

            if (selectedOption === 'status') {
               var filterDetail = $('#filterDetail');
               filterDetail.empty();
               filterDetail.append('<option selected disabled>Lựa chọn</option>');
               filterDetail.append('<option value="1">Hoạt động</option>');
               filterDetail.append('<option value="0">Không hoạt động</option>');
            }
         });

         $('#filterDetail').change(function () {
            var filterDetail = $(this).val();
            window.location.href = '/ProjectSWP391/admin/listSettingAdmin?msg=settingFilter&selected=' + selectedOption + '&value=' + filterDetail;
         });

         // Display the initial settings and pagination
         displayProducts();
         updatePagination();
      </script>
   </body>
</html>
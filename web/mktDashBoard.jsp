<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Marketing | MKTDashboard</title>
      <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
      <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
      <link href="${pageContext.request.contextPath}/css/sider.css" rel="stylesheet">
      <script src="https://kit.fontawesome.com/8922b65fb8.js" crossorigin="anonymous"></script>
   </head>
   <style>
      :root {
         --teal-primary: #4db6ac;
         --teal-light: #82e9de;
         --teal-dark: #00867d;
         --teal-bg: #e0f2f1;
         --teal-text: #004d40;
      }

      body {
         background-color: var(--teal-bg);
         color: var(--teal-text);
         font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      }

      .skin-black {
         background-color: var(--teal-bg) !important;
      }

      h2 {
         color: var(--teal-dark);
         margin: 20px 0;
         font-weight: 600;
      }

      /* Statistics Cards */
      .sm-st {
         background: white;
         border-radius: 8px;
         padding: 15px;
         box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
         transition: transform 0.3s ease;
      }

      .sm-st:hover {
         transform: translateY(-5px);
      }

      .st-red {
         background-color: #ffcdd2 !important;
         color: #d32f2f;
      }

      .st-violet {
         background-color: #e1bee7 !important;
         color: #7b1fa2;
      }

      .st-blue {
         background-color: #bbdefb !important;
         color: #1976d2;
      }

      .st-green {
         background-color: #c8e6c9 !important;
         color: #388e3c;
      }

      .sm-st-icon {
         background-color: var(--teal-primary) !important;
         color: white !important;
      }

      .sm-st-info {
         color: var(--teal-text);
      }

      .sm-st-info span {
         font-weight: bold;
         color: var(--teal-dark);
      }

      /* Tabs */
      .nav-tabs {
         border-bottom: 2px solid var(--teal-light);
         margin-bottom: 20px;
      }

      .nav-link {
         color: var(--teal-text);
         border: none !important;
         padding: 12px 20px;
         font-weight: 500;
      }

      .nav-link.active {
         color: var(--teal-primary) !important;
         background-color: transparent !important;
         border-bottom: 3px solid var(--teal-primary) !important;
      }

      .nav-link:hover:not(.active) {
         color: var(--teal-dark) !important;
         background-color: rgba(77, 182, 172, 0.1) !important;
      }

      /* Tables */
      .table {
         background-color: white;
         border-radius: 8px;
         overflow: hidden;
         box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      }

      .table thead {
         background-color: var(--teal-primary);
         color: white;
      }

      .table th {
         border: none !important;
         padding: 12px 15px !important;
      }

      .table td {
         padding: 10px 15px !important;
         vertical-align: middle !important;
         border-color: #e0f2f1 !important;
      }

      .table tr:nth-child(even) {
         background-color: #f5f5f5;
      }

      .table tr:hover {
         background-color: rgba(77, 182, 172, 0.1) !important;
      }

      /* Form Elements */
      .panel {
         border: none;
         border-radius: 8px;
         box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
         background-color: white;
      }

      .panel-heading {
         background-color: var(--teal-primary) !important;
         color: white !important;
         border-radius: 8px 8px 0 0 !important;
         padding: 12px 15px !important;
         border: none !important;
      }

      input[type="date"], input[type="submit"] {
         border: 1px solid var(--teal-light);
         border-radius: 4px;
         padding: 8px 12px;
         width: 100%;
         margin-bottom: 15px;
         color: var(--teal-text);
      }

      input[type="date"]:focus {
         outline: none;
         border-color: var(--teal-primary);
         box-shadow: 0 0 0 2px rgba(77, 182, 172, 0.2);
      }

      input[type="submit"] {
         background-color: var(--teal-primary);
         color: white;
         border: none;
         cursor: pointer;
         transition: background-color 0.3s;
      }

      input[type="submit"]:hover {
         background-color: var(--teal-dark);
      }

      /* Scrollbar styling */
      ::-webkit-scrollbar {
         width: 8px;
      }

      ::-webkit-scrollbar-track {
         background: #f1f1f1;
         border-radius: 4px;
      }

      ::-webkit-scrollbar-thumb {
         background: var(--teal-light);
         border-radius: 4px;
      }

      ::-webkit-scrollbar-thumb:hover {
         background: var(--teal-primary);
      }
   </style>
   <body class="skin-black">
      <div class="container-fluid">
         <div class="row">
            <div class="col-md-3">
               <div class="wrapper row-offcanvas row-offcanvas-left">
                  <jsp:include page="sidebar.jsp"></jsp:include>
                  </div>
               </div>
               <div class="col-md-9">
                  <h2 style="text-align: center">Bảng quản lí marketing</h2>
                  <div class="row" style="margin-bottom:5px;">
                     <!-- Statistics section -->
                     <div class="col-md-3">
                        <div class="sm-st clearfix">
                           <span class="sm-st-icon st-red"><i class="fa fa-file-text-o"></i></span>
                           <div class="sm-st-info">
                              Tổng <span>${totalP}</span> Bài Đăng <br>
                           * <span>${totalPA}</span> Bài viết đã được đăng <br>
                           * <span>${totalPIA}</span> Bài viết bị ẩn <br>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-3">
                     <div class="sm-st clearfix">
                        <span class="sm-st-icon st-violet"><i class="fa fa-shopping-cart"></i></span>
                        <div class="sm-st-info">
                           Tổng Sản Phẩm: <span>${totalPd}</span> <br>
                           * <span>${totalPdA}</span> Sản phẩm đang được bày bán <br>
                           * <span>${totalPdIA}</span> Sản phẩm chưa được bày bán.
                        </div>
                     </div>
                  </div>
                  <div class="col-md-3">
                     <div class="sm-st clearfix">
                        <span class="sm-st-icon st-blue"><i class="fa fa-user"></i></span>
                        <div class="sm-st-info">
                           <span>${totalU}</span> Khách Hàng
                        </div>
                     </div>
                  </div>
                  <div class="col-md-3">
                     <div class="sm-st clearfix">
                        <span class="sm-st-icon st-green"><i class="fa fa-comments"></i></span>
                        <div class="sm-st-info">
                           <span>${gDAOfeed}</span> Phản hồi
                        </div>
                     </div>
                  </div>
                  <!-- More statistic sections -->
                  <!-- Add or keep only necessary sections here -->
               </div>

               <!-- Tab buttons -->
               <ul class="nav nav-tabs" id="myTab" role="tablist">
                  <li class="nav-item">
                     <a class="nav-link active" id="account-tab" data-toggle="tab" href="#account" role="tab" aria-controls="account" aria-selected="true">Tài khoản mới</a>
                  </li>

               </ul>
               <!-- Tab content -->
               <div class="tab-content" id="myTabContent">
                  <!-- Tài khoản mới -->
                  <div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
                     <div class="row">
                        <div class="col-md-8">
                           <section class="panel">

                              <div class="panel-body table-responsive" style="max-height: 100vh; overflow: auto">
                                 <table class="table table-hover">
                                    <thead>
                                       <tr>
                                          <th>Số thứ tự</th>
                                          <th>Email</th>
                                          <th>Tên tài khoản</th>
                                          <th>Ngày đăng kí</th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <c:forEach items="${requestScope.newLyCustomers}" var="items">
                                          <tr>
                                             <td>${items.getID()}</td>
                                             <td>${items.email}</td>
                                             <td>${items.full_name}</td>
                                             <td>${items.registration_date}</td>
                                          </tr>
                                       </c:forEach>
                                    </tbody>
                                 </table>
                              </div>
                           </section>
                        </div>
                        <div class="col-md-4">
                           <section class="panel">
                              <header class="panel-heading">
                                 Thống kê
                              </header>
                              <div class="panel-body">
                                 <form>
                                    <label for="fromDate" style="display: block;">Bắt đầu:</label>
                                    <input type="date" id="fromDate" name="fromDate" value="${requestScope.fromDate}" onchange="this.form.submit()" style="display: block; margin-bottom: 10px;" />

                                    <label for="toDate" style="display: block;">Kết thúc:</label>
                                    <input type="date" id="toDate" name="toDate" value="${requestScope.toDate}" onchange="this.form.submit()" style="display: block; margin-bottom: 10px;" />

                                    <!-- Submit button -->
                                    <input type="submit" value="Lọc" style="display: block; padding: 8px 16px;" />
                                 </form>
                              </div>
                           </section>
                        </div>
                     </div>
                  </div>                  
               </div>
            </div>

         </div>
         <!-- Tab Mới -->


      </div>
   </div>

</div>
</div>
</div>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
                                       $(document).ready(function () {
                                          // Chuyển đến tab "Tài khoản mới" khi trang được tải lên
                                          $('#account-tab').tab('show');

                                          // Xử lý khi bấm vào tab
                                          $('#myTab a').on('click', function (e) {
                                             e.preventDefault();
                                             // Lấy ID của tab được bấm
                                             var selectedTab = $(this).attr('href');
                                             // Hiển thị nội dung của tab tương ứng với tab được bấm
                                             $(selectedTab).tab('show');
                                             // Nếu tab được bấm là tab đầu tiên
                                             if (selectedTab === '#account') {
                                                // Làm mới trang
                                                window.location.reload();
                                             }
                                          });

                                          // Xử lý khi chuyển tab
                                          $('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                                             // Lấy ID của tab đang được chọn
                                             var selectedTab = $(e.target).attr('href');
                                             // Ẩn tất cả các tab-pane khác
                                             $('.tab-pane').removeClass('show active');
                                             // Hiển thị nội dung của tab được chọn
                                             $(selectedTab).addClass('show active');
                                          });
                                       });
</script>

</body>
</html>

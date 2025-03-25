<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Marketing | MKTDashboard</title>
      <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
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
         margin: 0;
         padding: 0;
      }

      .container-fluid {
         padding: 0;
         margin: 0;
      }

      .row {
         margin: 0;
         display: flex;
         min-height: 100vh;
      }

      /* Sidebar styling */
      .col-md-3 {
         width: 250px;
         background: white;
         box-shadow: 2px 0 10px rgba(0,0,0,0.1);
         position: fixed;
         height: 100vh;
         z-index: 1000;
      }

      /* Main content area */
      .col-md-9 {
         margin-left: 250px;
         width: calc(100% - 250px);
         padding: 20px;
         background-color: var(--teal-bg);
      }

      h2 {
         color: var(--teal-dark);
         margin: 20px 0;
         font-weight: 600;
         text-align: center;
      }

      /* Statistics Cards */
      .sm-st {
         background: white;
         border-radius: 8px;
         padding: 15px;
         box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
         transition: transform 0.3s ease;
         height: 100%;
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
         width: 50px;
         height: 50px;
         display: flex;
         align-items: center;
         justify-content: center;
         border-radius: 50%;
         font-size: 20px;
         float: left;
         margin-right: 15px;
      }

      .sm-st-info {
         color: var(--teal-text);
         margin-left: 65px;
      }

      .sm-st-info span {
         font-weight: bold;
         color: var(--teal-dark);
      }

      /* Stats row */
      .row.statistics {
         margin-bottom: 20px;
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
         width: 100%;
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

      /* Panels */
      .panel {
         border: none;
         border-radius: 8px;
         box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
         background-color: white;
         height: 100%;
      }

      .panel-heading {
         background-color: var(--teal-primary) !important;
         color: white !important;
         border-radius: 8px 8px 0 0 !important;
         padding: 12px 15px !important;
         border: none !important;
      }

      .panel-body {
         padding: 15px;
      }

      /* Form Elements */
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
      /* Main content grid alignment */
      .main-content {
         display: grid;
         grid-template-columns: 1fr;
         gap: 20px;
         padding: 20px;
      }

      /* Statistics grid */
      .statistics-grid {
         display: grid;
         grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
         gap: 20px;
         margin-bottom: 20px;
      }

      /* Tab content grid */
      .tab-content-grid {
         display: grid;
         grid-template-columns: 2fr 1fr;
         gap: 20px;
      }

      /* Panel alignment */
      .panel-grid {
         display: grid;
         grid-template-rows: auto 1fr;
         height: 100%;
      }

      /* Table container */
      .table-container {
         height: 100%;
         display: flex;
         flex-direction: column;
      }

      /* Form alignment */
      .filter-form {
         display: grid;
         gap: 10px;
      }

      /* Responsive adjustments */
      @media (max-width: 992px) {
         .col-md-3 {
            width: 100%;
            position: relative;
            height: auto;
         }

         .col-md-9 {
            margin-left: 0;
            width: 100%;
         }

         .row {
            flex-direction: column;
         }
         .tab-content-grid {
            grid-template-columns: 1fr;
         }

         .statistics-grid {
            grid-template-columns: 1fr 1fr;
         }
      }
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
        <div class="col-md-9 main-content">
            <h2>Bảng quản lí marketing</h2>
            
            <!-- Statistics Cards Grid -->
            <div class="statistics-grid">
                <div class="sm-st">
                    <span class="sm-st-icon st-red"><i class="fa fa-file-text-o"></i></span>
                    <div class="sm-st-info">
                        Tổng <span>${totalP}</span> Bài Đăng <br>
                        * <span>${totalPA}</span> Bài viết đã được đăng <br>
                        * <span>${totalPIA}</span> Bài viết bị ẩn
                    </div>
                </div>
                
                <div class="sm-st">
                    <span class="sm-st-icon st-violet"><i class="fa fa-shopping-cart"></i></span>
                    <div class="sm-st-info">
                        Tổng Sản Phẩm: <span>${totalPd}</span> <br>
                        * <span>${totalPdA}</span> Đang bày bán <br>
                        * <span>${totalPdIA}</span> Chưa bày bán
                    </div>
                </div>
                
                <div class="sm-st">
                    <span class="sm-st-icon st-blue"><i class="fa fa-user"></i></span>
                    <div class="sm-st-info">
                        <span>${totalU}</span> Khách Hàng
                    </div>
                </div>
                
                <div class="sm-st">
                    <span class="sm-st-icon st-green"><i class="fa fa-comments"></i></span>
                    <div class="sm-st-info">
                        <span>${gDAOfeed}</span> Phản hồi
                    </div>
                </div>
            </div>

            <!-- Tabs Section -->
            <ul class="nav nav-tabs" id="myTab">
                <li class="nav-item">
                    <a class="nav-link active" id="account-tab" href="#account">Tài khoản mới</a>
                </li>
            </ul>
            
            <!-- Tab Content Grid -->
            <div class="tab-content tab-content-grid" id="myTabContent">
                <div class="tab-pane fade show active panel-grid" id="account">
                    <div class="table-container">
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
                </div>
                
                <div class="panel panel-grid">
                    <header class="panel-heading">
                        Thống kê
                    </header>
                    <div class="panel-body">
                        <form class="filter-form">
                            <label for="fromDate">Bắt đầu:</label>
                            <input type="date" id="fromDate" name="fromDate" value="${requestScope.fromDate}" onchange="this.form.submit()">
                            
                            <label for="toDate">Kết thúc:</label>
                            <input type="date" id="toDate" name="toDate" value="${requestScope.toDate}" onchange="this.form.submit()">
                            
                            <input type="submit" value="Lọc">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
      </div>   
   </body>
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
      <script type="text/javascript">
                                       $(document).ready(function () {
                                          $('#account-tab').tab('show');

                                          $('#myTab a').on('click', function (e) {
                                             e.preventDefault();
                                             var selectedTab = $(this).attr('href');
                                             $(selectedTab).tab('show');
                                             if (selectedTab === '#account') {
                                                window.location.reload();
                                             }
                                          });

                                          $('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                                             var selectedTab = $(e.target).attr('href');
                                             $('.tab-pane').removeClass('show active');
                                             $(selectedTab).addClass('show active');
                                          });
                                       });
      </script>

</html>
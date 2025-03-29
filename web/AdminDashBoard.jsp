<%-- 
    Document   : AdminDashBoard
    Created on : Mar 15, 2025, 11:07:53 PM
    Author     : tiend
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>Admin Dashboard | E-Shopee</title>

      <!-- Bootstrap & Icons -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
      <link href="https://kit.fontawesome.com/8922b65fb8.js" rel="stylesheet">

      <!-- Chart.js -->
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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

         .sm-st {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            border: 1px solid var(--teal-accent);
            display: flex;
            align-items: center;
         }

         .sm-st-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            color: white;
            font-size: 24px;
         }

         .st-primary {
            background-color: #4285F4;
         }
         .st-warning {
            background-color: #FBBC05;
         }
         .st-success {
            background-color: #34A853;
         }
         .st-danger {
            background-color: #EA4335;
         }

         .sm-st-info span {
            font-size: 1.8rem;
            font-weight: 700;
            display: block;
         }

         .form-control {
            border: 1px solid var(--teal-light);
            border-radius: 4px;
            padding: 8px 12px;
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
         }

         .sortable:hover {
            background-color: var(--teal-dark);
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

            .sm-st {
               flex-direction: column;
               text-align: center;
            }

            .sm-st-icon {
               margin-right: 0;
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
               <!-- Page Heading -->
               <div class="d-flex justify-content-between align-items-center mb-4">
                  <h1 class="h3 mb-0">Dashboard</h1>
               </div>

               <!-- Stats Cards -->
               <div class="row">
                  <!-- Earnings Card -->
                  <div class="col-xl-3 col-md-6 mb-4">
                     <div class="sm-st">
                        <span class="sm-st-icon st-primary"><i class="bi bi-currency-dollar"></i></span>
                        <div class="sm-st-info">
                           <span><fmt:formatNumber value="${requestScope.totalMonth}" type = "currency" /></span>
                        Thu nhập
                     </div>
                  </div>
               </div>

               <!-- New Users Card -->
               <div class="col-xl-3 col-md-6 mb-4">
                  <div class="sm-st">
                     <span class="sm-st-icon st-success"><i class="bi bi-people-fill"></i></span>
                     <div class="sm-st-info">
                        <span>${requestScope.totalLW}</span>
                        Số người mới đăng ký
                     </div>
                  </div>
               </div>

               <!-- Active Users Card -->
               <div class="col-xl-3 col-md-6 mb-4">
                  <div class="sm-st">
                     <span class="sm-st-icon st-warning"><i class="bi bi-person-check-fill"></i></span>
                     <div class="sm-st-info">
                        <span>${requestScope.totalUser}</span>
                        Người dùng hoạt động
                     </div>
                  </div>
               </div>

               <!-- Products Card -->
               <div class="col-xl-3 col-md-6 mb-4">
                  <div class="sm-st">
                     <span class="sm-st-icon st-danger"><i class="bi bi-box-seam"></i></span>
                     <div class="sm-st-info">
                        <span>${requestScope.totalProducts}</span>
                        Sản phẩm
                     </div>
                  </div>
               </div>
            </div>

            <!-- Charts Row -->
            <div class="row">
               <!-- Area Chart -->
               <div class="col-xl-8 col-lg-7">
                  <section class="panel">
                     <header class="panel-heading">Tổng quan thu nhập</header>
                     <div class="panel-body">
                        <canvas id="myAreaChart" height="330"></canvas>
                     </div>
                  </section>
               </div>

               <!-- Pie Chart -->
               <div class="col-xl-4 col-lg-5">
                  <section class="panel">
                     <header class="panel-heading">Revenue Sources</header>
                     <div class="panel-body">
                        <div class="chart-pie pt-4 pb-2">
                           <canvas id="myPieChart" height="330"></canvas>
                        </div>
                        <div class="mt-4 text-center small">
                           <span class="mr-2">
                              <i class="fas fa-circle text-primary"></i> Direct
                           </span>
                           <span class="mr-2">
                              <i class="fas fa-circle text-success"></i> Social
                           </span>
                           <span class="mr-2">
                              <i class="fas fa-circle text-info"></i> Referral
                           </span>
                        </div>
                     </div>
                  </section>
               </div>
            </div>

            <!-- Products Table -->
            <div class="row mt-4">
               <div class="col-12">
                  <section class="panel">
                     <header class="panel-heading">Danh sách sản phẩm và đánh giá trung bình</header>
                     <div class="panel-body">
                        <div class="table-responsive">
                           <table class="table">
                              <thead>
                                 <tr>
                                    <th class="sortable" onclick="sortTable(0)">Tên sản phẩm <i class="bi bi-arrow-down-up"></i></th>
                                    <th class="sortable" onclick="sortTable(1)">Đánh giá trung bình <i class="bi bi-arrow-down-up"></i></th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <!-- Data will be inserted here by JavaScript -->
                              </tbody>
                           </table>
                        </div>

                        <!-- Pagination -->
                        <nav aria-label="Pagination" class="mt-4">
                           <ul class="pagination justify-content-center">
                              <li class="page-item disabled">
                                 <a class="page-link" href="#" tabindex="-1">Trước</a>
                              </li>
                              <li class="page-item"><a class="page-link" href="#">1</a></li>
                              <li class="page-item active" aria-current="page">
                                 <a class="page-link" href="#">2</a>
                              </li>
                              <li class="page-item"><a class="page-link" href="#">3</a></li>
                              <li class="page-item">
                                 <a class="page-link" href="#">Tiếp</a>
                              </li>
                           </ul>
                        </nav>
                     </div>
                  </section>
               </div>
            </div>
         </div>
      </div>

      <!-- Bootstrap core JavaScript-->
      <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
      <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

      <!-- Core plugin JavaScript-->
      <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

      <!-- Custom scripts for all pages-->
      <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>

      <!-- Page level plugins -->
      <script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>

      <!-- Page level custom scripts -->
      <script src="${pageContext.request.contextPath}/js/demo/chart-area-demo.js"></script>
      <script type="text/javascript">
                                       Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                                       Chart.defaults.global.defaultFontColor = '#858796';

                                       // Pie Chart Example
                                       var ctx = document.getElementById("myPieChart");
                                       var myPieChart = new Chart(ctx, {
                                          type: 'doughnut',
                                          data: {
                                             labels: ${requestScope.months},
                                             datasets: [{
                                                   data: ${requestScope.values},
                                                   backgroundColor: [
                                                      'rgba(255, 99, 132, 0.2)',
                                                      'rgba(54, 162, 235, 0.2)',
                                                      'rgba(255, 206, 86, 0.2)',
                                                      'rgba(75, 192, 192, 0.2)',
                                                      'rgba(153, 102, 255, 0.2)',
                                                      'rgba(255, 159, 64, 0.2)',
                                                      'rgba(255, 99, 132, 0.2)',
                                                      'rgba(54, 162, 235, 0.2)',
                                                      'rgba(255, 206, 86, 0.2)',
                                                      'rgba(75, 192, 192, 0.2)',
                                                      'rgba(153, 102, 255, 0.2)',
                                                      'rgba(255, 159, 64, 0.2)'
                                                   ],
                                                   borderColor: [
                                                      'rgba(255, 99, 132, 1)',
                                                      'rgba(54, 162, 235, 1)',
                                                      'rgba(255, 206, 86, 1)',
                                                      'rgba(75, 192, 192, 1)',
                                                      'rgba(153, 102, 255, 1)',
                                                      'rgba(255, 159, 64, 1)',
                                                      'rgba(255, 99, 132, 1)',
                                                      'rgba(54, 162, 235, 1)',
                                                      'rgba(255, 206, 86, 1)',
                                                      'rgba(75, 192, 192, 1)',
                                                      'rgba(153, 102, 255, 1)',
                                                      'rgba(255, 159, 64, 1)'
                                                   ],
                                                   borderWidth: 1
                                                }]
                                          },
                                          options: {
                                             maintainAspectRatio: false,
                                             tooltips: {
                                                backgroundColor: "rgb(255,255,255)",
                                                bodyFontColor: "#858796",
                                                borderColor: '#dddfeb',
                                                borderWidth: 1,
                                                xPadding: 15,
                                                yPadding: 15,
                                                displayColors: false,
                                                caretPadding: 10,
                                             },
                                             legend: {
                                                display: false
                                             },
                                             cutoutPercentage: 80,
                                          },
                                       });

                                       var ctx = document.getElementById("myAreaChart");
                                       var myLineChart = new Chart(ctx, {
                                          type: 'line',
                                          data: {
                                             labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                                             datasets: [{
                                                   label: "Earnings",
                                                   lineTension: 0.3,
                                                   backgroundColor: "rgba(78, 115, 223, 0.05)",
                                                   borderColor: "rgba(78, 115, 223, 1)",
                                                   pointRadius: 3,
                                                   pointBackgroundColor: "rgba(78, 115, 223, 1)",
                                                   pointBorderColor: "rgba(78, 115, 223, 1)",
                                                   pointHoverRadius: 3,
                                                   pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                                                   pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                                                   pointHitRadius: 10,
                                                   pointBorderWidth: 2,
                                                   data: ${requestScope.values}
                                                }]
                                          },
                                          options: {
                                             maintainAspectRatio: false,
                                             layout: {
                                                padding: {
                                                   left: 10,
                                                   right: 25,
                                                   top: 25,
                                                   bottom: 0
                                                }
                                             },
                                             scales: {
                                                xAxes: [{
                                                      time: {
                                                         unit: 'date'
                                                      },
                                                      gridLines: {
                                                         display: false,
                                                         drawBorder: false
                                                      },
                                                      ticks: {
                                                         maxTicksLimit: 7
                                                      }
                                                   }],
                                                yAxes: [{
                                                      ticks: {
                                                         maxTicksLimit: 5,
                                                         padding: 10,
                                                         callback: function (value, index, values) {
                                                            return '$' + number_format(value);
                                                         }
                                                      },
                                                      gridLines: {
                                                         color: "rgb(234, 236, 244)",
                                                         zeroLineColor: "rgb(234, 236, 244)",
                                                         drawBorder: false,
                                                         borderDash: [2],
                                                         zeroLineBorderDash: [2]
                                                      }
                                                   }]
                                             },
                                             legend: {
                                                display: false
                                             },
                                             tooltips: {
                                                backgroundColor: "rgb(255,255,255)",
                                                bodyFontColor: "#858796",
                                                titleMarginBottom: 10,
                                                titleFontColor: '#6e707e',
                                                titleFontSize: 14,
                                                borderColor: '#dddfeb',
                                                borderWidth: 1,
                                                xPadding: 15,
                                                yPadding: 15,
                                                displayColors: false,
                                                intersect: false,
                                                mode: 'index',
                                                caretPadding: 10,
                                                callbacks: {
                                                   label: function (tooltipItem, chart) {
                                                      var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                                                      return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
                                                   }
                                                }
                                             }
                                          }
                                       });
      </script>

      <script>
         // Convert the product details from Java to JavaScript
         var productList = JSON.parse('${productList}');
         var productRatings = JSON.parse('${productRatings}');

         var currentPage = 1; // Current page
         var itemsPerPage = 8; // Number of items per page
         var sortDirection = [true, true]; // Lưu trạng thái sắp xếp của từng cột

         // Display products for the current page
         function displayProducts() {
            var start = (currentPage - 1) * itemsPerPage;
            var end = start + itemsPerPage;

            var keys = [];
            for (var key in productList) {
               if (productList.hasOwnProperty(key)) {
                  keys.push(key);
               }
            }

            // Sắp xếp trước khi hiển thị
            keys.sort((a, b) => {
               var productA = productList[a];
               var productB = productList[b];

               var ratingA = productRatings[a] || 0;
               var ratingB = productRatings[b] || 0;

               // Sắp xếp theo tên
               if (sortColumn === 0) {
                  return sortDirection[0] ? productA.name.localeCompare(productB.name) : productB.name.localeCompare(productA.name);
               }
               // Sắp xếp theo đánh giá trung bình
               else if (sortColumn === 1) {
                  return sortDirection[1] ? ratingA - ratingB : ratingB - ratingA;
               }
               return 0;
            });

            var productsToDisplay = keys.slice(start, end);

            // Clear the current products
            $('tbody').empty();

            // Add each product
            productsToDisplay.forEach(function (productId) {
               var product = productList[productId];
               var productRating = productRatings[productId];

               if (productRating === undefined || productRating === 0) {
                  productRating = "Không có đánh giá";
               } else {
                  productRating = productRating.toFixed(1); // Làm tròn đến 1 chữ số thập phân nếu cần
               }

               var productHtml = '<tr>' +
                       '<td>' + product.name + '</td>' +
                       '<td>' + productRating + '</td>' +
                       '</tr>';

               $('tbody').append(productHtml);
            });
         }

         // Update the pagination links
         function updatePagination() {
            var totalPages = Math.ceil(Object.keys(productList).length / itemsPerPage);

            $('.pagination').empty();
            var prevClass = currentPage === 1 ? 'disabled' : '';
            var prevHtml = '<li class="page-item ' + prevClass + '"><a class="page-link" href="#">Trước</a></li>';
            $('.pagination').append(prevHtml);

            for (var i = 1; i <= totalPages; i++) {
               var liClass = i === currentPage ? 'active' : '';
               var liHtml = '<li class="page-item ' + liClass + '"><a class="page-link" href="#">' + i + '</a></li>';
               $('.pagination').append(liHtml);
            }

            var nextClass = currentPage === totalPages ? 'disabled' : '';
            var nextHtml = '<li class="page-item ' + nextClass + '"><a class="page-link" href="#">Sau</a></li>';
            $('.pagination').append(nextHtml);

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

         // Hàm xử lý khi click vào cột để sắp xếp
         var sortColumn = 0; // Mặc định là cột "Tên sản phẩm"
         function sortTable(columnIndex) {
            sortColumn = columnIndex;
            sortDirection[columnIndex] = !sortDirection[columnIndex]; // Đảo ngược thứ tự sắp xếp
            displayProducts();
         }

         // Display the initial products and pagination
         displayProducts();
         updatePagination();
      </script>

   </body>
</html>
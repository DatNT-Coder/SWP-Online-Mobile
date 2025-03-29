<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Marketing Dashboard | E-Shopee</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
      <script src="https://kit.fontawesome.com/8922b65fb8.js" crossorigin="anonymous"></script>
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
         h2, h5 {
            color: var(--teal-dark);
            font-weight: 600;
            margin: 20px 0;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--teal-light);
         }

         /* Button styles */
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

         /* Card styles */
         .card {
            background-color: var(--teal-card);
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border: 1px solid var(--teal-accent);
            margin-bottom: 20px;
            height: 100%;
         }

         .card-body {
            padding: 20px;
         }

         .stat-icon {
            background-color: var(--teal-primary);
            color: white;
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

         .stat-info {
            margin-left: 65px;
         }

         /* Form styles */
         .date-filter {
            background-color: var(--teal-card);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border: 1px solid var(--teal-accent);
            margin-bottom: 20px;
         }

         .form-control {
            border: 1px solid var(--teal-light);
            border-radius: 4px;
            padding: 8px 12px;
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

         /* Chart container */
         .chart-container {
            background-color: var(--teal-card);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border: 1px solid var(--teal-accent);
            margin-bottom: 20px;
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

            .stat-icon {
               float: none;
               margin: 0 auto 15px;
            }

            .stat-info {
               margin-left: 0;
               text-align: center;
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
                        <h2>Marketing Dashboard</h2>
                     </div>

                     <!-- Date Filter -->
                     <div class="card date-filter">
                        <div class="card-body">
                           <h5>Date Filter</h5>
                           <form method="get" class="row g-3">
                              <div class="col-md-4">
                                 <label for="fromDate" class="form-label">From Date</label>
                                 <input type="date" class="form-control" id="fromDate" name="fromDate" value="${fromDate}">
                              </div>
                              <div class="col-md-4">
                                 <label for="toDate" class="form-label">To Date</label>
                                 <input type="date" class="form-control" id="toDate" name="toDate" value="${toDate}">
                              </div>
                              <div class="col-md-4 d-flex align-items-end">
                                 <button type="submit" class="btn btn-primary w-100">
                                    <strong>Filter Customers</strong>
                                 </button>
                              </div>
                           </form>
                        </div>
                     </div>

                     <!-- Statistics Cards -->
                     <div class="row">
                        <div class="col-md-3">
                           <div class="card">
                              <div class="card-body">
                                 <div class="stat-icon">
                                    <i class="fas fa-file-alt"></i>
                                 </div>
                                 <div class="stat-info">
                                    <h5>Posts</h5>
                                    <p class="mb-1">Total: <strong>${totalP}</strong></p>
                                    <p class="mb-1">Active: <strong>${totalPA}</strong></p>
                                    <p class="mb-0">Inactive: <strong>${totalPIA}</strong></p>
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="col-md-3">
                           <div class="card">
                              <div class="card-body">
                                 <div class="stat-icon">
                                    <i class="fas fa-shopping-cart"></i>
                                 </div>
                                 <div class="stat-info">
                                    <h5>Products</h5>
                                    <p class="mb-1">Total: <strong>${totalPd}</strong></p>
                                    <p class="mb-1">Active: <strong>${totalPdA}</strong></p>
                                    <p class="mb-0">Inactive: <strong>${totalPdIA}</strong></p>
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="col-md-3">
                           <div class="card">
                              <div class="card-body">
                                 <div class="stat-icon">
                                    <i class="fas fa-users"></i>
                                 </div>
                                 <div class="stat-info">
                                    <h5>Customers</h5>
                                    <p class="mb-0">Total: <strong>${totalU}</strong></p>
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="col-md-3">
                           <div class="card">
                              <div class="card-body">
                                 <div class="stat-icon">
                                    <i class="fas fa-comments"></i>
                                 </div>
                                 <div class="stat-info">
                                    <h5>Feedback</h5>
                                    <p class="mb-0">Total: <strong>${totalFeedback}</strong></p>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>

                     <!-- Charts and Tables -->
                     <div class="row mt-4">
                        <!-- Customer Trend Chart -->
                        <div class="col-md-8">
                           <div class="card chart-container">
                              <div class="card-body">
                                 <h5>New Customer Trend (${fromDate} to ${toDate})</h5>
                                 <canvas id="customerTrendChart"></canvas>
                              </div>
                           </div>
                        </div>

                        <!-- Recent Customers -->
                        <div class="col-md-4">
                           <div class="card chart-container">
                              <div class="card-body">
                                 <h5>Recent Customers</h5>
                                 <div class="table-responsive">
                                    <table class="table">
                                       <thead>
                                          <tr>
                                             <th>Name</th>
                                             <th>Date</th>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <c:forEach items="${newCustomers}" var="customer" end="4">
                                             <tr>
                                                <td>${customer.full_name}</td>
                                                <td>${customer.registration_date}</td>
                                             </tr>
                                          </c:forEach>
                                       </tbody>
                                    </table>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <script>
            // Customer Trend Chart
            const trendCtx = document.getElementById('customerTrendChart').getContext('2d');
            const trendData = {
               labels: [
            <c:forEach items="${customerTrend}" var="entry">
                  "${entry.key}",
            </c:forEach>
               ],
               datasets: [{
                     label: 'New Customers',
                     data: [
            <c:forEach items="${customerTrend}" var="entry">
               ${entry.value},
            </c:forEach>
                     ],
                     backgroundColor: 'rgba(38, 166, 154, 0.2)',
                     borderColor: 'rgba(38, 166, 154, 1)',
                     borderWidth: 2,
                     tension: 0.3,
                     fill: true
                  }]
            };

            const trendChart = new Chart(trendCtx, {
               type: 'line',
               data: trendData,
               options: {
                  responsive: true,
                  plugins: {
                     legend: {
                        position: 'top',
                     },
                     tooltip: {
                        mode: 'index',
                        intersect: false,
                     }
                  },
                  scales: {
                     y: {
                        beginAtZero: true,
                        ticks: {
                           stepSize: 1
                        }
                     }
                  }
               }
            });
         </script>
      </body>
   </html>
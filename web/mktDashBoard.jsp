<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Marketing Dashboard</title>
      <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
      <script src="https://kit.fontawesome.com/8922b65fb8.js" crossorigin="anonymous"></script>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

         .dashboard-header {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
         }

         .stat-card {
            background: white;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            height: 100%;
            margin-bottom: 20px;
         }

         .stat-card:hover {
            transform: translateY(-5px);
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

         .chart-container {
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
         }

         .data-table {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
         }

         .data-table thead {
            background-color: var(--teal-primary);
            color: white;
         }

         .date-filter {
            background: white;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
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
                     <div class="dashboard-header">
                        <h2 class="mb-0">Marketing Dashboard</h2>
                        <p class="text-muted mb-0">Statistics overview</p>
                     </div>

                     <!-- Date Filter -->
                     <div class="date-filter mb-4">
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
                           <button type="submit" class="btn btn-primary">Apply Filter</button>
                        </div>
                     </form>
                  </div>

                  <!-- Statistics Cards -->
                  <div class="row">
                     <div class="col-md-3">
                        <div class="stat-card">
                           <div class="stat-icon bg-danger">
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

                     <div class="col-md-3">
                        <div class="stat-card">
                           <div class="stat-icon bg-purple">
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

                     <div class="col-md-3">
                        <div class="stat-card">
                           <div class="stat-icon bg-primary">
                              <i class="fas fa-users"></i>
                           </div>
                           <div class="stat-info">
                              <h5>Customers</h5>
                              <p class="mb-0">Total: <strong>${totalU}</strong></p>
                           </div>
                        </div>
                     </div>

                     <div class="col-md-3">
                        <div class="stat-card">
                           <div class="stat-icon bg-success">
                              <i class="fas fa-comments"></i>
                           </div>
                           <div class="stat-info">
                              <h5>Feedback</h5>
                              <p class="mb-0">Total: <strong>${totalFeedback}</strong></p>
                           </div>
                        </div>
                     </div>
                  </div>

                  <!-- Charts and Tables -->
                  <div class="row mt-4">
                     <!-- Customer Trend Chart -->
                     <div class="col-md-8">
                        <div class="chart-container">
                           <h5>New Customer Trend (${fromDate} to ${toDate})</h5>
                           <canvas id="customerTrendChart"></canvas>
                        </div>
                     </div>

                     <!-- Recent Customers -->
                     <div class="col-md-4">
                        <div class="chart-container">
                           <h5>Recent Customers</h5>
                           <div class="table-responsive">
                              <table class="table data-table">
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
                  backgroundColor: 'rgba(77, 182, 172, 0.2)',
                          borderColor: 'rgba(77, 182, 172, 1)',
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
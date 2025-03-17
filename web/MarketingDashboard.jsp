<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Marketing Dashboard</title>
      <link rel="stylesheet" href="css/styles1.css">
   </head>
   <body>
      <!-- Sidebar -->
      <div class="sidebar">
         <div class="sidebar-header">
            <h2>Dashboard</h2>
         </div>
         <ul class="sidebar-menu">
            <li><a href="#" class="active">Home</a></li>
            <li><a href="#">Posts</a></li>
            <li><a href="#">Products</a></li>
            <li><a href="#">Customers</a></li>
            <li><a href="#">Feedback</a></li>
            <li><a href="#">Settings</a></li>
         </ul>
      </div>

      <!-- Main Content -->
      <div class="main-content">
         <div class="dashboard-container">
            <!-- Filters -->
            <div class="filters">
               <label for="date-range">Date Range:</label>
               <input type="date" id="start-date">
               <input type="date" id="end-date">
               <button onclick="applyFilters()">Apply</button>
            </div>

            <!-- Key Metrics -->
            <div class="metrics">
               <div class="metric-card">
                  <h3>Total Posts Published</h3>
                  <p>120</p>
               </div>
               <div class="metric-card">
                  <h3>Total Products Sold</h3>
                  <p>350</p>
               </div>
               <div class="metric-card">
                  <h3>Total Customers Acquired</h3>
                  <p>80</p>
               </div>
               <div class="metric-card">
                  <h3>Average Feedback Rating</h3>
                  <p>4.5/5</p>
               </div>
            </div>

            <!-- Charts -->
            <div class="charts">
               <div class="chart-card">
                  <h3>Post Statistics</h3>
                  <div class="chart-placeholder" id="post-stats-chart"></div>
               </div>
               <div class="chart-card">
                  <h3>Product Performance</h3>
                  <div class="chart-placeholder" id="product-performance-chart"></div>
               </div>
               <div class="chart-card">
                  <h3>Customer Insights</h3>
                  <div class="chart-placeholder" id="customer-insights-chart"></div>
               </div>
               <div class="chart-card">
                  <h3>Feedback Analysis</h3>
                  <div class="chart-placeholder" id="feedback-analysis-chart"></div>
               </div>
               <div class="chart-card">
                  <h3>Trend of New Customers</h3>
                  <div class="chart-placeholder" id="customer-trend-chart"></div>
               </div>
            </div>
         </div>
      </div>

      <script>
         function applyFilters() {
            const startDate = document.getElementById('start-date').value;
            const endDate = document.getElementById('end-date').value;
          alert(`Filters Applied: ${startDate} to ${endDate}`);
            // Add logic to fetch and update data based on the selected date range
         }
      </script>
   </body>
</html>
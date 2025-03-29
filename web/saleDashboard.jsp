<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Sale Dashboard | E-Shopee</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
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
            margin: 0;
            padding: 0;
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

         .st-blue {
            background-color: #4285F4;
         }
         .st-green {
            background-color: #34A853;
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
            color: black;
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

         .col-lg-10.main-content {
            flex-grow: 1;
            padding: 20px;
            background-color: var(--teal-bg);
         }

         @media (max-width: 768px) {
            .dashboard-container {
               flex-direction: column;
            }

            .col-md-2 {
               width: 100%;
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
      <div class="container-fluid">
         <div class="row">
            <!-- Sidebar -->
            <div class="col-md-2">
               <jsp:include page="Sale_sidebar.jsp"></jsp:include>
               </div>

               <!-- Main Content -->
               <div class="col-lg-10 main-content">
                  <div class="container-fluid py-4">
                     <div class="main-content">
                        <div class="row" style="margin-bottom:5px;">
                           <div class="col-md-3">
                              <div class="sm-st clearfix">
                                 <span class="sm-st-icon st-blue"><i class="fa-solid fa-cart-arrow-down"></i></span>
                                 <div class="sm-st-info">
                                    <span>${sumOrder}</span>
                                 Total Orders
                              </div>
                           </div>
                        </div>
                        <div class="col-md-3">
                           <div class="sm-st clearfix">
                              <span class="sm-st-icon st-green"><i class="fa-solid fa-check"></i></span>
                              <div class="sm-st-info">
                                 <span>${succOrder}</span>
                                 Successful Orders
                              </div>
                           </div>
                        </div>

                        <div class="col-md-6" style="margin-bottom:5px;">
                           <form action="/ProjectSWP391/sale/saleDashboard" method="POST" class="row">
                              <div class="col-md-6">
                                 <label for="startDate">From:</label>
                                 <input name="fromDate" value="${requestScope.fromDate}" type="date" class="form-control" id="startDate">
                              </div>
                              <div class="col-md-6">
                                 <label for="endDate">To:</label>
                                 <input name="toDate" value="${requestScope.toDate}" type="date" class="form-control" id="endDate" readonly>
                              </div>
                              <div class="col-md-3">
                                 <button style="margin-top: 8px;" class="btn btn-primary" type="submit">Filter <i class="fa-solid fa-filter"></i></button>
                              </div>
                           </form>
                        </div>
                     </div>

                     <!-- Main row -->
                     <div class="row">
                        <div class="col-md-8">
                           <!-- Success Rate Chart -->
                           <section class="panel">
                              <header class="panel-heading">Order Success Rate</header>
                              <div class="panel-body">
                                 <canvas id="successRateChart" width="600" height="330"></canvas>
                              </div>
                           </section>

                           <!-- Revenue Trend Chart -->
                           <section class="panel">
                              <header class="panel-heading">7-Day Revenue Trend</header>
                              <div class="panel-body">
                                 <canvas id="revenueTrendChart" width="600" height="330"></canvas>
                              </div>
                           </section>
                        </div>

                        <div class="col-md-4">
                           <!-- Best Selling Products -->
                           <section class="panel">
                              <header class="panel-heading">Best Selling Products</header>
                              <div class="panel-body">
                                 <table class="table table-bordered">
                                    <thead>
                                       <tr>
                                          <th>Product Name</th>
                                          <th>Total Quantity</th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <c:forEach items="${list}" var="listSelling">
                                          <tr>
                                             <td>${listSelling.key}</td>
                                             <td>${listSelling.value}</td>
                                          </tr>
                                       </c:forEach>
                                    </tbody>
                                 </table>
                              </div>
                           </section>
                        </div>
                     </div>
                  </div>
               </div>

               <script>
                  // Date picker constraints - kept exactly the same as original
                  window.onload = function () {
                     var today = new Date().toISOString().split('T')[0];
                     document.getElementById('startDate').setAttribute('max', today);
                     document.getElementById('endDate').setAttribute('max', today);
                     document.getElementById('startDate').addEventListener('change', function () {
                        if (this.value)
                           document.getElementById('endDate').setAttribute('min', this.value);
                     }, false);
                     document.getElementById('endDate').addEventListener('change', function () {
                        if (this.value)
                           document.getElementById('startDate').setAttribute('max', this.value);
                     }, false);
                  };

                  // Auto-set end date 7 days after start date - kept exactly the same as original
                  document.addEventListener('DOMContentLoaded', function () {
                     var startDateInput = document.getElementById('startDate');
                     var endDateInput = document.getElementById('endDate');

                     startDateInput.addEventListener('change', function () {
                        var startDateValue = startDateInput.value;

                        if (startDateValue) {
                           var startDate = new Date(startDateValue);

                           if (startDate.toISOString().split('T')[0] === new Date().toISOString().split('T')[0]) {
                              endDateInput.value = new Date().toISOString().split('T')[0];
                           } else {
                              startDate.setDate(startDate.getDate() + 6);
                              endDateInput.value = startDate.toISOString().split('T')[0];
                           }

                           endDateInput.readOnly = true;
                        }
                     });
                  });

                  // Success Rate Chart - kept exactly the same as original
                  var successOrdersJSON = '${succOrderChart}';
                  var totalOrdersJSON = '${sumOrderChart}';
                  var successOrders = JSON.parse(successOrdersJSON);
                  var totalOrders = JSON.parse(totalOrdersJSON);
                  var dateLabels = Object.keys(successOrders).sort();
                  var successValues = Object.values(successOrders);
                  var totalValues = Object.values(totalOrders);

                  var ctx = document.getElementById('successRateChart').getContext('2d');
                  var successRateChart = new Chart(ctx, {
                     type: 'line',
                     data: {
                        labels: dateLabels,
                        datasets: [{
                              label: 'Success Rate',
                              borderColor: 'green',
                              data: successValues.map((success, index) => {
                                 return (success / totalValues[index]) * 100;
                              }),
                              fill: false
                           }]
                     }
                  });

                  // Revenue Trend Chart - kept exactly the same as original
                  function formatDate(date) {
                     var d = new Date(date),
                             month = '' + (d.getMonth() + 1),
                             day = '' + d.getDate(),
                             year = d.getFullYear();

                     if (month.length < 2)
                        month = '0' + month;
                     if (day.length < 2)
                        day = '0' + day;

                     return [year, month, day].join('-');
                  }

                  var revenue7Days = JSON.parse('${revenue7Days}');
                  var labels = [];
                  var revenues = [];

                  for (var i = 0; i < revenue7Days.length; i++) {
                     labels.push(formatDate(revenue7Days[i].date));
                     revenues.push(revenue7Days[i].totalMoney);
                  }

                  var revenueTrendData = {
                     labels: labels,
                     revenues: revenues
                  };

                  var ctx = document.getElementById('revenueTrendChart').getContext('2d');
                  var revenueTrendChart = new Chart(ctx, {
                     type: 'line',
                     data: {
                        labels: revenueTrendData.labels,
                        datasets: [{
                              label: '7-Day Revenue Trend',
                              borderColor: 'orange',
                              data: revenueTrendData.revenues,
                              fill: false
                           }]
                     }
                  });
               </script>
               </body>
               </html>
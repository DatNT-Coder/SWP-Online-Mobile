<%-- 
    Document   : saleDashboard
    Created on : Mar 16, 2025, 2:35:33 PM
    Author     : Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Sale Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="${pageContext.request.contextPath}/css/saleDashboard/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${pageContext.request.contextPath}/css/saleDashboard/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="${pageContext.request.contextPath}/css/saleDashboard/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="${pageContext.request.contextPath}/css/saleDashboard/morris.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="${pageContext.request.contextPath}/css/saleDashboard/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- Date Picker -->
        <link href="${pageContext.request.contextPath}/css/saleDashboard/datepicker3.css" rel="stylesheet" type="text/css" />
        <!-- fullCalendar -->
        <!-- <link href="${pageContext.request.contextPath}/css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" /> -->
        <!-- Daterange picker -->
        <link href="${pageContext.request.contextPath}/css/saleDashboard/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- iCheck for checkboxes and radio inputs -->
        <link href="${pageContext.request.contextPath}/css/saleDashboard/all.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <!-- <link href="${pageContext.request.contextPath}/css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" /> -->
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="${pageContext.request.contextPath}/css/saleDashboard/style.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/css/sider.css" rel="stylesheet">


        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
          <![endif]-->

        <style type="text/css">

        </style>
        <style>
            table {
                width: 100%;
                text-align: center;
            }

            th, td {
                padding: 10px;
            }

            th {
                background-color: #f2f2f2;
            }
            .user-panel > .info > p　{
                color: #FFFFFF;
            }
            .sidebar{
                width: 270px;
            }
        </style>
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <div class="col-md-3">
            <jsp:include page="Sale_sidebar.jsp"></jsp:include>
            </div>

            <aside class="">

                <!-- Main content -->
                <section class="content">
                    <div class="row" style="margin-bottom:5px;">
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-blue"><i class="fa-solid fa-cart-arrow-down"></i></span>
                                <div class="sm-st-info">
                                    <span>${sumOrder}</span>
                                Tổng số đơn hàng chưa được giao
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="sm-st clearfix">
                            <span class="sm-st-icon st-green"><i class="fa-solid fa-check"></i></span>
                            <div class="sm-st-info">
                                <span>${succOrder}</span>
                                Tổng đơn hàng thành công
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6" style="margin-bottom:5px;">
                        <form action="/ProjectSWP391/sale/saleDashboard" method="POST">
                            <div class="col-md-6">
                                <label for="startDate">Bắt đầu:</label>
                                <input name="fromDate" value="${requestScope.fromDate}" type="date" class="form-control" id="startDate">
                            </div>
                            <div class="col-md-6">
                                <label for="endDate">Kết thúc:</label>
                                <input name="toDate" value="${requestScope.toDate}" type="date" class="form-control" id="endDate" readonly>
                            </div>
                            <div class="col-md-3">
                                <button style="margin-top: 8px; background-color: #2f7db2; border: white; color: white; padding: 5px 10px;" class="" type="submit">Lọc <i class="fa-solid fa-filter"></i></button>
                            </div>
                        </form>


                        <!--                            <div class="col-md-3">
                                                        <label for="sale">Sale:</label>
                                                        <select class="form-control" id="sale">
                                                             Add options based on your sales data 
                                                            <option value="sale1">Nhân viên sale</option>
                                                            <option value="sale2">Quản lý sale</option>
                                                             Add more options as needed 
                                                        </select>
                                                    </div>-->
                        <!--                                                        <div class="col-md-3">
                                                                                    <label for="orderStatus">Trạng thái:</label>
                                                                                    <select class="form-control" id="orderStatus">
                                                                                        <option value="status1">Đã đặt hàng</option>
                                                                                        <option value="status2">Đang xử lí</option>
                                                                                        <option value="status3">Đã giao hàng</option>
                                                                                        <option value="status4">Đã hủy</option>
                                                                                    </select>
                                                                                </div>-->
                    </div>

                    <!-- Main row -->
                    <div class="row">

                        <div class="col-md-8">
                            <!--earning graph start1-->
                            <section class="panel">
                                <header class="panel-heading"> Tỷ lệ đơn hàng thành công  </header>
                                <div class="panel-body">
                                    <canvas id="successRateChart" width="600" height="330"></canvas>
                                </div>
                            </section>
                            <!--earning graph end1-->

                            <!--earning graph start2-->
                            <section class="panel">
                                <header class="panel-heading"> Xu hướng doanh thu 7 ngày gần nhất </header>
                                <div class="panel-body">
                                    <canvas id="revenueTrendChart" width="600" height="330"></canvas>
                                </div>
                            </section>
                            <!--earning graph end2-->

                        </div>
                        <div class="col-lg-4">

                            <!--chat start-->
                            <section class="panel">
                                <header class="panel-heading">
                                    Sản phẩm bán chạy nhất
                                </header>
                                <div class="panel-body" id="noti-box">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Tên sản phẩm</th>
                                                <th>Tổng số lượng</th>
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


                        </div>
                        </section><!-- /.content -->
                        <div class="footer-main">
                            Copyright &copy Sale Dashboard, 2014
                        </div>
                        </aside><!-- /.right-side -->

                    </div><!-- ./wrapper -->


                    <!-- jQuery 2.0.2 -->
                    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
                    <script src="${pageContext.request.contextPath}/js/saleDashboard/jquery.min.js" type="text/javascript"></script>

                    <!-- jQuery UI 1.10.3 -->
                    <script src="${pageContext.request.contextPath}/js/saleDashboard/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
                    <!-- Bootstrap -->
                    <script src="${pageContext.request.contextPath}/js/saleDashboard/bootstrap.min.js" type="text/javascript"></script>
                    <!-- daterangepicker -->
                    <script src="${pageContext.request.contextPath}/js/saleDashboard/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>

                    <script src="${pageContext.request.contextPath}/js/saleDashboard/plugins/chart.js" type="text/javascript"></script>

                    <!-- datepicker
                    <script src="${pageContext.request.contextPath}/js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>-->
                    <!-- Bootstrap WYSIHTML5
                    <script src="${pageContext.request.contextPath}/js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>-->
                    <!-- iCheck -->
                    <script src="${pageContext.request.contextPath}/js/saleDashboard/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
                    <!-- calendar -->
                    <script src="${pageContext.request.contextPath}/js/saleDashboard/plugins/fullcalendar/fullcalendar.js" type="text/javascript"></script>

                    <!-- Director App -->
                    <script src="${pageContext.request.contextPath}/js/saleDashboard/Director/app.js" type="text/javascript"></script>

                    <!-- Director dashboard demo (This is only for demo purposes) -->
                    <script src="${pageContext.request.contextPath}/js/saleDashboard/
                    Director/dashboard.js" type="text/javascript"></script>
                    <!-- comment -->
                    <script src="https://kit.fontawesome.com/8922b65fb8.js" crossorigin="anonymous"></script>
                    <!-- Director for demo purposes -->
                    <!--        <script type="text/javascript">
                                                    $('input').on('ifChecked', function (event) {
                                                        // var element = $(this).parent().find('input:checkbox:first');
                                                        // element.parent().parent().parent().addClass('highlight');
                                                        $(this).parents('li').addClass("task-done");
                                                        console.log('ok');
                                                    });
                                                    $('input').on('ifUnchecked', function (event) {
                                                        // var element = $(this).parent().find('input:checkbox:first');
                                                        // element.parent().parent().parent().removeClass('highlight');
                                                        $(this).parents('li').removeClass("task-done");
                                                        console.log('not');
                                                    });
                            </script>-->


                    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                    <script>
                        // Sample data (replace with your data)
                        var successOrdersJSON = '${succOrderChart}'; // JSON string containing success orders
                        var totalOrdersJSON = '${sumOrderChart}'; // JSON string containing total orders

                        // Parse JSON data
                        var successOrders = JSON.parse(successOrdersJSON);
                        var totalOrders = JSON.parse(totalOrdersJSON);
                        var dateLabels = Object.keys(successOrders).sort(); // Sort dates in ascending order
                        var successValues = Object.values(successOrders);
                        var totalValues = Object.values(totalOrders);

                        // Get canvas context
                        var ctx = document.getElementById('successRateChart').getContext('2d');

                        // Create the chart
                        var successRateChart = new Chart(ctx, {
                            type: 'line',
                            data: {
                                labels: dateLabels,
                                datasets: [{
                                        label: 'Tỉ lệ thành công',
                                        borderColor: 'green',
                                        data: successValues.map((success, index) => {
                                            return (success / totalValues[index]) * 100;
                                        }),
                                        fill: false
                                    }]
                            }
                        });
                    </script>

                    <script>
                        // Function to format a Date object to 'yyyy-mm-dd'
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

                        // Convert JSON string to JavaScript array
                        var revenue7Days = JSON.parse('${revenue7Days}');

                        // Create arrays for labels and data
                        var labels = [];
                        var revenues = [];

                        // Populate arrays with data from revenue7Days
                        for (var i = 0; i < revenue7Days.length; i++) {
                            labels.push(formatDate(revenue7Days[i].date));
                            revenues.push(revenue7Days[i].totalMoney);
                        }

                        // Use the arrays in the chart
                        var revenueTrendData = {
                            labels: labels,
                            revenues: revenues
                        };
                        // Get canvas context
                        var ctx = document.getElementById('revenueTrendChart').getContext('2d');

                        // Create the chart
                        var revenueTrendChart = new Chart(ctx, {
                            type: 'line',
                            data: {
                                labels: revenueTrendData.labels,
                                datasets: [{
                                        label: 'Xu hướng doanh thu 7 gần nhất',
                                        borderColor: 'orange',
                                        data: revenueTrendData.revenues,
                                        fill: false
                                    }]
                            }
                        });
                        // Convert Java List to JavaScript array

                    </script>
                    <script>
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
                        }
                    </script>

                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            // Lấy các phần tử input
                            var startDateInput = document.getElementById('startDate');
                            var endDateInput = document.getElementById('endDate');

                            // Lắng nghe sự kiện thay đổi của ngày bắt đầu
                            startDateInput.addEventListener('change', function () {
                                // Lấy giá trị ngày bắt đầu
                                var startDateValue = startDateInput.value;

                                // Nếu ngày bắt đầu không rỗng
                                if (startDateValue) {
                                    // Chuyển đổi giá trị ngày thành đối tượng Date
                                    var startDate = new Date(startDateValue);

                                    // Kiểm tra xem ngày bắt đầu có phải là ngày hôm nay hay không
                                    if (startDate.toISOString().split('T')[0] === new Date().toISOString().split('T')[0]) {
                                        // Nếu là ngày hôm nay, ngày kết thúc cũng là ngày hôm nay
                                        endDateInput.value = new Date().toISOString().split('T')[0];
                                    } else {
                                        // Ngày kết thúc là ngày bắt đầu cộng thêm 7 ngày
                                        startDate.setDate(startDate.getDate() + 6);
                                        endDateInput.value = startDate.toISOString().split('T')[0];
                                    }

                                    // Làm cho ô nhập ngày kết thúc không thể sửa
                                    endDateInput.readOnly = true;
                                }
                            });
                        });
                    </script>
                    </body>
                    </html>
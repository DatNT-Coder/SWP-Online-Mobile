<%-- 
    Document   : Sale_orderDetail
    Created on : Mar 20, 2025, 11:22:11 AM
    Author     : naokh
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
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



      <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
      <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
      <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
      <link href="${pageContext.request.contextPath}/css/sider.css" rel="stylesheet">
      <style type="text/css">
         body {
            font-family: Arial, sans-serif;
         }
         .container {
            display: flex;
            justify-content: space-between;
         }
         .info, .sales {
            width: 45%;
         }
         .info h2, .sales h2 {
            color: #333;
         }
         .info p, .sales p {
            color: #666;
         }
         .button {
            background-color: #2f7db2;
            color: white;
            padding: 5px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
         }
         input,button,select,textarea{
            font-family:inherit;
            font-size:inherit;
            line-height:inherit;
            padding-right: 315px;
            padding-bottom: 100px;
         }
         .info p:before {
            content: "• ";
            font-weight: bold;
         }
         label{
            margin-top: 5px;
         }
         .sidebar{
            width:270px;
         }
      </style>
   </style>
</head>
<body class="skin-black">

   <div class="wrapper row-offcanvas row-offcanvas-left">
      <!-- Left side column. contains the logo and sidebar -->
      <div class="col-md-3">
         <jsp:include page="Sale_sidebar.jsp"></jsp:include>
         </div>
         <aside class="">
            <!-- Main content -->
            <section class="content">
               <!-- Main row -->
               <div class="row">

                  <div class="col-md-12">
                     <!--earning graph start-->
                     <section class="panel">
                        <header class="panel-heading">
                           Thông tin khách hàng
                        </header>
                        <div class="panel-body">
                           <div class="container">
                              <div class="info">
                                 <h2>Thông tin khách hàng</h2>
                                 <p>Mã đặt hàng: ${requestScope.order.id}</p>
                              <p>Tên khách hàng: ${requestScope.customerName}</p>
                              <p>Email: ${requestScope.order.email}</p>
                              <p>Số điện thoại: ${requestScope.order.phone}</p>
                              <p>Ngày đặt: ${requestScope.order.date}</p>
                              <h3>Tóm tắt đơn hàng</h3>
                              <h5 style="color: red;">Tổng tiền: </h5>
                           </div>
                           <c:if test="${sessionScope.user.ID == requestScope.order.saleId}"> 
                              <div class="sales">
                                 <h2>Thông tin người bán</h2>
                                 <div class="col-md-6">
                                    <label>Người bán:</label>
                                    <select class="form-control" id="" readonly>
                                       <option>${requestScope.saleName}</option>
                                    </select>
                                 </div>
                                 <form method="POST" action="viewOrderSale">
                                    <input type="hidden" name="id" value="${requestScope.order.id}">
                                    <div class="col-md-6">
                                       <label for="orderStatus">Trạng thái:</label>
                                       <c:if test="${requestScope.order.status != 3}">
                                          <select name="status" class="form-control" id="orderStatus">
                                             <option value="1" <c:if test="${requestScope.order.status == 1}">selected</c:if>>Đã đặt hàng</option>
                                             <option value="2" <c:if test="${requestScope.order.status == 2}">selected</c:if>>Đang xử lí</option>
                                             <option value="3" <c:if test="${requestScope.order.status == 3}">selected</c:if>>Đã giao hàng</option>
                                             <option value="4" <c:if test="${requestScope.order.status == 4}">selected</c:if>>Đã hủy</option>
                                          </select>
                                       </c:if>
                                       <c:if test="${requestScope.order.status == 3}">
                                          <select name="status" class="form-control" id="orderStatus">
                                             <option value="3" <c:if test="${requestScope.order.status == 3}">selected</c:if>>Đã giao hàng</option>
                                          </select>
                                       </c:if>
                                    </div>
                                    <div class="col-md-12">
                                       <label>Ghi chú: <textarea name="notes" >${requestScope.order.note}</textarea></label>
                                       <button class="button" type="submit">Thay đổi</button>
                                    </div>
                                 </form>
                              </div>
                           </c:if>
                        </div>
                  </section>
               </div>
               <div class="col-lg-4">
               </div>
            </div>
            <div class="row">
               <div class="col-md-12">
                  <section class="panel">
                     <header class="panel-heading">
                        ĐƠN HÀNG NÀY BAO GỒM CÁC SẢN PHẨM SAU ĐÂY
                     </header>
                     <div class="panel-body table-responsive">
                        <table class="table table-hover">
                           <thead>
                              <tr>
                                 <th>Tên sản phẩm</th>
                                 <th>Loại</th>
                                 <th>Đơn giá</th>
                                 <th>Số lượng</th>
                                 <th>Tổng tiền</th>
                              </tr>
                           </thead>
                           <tbody>
                           <c:forEach var="orderDetail" items="${orderDetail}">
                              <tr>
                                 <td>${orderDetail.value.product_name}</td>
                                 <td>${orderDetail.value.product_category}</td>
                                 <td>${orderDetail.value.salePrice}</td>
                                 <td>${orderDetail.value.quantity}</td>
                                 <td>${orderDetail.value.total_price}</td>
                              </tr>
                           </c:forEach>
                           </tbody>
                        </table>
                     </div>
                  </section>
               </div><!--end col-6 -->
            </div>
            <!-- row end -->
         </section><!-- /.content -->
         <div class="footer-main">
            Copyright &copy Director, 2014
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
   <script type="text/javascript">
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

   </script>
   <script>
      $('#noti-box').slimScroll({
         height: '400px',
         size: '5px',
         BorderRadius: '5px'
      });

      $('input[type="checkbox"].flat-grey, input[type="radio"].flat-grey').iCheck({
         checkboxClass: 'icheckbox_flat-grey',
         radioClass: 'iradio_flat-grey'
      });
   </script>

   <script>
      document.addEventListener("DOMContentLoaded", function () {
         // Wait for the HTML content to be fully loaded

         // Lấy danh sách các phần tử tr trong tbody
         var orderDetailRows = document.querySelectorAll("tbody tr");

         // Khởi tạo biến để lưu tổng tiền
         var totalPrice = 0;

         // Lặp qua từng dòng trong tbody
         orderDetailRows.forEach(function (row) {
            // Lấy giá trị từ ô total_price trong dòng hiện tại
            var total_priceText = row.querySelector("td:nth-child(5)").textContent.trim();

            // Kiểm tra nếu total_priceText không rỗng
            if (total_priceText !== '') {
               // Chuyển đổi total_priceText thành số và cộng vào tổng tiền
               var total_price = parseFloat(total_priceText.replace('đ', '').replace('.', ''));
               if (!isNaN(total_price)) {
                  totalPrice += total_price;
               }
            }
         });

         // Hiển thị tổng tiền trong thẻ h5
         var h5Element = document.querySelector("h5");
         if (h5Element) {
            h5Element.textContent = "Tổng tiền: " + totalPrice.toLocaleString() + " $";
         }
      });
   </script>
</body>
</html>
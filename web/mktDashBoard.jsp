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
                              <span>${totalP}</span> Bài Đăng
                        </div>
                     </div>
                  </div>
                  <div class="col-md-3">
                     <div class="sm-st clearfix">
                        <span class="sm-st-icon st-violet"><i class="fa fa-shopping-cart"></i></span>
                        <div class="sm-st-info">
                           <span>${totalPd}</span> Sản Phẩm
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

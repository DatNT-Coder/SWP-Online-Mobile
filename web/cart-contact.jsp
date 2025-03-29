<%@ page import="model.User"%>
<%@ page import="constant.CommonConst"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>Cart | E-Shopper</title>
      <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/prettyPhoto.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/price-range.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
      <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet">
      <!--[if lt IE 9]>
      <script src="${pageContext.request.contextPath}/js/html5shiv.js"></script>
      <script src="${pageContext.request.contextPath}/js/respond.min.js"></script>
      <![endif]-->       
      <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ico/favicon.ico">
      <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-144-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-72-precomposed.png">
      <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/images/ico/apple-touch-icon-57-precomposed.png">
      <link rel="stylesheet" href="http://cdn.datatables.net/2.0.0/css/dataTables.dataTables.min.css"/><link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/lelinh014756/fui-toast-js@master/assets/css/toast@1.0.1/fuiToast.min.css">
      <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/lelinh014756/fui-toast-js@master/assets/css/toast@1.0.1/fuiToast.min.css">
      <style>
         /* Cart Items Section */
         #cart_items {
            padding: 40px 0;
            background: #f5faf9;
         }

         .cart_info {
            border: 1px solid #e0f2f1;
            border-radius: 8px;
            background: #fff;
            padding: 20px;
            box-shadow: 0 3px 10px rgba(0, 77, 64, 0.1);
         }

         .cart_menu {
            background: #e0f2f1;
            color: #00796b;
            font-family: "Francois one", sans-serif;
            text-transform: uppercase;
            font-size: 14px;
         }

         .cart_menu td {
            padding: 15px;
            font-weight: bold;
         }

         .cart_product img {
            border: 1px solid #b2dfdb;
            border-radius: 4px;
            padding: 5px;
            transition: all 0.3s;
         }

         .cart_product img:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 121, 107, 0.1);
         }

         .cart_description h4 a {
            color: #00796b;
            font-weight: 500;
            transition: all 0.3s;
         }

         .cart_description h4 a:hover {
            color: #004d40;
         }

         .cart_price p, .cart_total p {
            color: #00796b;
            font-weight: 600;
            font-size: 16px;
         }

         /* Checkout Section */
         #do_action {
            padding: 40px 0;
            background: #f5faf9;
         }

         .heading h3 {
            color: #00796b;
            font-family: "Francois one", sans-serif;
            text-transform: uppercase;
            margin-bottom: 15px;
         }

         .heading p {
            color: #00695c;
            margin-bottom: 30px;
         }

         .total_area {
            height: 410px;
            background: #fff;
            border: 1px solid #e0f2f1;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 3px 10px rgba(0, 77, 64, 0.1);
         }

         .total_area ul {
            padding: 0;
            list-style: none;
         }

         .total_area ul li {
            margin-bottom: 15px;
            color: #00796b;
            font-size: 16px;
            display: flex;
            justify-content: space-between;
         }

         .total_area ul li span {
            font-weight: bold;
         }

         .total_area ul li p {
            margin: 10px 0;
            color: #00695c;
            text-align: center;
         }

         /* Form Styles */
         
         .form-control {
            border: 1px solid #b2dfdb;
            border-radius: 4px;
            padding: 10px 15px;
            color: #00796b;
            transition: all 0.3s;
         }

         .form-control:focus {
            border-color: #26a69a;
            box-shadow: 0 0 5px rgba(38, 166, 154, 0.3);
         }

         label {
            color: #00796b;
            font-weight: 500;
            margin-bottom: 8px;
            display: block;
         }

         .btn-default.update {
            background: #26a69a;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 4px;
            font-weight: 600;
            text-transform: uppercase;
            transition: all 0.3s;
            box-shadow: 0 3px 10px rgba(0, 121, 107, 0.2);
            width: 100%;
            margin-top: 20px;
         }

         .btn-default.update:hover {
            background: #00897b;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 121, 107, 0.3);
         }

         /* Center everything in total_area */
         .total_area {
            background: #fff;
            border: 1px solid #e0f2f1;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 3px 10px rgba(0, 77, 64, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            margin: 0 auto;
            max-width: 90%;
         }

         .total_area ul {
            padding: 0;
            list-style: none;
            width: 100%;
            text-align: center;
         }

         .total_area ul li {
            margin-bottom: 15px;
            color: #00796b;
            font-size: 16px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 400px;
            margin-left: auto;
            margin-right: auto;
         }

         .total_area ul li p {
            margin: 10px 0;
            color: #00695c;
            text-align: center;
            width: 100%;
         }

         .total_area form {
            width: 100%;
            max-width: 400px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            align-items: center;
         }

         .form-group {
            width: 100%;
            margin-bottom: 15px;
            text-align: left;
         }

         .form-control {
            width: 100%;
            border: 1px solid #b2dfdb;
            border-radius: 4px;
            padding: 10px 15px;
            color: #00796b;
            transition: all 0.3s;
         }

         /* QR Code Container */
         .qr-container {
            display: flex;
            justify-content: center;
            margin: 20px 0;
         }

         /* Responsive Adjustments */
         @media (max-width: 767px) {
            .total_area {
               padding: 20px;
            }

            .total_area ul li {
               flex-direction: column;
               text-align: center;
            }

            .form-group {
               text-align: center;
            }

            .form-control {
               text-align: center;
            }
         }


         /* Responsive Adjustments */
         @media (max-width: 767px) {
            .cart_menu {
               display: none;
            }

            tr {
               display: block;
               margin-bottom: 20px;
               border-bottom: 2px solid #b2dfdb;
            }

            td {
               display: block;
               text-align: right;
               padding: 10px 15px;
               position: relative;
            }

            td:before {
               content: attr(data-label);
               position: absolute;
               left: 15px;
               width: 45%;
               padding-right: 10px;
               font-weight: bold;
               text-align: left;
               color: #00796b;
            }

            .cart_product img {
               max-width: 100px;
            }

            .row {
               flex-direction: column;
            }

            .col-sm-6 {
               width: 100%;
               margin-bottom: 30px;
            }

            .total_area {
               margin-left: 0;
               padding: 20px;
            }
         }
      </style>
   </head><!--/head-->

   <body>
      <!--header-->
      <header id="header">
         <div class="header_top"><!--header_top-->
            <div class="container">
               <div class="row">
                  <div class="col-sm-12">
                     <div class="contactinfo">
                        <ul class="nav nav-pills">
                           <li><a href="#"><i class="fa fa-phone"></i> +8486 933 35322</a></li>
                           <li><a href="#"><i class="fa fa-envelope"></i> ProjectSWP391@fpt.edu.vn</a></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <section>
            <div class="container">
               <!--header-middle-->
               <div class="header-middle">
                  <div class="container">
                     <div class="row">
                        <div class="col-sm-4">
                           <div class="logo pull-left">
                              <a href="index.html"><img src="images/home/logo.png" alt="" /></a>
                           </div>
                        </div>
                        <div class="col-sm-8">
                           <div class="shop-menu pull-right">
                              <ul class="nav navbar-nav">
                                 <li><a data-toggle="modal" data-target="#editProfileModal"><i class="fa fa-user"></i> Tài khoản</a></li>
                                 <li><a href="CartViewController"><i class="fa fa-shopping-cart"></i> Giỏ Hàng</a></li>
                                    <c:if test="${sessionScope.user != null}">
                                    <li><a href="${pageContext.request.contextPath}/customer/orders"><i class="fa fa-star"></i> Đơn Mua</a></li>
                                    </c:if>
                                    <c:if test="${account != null}">
                                    <li><a href="authen?action=logout"><i class="fa fa-lock"></i> Đăng Xuất</a></li>
                                    </c:if>
                                    <c:if test="${account == null}">
                                    <li><a href="authen?action=login"><i class="fa fa-lock"></i> Đăng Nhập</a></li>
                                    </c:if> 
                                    <c:if test="${account != null}">
                                    <li><a href="authen?action=change"><i class="fa fa-lock"></i> Đổi mật khẩu</a></li>
                                    </c:if>
                                 <li><a href="authen?action=regis"><i class="fa fa-shopping-cart"></i> Đăng kí</a></li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
         </section>
         <!--header-bottom-->
         <div class="header-bottom">
            <div class="container">
               <div class="row">
                  <div class="col-sm-8">
                     <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                           <span class="sr-only">Toggle navigation</span>
                           <span class="icon-bar"></span>
                           <span class="icon-bar"></span>
                           <span class="icon-bar"></span>
                        </button>
                     </div>
                     <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                           <li><a href="HomePage" class="active">Trang Chủ</a></li>
                           <li><a href="ProductList">Cửa Hàng</a></li> 
                           <li class="dropdown">
                              <a href="#" class="dropdown-toggle" aria-haspopup="true" aria-expanded="false">
                                 Bài Đăng <i class="fa fa-angle-down"></i>
                              </a>
                              <ul role="menu" class="sub-menu">
                                 <li><a href="BlogPostList">Danh sách Bài Đăng</a></li>
                              </ul>
                           </li>
                           <li>
                              <% 
                              User loggedInUser = (User) session.getAttribute(CommonConst.SESSION_ACCOUNT);
                              if (loggedInUser != null && loggedInUser.getRole_id() == 5) { 
                              %>
                              <a href="/ProjectSWP391/marketing/MarketingDashboardController">Bảng Điều Khiển Marketing</a>
                              <% 
                              } else if (loggedInUser != null && loggedInUser.getRole_id() == 2) { 
                              %>
                              <a href="/ProjectSWP391/sale/saleDashboard">Bảng Điều Khiển Sale</a>
                              <% 
                              } else if (loggedInUser != null && loggedInUser.getRole_id() == 4) { 
                              %>
                              <a href="/ProjectSWP391/admin/adminDashBoard">Bảng Điều Khiển Admin</a>
                              <% 
                              }
                              %>
                           </li>
                           <%-- popup khi đúng role --%>  
                           <%--  <c:if test="${account.getRole_id() == 4 || account.getRole_id() == 5}">
                                   <li class="dropdown"><a href="customerList">Customer List</a>
                                   </li>
                               </c:if> --%>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-4">
                     <div class="pull-right">
                        <form action="searchProduct" class="search-form">
                           <input type="hidden" name="action" value="searchByWord"/>
                           <input name="searchBox" type="text" placeholder="Mô tả, tên sản phẩm..." required aria-label="Search products"/>
                           <button type="submit" value="search">
                              <i class="fa fa-search"></i> Tìm kiếm
                           </button>
                        </form> 
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </header>

      <!--Edit Profile-->
      <div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="editProfileModalLabel">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="editProfileModalLabel">Edit Profile</h4>
               </div>
               <div class="modal-body">
                  <form class="edit-form" action="user-profile" enctype="multipart/form-data" method="post">
                     <div class="form-group">
                        <label for="edit-full-name">Full Name</label>
                        <input type="text" name="fullName" class="form-control" id="edit-full-name" value="${sessionScope.profileUser.full_name}">
                     </div>
                     <div class="form-group">
                        <label for="edit-email">Email</label>
                        <input type="email" name="email" class="form-control" disabled="true"id="edit-email" value="${sessionScope.profileUser.email}">
                     </div>
                     <div class="form-group">
                        <label for="edit-phone">Phone</label>
                        <input type="tel" name="phone" class="form-control" id="edit-phone" value="${sessionScope.profileUser.phone}">
                     </div>
                     <div class="form-group">
                        <label for="edit-gender">Gender</label>
                        <select class="form-control" id="edit-gender" name="gender">
                           <option value="Male" ${sessionScope.profileUser.gender == "Male" ?"selected" : ""}>Male</option>
                           <option value="Female" ${sessionScope.profileUser.gender == "Female" ?"selected" : ""}>Female</option>
                           <option value="Other"${sessionScope.profileUser.gender == "Other" ?"selected" : ""}>Other</option>
                        </select>
                     </div>
                     <div class="form-group">
                        <label for="profile-image">Profile Image</label>
                        <input type="file" id="profile-image" accept="image/*">
                        <p class="help-block">Choose a new profile image</p>
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn primary">Save Changes</button>
                     </div>
                  </form>
               </div>

            </div>
         </div>
      </div>

      <section id="cart_items">
         <div class="container">
            <div class="table-responsive cart_info">
               <table class="table table-condensed">
                  <thead>
                     <tr class="cart_menu">
                        <td class="image">Sản Phẩm</td>
                        <td class="description"></td>
                        <td class="price">Giá Tiền</td>
                        <td class="quantity">Số lượng</td>
                        <td class="total">Tổng tiền</td>
                        <td></td>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="item" items="${cart}">
                        <c:if test="${empty selectedProducts or fn:contains(selectedProducts, item.productId)}">
                           <tr id="item-${item.productId}">
                              <td class="cart_product">
                                 <a href=""><img style="max-height: 100px;" src="${pageContext.request.contextPath}/assets/img/productImage/${item.image}" alt=""></a>
                              </td>
                              <td class="cart_description">
                                 <h4><a href="">${item.name}</a></h4>
                              </td>
                              <td class="cart_price"><p>$${item.price}</p></td>
                              <td class="cart_quantity"><p>${item.quantity}</p></td>
                              <td class="cart_total"><p>$${item.total}</p></td>
                           </tr>
                        </c:if>
                     </c:forEach>
                  </tbody>
               </table>
               <script>
                  async function updateQuantity(productId, amount) {
                     const quantityDiv = document.getElementById('item-quantity-' + productId);
                     const postData = new URLSearchParams();
                     postData.append("productId", productId);
                     if (amount === 0) {
                        postData.append("amount", -quantityDiv.value);
                     } else {
                        postData.append("amount", amount);
                     }
                     const response = await fetch('${pageContext.request.contextPath}/customer/cart/update', {
                        method: "POST",
                        body: postData
                     });
                     const data = await response.json();
                     const status = data.status;

                     console.log(data);
                     if (status === 'successed') {
                        const newQuantity = data.quantity;
                        if (+newQuantity === 0) {
                           document.getElementById('item-' + productId).remove();
                           await FuiToast.success('Updated product quantity successfully!');
                           return false;
                        }
                        const price = data.price;
                        const total = data.total;
                        const priceDiv = document.getElementById('item-price-' + productId);
                        const totalDiv = document.getElementById('item-total-' + productId);
                        quantityDiv.value = newQuantity;
                        priceDiv.innerHTML = '$' + price;
                        totalDiv.innerHTML = '$' + total;
                        await FuiToast.success('Updated product quantity successfully!');
                     } else {
                        await FuiToast.error('Update product quantity failed!');
                     }
                     return false;
                  }
               </script>

            </div>
         </div>
      </section> <!--/#cart_items-->

      <section id="do_action">
         <div class="container">
            <div class="heading">
               <h3>Thông Tin Liên Lạc</h3>
               <p>Hãy hoàn thành thông tin trước khi bạn đạt hàng</p>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <div class="total_area">
                     <ul>
                        <li>Tổng tiền <span>$${total}</span></li>
                        <li>
                           <p>
                              Thanh toán bằng mã QR dưới đây!
                           </p>
                           <img style="max-width: 250px; margin: 0 auto; display: block;" src="${qr}" alt="qr"/>
                        </li>
                     </ul>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="total_area">
                     <form action="${pageContext.request.contextPath}/customer/cart/checkout" method="POST">
                        <div class="form-group" style="display: flex; gap: 10px;">
                           <input name="address" type="text" class="form-control" id="addressInput" placeholder="Nhập địa chỉ" style="flex: 2;" required>

                           <!-- Dropdown chọn địa chỉ -->
                           <select id="addressSelect" class="form-control" style="flex: 1;">
                              <c:forEach var="addr" items="${addressList}">
                                 <option value="${addr}">${addr}</option>
                              </c:forEach>
                           </select>

                           <!-- Ô nhập địa chỉ -->
                        </div>

                        <script>
                           document.getElementById("addressSelect").addEventListener("change", function () {
                              document.getElementById("addressInput").value = this.value;
                           });
                        </script>
                        <div class="form-group">
                           <label for="exampleInputEmail1">Số Điện Thoại</label>
                           <input name="phone" value="${phone}"  type="text" class="form-control" id="exampleInputEmail1" placeholder="Phone" required="không thể bỏ trống địa chỉ">
                           <!--<label style="color: red" > số điện thoại không đúng định dạng!!!</label>-->
                        </div>
                        <div class="form-group">
                           <label for="exampleInputEmail1">Email</label>
                           <input name="email" value="${email}"   type="text" class="form-control" id="exampleInputEmail1" placeholder="Email" required="không thể bỏ trống địa chỉ">
                           <!--<label style="color: red" > email không tồn tại!!!</label>-->
                        </div>
                        <div class="form-group">
                           <label for="exampleInputEmail1">Ghi chú</label>
                           <input name="note" type="text" class="form-control" id="exampleInputEmail1" placeholder="Note">
                        </div>

                        <input  type="submit" class="btn btn-default update" style="margin-left: 0;" value="Hoàn tất đặt hàng"/>

                     </form>

                  </div>
               </div>
            </div>
         </div>
      </section><!--/#do_action-->

      <!--Footer-->               
      <footer id="footer">
         <div class="footer-widget">
            <div class="container">
               <div class="row">
                  <div class="col-sm-3">
                     <div class="single-widget">
                        <h2>Support - service</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <li><a href="/mua-hang-tra-gop">Policy and instructions for installment purchases</a></li>
                           <li><a href="/huong-dan-dat-hang">Purchase instructions and shipping policy</a></li>
                           <li><a href="/order/check">Order Tracking</a></li>
                           <li><a href="/chinh-sach-bao-hanh">Exchange and warranty policy</a></li>
                           <li><a href="/tin-tuc/dat-hang/dich-vu-bao-hanh-mo-rong-hoang-ha-mobile/">Extended warranty service</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-3">
                     <div class="single-widget">
                        <h2>Contact information</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <li><a href="/cham-soc-khach-hang">Customer care</a></li>
                           <li><a href="/trung-tam-bao-hanh">Warranty lookup</a></li>
                           <li><a href="contact-us.html">Contact us</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-3">
                     <div class="single-widget">
                        <h2>Payment methods</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <img src="images/home/visa.png" />
                           <img src="images/home/mastercard.png" />
                           <img src="images/home/jcb.png" />
                           <img src="images/home/samsungpay.png" />
                           <img src="images/home/vnpay.png" />
                           <img src="images/home/zalopay.png" />
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-3">
                     <div class="single-widget">
                        <h2>Shipping method</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <img src="images/home/vnpost.png">
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="footer-bottom">
            <div class="container">
               <div class="row">
               </div>
            </div>
         </div>
      </footer>



      <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
      <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
      <script src="${pageContext.request.contextPath}/js/jquery.scrollUp.min.js"></script>
      <script src="${pageContext.request.contextPath}/js/jquery.prettyPhoto.js"></script>
      <script src="${pageContext.request.contextPath}/js/main.js"></script>
      <script src="https://cdn.datatables.net/2.0.0/js/dataTables.min.js"></script>
      <script type="text/javascript" src="https://cdn.jsdelivr.net/gh/lelinh014756/fui-toast-js@master/assets/js/toast@1.0.1/fuiToast.min.js"></script>
      <script>
                           document.addEventListener('DOMContentLoaded', function () {
                              // Get all dropdown elements
                              const dropdowns = document.querySelectorAll('.dropdown');

                              // Close when clicking outside
                              document.addEventListener('click', function (e) {
                                 if (!e.target.closest('.dropdown')) {
                                    dropdowns.forEach(dropdown => {
                                       dropdown.classList.remove('active');
                                       dropdown.querySelector('.sub-menu').classList.remove('show');
                                    });
                                 }
                              });

                              // Toggle dropdown on click
                              dropdowns.forEach(dropdown => {
                                 const toggle = dropdown.querySelector('.dropdown-toggle');
                                 const menu = dropdown.querySelector('.sub-menu');

                                 toggle.addEventListener('click', function (e) {
                                    e.preventDefault();

                                    // Close other open dropdowns
                                    dropdowns.forEach(otherDropdown => {
                                       if (otherDropdown !== dropdown) {
                                          otherDropdown.classList.remove('active');
                                          otherDropdown.querySelector('.sub-menu').classList.remove('show');
                                       }
                                    });

                                    // Toggle current dropdown
                                    dropdown.classList.toggle('active');
                                    menu.classList.toggle('show');

                                    // Update ARIA attributes
                                    const isExpanded = dropdown.classList.contains('active');
                                    toggle.setAttribute('aria-expanded', isExpanded);
                                 });
                              });
                           });
      </script>
   </body>
</html>

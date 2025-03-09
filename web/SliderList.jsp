<%-- 
    Document   : SliderList
    Created on : Feb 10, 2025, 10:02:20 PM
    Author     : naokh
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Slider" %>
<%@ page import="dao.SliderDAO" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>Blog | E-Shopper</title>
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <link href="css/font-awesome.min.css" rel="stylesheet">
      <link href="css/prettyPhoto.css" rel="stylesheet">
      <link href="css/price-range.css" rel="stylesheet">
      <link href="css/animate.css" rel="stylesheet">
      <link href="css/main.css" rel="stylesheet">
      <link href="css/responsive.css" rel="stylesheet">
      <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <![endif]-->       
      <link rel="shortcut icon" href="images/ico/favicon.ico">
      <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
      <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
      <title>Slider List</title>
      <style>
         .slider-container {
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 20px;
         }
         .pagination {
            margin-top: 20px;
         }
         .pagination a {
            padding: 8px 12px;
            margin: 5px;
            border: 1px solid #007BFF;
            color: #007BFF;
            text-decoration: none;
         }
         .pagination a.active {
            background-color: #007BFF;
            color: white;
         }
      </style>
   </head><!--/head-->
   <body>
      <header id="header"><!--header-->
         <div class="header_top"><!--header_top-->
            <div class="container">
               <div class="row">
                  <div class="col-sm-6 ">
                     <div class="contactinfo">
                        <ul class="nav nav-pills">
                           <li><a href=""><i class="fa fa-phone"></i> +84 985 350 491</a></li>
                           <li><a href=""><i class="fa fa-envelope"></i> group3_shopmobile@gmail.com</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-6">
                     <div class="social-icons pull-right">
                        <ul class="nav navbar-nav">
                           <li><a href=""><i class="fa fa-facebook"></i></a></li>
                           <li><a href=""><i class="fa fa-twitter"></i></a></li>
                           <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                           <li><a href=""><i class="fa fa-dribbble"></i></a></li>
                           <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div><!--/header_top-->

         <div class="header-middle"><!--header-middle-->
            <div class="container">
               <div class="row">
                  <div class="col-sm-4">
                     <div class="logo pull-left">
                        <a href="Home "><img src="images/home/logo.png" alt="" /></a>
                     </div>

                  </div>
                  <div class="col-sm-8">
                     <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav">
                           <li class="dropdown">
                              <a href="user-profile">
                                 <i class="fa fa-user"></i>
                                 ${empty sessionScope.user.email ? "Tài khoản" : sessionScope.user.full_name}</a>
                              <ul class="sub-menu" style=" background-color: #ffffff;padding-top: 0.8rem;max-width: 180px;" >
                                 <li  style="color: #696763; font-size: 20px; text-align: center;padding:1rem;">
                                    <a class="dropdown-hover" href="changepassword" style="color: #696763">Đổi mật khẩu</a>
                                 </li>
                                 <li  style="color: #696763; font-size: 20px; text-align: center;padding: 1rem;">
                                    <a class="dropdown-hover" href="user-profile" style="color: #696763;">Thông tin người dùng</a>
                                 </li>
                              </ul>
                           </li>
                           <c:if test="${sessionScope.user != null}">
                              <li><a href="${pageContext.request.contextPath}/user/orders"><i class="fa fa-star"></i> Đơn Mua</a></li>
                           </c:if>
                           <li><a href="CartViewController"><i class="fa fa-shopping-cart"></i> Giỏ Hàng</a></li>

                           <c:choose>
                              <c:when test="${sessionScope.user == null}">
                                 <li><a href="login.jsp"><i class="fa fa-lock"></i> Đăng Nhập</a></li>
                              </c:when>
                              <c:otherwise>
                                 <li><a href="logOut.jsp"><i class="fa-solid fa-right-from-bracket"></i> Đăng Xuất</a></li>
                              </c:otherwise>
                           </c:choose>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div><!--/header-middle-->

         <div class="header-bottom"><!--header-bottom-->
            <div class="container">
               <div class="row">
                  <div class="col-sm-9">
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
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-3">
                     <div class=" pull-right">
                        <form action="searchProduct">
                           <input type="hidden" name="action" value="searchByWord"/>
                           <input name="searchBox" type="text" placeholder="Mô tả, tên sản phẩm..." required=""/>
                           <button type="submit" value="search">Tìm kiếm</button>
                        </form> 
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </header>

      <section>
         <div class="container">
            <div class="row">
               <div class="col-sm-12">
                  <h2 class="title text-center">Slider List</h2>

                  <%
                      List<Slider> sliders = (List<Slider>) request.getAttribute("sliders");
                      int currentPage = (Integer) request.getAttribute("currentPage");
                      int totalPages = (Integer) request.getAttribute("totalPages");

                      // Retrieve the selected slider ID from request
                      String sliderIdParam = request.getParameter("sliderId");
                      int selectedSliderId = (sliderIdParam != null) ? Integer.parseInt(sliderIdParam) : -1;

                      if (sliders != null && !sliders.isEmpty()) {
                          for (Slider slider : sliders) {
                  %>
                  <div class="slider-container <%= (slider.getId() == selectedSliderId) ? "highlighted-slider" : "" %>">
                     <strong>ID:</strong> <%= slider.getId() %><br>
                     <strong>Title:</strong> <%= slider.getTitle() %><br>
                     <strong>Image:</strong> <img src="<%= slider.getImage() %>" width="100" height="50"><br>
                     <strong>Backlink:</strong> <a href="<%= slider.getBacklink() %>"><%= slider.getBacklink() %></a><br>
                     <strong>Status:</strong> <%= slider.getStatus() %><br>
                     <strong>Notes:</strong> <%= slider.getNotes() %><br>
                     <strong>Marketing ID:</strong> <%= slider.getMarketingId() %><br>
                     <strong>Updated Date:</strong> <%= slider.getUpdatedDate() %><br>
                  </div>
                  <%
                          }
                      } else {
                  %>
                  <p>No sliders found.</p>
                  <%
                      }
                  %>

                  <!-- Pagination -->
                  <div class="pagination">
                     <% if (currentPage > 1) { %>
                     <a href="Slider?page=<%= currentPage - 1 %>">Previous</a>
                     <% } %>

                     <% for (int i = 1; i <= totalPages; i++) { %>
                     <a href="Slider?page=<%= i %>" class="<%= (i == currentPage) ? "active" : "" %>"><%= i %></a>
                     <% } %>

                     <% if (currentPage < totalPages) { %>
                     <a href="Slider?page=<%= currentPage + 1 %>">Next</a>
                     <% } %>
                  </div>
               </div>
            </div>
         </div>
      </section>

      <footer id="footer"><!--Footer-->
         <div class="footer-top">
            <div class="container">
               <div class="row">
                  <div class="col-sm-2">
                     <div class="companyinfo">
                        <h2><span>e</span>-shopper</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor</p>
                     </div>
                  </div>
                  <div class="col-sm-7">
                     <div class="col-sm-3">
                        <div class="video-gallery text-center">
                           <a href="#">
                              <div class="iframe-img">
                                 <img src="images/home/iframe1.png" alt="" />
                              </div>
                              <div class="overlay-icon">
                                 <i class="fa fa-play-circle-o"></i>
                              </div>
                           </a>
                           <p>Circle of Hands</p>
                           <h2>24 DEC 2014</h2>
                        </div>
                     </div>

                     <div class="col-sm-3">
                        <div class="video-gallery text-center">
                           <a href="#">
                              <div class="iframe-img">
                                 <img src="images/home/iframe2.png" alt="" />
                              </div>
                              <div class="overlay-icon">
                                 <i class="fa fa-play-circle-o"></i>
                              </div>
                           </a>
                           <p>Circle of Hands</p>
                           <h2>24 DEC 2014</h2>
                        </div>
                     </div>

                     <div class="col-sm-3">
                        <div class="video-gallery text-center">
                           <a href="#">
                              <div class="iframe-img">
                                 <img src="images/home/iframe3.png" alt="" />
                              </div>
                              <div class="overlay-icon">
                                 <i class="fa fa-play-circle-o"></i>
                              </div>
                           </a>
                           <p>Circle of Hands</p>
                           <h2>24 DEC 2014</h2>
                        </div>
                     </div>

                     <div class="col-sm-3">
                        <div class="video-gallery text-center">
                           <a href="#">
                              <div class="iframe-img">
                                 <img src="images/home/iframe4.png" alt="" />
                              </div>
                              <div class="overlay-icon">
                                 <i class="fa fa-play-circle-o"></i>
                              </div>
                           </a>
                           <p>Circle of Hands</p>
                           <h2>24 DEC 2014</h2>
                        </div>
                     </div>
                  </div>
                  <div class="col-sm-3">
                     <div class="address">
                        <img src="images/home/map.png" alt="" />
                        <p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="footer-widget">
            <div class="container">
               <div class="row">
                  <div class="col-sm-2">
                     <div class="single-widget">
                        <h2>Service</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <li><a href="">Online Help</a></li>
                           <li><a href="">Contact Us</a></li>
                           <li><a href="">Order Status</a></li>
                           <li><a href="">Change Location</a></li>
                           <li><a href="">FAQ’s</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-2">
                     <div class="single-widget">
                        <h2>Quock Shop</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <li><a href="">T-Shirt</a></li>
                           <li><a href="">Mens</a></li>
                           <li><a href="">Womens</a></li>
                           <li><a href="">Gift Cards</a></li>
                           <li><a href="">Shoes</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-2">
                     <div class="single-widget">
                        <h2>Policies</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <li><a href="">Terms of Use</a></li>
                           <li><a href="">Privecy Policy</a></li>
                           <li><a href="">Refund Policy</a></li>
                           <li><a href="">Billing System</a></li>
                           <li><a href="">Ticket System</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-2">
                     <div class="single-widget">
                        <h2>About Shopper</h2>
                        <ul class="nav nav-pills nav-stacked">
                           <li><a href="">Company Information</a></li>
                           <li><a href="">Careers</a></li>
                           <li><a href="">Store Location</a></li>
                           <li><a href="">Affillate Program</a></li>
                           <li><a href="">Copyright</a></li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-sm-3 col-sm-offset-1">
                     <div class="single-widget">
                        <h2>About Shopper</h2>
                        <form action="#" class="searchform">
                           <input type="text" placeholder="Your email address" />
                           <button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
                           <p>Get the most recent updates from <br />our site and be updated your self...</p>
                        </form>
                     </div>
                  </div>

               </div>
            </div>
         </div>

         <div class="footer-bottom">
            <div class="container">
               <div class="row">
                  <p class="pull-left">Copyright © 2013 E-SHOPPER Inc. All rights reserved.</p>
                  <p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
               </div>
            </div>
         </div>

      </footer><!--/Footer-->



      <script src="js/jquery.js"></script>
      <script src="js/price-range.js"></script>
      <script src="js/jquery.scrollUp.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/jquery.prettyPhoto.js"></script>
      <script src="js/main.js"></script>
   </body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Slider List | EShopee</title>

      <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
      <!-- Nucleo Icons -->
      <link href="./css/nucleo-icons.css" rel="stylesheet" />
      <link href="./css/nucleo-svg.css" rel="stylesheet" />
      <!-- Font Awesome Icons -->
      <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
      <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.dataTables.css" />
      <!-- Material Icons -->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
      <!-- CSS Files -->
      <link id="pagestyle" href="../assets/css/material-dashboard.css?v=3.1.0" rel="stylesheet" />
      <!-- Nepcha Analytics (nepcha.com) -->
      <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
      <script defer data-site="http://localhost:8080/QuizPracticeOnline/home" src="https://api.nepcha.com/js/nepcha-analytics.js"></script>
      <%@include file="base-view/baseTag.jsp" %>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
      <link rel="stylesheet" href="css/styles.css">
      <style>
         *{
            box-sizing: border-box;
            margin:0;
            padding:0;
         }
         .header{
            padding: 0.4rem .2rem;
            margin-bottom: 1rem;
         }
         .add-product-btn{
            text-align: center;
            display: block;
            border:none;
            color: black;
            text-decoration: none;
            padding:.7rem .2rem;
            margin-top: 10px;
            width: 100%;
         }
         .add-product-btn:hover{
            color: black;
            text-decoration: none;
         }
         .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #009981; /* Bright green */
            padding: 20px;
            position: fixed;
            top: 0;
            left: 0;
            overflow-y: auto;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
         }

         .user-avatar {
            text-align: center;
            margin-bottom: 20px;
         }

         .user-avatar img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            border: 2px solid white;
         }

         .user-avatar p {
            margin-top: 10px;
            font-size: 14px;
            color: white;
         }

         .user-avatar a {
            color: #154734; /* Dark green for contrast */
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
         }

         h2 {
            color: white;
            font-size: 18px;
            margin-bottom: 15px;
            border-bottom: 2px solid #219150; /* Slightly darker shade */
            padding-bottom: 5px;
         }

         ul {
            list-style: none;
            padding: 0;
            margin: 0;
         }

         ul li {
            padding: 12px;
            margin: 5px 0;
            border-radius: 5px;
            background: white; /* Lighter green for contrast */
            transition: all 0.3s;
         }

         ul li a {
            text-decoration: none;
            color: black;
            font-size: 16px;
            font-weight: bold;
            display: block;
            transition: background 0.3s, padding-left 0.3s;
         }

         ul li:hover {
            background: white; /* Darker green for hover effect */
            padding-left: 10px;
         }

         .text-success {
            color: black;
         }

         /* Responsive */
         @media screen and (max-width: 768px) {
            .sidebar {
               width: 200px;
            }
         }
      </style>
   </head>
   <body class="g-sidenav-show  bg-gray-200">

      <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
         <div class="container-fluid">
            <div class="row">
               <!-- Sidebar -->
               <div class="col-md-2">
                  <jsp:include page="sidebar.jsp"></jsp:include>
                  </div>
                  <div class="col-md-10 mt-8" id="listSliderItems">
                     <div class="card">
                        <div class="card-header pb-0 p-3">
                           <div class="row">
                              <div class="col-3 d-flex align-items-center">
                                 <h6 class="mb-0">Slider List</h6>
                              </div>
                              <form action="search-slider" method="POST" class="d-flex col-6" style="width: 600px; float: right !important">
                                 <div
                                    class="col-6 ms-md-auto pe-md-3 d-flex align-items-center">
                                    <div
                                       class="input-group input-group-outline">

                                       <input id="inputSearchSlider" name="keyword" type="text" class="form-control"
                                              placeholder="Search Slider">
                                    </div>
                                 </div>
                                 <div
                                    class="col-6 ms-md-auto pe-md-3 d-flex align-items-center">

                                    <select
                                       class="form-select input-group-outline" name="status">

                                       <option value="1" checked>Active</option>
                                       <option value="0">Inactive</option>
                                    </select>


                                 </div>
                                 <div
                                    class=" ms-md-auto pe-md-3 d-flex align-items-center">
                                    <button type="submit" class="btn btn-primary mb-0">
                                       <i class="fas fa-search"></i>
                                    </button>   
                                 </div>

                              </form>
                              <div class="col-3 ms-md-auto pe-md-3 mb-0 text-end" >
                                 <a class="btn text-white bg-primary mb-0"
                                    href="add-slider"><i class="bi text-white bi-plus h6 m-0 p-0"></i>&nbsp;&nbsp;Add
                                    New Slider</a>
                              </div>
                           </div>
                        </div>
                        <div class="card-body pt-4 p-3">
                           <ul class="list-group" >
                           <c:forEach var="sl" items="${sessionScope.listSlidersByPagging}">
                              <li
                                 class="list-group-item border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg">
                                 <img
                                    src="images/slider/${sl.image}"
                                    alt class="border"
                                    style="width: 200px; height: auto;">
                                 <div class="d-flex flex-column ms-3">

                                    <h6 class="mb-3 text-sm">${sl.title}</h6>
                                    <span class="mb-2 text-xs">ID: <span
                                          class="text-dark ms-sm-2 font-weight-bold">${sl.id}</span></span>

                                    <span class="mb-2 text-xs">Back
                                       link<span
                                          class="text-dark ms-sm-2 font-weight-bold"><a
                                             href="${sl.backlink}"
                                             class="__cf_email__"
                                             data-cfemail="fb9497928d9e89bb998e8989928f94d5989496">
                                             ${sl.notes}</a></span></span>
                                    <span class="text-xs ">Status: 
                                       <span class="text-xs ${sl.status == 1?"text-success":"text-danger"}">
                                          ${sl.status == 1?"Active":"Inactive"}
                                       </span>
                                    </span>

                                 </div>
                                 <div class="ms-auto text-end">
                                    <c:choose>
                                       <c:when test="${sl.status == 1}">
                                          <a
                                             class="btn btn-link text-danger text-gradient mb-0 m-0"
                                             href="hide-slider?id=${sl.id}"><i
                                                class="bi bi-eye-slash-fill m-0 me-1 h6"></i>Hide</a>

                                       </c:when>
                                       <c:otherwise>
                                          <a
                                             class="btn btn-link text-success text-gradient px-3 m-0"
                                             href="show-slider?id=${sl.id}"><i
                                                class="bi bi-eye-fill m-0 me-1 h6"></i>Show</a>

                                       </c:otherwise>
                                    </c:choose>


                                    <a
                                       class="btn btn-link text-dark px-3 mb-0"
                                       href="edit-slider?id=${sl.id}"><i class="bi bi-pencil-fill m-0 me-1 h6"></i>Edit</a>
                                    <a
                                       class="btn btn-link text-dark px-3 mb-0"
                                       href="slider-detail?id=${sl.id}"><i class="bi bi-view-list m-0 me-1 h6"></i>View</a>
                                 </div>
                              </li>
                           </c:forEach>
                        </ul>
                     </div>
                     <c:choose>
                        <c:when test="${sessionScope.listSlidersByPagging==null || sessionScope.listSlidersByPagging.size()==0}">
                           Not founds
                        </c:when>
                        <c:when test="${totalPage < 2}">
                           <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                              <ul class="pagination">
                                 <c:forEach begin="1" end="${totalPage}" var="i">
                                    <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                                    </c:forEach>
                              </ul>
                           </nav>
                        </c:when>
                        <c:when test="${page < 2}">
                           <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                              <ul class="pagination">                               
                                 <c:forEach begin="1" end="${totalPage}" var="i">
                                    <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                                    </c:forEach>
                                 <li class="page-item"><a class="page-link" href="${pagination_url}page=${page+1}">>></a></li>
                              </ul>
                           </nav>
                        </c:when>
                        <c:when test="${page+1 > totalPage}">
                           <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                              <ul class="pagination">
                                 <li class="page-item"><a class="page-link" href="${pagination_url}page=${page-1}"><<</a></li>
                                    <c:forEach begin="1" end="${totalPage}" var="i">
                                    <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                                    </c:forEach>
                              </ul>
                           </nav>
                        </c:when>
                        <c:otherwise>
                           <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                              <ul class="pagination">
                                 <li class="page-item"><a class="page-link" href="${pagination_url}page=${page-1}"><<</a></li>
                                    <c:forEach begin="1" end="${totalPage}" var="i">
                                    <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                                    </c:forEach>
                                 <li class="page-item"><a class="page-link" href="${pagination_url}page=${page+1}">>></a></li>
                              </ul>
                           </nav>
                        </c:otherwise>
                     </c:choose>
                  </div>
               </div>
               </main>
               </main>
               </body>
               <script src="./assets/js/core/popper.min.js"></script>
               <script src="./assets/js/core/bootstrap.min.js"></script>
               <script src="./assets/js/plugins/perfect-scrollbar.min.js"></script>
               <script src="./assets/js/plugins/smooth-scrollbar.min.js"></script>
               <script src="./assets/js/plugins/chartjs.min.js"></script>
               <script>
                  var win = navigator.platform.indexOf('Win') > -1;
                  if (win && document.querySelector('#sidenav-scrollbar')) {
                     var options = {
                        damping: '0.5'
                     }
                     Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
                  }
               </script>
               <!-- Github buttons -->
               <script async defer src="https://buttons.github.io/buttons.js"></script>
               <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
               <script src="./assets/js/material-dashboard.min.js?v=3.1.0"></script>
               <script src="./js/home.js"></script>
               <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
               <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
               <script>
                  function searchSlider() {
                     var keyword = $("#inputSearchSlider").val();
                     var status = $("select[name='status']").val();
                     var page = $(".page-item.active a").text();
                     loadingSliderAjax(keyword, status, page);
                  }
                  function loadingSliderAjax(keyword, status, page) {

                     $.ajax({
                        url: "search-slider",
                        type: "GET",
                        data: {
                           keyword: keyword,
                           status: status,
                           page: page
                        },
                        success: function (data) {
                           $("#listSliderItems").html(data);
                        }
                     });
                  }

               </script>

               </html>
